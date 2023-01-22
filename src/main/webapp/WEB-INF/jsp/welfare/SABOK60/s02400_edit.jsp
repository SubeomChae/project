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
<!-- 금융기관 이자지원 신청서 작성 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.data01.value = document.saveForm.support_item.value;
				document.saveForm.data02.value = document.saveForm.loan_ymd.value;
				document.saveForm.data03.value = document.saveForm.loan_bank_cd.value;
				document.saveForm.data04.value = document.saveForm.use_area.value;
				document.saveForm.data05.value = document.saveForm.house_kind.value;
				document.saveForm.data06.value = document.saveForm.contract_ymd.value;
				document.saveForm.data07.value = document.saveForm.obtain_ymd.value;
				document.saveForm.data08.value = document.saveForm.new_zip_no.value;
				document.saveForm.data09.value = document.saveForm.new_addr.value;
				document.saveForm.data15.value = document.saveForm.support_amt.value;
				
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
			<th width="20%">사번/성명</th>
			<td width="30%"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
				<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%=obox.get("empl_nm")%></a>
				<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
			</td>
			<th width="20%">부서</th>
			<td width="30%"><%=obox.get("dept_nm")%></td>
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
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>이자지원 종류</th>
			<td>
				<select name="support_item" class="bs-select form-control required" title="지원항목" style="width:180px">
					<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("support_item"),"support_item@"+uSesEnt.dbo,box.get("bugt_cd"),"","","")%>
				</select>
			</td>
			<th>대출시행(예정)일</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="loan_ymd" value="<%=obox.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("loan_ymd")%>" maxlength="8" title="대출시행(예정)일" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
		</tr>
		<tr>
			<th>은행</th>
			<td>
				<select name="loan_bank_cd" class="bs-select form-control required" title="은행" style="width:180px">
					<option value=''>:: 금융기관 선택 ::</option>
		            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("loan_bank_cd"))%>
				</select>
			</td>
			<th>대출금액</th>
			<td>
				<input type="text" name="support_amt" value="<%=obox.get("support_amt")%>" maxlength="10" title="대출금액" class="form-control required tMONEY" style="width:100px">&nbsp;원
			</td>
		</tr>
		<tr>
			<th>전용면적</th>
			<td>
				<input type="text" name="use_area" value="<%=obox.get("use_area",Box.THOUSAND_COMMA_FLOAT)%>" maxlength="15" title="전용면적" class="form-control required" style="width:90px"> ㎡
			</td>
			<th>주택종류</th>
			<td>
				<input type="text" name="house_kind" value="<%=obox.get("house_kind")%>" maxlength="30" title="주택종류" class="form-control required" style="width:150px">
			</td>
		</tr>
		<tr>
			<th>매입·임차계약일</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="contract_ymd" value="<%=obox.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("contract_ymd")%>" maxlength="8" title="매입·임차계약일" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th>취득완료일</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="obtain_ymd" value="<%=obox.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("obtain_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3">
					<div class="form-inline">
						<div class="input-group f-left" style="width:154px;">
							<input type="text" name="new_zip_no" value="<%=obox.get("new_zip_no")%>" title="우편번호" class="form-control" readOnly>
							<span class="input-group-btn">
								<button class="btn dark" type="button" onclick="findZipNo('');">우편번호검색</button>
							</span>
						</div>
						<input type="text" name="new_addr" value="<%=obox.get("new_addr")%>" maxlength="120" title="주소" class="form-control" style="width:70%;ime-mode:active;">
					</div>
			</td>
		</tr>
		<tr>
			<th width="20%">신청일자</th>
			<td width="30%">
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=obox.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th width="20%">신청금액</th>
			<td width="30%">
				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:100px">&nbsp;원
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
			<th>전표번호</th>
			<td nowrap>
				<%if(!obox.get("slip_no").equals("")){%>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				<%}%>
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