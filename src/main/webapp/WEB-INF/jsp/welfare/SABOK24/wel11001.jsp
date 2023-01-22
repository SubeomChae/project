<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="pbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(box.get("action_type").equals("edit") && rsWp.getLength() > 0) { isEditable = true; }
	if(box.get("excel_yn").equals("Y")) { isEditable = false; }
%>
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/com/include/excel_header.jsp" %>
<% } %>

<title>선물 일괄지급</title>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {		
			var theURL = 'wel11001_list.do';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=선물일괄지급'; }
	
			removeMask("#main");	
			<% if(rsWp.getLength() > 0) { %> document.main.unit_count.value = document.form1.unit_count.value; <% } %>
			document.main.pay_cond.value = concat_pay_cond();
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goSave() {
		if(formValidate("#main")) {
			var new_empl_no = '';
			for(var i=0; i < <%=rsWp.getLength()%>; i++) {
				if(document.all['new_empl_no'+i].checked) { new_empl_no += document.all['new_empl_no'+i].value; }
			}
			if(new_empl_no == '') {
				alert('지급대상자가 선택되지 않았습니다.');
				return;
			}
	
			if(confirm('선물지급 대상자를 일괄 저장하시겠습니까?')) {
				removeMask("#main");		
				document.main.old_empl_no.value = document.form1.old_empl_no.value;
				document.main.new_empl_no.value = new_empl_no;
				document.main.discount_amt.value = parseInt2(document.form1.discount_amt);
				document.main.pay_cond.value = concat_pay_cond();
				document.main.action = 'wel11001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function go_create_slip() {
		if(formValidate("#main")) {
			if(confirm('전표를 생성하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel11001_create_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDelete() {
		if(formValidate("#main")) {
			if(confirm('선물지급 대상자를 일괄 삭제하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel11001_delete.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function go_delete_slip() {
		if(formValidate("#main")) {
			if(confirm('전표를 삭제하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel10.do?method=wel11001_delete_slip';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function sign_request_post() { goSearch('N'); }
	
	function concat_pay_cond() {
		var pay_cond = document.form1.entry_ymd1.value.replace(/-/g,"") + "|" + document.form1.entry_ymd2.value.replace(/-/g,"") + "|";
		for(var i=0; i < document.form1.empl_class.length; i++) {
			if(document.form1.empl_class[i].checked) { pay_cond += document.form1.empl_class[i].value; }
		}	
		pay_cond += "|";			  
		for(var i=0; i < document.form1.empl_status.length; i++) {
			if(document.form1.empl_status[i].checked) { pay_cond += document.form1.empl_status[i].value; }
		}	
		document.main.pay_cond.value = pay_cond;
		return pay_cond;			  
	}

	function go_select_all() {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				document.all['new_empl_no'+i].checked = document.form1.checkbox.checked; 
			} catch(e) {}
		}
		auto_calc('');
	}
	
	function auto_calc(inx) {
	<%  int cnt = obox.getInt("member_cnt");
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(rsWp.get("exist_yn",i).equals("Y")) { cnt--; }
		}
	%>	
		if(inx == '') {
			document.form1.member_cnt.value = document.form1.checkbox.checked ? <%=cnt+rsWp.getLength()%> : <%=cnt%>;
		}else {
			document.form1.member_cnt.value = parseInt2(document.form1.member_cnt) + (document.all['new_empl_no'+inx].checked ? 1 : -1);
		}
		document.form1.pay_amt_tot.value = parseInt2(document.form1.member_cnt) * parseInt2(document.form1.pay_amt) - parseInt2(document.form1.discount_amt);
		formatMaskElm(document.form1.member_cnt);
		formatMaskElm(document.form1.pay_amt_tot);
	}
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('Y');
	}
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<% if(!box.get("msg_popup").equals("Y")) { %>
	<tr> 
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">선물 일괄지급</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<% } %>
	<tr valign="top">
		<td align="center">
			<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="old_empl_no" 	value="">
			<input type="hidden" name="new_empl_no" 	value="">
			<input type="hidden" name="pay_cond" 		value="<%=obox.get("pay_cond")%>">
			<input type="hidden" name="discount_amt" 	value="<%=pbox.getInt("discount_amt")%>">
			<input type="hidden" name="sort_order" 		value="">
			<input type="hidden" name="unit_count" 		value="">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
			<% if(!box.get("msg_popup").equals("Y")) { %>
		  		<tr height="28">
					<td width="13%" align="center" class="table01_title">기준년도</td>
					<td width="17%" style="padding-left:5px">
						<select name="std_yy" title="기준년도" style="width:90px" onChange="changeObjectProperty(document.main.bugt_cd, 'enabled', false); goSearch('N')">
							<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
						</select>
					</td>
					<td width="13%" align="center" class="table01_title">세부사업명</td>
					<td width="27%" style="padding-left:5px">
						<select name="bugt_cd" class="required" title="세부사업명" style="width:170px" onChange="goSearch('N')">
							<option value=''>선택</option>
							<%=CodeHelper.OptList("PR_BUDTB_BUGT01_LIST","LISTCODE",box.get("bugt_cd"),box.get("std_yy"),StringUtil.substr(box.get("bugt_cd"),0,6),"2","","", request)%>
						</select>
					</td>
				    <td align="center">
			  			<a href="javascript:goSearch('N');"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>
						
				    </td>
		  		</tr>
		  	<% } %>	
			<% if(!box.get("bugt_cd").equals("")) { %>
		  		<tr height="28">
					<td align="center" class="table01_title">지급일자</td>
					<td style="padding-left:5px">
					<% if(box.get("action_type").equals("edit")) { %>
						<input type="text" name="pay_ymd" value="<%=DateUtil.toString("yyyyMMdd")%>" size="10" maxlength="8" class="required tYMD" title="지급일자" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.pay_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a></td>
					<% }else { %>
						<%=obox.get("pay_ymd",Box.DEF_DATE_FMT)%>
					<% } %>
					<td align="center" class="table01_title">지급기준</td>
					<td colspan="2" nowrap style="padding-left:5px">
						<%=pbox.getInt("member_cnt")%> 명 x <%=FormatUtil.insertComma(String.valueOf(pbox.getLong("unit_amt")))%> 원 = 소요예산(<%=FormatUtil.insertComma(String.valueOf(pbox.getLong("bugt_amt")))%> 원)
					<% if(box.get("action_type").equals("edit")) { %>
						<img src="/com/img/bn_daesang.gif" border="0" align="absmiddle" alt="대상자추출" style="cursor:hand" onClick="document.getElementById('divSpecialTable').style.display='';">
						<% if(rsWp.getLength() > 0) { %>
							<img src="/com/img/bn_save.gif" border="0" align="absmiddle" alt="저장" style="cursor:hand" onClick="goSave();">
						<% } %>
					<% } %>
					<% if(obox.getInt("member_cnt") > 0 && obox.get("slip_no").equals("")) {%>
						<img src="/com/img/bn_delete_all.gif" border="0" align="absmiddle" alt="전체삭제" style="cursor:hand" onClick="goDelete();">
					<% } %>
					</td>
		  		</tr>
			<% } %>
			<% if(obox.getInt("member_cnt") > 0) { %>
				<tr height="28">
					<td align="center" class="table01_title">전표번호</td>
					<td colspan="5" style="padding-left:5px">
					<% if(obox.get("slip_no").equals("")) { %>
						미작성&nbsp;<a href="javascript:go_create_slip();"><img src="/com/img/bn_create_slip.gif" border="0" align="absmiddle" alt="전표분개"></a>
					<% }else { %>
						<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
						<%=obox.get("slip_no",Box.SLIP_NO)%><a href="javascript:go_slip_viewer('<%=obox.get("slip_no")%>');"> <img src="/com/img/icon_zoom.gif" border="0" align="absmiddle"></a>
						&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
						<% if(obox.get("sign_status").equals("1")) { %>
							<a href="javascript:go_sign_request(document.signForm);"><img id="btnRequest" src="/com/img/btn_gian_write.gif" border="0" align="absmiddle" alt="기안문작성"></a>
							<img src="/com/img/bn_delete_slip.gif" border="0" align="absmiddle" alt="전표삭제" style="cursor:hand" onClick="go_delete_slip();">
						<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { %>
							<a href="javascript:go_sign_line('', document.signForm.msg_type.value, document.signForm.search_key.value);"><img id="btnSignLine" src="/com/img/btn_signLine.gif" border="0" align="absmiddle" alt="결재라인"></a>
						<% } %>
					<% } %>
					</td>
				</tr>
			<% } %>
			</table>
			</form>
			<form name="form1" method="post" action="" class="fType" style="margin:0px">
			<table id="divSpecialTable" cellpadding="0" cellspacing="1" border="0" bgcolor="#000000" style="position:absolute; left:20%; top:20%; width:400px; background:#000000; z-index:1;display:none;">
				<tr>
				  	<td bgcolor="white" style="padding:0 1 0 1">
						<table width="400" border="0" cellpadding="0" cellspacing="0" class="table03">
							<tr>																											
								<td colspan="2"><img src="/com/img/slip_search_bar.jpg" width="400" border="0" align="absmiddle" usemap="#map01"></a></td>
								<map name="map01"><area shape="rect" coords="360,1,398,12" href="#" onClick="document.getElementById('divSpecialTable').style.display='none';" alt="닫기"></map>											
							</tr>
							<tr height="30">																											
								<td colspan="2"><img src="/com/img/title_bullet.gif" border="0" align="absmiddle"> <b>선물지급 대상자 추출 조건설정</b></td>
							</tr>
							<%	String arr[] = StringUtil.split(obox.get("pay_cond")+"||||||||||","|",true); %>
							<tr height="28">	
								<td width="25%" class="table01_title">입사일자</td>																										
								<td width="75%" style="padding-left:5px">
									<input type="text" name="entry_ymd1" value="<%=arr[0]%>" size="10" maxlength="8" title="입사일자(부터)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.form1.entry_ymd1)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a> ~ 
									<input type="text" name="entry_ymd2" value="<%=arr[1]%>" size="10" maxlength="8" title="입사일자(까지)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.form1.entry_ymd2)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>
								</td>
							</tr>
							<tr height="28">																											
								<td class="table01_title">사원구분</td>																										
								<td style="padding-left:5px">
								<%	RsWrapper codeWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE","","empl_class@"+uSesEnt.dbo,"","","","","",request);
									for(int i=0; i < codeWp.getLength(); i++) { %>
									<input type="checkbox" name="empl_class" value="<%=codeWp.get("code",i)%>," <%=arr[2].indexOf(codeWp.get("code",i)) >= 0 ? "checked":""%> style="border:none"><%=codeWp.get("data",i)%>&nbsp;<%if(i%2==1){%><br><%}%>
								<%	} %>	
								</td>
							</tr>
							<tr height="28">																											
								<td class="table01_title">재직구분</td>																										
								<td style="padding-left:5px">
									<input type="checkbox" name="empl_status" value="S" <%=arr[3].indexOf("S") >= 0 ? "checked":""%> style="border:none">재직자
									<input type="checkbox" name="empl_status" value="H" <%=arr[3].indexOf("H") >= 0 ? "checked":""%> style="border:none">휴직자
								</td>
							</tr>
							<tr height="25">																											
								<td colspan="2" align="right" style="padding:5 5 5 0">
									<%if(obox.getInt("member_cnt")==0){%><img src="/com/img/bn_search.gif" border="0" align="absmiddle" onClick="goSearch('N');"></a><%}%>
									<img src="/com/img/bn_close.gif" border="0" align="absmiddle" onClick="document.getElementById('divSpecialTable').style.display='none';"></a>
								</td>
							</tr>
						</table>
				  	</td>											
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr>
				  	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">성명을 클릭</span>하면 해당 사원의 상세정보를 검색할 수 있습니다.</td>
				  	<td align="right" valign="bottom" style="padding-bottom:5px">
				  	<% if(!obox.get("slip_no").equals("")) { %>
						<b>총 지급액</b> : <%=obox.getInt("member_cnt")%> 명 x <%=pbox.get("unit_amt",Box.THOUSAND_COMMA)%> 원 
						<%if(obox.getInt("discount_amt") > 0){%>- (할인액 : <%=obox.get("discount_amt",Box.THOUSAND_COMMA)%> 원)<%}%>
						= <span style="font-weight:bold; color:#01a1db;"><%=FormatUtil.insertComma(String.valueOf(obox.getInt("pay_amt") - obox.getInt("discount_amt")))%></span> 원
				  	<% }else if(isEditable) { %>
				  		<b>총 지급액</b> : 
						<input type="text" name="member_cnt" value="<%=obox.getInt("member_cnt")%>" size="4" title="인원수" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 명 x 
						<input type="text" name="pay_amt" value="<%=pbox.get("unit_amt")%>" size="10" title="지원금액" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 원   
						- (할인액 : <input type="text" name="discount_amt" value="<%=pbox.getInt("discount_amt")%>" size="10" title="할인액" class="tMONEY" style="border:1 solid #c9c9c9" onChange="document.form1.pay_amt_tot.value = parseInt2(document.form1.pay_amt_tot) - parseInt(this.value); formatMaskElm(document.form1.pay_amt_tot);"> 원) 
						= <input type="text" name="pay_amt_tot" value="<%=obox.getInt("member_cnt")*pbox.getLong("unit_amt")%>" size="13" title="합계" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 원
				  	<% } %>
				  	</td>
				</tr>
          		<tr>
					<td width="100%" colspan="2">
						<div id="divList" style="width:100%;height:300px;overflow-y:scroll;">
<% } %>
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
								<td width="4%">No</td>
								<td width="8%">사번</td>
								<td width="8%">성명</td>
								<td width="15%">부서</td>
								<td width="10%">직위</td>
								<td width="10%">입사일자</td>
								<td width="13%">주민번호</td>
								<td width="13%">사원구분</td>
								<td width="8%">재직상태</td>
								<td width="10%">지급액</td>
								<%if(isEditable){%><td width="30"><input type="checkbox" name="checkbox" value="Y" style="border:none" onClick="go_select_all()"></td><%}%>
			          		</tr> 
					<% if(!box.get("bugt_cd").equals("") && rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="<%=isEditable ? 11 : 10%>" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else if(rsWp.getLength() > 0) {
						   String old_empl_no = rsWp.get("sort_key",0) + "@" + rsWp.get("sort_key",rsWp.getLength()-1);
					   	   for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
								<td align="center"><%=String.valueOf(i+1)%></td>
								<td align="center"><%=rsWp.get("empl_no",i)%></td>
								<td align="center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_employee_info('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
								<td align="center"><%=rsWp.get("dept_nm",i)%></td>
								<td align="center"><%=rsWp.get("position_nm",i)%></td>
								<td align="center"><%=rsWp.get("entry_ymd",i, Box.DEF_DATE_FMT)%></td>
								<td align="center"><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
								<td align="center"><%=rsWp.get("empl_class_nm",i)%></td>
								<td align="center"><%=rsWp.get("empl_status_nm",i)%></td>
								<td align="center"><%=obox.getInt("member_cnt") > 0 ? rsWp.get("pay_amt",i,Box.THOUSAND_COMMA) : pbox.get("unit_amt",Box.THOUSAND_COMMA)%></td>
								<%if(isEditable){%><td align="center"><input type="checkbox" name="new_empl_no<%=i%>" value="<%=rsWp.get("empl_no",i)%>," style="border:none" <%=rsWp.get("exist_yn",i).equals("Y")?"checked":""%> onClick="auto_calc('<%=i%>')"></td><%}%>
							</tr>	
						<% } %>
							<input type="hidden" name="old_empl_no" value="<%=old_empl_no%>">
					<% } %>
						</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
						</div>
					</td>
				</tr>
			</table>
		<% if(rsWp.getLength() > 0) { 
			String unit_count = FormatUtil.nvl2(box.get("unit_count"),"100");%>	
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" style="padding-top:5px"><%=rsWp.getPageLine(request, unit_count, 10)%></td>
					<td width="70" align="right">
						<select name="unit_count" title="페이지당 조회수" style="width:60px;">
							<option value='30' <%=unit_count.equals("30")?"selected":""%>>30명</option>
							<option value='100' <%=unit_count.equals("100")?"selected":""%>>100명</option>
							<option value='500' <%=unit_count.equals("500")?"selected":""%>>500명</option>
						</select>
					</td>
				</tr>
			</table>
		<% } %>
			</form>
		</td>
  	</tr>
</table>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="선물지급(<%=obox.get("bugt_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP005">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("std_yy")%>|<%=obox.get("bugt_cd")%>">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="pay_ymd"			value="<%=obox.get("pay_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="member_cnt"		value="<%=obox.get("member_cnt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="pay_amt"			value="<%=FormatUtil.insertComma(String.valueOf(obox.getInt("pay_amt") - obox.getInt("discount_amt")))%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
<script language="javascript">
	document.getElementById("divList").style.height = document.body.clientHeight - 150 - <%=box.get("bugt_cd").equals("")?"0":"28"%> - <%=box.get("action_type").equals("view")?"28":"0"%> + <%=box.get("msg_popup").equals("Y")?"63":"0"%> - <%=rsWp.getLength() > 0?"28":"0"%>;
</script>
<script for=window event="onresize" language="JScript">
	document.getElementById("divList").style.height = document.body.clientHeight - 150 - <%=box.get("bugt_cd").equals("")?"0":"28"%> - <%=box.get("action_type").equals("view")?"28":"0"%> + <%=box.get("msg_popup").equals("Y")?"63":"0"%> - <%=rsWp.getLength() > 0?"28":"0"%>;
</script>
<% } %>