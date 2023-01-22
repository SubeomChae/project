<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>

<title>휴양시설이용 </title>
<script language="javascript">
	function goEdit() {
		document.main.action = 'wel01003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			document.main.action = 'wel01002_delete.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function sign_request_post() {
		document.main.action = 'wel01002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<form name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td align="center" class="table01_title">사번/성명</td>
					<td style="padding-left:5px"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;<%=obox.get("empl_nm")%>
						&nbsp;<a href="javascript:go_employee_info('<%=obox.get("empl_no")%>');"><img src="/com/img/icon_zoom.gif" border="0" align="absmiddle" alt="자세히보기"></a>
						<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
					</td>
					<td align="center" width="15%" class="table01_title">부서</td>
					<td style="padding-left:5px"><%=obox.get("dept_nm")%></td>
				</tr>
				<tr height="28">
					<td width="15%" align="center" class="table01_title">주민번호</td>
					<td width="35%" style="padding-left:5px"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
					<td width="15%" align="center" class="table01_title">직위</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("position_nm")%></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">입사일자</td>
					<td style="padding-left:5px"><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
					<td align="center" class="table01_title">사원구분</td>
					<td style="padding-left:5px"><%=obox.get("empl_class_nm")%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height="10"></td></tr>
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td align="center" class="table01_title">휴양시설명</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("condo_nm")%></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">이용일자</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("start_ymd",Box.DEF_DATE_FMT)%><%if(!obox.get("end_ymd").equals(obox.get("start_ymd"))){%> ~ <%=obox.get("end_ymd",Box.DEF_DATE_FMT)%><%}%>&nbsp;&nbsp;(이용일수 : <%=obox.get("use_ilsu")%> 일)</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">사용인원</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("member_cnt")%> 명</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">이용금액</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("use_amt",Box.THOUSAND_COMMA)%> 원</td>
				</tr>
				<tr height="28">
					<td width="15%" align="center" class="table01_title">신청일자</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
					<td width="15%" align="center" class="table01_title">신청금액</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("apply_amt",Box.THOUSAND_COMMA)%> 원</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">비고</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("etc_remark")%></td>
				</tr>
		  		<tr height="28">
					<td class="table01_title" align="center">전표번호</td>
					<td nowrap style="padding-left:5px"><%=obox.get("slip_no",Box.SLIP_NO)%>
						<%if(!obox.get("slip_no").equals("")){%><a href="javascript:go_slip_viewer('<%=obox.get("slip_no")%>');"><img src="/com/img/icon_zoom.gif" align="absmiddle" border="0"></a><%}%>
						<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
					</td>
					<td class="table01_title" align="center">문서번호</td>
					<td style="padding-left:5px"><%=FormatUtil.msgNo(obox.get("msg_no"))%>
						<%if(!obox.get("msg_no").equals("")){%><a href="javascript:go_docu_viewer('<%=obox.get("msg_no")%>');"><img src="/com/img/icon_zoom.gif" align="absmiddle" border="0"></a><%}%>
					</td>
		  		</tr>
		  		<tr height="28">
					<td class="table01_title" align="center">결재상태</td>
					<td colspan="3" style="padding-left:5px"><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
					<% if(obox.get("sign_status").equals("1")) { %>
						<a href="javascript:go_sign_request(document.signForm);"><img src="/com/img/btn_gian_write.gif" align="absmiddle" border="0"></a>
					<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
						<a href="javascript:go_sign_line('', document.signForm.msg_type.value, document.signForm.search_key.value);"><img src="/com/img/btn_signLine.gif" align="absmiddle" border="0"></a>
					<% } %>
					</td>
		  		</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" style="padding-top:5px">
		<% if(isEditable) { %>
			<a href="javascript:goEdit();"><img src="/com/img/bn_modify.gif" border="0" align="absmiddle"></a>
			<a href="javascript:goDelete();"><img src="/com/img/bn_delete.gif" border="0" align="absmiddle"></a>
		<% } %>
			<a href="javascript:go_rpt_viewer('welfare/<%=box.get("dbo")%>/report/s005PDF', '<%=box.get("apply_no")%>');"><img src="/com/img/bn_print.gif" border="0" align="absmiddle" alt="인쇄">
		</td>
	</tr>
</table>
</form>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="휴양시설이용(<%=obox.get("empl_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP002">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>">
<input type="hidden" name="etc_remark" 		value="<%=obox.get("etc_remark")%>">
<input type="hidden" name="apply_ymd" 		value="<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="apply_amt" 		value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>