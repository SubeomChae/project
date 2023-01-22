<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 문화활동비지원 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.data01.value = document.main.start_ymd.value;
				document.main.data04.value = document.main.event_content.value;
				
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
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
	
	function __Calendar_Setting_Post(target) {
		if(target == 'start_ymd') {
			document.main.end_ymd.value = document.main.start_ymd.value.replace(/-/g,"");
			formatMaskElm(document.main.end_ymd);
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
<%@ include file="/WEB-INF/jsp/welfare/payGuide.jsp" %>
	
	<table class="table table-view table-bordered table-cover marB5">
	<% if(uSesEnt.use_auth.startsWith("S")) { %>
		<tr>
			<th>사원선택</th>
			<td colspan="3">
				<div class="input-group input-medium">
					<input type="text" name="empl_nm" value="<%=obox.get("empl_nm",Box.SPECIAL_CHAR)%>" class="form-control" style="width:90px" readOnly>
					<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button></span>
				</div>
			</td>
		</tr>
	<% } %>
		<tr>
			<th>사번/성명</th>
			<td><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
				<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><b><%=obox.get("empl_nm")%></b></a>
				<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
			</td>
			<th width="15%">부서</th>
			<td><%=obox.get("dept_nm")%></td>
		</tr>
		<tr>
			<th width="15%">주민번호</th>
			<td width="35%"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
			<th width="15%">직위</th>
			<td width="35%"><%=obox.get("position_nm")%></td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
			<th>사원구분</th>
			<td><%=obox.get("empl_class_nm")%></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		<tr>
			<th>문화활동구분</th>
			<td>
			<% if(box.get("apply_no").equals("")) { %>
				<select name="sub_cd" title="문화활동구분" class="bs-select form-control required" style="width:120px">
					<option value=''>선택</option>
					<%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",obox.get("bugt_cd"),"2",box.get("bugt_cd"),"","","",uSesEnt.dbo)%>
				</select> 
			<% }else { %>
				<%=obox.get("sub_nm")%>
			<% } %>
			</td>
			<th>일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="<%=box.get("data01",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="start_ymd" value="<%=box.get("data01")%>" maxlength="8" title="일자(부터)" class="form-control tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
		</tr>
		<tr height="100">
			<th>활동내용</th>
			<td colspan="3"><textarea name="event_content" title="활동내용" class="form-control required" style="height:90;width:100%;ime-mode:active;"><%=obox.get("data04")%></textarea></td>
		</tr>
		<tr>
			<th width="15%">신청일자</th>
			<td width="35%">
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th>신청금액</th>
			<td>
				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="13" maxlength="10" class="form-control required tMONEY" class="required" title="신청금액" style="width:90px;" > 원
			</td>
		</tr>
		<tr>
			<th>비고</th>
			<td colspan="3">
				<input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="width:90%;">
			</td>
		</tr>
	<% if(!box.get("apply_no").equals("")) { %>
  		<tr>
			<th>전표번호</th>
			<td>
				<%if(!obox.get("slip_no").equals("")){%>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
				<%}%>
				<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
				<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
			</td>
			<td>결재상태</td>
			<td><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
  		</tr>
	<% } %>
	</table>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		<%if(!box.get("apply_no").equals("")){%>
			<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
		<% } %>
		</span>
	</div>
</form>