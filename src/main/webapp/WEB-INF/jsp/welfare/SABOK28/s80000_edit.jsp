<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "bank_cd@@@@A|","","","","");
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4") || (obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y"))) { isEditable = true; }
%>
<!-- 직원 복지연금 신청서 작성 -->

<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(document.saveForm.apply_ymd.value.replace(/-/g,"") > '<%=DateUtil.toString("yyyyMMdd")%>') { 
				alert('신청일이  오늘 날짜 이후로 입력되었습니다.\n다시 확인 후 입력해주세요.');
				document.saveForm.apply_ymd.focus();
				return;
			}	
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				<%if(obox.get("sign_status").equals("3")) { %>
					document.saveForm.finish_ym.value = document.main.finish_yy.value + document.main.finish_mm.value;
				<% } %>
	
				ajaxSubmitForm("wel02003_update.do","#saveForm", function(rtn) {
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
		ajaxReplaceForm("wel02002_select.do", "#saveForm", "#divFrame");
	}
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel02003_edit.do", "#saveForm", "#divFrame");
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType">
<input type="hidden" name="bugt_cd" 		value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 		value="<%=box.get("apply_no")%>">
<input type="hidden" name="msg_popup" 		value="<%=box.get("msg_popup")%>">
<input type="hidden" name="sign_status"		value="<%=box.get("sign_status")%>">
<input type="hidden" name="support_term"	value="Q">
<input type="hidden" name="finish_ym" 		value="">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
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
				<th width="15%">사번/성명</th>
				<td width="35%"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
					<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%=obox.get("empl_nm")%></a>
					<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
				</td>
				<th width="15%">부서</th>
				<td width="35%"><%=obox.get("dept_nm")%></td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
				<th>직위</th>
				<td><%=obox.get("position_nm")%></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
				<th>사원구분</th>
				<td><%=obox.get("empl_class_nm")%></td>
			</tr>
		</table>
	</div>
	
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th width="15%">지원항목</th>
				<td width="35%">						
					<select name="support_item" title="지원항목" class="bs-select form-control required" style="width:150px">
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("support_item"),"support_item@",box.get("bugt_cd"),"","","",uSesEnt.dbo)%>
					</select>
				</td>
				<th width="15%">본인부담금</th>
				<td width="35%">
					<input type="text" name="self_pay_amt" value="<%=obox.get("self_pay_amt")%>" maxlength="10" title="본인부담금" class="form-control tMONEY" style="width:100px">&nbsp;원
				</td>
			</tr>
			<tr>
				<th>신청일자</th>
				<td>
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="apply_ymd" value="<%=obox.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
				<th>신청금액</th>
				<td>
					<input type="text" name="support_amt" value="<%=obox.get("support_amt")%>" maxlength="10" class="form-control required tMONEY" class="required" title="신청금액" style="width:100px">&nbsp;원
					<input type="hidden" name="apply_amt" value="<%=obox.get("apply_amt")%>">
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td colspan="3">
					<select name="bank_cd" class="bs-select form-control required" title="금융기관" style="width:150px">
						<option value=''>:: 금융기관 선택 ::</option>
			            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
					</select>
					<input type="text" name="account_no" value="<%=obox.get("account_no")%>" title="계좌번호" class="form-control required" style="width:120px">&nbsp;예금주&nbsp;:&nbsp;
					<input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" maxlength="15" title="예금주" class="form-control required" style="width:90px">
				</td>
			</tr>
		<% if(!box.get("apply_no").equals("")) { %>
	  		<tr>
				<th>결재상태</th>
				<td colspan="3"><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
	  		</tr>
		<% } %>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		<%if(!box.get("apply_no").equals("")){%>
			<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
		<% } %>
		</span>
	</div>
</form>