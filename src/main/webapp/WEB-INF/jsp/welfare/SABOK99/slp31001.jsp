<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/com/include/excel_header.jsp" %>
<% } %>

<title>회계전표 승인/취소</title>

<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var days = getDayInterval(document.main.start_ymd.value.replace(/-/g,""), document.main.end_ymd.value.replace(/-/g,""));
			if(days > 365) {
				alert('조회기간은 365일 이내로 지정하셔야 합니다.');
				document.main.end_ymd.focus();
				return;
			}
		
			var theURL = 'slp31001_list';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=회계전표 승인'; }
			else { displaySinjaxAlert(200,400,'조회중입니다. 잠시만 기다려 주십시오.'); }
	
			removeMask("#main");		
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goSign() {
		var msg = document.main.sign_yn[0].checked ? '승인' : '승인취소';
		var isOK = false;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { if(document.all['slip_no'+i].checked) { isOK = true; break; }
			}catch(e) {}
		}
		
		if(!isOK) {
			alert(msg+'할 자료가 선택되지 않았습니다.');
			return;
		}
		
		if (formValidate("#main")) {
			if(confirm(msg+'처리하시겠습니까?')) {
				removeMask("#main");
				displaySinjaxAlert(200,400,'처리중입니다. 잠시만 기다려 주십시오.');
				document.main.action = 'slp31001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}	
	}
	
	function go_select_all() {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				document.all['slip_no'+i].checked = document.main.checkbox.checked; 
				click_slip_no(i);
			} catch(e) {}
		}
	}
	
	function click_slip_no(inx) {
		if(document.all['slip_no'+inx].checked) {
			changeObjectProperty(document.all['sign_ymd'+inx], 'required');
			document.all['sign_ymd'+inx].value = document.all['proof_ymd'+inx].value;
			formatMaskElm(document.all['sign_ymd'+inx]);
		}else {
			changeObjectProperty(document.all['sign_ymd'+inx], 'enabled');
			document.all['sign_ymd'+inx].value = '';
		}
		autoCalc();
	}
	
	function autoCalc() {
		var slip_cnt_tot = 0;
		var slip_amt_tot = 0;
	<% for(int i=0; i < rsWp.getLength(); i++) { %>
		if(isObject('slip_no<%=i%>') && document.main.slip_no<%=i%>.checked) { 
			slip_amt_tot = slip_amt_tot + <%=rsWp.getInt("dae_amt",i)%>;
			slip_cnt_tot++;
		}
	<% } %>
		document.all['slip_cnt'].value = slip_cnt_tot;
		document.all['slip_amt_tot'].value = slip_amt_tot;
		formatMaskElm(document.all['slip_cnt']);
		formatMaskElm(document.all['slip_amt_tot']);
		if(slip_cnt_tot > 0) { 
			document.getElementById('slip_summary').style.display = '';
		}else {
			document.getElementById('slip_summary').style.display = 'none';
		}
	}
	
	function __Calendar_Setting_Post(target) {
		if(!isEmpty(document.main.slip_ymd)) {
			document.main.slip_no.options.length = 0;
			var slip_ymd = document.main.slip_ymd.value.replace(/-/g,"");
			protoSetUrlOption('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.slip_no, '', slip_ymd, '', '', '', '3', '선택'); 
		}
	}
</script>
</head>
<body>
<% if(!box.get("excel_yn").equals("Y")) { %>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="sort_order" value="">
<input type="hidden" name="select_yn"  value="Y">
<input type="hidden" name="input_cnt"  value="<%=rsWp.getLength()%>">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr> 
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">회계전표 승인/취소</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td rowspan="2" align="center">
						<input type="radio" name="sign_yn" value="N" <%=box.get("sign_yn").equals("Y")?"":"checked"%> style="border:none" onClick="document.main.select_yn.value='N'; goSearch('N');"> 결의전표<br>
						<input type="radio" name="sign_yn" value="Y" <%=box.get("sign_yn").equals("Y")?"checked":""%> style="border:none" onClick="document.main.select_yn.value='N'; goSearch('Y');"> 승인전표
					</td>
					<td width="10%" class="table01_title" align="center"><%=box.get("sign_yn").equals("Y")?"회계일자":"접수일자"%></td>
					<td width="24%" nowrap style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" size="10" maxlength="8" class="required tYMD" title="기준일자(부터)" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border='0'></a> ~ 
						<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" size="10" maxlength="8" class="required tYMD" title="기준일자(까지)" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border='0'></a>
					</td>
					<td width="10%" class="table01_title" align="center">업무유형</td>
					<td style="padding-left:5px">
						<select name="biz_type" style="width:160px">
							<option value=''>전체</option>
							<%=CodeHelper.OptList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("biz_type"),"biz_type","","","","", request)%>
						</select>
					</td>
					<td width="10%" class="table01_title" align="center">
						<select name="search_key" style="width:90px">
							<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>작성자성명</option>
							<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>작성자사번</option>
							<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>작성부서</option>
							<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>적요</option>
						</select>
					</td>
					<td width="*" style="padding-left:5px"><input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:120px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')"></td>
		  		</tr>
		  		<tr height="28">
					<td class="table01_title" align="center">전표번호</td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="slip_ymd" value="<%=box.get("slip_ymd")%>" size="10" maxlength="8" class="tYMD" title="전표일자" style="border:1 solid gray" onChange="__Calendar_Setting_Post('')"><a href="javascript:Calendar_D(document.main.slip_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a> ~  
						<select name="slip_no" title="전표번호" style="width:70px" onChange="goSearch('N');">
							<option value=''>선택</option>
						<% if(!box.get("slip_ymd").equals("")) { %>
							<%=CodeHelper.OptList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("slip_no"),box.get("slip_ymd"),"","","","3", request)%>
						<% } %>
						</select>
					</td>
					<td class="table01_title" align="center">계정과목</td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="acct_nm" value="<%=box.get("acct_nm")%>" title="계정과목" style="width:132px;ime-mode:active;" onKeyUp="document.main.acct_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<a href="javascript:find_account_code('');"><img src="/com/img/icon_find.gif" border="0" align="absmiddle"></a>
						<input type="hidden" name="acct_cd" value="<%=box.get("acct_cd")%>">
					</td>
					<td colspan="2" align="center">
						<a href="javascript:goSearch('N');"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle">
					</td>
		  		</tr>
			</table>		    
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="20">
				  	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">전표번호, 거래처, 작성자를 클릭</span>하면 해당 세부내용을 조회할 수  있습니다.</td>
				  	<td align="right" class="table_description" style="padding-right:5px;">
				  	<% if(box.get("sign_yn").equals("N")) { %>
						<span id="slip_summary" style="display:none;">
						[전체 <input type="text" name="slip_cnt" size="4" value="" class="tFMONEY" style="height:16px;border-top:none; border-right:none; border-left:none; border-bottom:1 solid gray;" readOnly> 건],&nbsp;&nbsp;
						[<input type="text" name="slip_amt_tot" size="15" value="" class="tMONEY" style="height:16px;border-top:none; border-right:none; border-left:none; border-bottom:1 solid gray;" readOnly> 원]
						</span>
					<% } %>
				  	</td>
				</tr>
          		<tr>
					<td colspan="2" width="100%">
						<div id="divList" style="width:100%;height:300px;overflow-y:scroll">
