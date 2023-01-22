<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "acct_cd|bank_cd@@@@A|","","","","",""); %>
<!-- 예적금 계좌관리 -->

<script language="javascript"> 
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask('#saveForm');
				ajaxSubmitForm("fin11002_update.do","#saveForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete() {
		if (formValidate("#saveForm")) {
			if(confirm('삭제하시겠습니까?')) {
				removeMask('#saveForm');
				ajaxSubmitForm("fin11002_delete.do","#saveForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						alert('삭제되었습니다.');
						goSearch('');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goDetail(account_no) {
		parent.location.href = 'fin03011_list.do?account_no='+account_no; 
	}
	
	function change_acct_cd(acct_cd) {
		if(acct_cd.indexOf('11101') >= 0) { // 보통예금
			document.getElementById('repAccountArea').style.display = '';
		}else {
			for(var i=0; i < document.main.rep_account.length; i++) {
				document.main.rep_account[i].checked = false;
			}
			document.getElementById('repAccountArea').style.display = 'none';
		}
		
		if(acct_cd.indexOf('11103') >= 0 || acct_cd.indexOf('12101') >= 0) { // 정기예금, 정기적금 
			changeObjectProperty(document.main.close_ymd, 'required');
			changeObjectProperty(document.main.deposit_amt, 'required');
			changeObjectProperty(document.main.intr_rate, 'required');
		}else {
			changeObjectProperty(document.main.close_ymd, 'enabled');
			changeObjectProperty(document.main.deposit_amt, 'readonly');
			changeObjectProperty(document.main.intr_rate, 'enabled');
		}
	}
	
	function page_init() {
		change_acct_cd('<%=obox.get("acct_cd")%>');
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType">
<input type="hidden" name="action_type"	value="<%=box.get("account_no").equals("")?"INSERT":"UPDATE"%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>계좌번호</th>
				<td colspan="3">
				<% if(box.get("account_no").equals("")) { %>
					<input type="text" name="account_no" value="<%=obox.get("account_no")%>" maxlength="30"  class="required form-control"  title="계좌번호" style="width:140px;border:1 solid gray">
				<% }else { %>
					<b><%=obox.get("account_no")%></b><input type="hidden" name="account_no" value="<%=obox.get("account_no")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<th>은행명</th>
				<td>
					<select name="bank_cd" title="은행명"  class="required form-control"  style="width:140px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
		 			</select>
				</td>
				<th>예적금유형</th>
				<td>
					<select name="acct_cd" title="예적금유형"  class="required form-control"  style="width:140px" onChange="change_acct_cd(this.value)">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_ACCTB_CODE01_LIST","LISTCODE",obox.get("acct_cd"),"1","","11","","",uSesEnt.dbo)%>
					</select>
				</td>
			</tr>
			<tr>
				<th>거래처코드</th>
				<td colspan="3">
					<div class="input-group input-medium">
						<input type="text" name="cust_nm" value="<%=obox.get("cust_nm")%>" widht="30" maxlength="50" title="거래처명"  class="form-control required"  style="width:300px">
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="findCustCode('&cust_type=30')"><i class="fa fa-search"></i></button></span>
						<input type="hidden" name="cust_cd" value="<%=obox.get("cust_cd")%>">
					</div>
				</td>
			</tr>
			<tr>
				<th width="20%">개설일자</th>
				<td width="30%">
					<div class="form-inline">
					    <div class="input-group input-medium date date-picker" data-date="<%=obox.get("open_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="open_ymd" name="open_ymd" value="<%=obox.get("open_ymd")%>" maxlength="8" title="개설일자" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
				<th width="20%">만기일자</th>
				<td width="30%">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("close_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="close_ymd" name="close_ymd" value="<%=obox.get("close_ymd")%>" maxlength="8" title="만기일자" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="deposit_amt" value="<%=obox.get("deposit_amt")%>" maxlength="13" title="금액" class="form-control tMONEY" style="width:100px"> 원
				</td>
				<th>이자율</th>
				<td>
					<input type="text" name="intr_rate" value="<%=obox.get("intr_rate")%>" title="이자율" class="form-control tFMONEY" style="width:100px"> %
				</td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="3">
					<textarea name="etc_remark" class="form-control" style="height:70px;width:100%"><%=obox.get("etc_remark")%></textarea>
				</td>
			</tr>
			<tr id="repAccountArea">
				<th>(대표)결제계좌</th>
				<td colspan="3">
					<div class="mt-checkbox-inline">
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="rep_account" value="S" <%=obox.get("rep_account").indexOf("S")>=0 ? "checked":""%>>목적사업
							<span></span>
						</label>
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="rep_account" value="L" <%=obox.get("rep_account").indexOf("L")>=0 ? "checked":""%>>대부사업
							<span></span>
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td colspan="3">
					<select name="use_yn" style="width:80px" class="bs-select form-control" >
						<option value='Y' <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
						<option value='N' <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
					</select>
				</td>
			</tr>
		</table>
	</div>	
		
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span class="f-right marR5">
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<%if(!box.get("account_no").equals("")){%>
				<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% } %>
			</span>
		</span>
	</div>
</form>