<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "bank_cd@@@@A|","","","","","");
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 선진산업시찰 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.data01.value = document.saveForm.area_nm.value;
				document.saveForm.data02.value = document.saveForm.agent_nm.value;
				document.saveForm.data03.value = document.saveForm.start_ymd.value;
				document.saveForm.data04.value = document.saveForm.end_ymd.value;
				document.saveForm.data05.value = document.saveForm.use_ilsu.value;
				document.saveForm.data15.value = document.saveForm.support_amt.value;
				document.saveForm.apply_amt.value = document.saveForm.support_amt.value
				
				ajaxSubmitForm("wel01003_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.apply_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
		
	function goCancel() {
		ajaxReplaceForm("wel01002_select.do", "#saveForm", "#divFrame");
	}
	
	function CalendarSettingPost(target) {
		var use_ilsu = 0;
		if(target.substring(0,9) == 'start_ymd') {
			if(!isEmpty(document.saveForm.end_ymd)) {
				use_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}else if(target.substring(0,7) == 'end_ymd') {
			if(!isEmpty(document.saveForm.start_ymd)) {
				use_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}
		document.saveForm.use_ilsu.value = use_ilsu;
		formatMaskElm(document.saveForm.use_ilsu);
	}
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		removeMask("#saveForm");
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
</script>
<form id="saveForm" name="saveForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<input type="hidden" name="apply_amt" 	value="">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
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
			<th>부서</th>
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
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>예정지역</th>
			<td colspan="3">
				<input type="text" name="area_nm" value="<%=obox.get("area_nm")%>" size="20" maxlength="40" title="예정지역" class="form-control required" style="width:180px">
			</td>
		</tr>
		<tr>
			<th>일정</th>
			<td colspan="3">
				<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=obox.get("start_ymd")%>" maxlength="8" title="이용일자(부터)" class="form-control required tYMD" onChange="CalendarSettingPost('start_ymd')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=obox.get("end_ymd")%>" maxlength="8" title="이용일자(까지)" class="form-control required tYMD" onChange="CalendarSettingPost('end_ymd')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>&nbsp;까지&nbsp;
						(숙박일수 : <input type="text" name="use_ilsu" value="<%=obox.get("use_ilsu")%>" maxlength="3" title="이용일수" class="form-control required tNUM" style="width:35px" readonly> 일)
					</div>
			</td>
		</tr>
		<tr>
			<th>주관사</th>
			<td colspan="3">
				<input type="text" name="agent_nm" value="<%=obox.get("agent_nm")%>" size="20" maxlength="40" title="주관사" class="form-control required" style="width:150px">
			</td>
		</tr>
		<tr>
			<th width="15%">신청일자</th>
			<td width="35%">
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th width="15%">신청금액</th>
			<td width="35%">
				<input type="text" name="support_amt" value="<%=obox.get("support_amt")%>" size="13" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:100px" > 원
			</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td colspan="3">
				<select name="bank_cd" title="금융기관" class="bs-select form-control required" style="width:130px">
					<option value=''>:: 금융기관 선택 ::</option>
		            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
				</select>
				<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="18" maxlength="30" title="계좌번호" class="form-control required" style="width:100px">&nbsp;예금주 :
				<input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="10" maxlength="15" title="예금주" class="form-control required" style="width:100px">
			</td>
		</tr>
	<% if(!box.get("apply_no").equals("")) { %>
  		<tr>
			<td class="table01_title" class="t-center">전표번호</td>
			<td nowrap><%=obox.get("slip_no",Box.SLIP_NO)%>
				<%if(!obox.get("slip_no").equals("")){%><a href="javascript:go_slip_viewer('<%=obox.get("slip_no")%>');"><img src="/com/img/icon_zoom.gif" align="absmiddle" border="0"></a><%}%>
				<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
				<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
			</td>
			<td class="table01_title" class="t-center">결재상태</td>
			<td nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
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