<% } %>
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
							<% if(!box.get("excel_yn").equals("Y")) { %>
								<td><input type="checkbox" name="checkbox" value="Y" style="border:none" onClick="go_select_all()"></td>
							<% } %>
								<td>전표번호</td>
								<td>업무유형</td>
								<td>적요</td>
								<td>작성자</td>
								<td>계정과목</td>
								<td>차변</td>
								<td>대변</td>
								<td>거래처</td>
								<td>증빙일자</td>
			          		</tr> 
					<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="10" align="center">조회할 자료가 없습니다.</td></tr>
					<% }else if(rsWp.getLength() > 0) {
						   int pass_cnt = 0;
					   	   for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
							<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
							<%	if(pass_cnt == 0) {
									int span_cnt = 1;
									for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
										if(!rsWp.get("slip_no",row_index).equals(rsWp.get("slip_no",tmp_index))) { break; }
										span_cnt ++;
									} %>
								<% if(!box.get("excel_yn").equals("Y")) { %>
									<td width="2%" align="center" rowspan="<%=span_cnt%>" style="padding-top:5px;" valign="top">
										<input type="checkbox" name="slip_no<%=row_index%>" value="<%=rsWp.get("slip_no",row_index)%>" style="border:none" <%if(!box.get("sign_yn").equals("Y")){%>onClick="click_slip_no('<%=row_index%>')"<%}%>>
									</td>
								<% } %>
									<td width="10%" align="center" rowspan="<%=span_cnt%>" style="padding-top:5px;" valign="top">
										<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_slip_viewer('<%=rsWp.get("slip_no",row_index)%>')"><%}%><%=rsWp.get("slip_no",row_index,Box.SLIP_NO)%></a>
									<% if(!box.get("excel_yn").equals("Y") && !box.get("sign_yn").equals("Y")) { %>
										<br><input type="text" name="sign_ymd<%=row_index%>" value="" class="tYMD" size="10" maxlength="8" title="결산반영일" style="border:1 solid gray" onDblClick="Calendar_D(document.main.sign_ymd<%=row_index%>)">
									<% }else { %>
										<br><div style="font-size:11px; letter-spacing:-1px;">(<%=rsWp.get("sign_no",row_index)%>)</div>
									<% } %>
									</td>
									<td width="10%" align="center" rowspan="<%=span_cnt%>" style="letter-spacing:-1px; padding-top:5px;" valign="top">
										<%=rsWp.get("biz_type_nm",row_index)%>
										<br><div style="font-size:11px; letter-spacing:-1px;">(<%=rsWp.get("docu_no",row_index)%>)</div>
									</td>
									<td width="14%" rowspan="<%=span_cnt%>" style="letter-spacing:-1px; padding-top:5px;" valign="top"><%=rsWp.get("etc_remark",row_index)%></td>
									<td width="10%" rowspan="<%=span_cnt%>" align="center" style="letter-spacing:-1px; padding-top:5px;" valign="top">
										<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_employee_info('<%=rsWp.get("wrt_empl_no",row_index)%>')"><%}%><%=rsWp.get("wrt_dept_nm",row_index)%><br><%=rsWp.get("wrt_empl_nm",row_index)%></a>
									</td>
								<%	pass_cnt = span_cnt - 1;
								}else {
									pass_cnt --;
								}
							%>
								<td width="15%" style="letter-spacing:-1px"><%=rsWp.get("acct_nm",row_index)%></td>
								<td width="8%" align="right" style="padding-right:2px"><%=rsWp.get("cd_flag",row_index).equals("1") ? rsWp.get("slip_amt",row_index,Box.THOUSAND_COMMA) : ""%></td>
								<td width="8%" align="right" style="padding-right:2px"><%=rsWp.get("cd_flag",row_index).equals("2") ? rsWp.get("slip_amt",row_index,Box.THOUSAND_COMMA) : ""%></td>
								<td width="12%" style="letter-spacing:-1px">
									<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",row_index)%>')"><%}%><%=rsWp.get("cust_nm",row_index)%></a>
									<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_employee_info('<%=rsWp.get("empl_no",row_index)%>')"><%}%><%=rsWp.get("empl_nm",row_index)%></a>
								</td>
								<td width="8%" align="center"><%=rsWp.get("proof_ymd",row_index,Box.DEF_DATE_FMT)%></td>
								<input type="hidden" name="proof_ymd<%=row_index%>"  value="<%=rsWp.get("proof_ymd",row_index)%>">
								<input type="hidden" name="slip_amt<%=row_index%>"  value="<%=rsWp.get("slip_amt",row_index)%>">
							</tr>	
						<% } %>
					 <% } %>
						</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
						</div>
					</td>
				</tr>
			<% if(rsWp.getLength() > 0) { %>
				<tr height="1"><td colspan="2" bgcolor="cccccc" style="padding-top:10px"></td></tr>
				<tr height="28">
					<td colspan="2" align="center" style="padding-top:10px">
					<% if(box.get("sign_yn").equals("Y")) { %>
						<a href="javascript:goSign();"><img id="imgCancel" src="/com/img/icon_sign_cancel.gif" alt="승인취소" border="0" align="absmiddle"></a>
					<% }else { %>
						<a href="javascript:goSign();"><img id="imgSign" src="/com/img/icon_sign_all.gif" alt="일괄승인" border="0" align="absmiddle"></a>
					<% } %>
					</td>
          		</tr> 
          	<% } %>
			</table>
		</td>
  	</tr>
</table>
</form>
<% } %>