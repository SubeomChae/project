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
<!-- 모성보호 신청서 작성 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.data01.value = document.saveForm.due_date.value;
				document.saveForm.data02.value = document.saveForm.mother_status.value;
				document.saveForm.data03.value = document.saveForm.fetus_status.value;
				
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
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		removeMask("#saveForm");
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<input type="hidden" name="apply_amt" 	value="500000">
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
			<th>신청일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th>출산예정일</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="<%=box.get("due_date",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="due_date" value="<%=box.get("due_date")%>" maxlength="8" title="출산예정일" class="form-control required tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
		</tr>	
		<tr>	
			<th width="15%">임산부 건강상태</th>
			<td width="35%">
				<input type="text" name="mother_status" value="<%=obox.get("mother_status")%>" size="20" maxlength="20" title="임산부 건강상태" class="form-control required" style="width:120px">
			</td>
			<th width="15%">태아 건강상태</th>
			<td width="35%">
				<input type="text" name="fetus_status" value="<%=obox.get("fetus_status")%>" size="20" maxlength="20" title="태아 건강상태" class="form-control required" style="width:120px">
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
			<th>전표번호</th>
			<td>
				<%if(!obox.get("slip_no").equals("")) { %>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
				<% } %>
				<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
				<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
			</td>
			<th>결재상태</th>
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