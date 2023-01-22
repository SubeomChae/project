<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "condo_cd|","","","","","",request);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>

<title>휴양시설이용 </title>
<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.data01.value = document.main.condo_nm.value;
				document.main.data04.value = document.main.member_cnt.value;
				document.main.data05.value = document.main.start_ymd.value;
				document.main.data06.value = document.main.end_ymd.value;
				document.main.data07.value = document.main.use_ilsu.value;
				document.main.data08.value = document.main.use_amt.value;
				
				document.main.action = 'wel01003_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}		
	}
		
	function goCancel() {
		removeMask("#main");
		document.main.action = 'wel01002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function __Calendar_Setting_Post(target) {
		if(target.substring(0,9) == 'start_ymd') {
			inx = target.substring(9);
			if(!isEmpty(document.all['end_ymd'+inx])) {
				document.all['use_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000');
			}		
		}else if(target.substring(0,7) == 'end_ymd') {
			inx = target.substring(7);		
			if(!isEmpty(document.all['start_ymd'+inx])) {
				document.all['use_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000');
			}		
		} 
		formatMaskElm(document.all['edu_ilsu'+inx]);
	}
	
	function find_employee_no_post(empl_no, empl_nm) {
		removeMask("#main");
		document.main.apply_no.value = '';
		document.main.empl_no.value = empl_no;
		document.main.empl_nm.value = empl_nm;
		document.main.action = "wel01003_edit.do";
		document.main.target = "_self";
		document.main.submit();
	}

	function page_init() {
		if(!isEmpty(document.main.condo_cd1)) { change_condo_cd('<%=obox.get("condo_cd1")%>', '<%=obox.get("condo_cd2")%>'); }
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
			<% if(uSesEnt.use_auth.startsWith("S")) { %>
				<tr height="28">
					<td align="center" class="table01_title">사원선택</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" size="12" style="background-color:f6f6f6;border:1 solid gray" readOnly>
					<a href="javascript:find_employee_no('')"><img src="/com/img/icon_find.gif" border="0" alt="사원 찾기" align="absmiddle"></a></td>
				</tr>
			<% } %>
				<tr height="28">
					<td align="center" class="table01_title">사번/성명</td>
					<td style="padding-left:5px"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;<%=obox.get("empl_nm")%>
						&nbsp;<a href="javascript:go_employee_info('<%=obox.get("empl_no")%>');"><img src="/com/img/icon_zoom.gif" border="0" align="absmiddle" alt="자세히보기"></a>
						<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
					</td>
					<td align="center" class="table01_title">부서</td>
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
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="condo_nm" value="<%=obox.get("condo_nm")%>" size="20" maxlength="40" title="휴양시설명" class="required" style="border:1 solid gray">
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">이용일자</td>
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=obox.get("start_ymd")%>" size="10" maxlength="8" title="이용일자(부터)" class="required tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a> ~ 
						<input type="text" name="end_ymd" value="<%=obox.get("end_ymd")%>" size="10" maxlength="8" title="이용일자(까지)" class="required tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>&nbsp;&nbsp;
						(숙박일수 : <input type="text" name="use_ilsu" value="<%=obox.get("use_ilsu")%>" size="2" maxlength="3" title="이용일수" class="required tNUM" style="border:1 solid gray"> 일)
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">사용인원</td>
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="member_cnt" value="<%=obox.get("member_cnt")%>" size="3" maxlength="40" title="사용인원" style="border:1 solid gray"> 명
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">이용금액</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="use_amt" value="<%=obox.get("use_amt")%>" size="13" maxlength="10" title="신청금액" class="required tMONEY" style="border:1 solid gray"> 원</td>
				</tr>
				<tr height="28">
					<td width="15%" align="center" class="table01_title">신청일자</td>
					<td width="35%" style="padding-left:5px"><input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" size="10" maxlength="8" title="신청일자" class="required tYMD" style="border:1 solid gray" <%=isEditable?"":"readonly"%>><%if(isEditable){%><a href="javascript:Calendar_D(document.main.apply_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a><%}%></td>
					<td width="15%" align="center" class="table01_title">신청금액</td>
					<td width="35%" style="padding-left:5px"><input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="13" maxlength="10" title="신청금액" class="required tMONEY" style="border:1 solid gray" > 원</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">비고</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" style="width:90%;border:1 solid gray"></td>
				</tr>
			<% if(!box.get("apply_no").equals("")) { %>
		  		<tr height="28">
					<td class="table01_title" align="center">전표번호</td>
					<td nowrap style="padding-left:5px"><%=obox.get("slip_no",Box.SLIP_NO)%>
						<%if(!obox.get("slip_no").equals("")){%><a href="javascript:go_slip_viewer('<%=obox.get("slip_no")%>');"><img src="/com/img/icon_zoom.gif" align="absmiddle" border="0"></a><%}%>
						<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
						<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
					</td>
					<td class="table01_title" align="center">결재상태</td>
					<td nowrap style="padding-left:5px"><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
		  		</tr>
			<% } %>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" style="padding-top:5px">
			<a href="javascript:goSave();"><img src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
			<%if(!box.get("apply_no").equals("")){%><a href="javascript:goCancel();"><img src="/com/img/bn_cancel.gif" border="0" align="absmiddle"></a><%}%>
		</td>
	</tr>
</table>
</form>