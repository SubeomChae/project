<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "rel_no_type|vat_cd|","","","","",uSesEnt.dbo); %>
<!-- 회계전표 수정 -->
<script language="javascript">
	var old_vat_cd = '<%=obox.get("vat_cd")%>'; 
	function goSave2() {
		if(formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				var acc_summary = 'N';
				if(document.saveForm.sign_status.value == '3' && !isEmpty(document.saveForm.sign_ymd)) {
					if	   (document.saveForm.acct_cd.value   != '<%=obox.get("acct_cd")%>')  { acc_summary = 'Y'; }
					else if(document.saveForm.rel_no.value    != '<%=obox.get("rel_no")%>')   { acc_summary = 'Y'; }
				}
				ajaxSubmitForm("slp21002_update.do?acc_summary="+acc_summary,"#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.slip_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function _changeAcctCodePost(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_type, rel_no_flag, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag) {
		if(cust_cd_flag 	>= '2') { changeObjectProperty(document.saveForm.cust_nm, 'requiredOnly', false); }
		if(cost_dept_flag 	>= '2') { changeObjectProperty(document.saveForm.cost_dept_nm, 'requiredOnly', false); }
		if(empl_no_flag 	>= '2') { changeObjectProperty(document.saveForm.empl_nm, 'requiredOnly', false); }
		if(rel_no_flag 		>= '2') { changeObjectProperty(document.saveForm.rel_no, 'required', false); }
		if(issue_ymd_flag 	>= '2') { changeObjectProperty(document.saveForm.issue_ymd, 'required', false); }
		if(finish_ymd_flag 	>= '2') { changeObjectProperty(document.saveForm.finish_ymd, 'required', false); }
		if(intr_rate_flag 	>= '2') { changeObjectProperty(document.saveForm.intr_rate, 'required', false); }
		if(tax_rate_flag 	>= '2') { changeObjectProperty(document.saveForm.tax_rate, 'required', false); }
		if(vat_cd_flag 		>= '2') { changeObjectProperty(document.saveForm.vat_cd, 'required', false); }
	}

	function change_account_type(account_type) {
		if(account_type != '') {
			document.saveForm.acct_cd.value = account_type;
			document.saveForm.acct_nm.value = getSelectedText(document.saveForm.account_type);
			document.saveForm.rel_no.options.length=0;
			protoSetUrlOption('PR_FINTB_ACNO01_LIST@LISTCODE', document.saveForm.rel_no, '', account_type, '', '', '', '', '계좌번호 선택');
		}
	}
	
	function change_vat_cd(vat_cd) {}

	function page_init() {
		_changeAcctCodePost('<%=obox.get("acct_cd")%>','<%=obox.get("cust_cd_flag")%>','<%=obox.get("cost_dept_flag")%>','<%=obox.get("empl_no_flag")%>','<%=obox.get("rel_no_type")%>','<%=obox.get("rel_no_flag")%>',
						    '<%=obox.get("issue_ymd_flag")%>','<%=obox.get("finish_ymd_flag")%>','<%=obox.get("intr_rate_flag")%>','<%=obox.get("tax_rate_flag")%>','<%=obox.get("vat_cd_flag")%>');
	}	
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="slip_no" 		value="<%=obox.get("slip_no")%>">
<input type="hidden" name="slip_seq" 		value="<%=obox.get("slip_seq")%>">
<input type="hidden" name="cd_flag" 		value="<%=obox.get("cd_flag")%>">
<input type="hidden" name="sign_status" 	value="<%=obox.get("sign_status")%>">
<input type="hidden" name="sign_ymd" 		value="<%=obox.get("sign_ymd")%>">
<input type="hidden" name="acc_unit" 		value="<%=obox.get("acc_unit")%>">
<input type="hidden" name="sign_no" 		value="<%=obox.get("sign_no")%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th><span style="font-weight:bold; color:#01a1db;">세부항목</span></th>
				<td colspan="3" nowrap>
					<div class="mt-radio-inline">
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="cd_flag" value="1" <%=obox.get("cd_flag").equals("1")?"checked":""%> disabled><%=obox.get("cd_flag").equals("1")?"<font color=red><b>차변</b></font>":"차변"%><span></span>
						</label>
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="cd_flag" value="2" <%=obox.get("cd_flag").equals("2")?"checked":""%> disabled><%=obox.get("cd_flag").equals("2")?"<font color=red><b>대변</b></font>":"대변"%><span></span>
						</label>
					</div>
				</td>
			</tr>	
			<tr>
				<th>계정과목</th>
				<td colspan="3" nowrap>
					<input type="text" name="acct_nm" value="<%=obox.get("acct_nm")%>" class="form-control required" title="계정과목" style="width:350px" readOnly>
					<a href="javascript:find_account_code('');"><img id="imgFindAcct" src="/com/img/icon_find.gif" border="0" align="absmiddle" style="display:none"></a>
					<input type="hidden" name="acct_cd" value="<%=obox.get("acct_cd")%>">
				</td>
			</tr>	
			<tr>
				<th>금액</th>
				<td colspan="3" nowrap><input type="text" name="slip_amt" value="<%=obox.get("slip_amt")%>" class="form-control required tMONEY" title="금액" style="width:100px" readOnly> 원</td>
			</tr>	
			<tr>
				<th>적요</th>
				<td colspan="3" nowrap>
					<div class="input-group">
						<input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="50" class="form-control required" title="적요" style="width:350px;ime-mode:active;">
						<button type="button" class="btn dark" onClick="findRemarkCode(document.saveForm.acct_cd.value, document.saveForm.acct_nm.value)"><i class="fa fa-search"></i></button>
					</div>
				</td>
			</tr>	
			<tr>
				<th>거래처</th>
				<td colspan="3" nowrap>
					<div class="input-group">
						<input type="text" name="cust_nm" value="<%=obox.get("cust_nm")%>" title="거래처" class="form-control" style="width:350px" readOnly>
						<button type="button" class="btn dark" onClick="findCustCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="cust_cd" value="<%=obox.get("cust_cd")%>">
					</div>
				</td>
			</tr>	
			<tr>
				<th>비용귀속부서</th>
				<td colspan="3" nowrap>
					<input type="text" name="cost_dept_nm" value="<%=obox.get("cost_dept_nm")%>" title="비용귀속부서" class="form-control" style="width:350px" readOnly>
					<a href="javascript:find_dept_code('');"><img id="imgFindDept" src="/com/img/icon_find.gif" border="0" align="absmiddle" style="display:none"></a>
					<input type="hidden" name="cost_dept" value="<%=obox.get("cost_dept")%>">
				</td>
			</tr>	
			<tr>
				<th>사번</th>
				<td colspan="3" nowrap>
					<div class="input-group">
						<input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" title="사번" class="form-control" style="width:100px" readOnly>
						<button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
					</div>
				</td>
			</tr>	
			<tr>
				<th>
					<select name="rel_no_type" title="관련번호유형" class="bs-select form-control" style="width:90%" onChange="alert('관련번호유형은 수정할 수 없습니다.'); this.value='<%=obox.get("rel_no_type")%>';">
						<option value=''>관련번호</option>
						<%=CodeUtil.optList(codeWp, "rel_no_type", obox.get("rel_no_type"))%>
					</select>
				</th>
				<td colspan="3">
				<% if(obox.get("rel_no_type").equals("11")) { %>
					<select name="account_type" title="예적금유형" class="form-control required" style="width:160px" onChange="change_account_type(this.value);">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_ACCTB_CODE01_LIST","LISTCODE",obox.get("acct_cd"),"1","","11","","",uSesEnt.dbo)%>
					</select>
					<select name="rel_no" title="계좌번호" class="form-control required" style="width:200px">
						<option value=''>계좌번호 선택</option>
						<%=CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",obox.get("rel_no"),obox.get("acct_cd"),"","","","",uSesEnt.dbo)%>
					</select>
				<% }else { %>
					<input type="text" name="rel_no" value="<%=obox.get("rel_no")%>" title="관련번호" class="form-control" style="width:150px">
				<% } %>
				</td>
			</tr>	
			<tr>
				<th width="20%">발생일자</th>
				<td width="30%" nowrap>
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("issue_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="issue_ymd" value="<%=obox.get("issue_ymd")%>" maxlength="8" title="발생일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
				<th width="20%">만기일자</th>
				<td width="30%" nowrap>
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("finish_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="finish_ymd" value="<%=obox.get("finish_ymd")%>" maxlength="8" title="만기일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
			</tr>	
			<tr>
				<th>이자율</th>
				<td nowrap><input type="text" name="intr_rate" value="<%=obox.get("intr_rate")%>" class="form-control tFMONEY" title="이자율" style="width:70px"> %</td>
				<th>세율</th>
				<td nowrap><input type="text" name="tax_rate" value="<%=obox.get("tax_rate")%>" class="form-control tFMONEY" title="세율" style="width:70px"> %</td>
			</tr>	
			<tr>
				<th>증빙유형</th>
				<td colspan="3">
					<select name="vat_cd" title="증빙유형" class="bs-select form-control" style="width:150px" onChange="change_vat_cd(this.value)">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "vat_cd", obox.get("vat_cd"))%>
					</select>
				</td>
			</tr>	
			<tr>
				<th><%=obox.get("acct_cd").startsWith("11111") || obox.get("acct_cd").startsWith("21011") ? "공급가액" : "관련금액"%></th>
				<td colspan="3"><input type="text" name="rel_amt" value="<%=obox.get("rel_amt")%>" title="관련금액" class="form-control tMONEY" style="width:100px"> 원</td>
			</tr>	
			<tr>
				<th>부가세</th>
				<td colspan="3"><input type="text" name="vat_amt" value="<%=obox.get("vat_amt")%>" title="부가세" class="form-control tMONEY" style="width:100px"> 원</td>
			</tr>	
			<tr>
				<th>증빙일자</th>
				<td colspan="3">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("proof_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="proof_ymd" value="<%=obox.get("proof_ymd")%>" maxlength="8" title="증빙일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
			</tr>	
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" id="btnUpdate" class="btn dark" onClick="goSave2()"><img src="/com/img/ico_btn_save.png">저장</button>
			</span>
		</span>
	</div>
</form>