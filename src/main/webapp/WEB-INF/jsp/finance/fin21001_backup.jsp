<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>미지급금 결제</title>

<script language='javascript'>
	function goSearch() {
	<% if(box.get("cd_flag").equals("2")) { %>
		var days = getDayInterval(document.main.start_ymd.value.replace(/-/g,""), document.main.end_ymd.value.replace(/-/g,""));
		if(days > 365) {
			alert('조회기간은 365일 이내로 지정하셔야 합니다.');
			document.main.end_ymd.focus();
			return;
		}
	<% } %>

		removeMask("#main");		
		displaySinjaxAlert(200,400,'조회중입니다. 잠시만 기다려 주십시오.');		
		document.main.action = 'fin21001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goSave() {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			if(document.all['slip_key'+i].checked) { 
				document.main.slip_key.value += document.all['slip_key'+i].value; 
			}
		}
		
		if(isEmpty(document.main.slip_key)) {
			alert('대체할 자료가 선택되지 않았습니다.');
			return;
		}
		
		if(formValidate("#main")) {
			if(isEmpty(document.main.dae_acct_cd)) {
				alert('결제계정과목이 선택되지 않았습니다.');
				document.main.dae_acct_cd.focus();
				return;
			}else if(isEmpty(document.main.account_no)) {
				alert('계좌번호가 선택되지 않았습니다.');
				document.main.account_no.focus();
				return;
			}
			
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				displaySinjaxAlert(200,400,'처리중입니다. 잠시만 기다려 주십시오.');
				document.main.action = 'fin21001_insert.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}	
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'fin21001_delete.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function autoCalc() {
		var dae_amt = 0;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			if(document.all['slip_key'+i].checked) { dae_amt += parseInt2(document.all['slip_amt'+i]); }
		}
		document.main.dae_amt.value = dae_amt;
		formatMaskElm(document.main.dae_amt);
	}
	
	function change_acct_cd(acct_cd) {
		document.main.account_no.options.length=0;
		if(acct_cd != '') {
			protoSetUrlOption('PR_FINTB_ACNO01_LIST@LISTCODE', document.main.account_no, '', acct_cd, '', '', '', '', ':: 계좌번호 선택 ::');
		}
	}
	
	function __Calendar_Setting_Post(target) {
		if(!isEmpty(document.main.p_slip_ymd)) {
			document.main.p_slip_no.options.length = 0;
			var slip_ymd = document.main.p_slip_ymd.value.replace(/-/g,"");
			protoSetUrlOption('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.p_slip_no, '', slip_ymd, 'B20', '', '', '', '선택'); 
		}
	}
	
	function sign_request_post() { goSearch(); }
</script>
</head>
<body>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="slip_key"  	value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr> 
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">미지급금 결제</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="130" align="center">
						<input type="radio" name="cd_flag" value="2" <%=box.get("cd_flag").equals("2")?"checked":""%> style="border:none" onClick="goSearch();"> 대체&nbsp;
						<input type="radio" name="cd_flag" value="1" <%=box.get("cd_flag").equals("1")?"checked":""%> style="border:none" onClick="goSearch();"> 취소
					</td>
				<% if(box.get("cd_flag").equals("2")) { %>
					<td width="10%" class="table01_title" align="center">기준일자</td>
					<td width="25%" nowrap style="padding:0 5 0 5">
						<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" size="10" maxlength="8" title="기준일자(부터)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border='0'></a> ~ 
						<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" size="10" maxlength="8" title="기준일자(까지)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border='0'></a>
					</td>
					<td width="10%" class="table01_title" align="center">
						<select name="search_key" style="width:95%">
							<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>작성자성명</option>
							<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>작성자사번</option>
							<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>작성부서</option>
							<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>적요</option>
						</select>
					</td>
					<td width="*" style="padding-left:5px">
						<input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:120px; border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')">
						<a href="javascript:goSearch();"><img src="/com/img/icon_search.gif" border="0" align="absmiddle"></a>
					</td>
				<% }else { %>
					<td width="10%" class="table01_title" align="center">전표번호</td>
					<td width="*" nowrap style="padding:0 5 0 5">
						<input type="text" name="p_slip_ymd" value="<%=box.get("p_slip_ymd")%>" size="10" maxlength="8" class="required tYMD" title="전표일자" style="border:1 solid gray" onChange="__Calendar_Setting_Post('')"><a href="javascript:Calendar_D(document.main.p_slip_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border='0'></a> - 
						<select name="p_slip_no" title="전표번호" style="width:70px" onChange="goSearch();">
							<option value=''>선택</option>
						<% if(!obox.get("slip_no").equals("")) { %>
							<%=CodeHelper.OptList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("p_slip_no"),box.get("p_slip_ymd"),"B20","","","", request)%>
						<% } %>
						</select>
					<% if(obox.get("sign_status").equals("1")) { %>
						<a href="javascript:go_sign_request(document.signForm);"><img src="/com/img/btn_gian_write.gif" align="absmiddle" border="0"></a>
					<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
						<a href="javascript:go_sign_line('', document.signForm.msg_type.value, document.signForm.search_key.value);"><img src="/com/img/btn_signLine.gif" align="absmiddle" border="0"></a>
					<% } %>
						<a href="javascript:goSearch();"><img src="/com/img/icon_search.gif" border="0" align="absmiddle"></a>
					</td>
				<% } %>
		  		</tr>
			</table>		    
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="20">
				  	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">전표번호를 클릭</span>하면 해당 세부내용을 조회할 수  있습니다.</td>
				  	<td align="right"></td>
				</tr>
          		<tr>
					<td colspan="2" width="100%">
						<div id="divList" style="width:100%;height:300px;overflow-y:scroll">
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
								<td></td>
								<td>전표번호</td>
								<td>업무유형</td>
								<td>적요</td>
								<td>작성부서</td>
								<td>작성자</td>
								<td>금액</td>
								<td>지출거래처</td>
								<td>증빙일자</td>
			          		</tr> 
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="9" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
					   	   for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
								<td width="2%" align="center">
								<% if(box.get("cd_flag").equals("2")) { %>
									<input type="checkbox" name="slip_key<%=i%>" value="<%=rsWp.get("slip_no",i)%><%=rsWp.get("slip_seq",i)%>|" style="border:none" onClick="autoCalc()">
								<% }else { %>
									<%=String.valueOf(i+1)%>
								<% } %>
								</td>
								<td width="10%" align="center"><a href="javascript:go_slip_viewer('<%=rsWp.get("slip_no",i)%>')"><span style="letter-spacing:0px"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></span></a></td>
								<td width="10%" align="center"><%=rsWp.get("biz_type_nm",i)%></td>
								<td width="16%" style="letter-spacing:-1px;"><%=rsWp.get("etc_remark",i)%></td>
								<td width="12%" align="center" style="letter-spacing:-1px;"><%=rsWp.get("wrt_dept_nm",i)%></td>
								<td width="8%" align="center" style="letter-spacing:-1px;"><a href="javascript:go_employee_info('<%=rsWp.get("wrt_empl_no",i)%>')"><%=rsWp.get("wrt_empl_nm",i)%></a></td>
								<td width="8%" align="right" style="padding-right:2px"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
								<td width="13%" align="center" style="letter-spacing:-1px">
									<a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a>
									<a href="javascript:go_employee_info('<%=rsWp.get("empl_no",i)%>')"><%=rsWp.get("empl_nm",i)%></a>
								</td>
								<td width="8%" align="center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
								<input type="hidden" name="slip_amt<%=i%>" 	value="<%=rsWp.get("slip_amt",i)%>">
							</tr>	
						<% } %>
					 <% } %>
						</table>
						</div>
					</td>
				</tr>
			<% if(rsWp.getLength() > 0) { %>
				<tr height="1"><td colspan="2" bgcolor="cccccc" style="padding-top:10px"></td></tr>
				<tr>
					<td colspan="2" align="center" style="padding-top:10px">
					<% if(box.get("cd_flag").equals("2")) { %>
						<select name="dae_acct_cd" title="결제계정과목" onChange="change_acct_cd(this.value)">
							<option value=''>:: 결제계정과목 선택 ::</option>
				            <option value="1110103">보통예금</option> 
							<option value="1110105">기업자유예금</option>
 						</select>
 						<select name="account_no" title="계좌번호">
							<option value=''>:: 계좌번호 선택 ::</option>
 						</select>
 						<input type="text" name="dae_amt" value="" class="tMONEY" style="width:120px;height:19px;background-color:f6f6f6;border:1 solid gray" readOnly>
						<a href="javascript:goSave();"><img id="btnInsert" src="/com/img/bn_save.gif" alt="대체" border="0" align="absmiddle"></a>
					<% }else if(obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { %>
						<a href="javascript:goDelete();"><img id="btnDelete" src="/com/img/bn_delete.gif" alt="취소" border="0" align="absmiddle"></a>
					<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("3")) { %>
						대체전표가 <font color=red><b><%=obox.get("sign_status").equals("2")?"승인대기":"승인"%></b></font>상태에 있으므로 취소할 수 없습니다.
					<% } %>
					</td>
          		</tr> 
          	<% } %>
			</table>
		</td>
  	</tr>
</table>
</form>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="<%=obox.get("subject")%>">
<input type="hidden" name="msg_type" 		value="SLP003">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>">
<input type="hidden" name="etc_remark" 		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>