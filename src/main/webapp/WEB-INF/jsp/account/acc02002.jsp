<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "bank_cd|cust_type|nation_cd|tel_no|hp_no|","","","","");
	boolean isEditAuth = false;
   	if(uSesEnt.use_auth.startsWith("S") || box.get("method").endsWith("write")) { isEditAuth = true; }
%>
<!-- 거래처코드 등록/수정화면 -->
<script language="javascript">
	function goSave() {
		if(formValidate("#saveForm")) {
			if(document.saveForm.cust_flag.value == '1') {
				if(!isEmpty(document.saveForm.cust_reg_no1.value+document.saveForm.cust_reg_no2.value+document.saveForm.cust_reg_no3.value)) {
					alert('사업자등록번호가 잘못되었습니다.');
					document.saveForm.cust_reg_no1.select();
					return;
				}
			}else {
				if(!isEmpty(document.saveForm.reside_no1.value, document.saveForm.reside_no2.value)) {
					alert('주민등록번호가 잘못되었습니다.');
					document.saveForm.reside_no1.select();
					return;
				}
			}
			
			if(document.saveForm.dup_check_yn.value == 'N') {
				alert('사업자(주민)등록번호 중복확인을 하지 않았습니다.');
				return;
			}
			
			if(confirm('저장하시겠습니까?')) {
				removeMask('#saveForm');
				ajaxSubmitForm("acc02002_update.do?action_type="+(isEmpty(document.saveForm.cust_cd) ? "INSERT" : "UPDATE"),"#saveForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch('<%=box.get("cust_cd")%>');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask('#saveForm');
			ajaxSubmitForm("acc02002_delete.do","#saveForm", function(rtn) {
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
	
	function go_dup_check() {
		var cust_reg_no = '';
		if(document.saveForm.cust_flag.value == '1') {
			if(!isEmpty(document.saveForm.cust_reg_no1.value+document.saveForm.cust_reg_no2.value+document.saveForm.cust_reg_no3.value)) {
				alert('사업자등록번호가 잘못되었습니다.');
				document.saveForm.cust_reg_no1.select();
				return;
			}
			cust_reg_no = document.saveForm.cust_reg_no1.value+document.saveForm.cust_reg_no2.value+document.saveForm.cust_reg_no3.value;
		}else {
			if(!chkLocFrnJuminNo(document.saveForm.reside_no1.value, document.saveForm.reside_no2.value)) {
				alert('주민등록번호가 잘못되었습니다.');
				document.saveForm.reside_no1.select();
				return;
			}
			cust_reg_no = document.saveForm.reside_no1.value+document.saveForm.reside_no2.value;
		}
		ajaxProcJsonBox("PR_ACCTB_CUST01@CUST_DUP_CHECK", {'cust_reg_no' : document.saveForm.cust_reg_no1.value+document.saveForm.cust_reg_no2.value+document.saveForm.cust_reg_no3.value}, function(rtn) {
			var cnt = rtn.cnt;
			if(parseInt(cnt) == 0) {
				alert('등록되지 않은 거래처입니다.');
				document.saveForm.dup_check_yn.value = 'Y';
			}else {
				alert('이미 등록된 거래처입니다.');
				document.saveForm.dup_check_yn.value = 'N';
			}
		});
	}
	
	function change_cust_flag(cust_flag) {
		if(cust_flag == '2') {
			$("#spanSaupjaNo").hide();
			$("#spanResideNo").show();
			changeObjectProperty(document.saveForm.cust_reg_no1, 'readonly', false);
			changeObjectProperty(document.saveForm.cust_reg_no2, 'readonly', false);
			changeObjectProperty(document.saveForm.cust_reg_no3, 'readonly', false);
			changeObjectProperty(document.saveForm.reside_no1, 'required', false);
			changeObjectProperty(document.saveForm.reside_no2, 'required', false);
			document.saveForm.cust_reg_no1.value = '';
			document.saveForm.cust_reg_no2.value = '';
			document.saveForm.cust_reg_no3.value = '';
		}else {
			$("#spanSaupjaNo").show();
			$("#spanResideNo").hide();
			changeObjectProperty(document.saveForm.cust_reg_no1, 'required', false);
			changeObjectProperty(document.saveForm.cust_reg_no2, 'required', false);
			changeObjectProperty(document.saveForm.cust_reg_no3, 'required', false);
			changeObjectProperty(document.saveForm.reside_no1, 'readonly', false);
			changeObjectProperty(document.saveForm.reside_no2, 'readonly', false);
			document.saveForm.reside_no1.value = '';
			document.saveForm.reside_no2.value = '';
		}
	}
	
	$(function() {
		change_cust_flag('<%=obox.get("cust_flag")%>');
	<% 	if(!isEditAuth) { %>
			changeObjectProperty(document.saveForm.cust_nm, 'readonly', false);
			changeObjectProperty(document.saveForm.abbr_nm, 'readonly', false);
			changeObjectProperty(document.saveForm.cust_reg_no1, 'readonly', false);
			changeObjectProperty(document.saveForm.cust_reg_no2, 'readonly', false);
			changeObjectProperty(document.saveForm.cust_reg_no3, 'readonly', false);
			changeObjectProperty(document.saveForm.reside_no1, 'readonly', false);
			changeObjectProperty(document.saveForm.reside_no2, 'readonly', false);
			changeObjectProperty(document.saveForm.rep_person_nm, 'readonly', false);
	 <% } %>
	});
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="cust_cd" 	value="<%=obox.get("cust_cd")%>">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">

	
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>거래처명</th>
			<td>
				<input type="text" name="cust_nm" value="<%=obox.get("cust_nm")%>" title="거래처명" class="form-control required" style="width:200px">
			</td>
			<th>약칭</th>
			<td>
				<input type="text" name="abbr_nm" value="<%=obox.get("abbr_nm")%>" title="거래처명(약칭)" class="form-control required" style="width:200px" >
			</td>
		</tr>
		<tr>
			<th>
			<% if(isEditAuth) { %>
				<select name="cust_flag" class="bs-select form-control" style="width:90%" onChange="change_cust_flag(this.value)">
					<option value='1' <%=obox.get("cust_flag").equals("1")?"selected":""%>>사업자번호</option>
					<option value='2' <%=obox.get("cust_flag").equals("2")?"selected":""%>>주민등록번호</option>
				</select>
			<% }else { %>
				<%=obox.get("cust_flag").equals("1")?"사업자번호":"주민등록번호"%>
				<input type="hidden" name="cust_flag" value="<%=obox.get("cust_flag")%>">
			<% } %>
			</th>
			<td>
				<span id="spanSaupjaNo">
					<input type="text" name="cust_reg_no1" value="<%=StringUtil.substr(obox.get("cust_reg_no"),0,3)%>" maxlength="3" title="사업자등록번호" class="form-control required autoTab" style="width:40px"> -
					<input type="text" name="cust_reg_no2" value="<%=StringUtil.substr(obox.get("cust_reg_no"),3,5)%>" maxlength="2" title="사업자등록번호" class="form-control required autoTab" style="width:30px"> -
					<input type="text" name="cust_reg_no3" value="<%=StringUtil.substr(obox.get("cust_reg_no"),5,10)%>" maxlength="5" title="사업자등록번호" class="form-control required" style="width:50px">
				</span>
				<span id="spanResideNo" style="display:none">
					<input type="text" name="reside_no1" value="<%=StringUtil.substr(obox.get("cust_reg_no"),0,6)%>" maxlength="6" title="주민등록번호" class="form-control autoTab" style="width:60px"> -
					<input type="text" name="reside_no2" value="<%=StringUtil.substr(obox.get("cust_reg_no"),6,13)%>" maxlength="7" title="주민등록번호" class="form-control autoTab" style="width:70px">
				</span>
				<button type="button" class="btn btn-primary btn-table" onClick="go_dup_check();" style="display:<%=box.get("cust_cd").equals("")?"":"none"%>">중복확인</button>
				<input type="hidden" name="dup_check_yn" value="<%=box.get("cust_cd").equals("")?"N":"Y"%>">
<%-- 					<a href="javascript:go_dup_check();"><img id="btnDupCheck" src="/com/img/icon_dup_check.gif" border="0" align="absmiddle" style="display:<%=!box.get("method").endsWith("write")?"":"none"%>"></a> --%>
<%-- 					<input type="hidden" name="dup_check_yn" value="<%=box.get("method").endsWith("write")?"N":"Y"%>"> --%>
			</td>
			<th>거래처유형</th>
			<td>
				<select name="cust_type" title="거래처유형" class="bs-select form-control" style="width:90px">
						<%=CodeUtil.optList(codeWp,"cust_type", obox.get("cust_type"))%>
				</select>
			</td>
		</tr>
		<tr>
			<th>대표자 성명</th>
			<td><input type="text" name="rep_person_nm" value="<%=obox.get("rep_person_nm")%>" maxlength="20" title="대표자성명" class="form-control required"" style="width:90px;"></td>
			<th>국가</th>
			<td>
				<select name="nation_cd" title="국가" class="bs-select form-control" style="width:190px">
					<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp,"nation_cd", obox.get("nation_cd"))%>
				</select>
			</td>
		</tr>
		<tr>
			<th>업태</th>
			<td><input type="text" name="uptae" value="<%=obox.get("uptae")%>" maxlength="20" title="업태" class="form-control" style="width:150px;"></td>
			<th>종목</th>
			<td><input type="text" name="upjong" value="<%=obox.get("upjong")%>" maxlength="20" title="종목" class="form-control" style="width:150px;"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3">
				<div class="input-group">
					<input type="text" name="zip_no" value="<%=obox.get("zip_no")%>" title="우편번호" class="form-control" style="width:50px;" readOnly>
					<span class="input-group-btn">
						<button id="btnZipFind" class="btn dark" type="button" onclick="findZipNo('');">주소찾기</button>
					</span>
					<input type="text" name="addr" value="<%=obox.get("addr")%>" maxlength="120" title="주소" class="form-control marL5" style="width:400px; ime-mode:active">
				</div>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<select name="tel_no1" title="전화번호" class="bs-select form-control" style="width:60px">
					<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp,"tel_no", StringUtil.arrayCol(obox.get("tel_no"),1,"-"))%>
				</select> - 
				<input type="text" name="tel_no2" value="<%=StringUtil.arrayCol(obox.get("tel_no"),2,"-")%>" maxlength="4" title="전화번호" class="form-control autoTab" style="width:50px"> - 
				<input type="text" name="tel_no3" value="<%=StringUtil.arrayCol(obox.get("tel_no"),3,"-")%>" maxlength="4" title="전화번호" class="form-control" style="width:50px">
			</td>
			<th>팩스번호</th>
			<td>
				<select name="fax_no1" class="bs-select form-control" title="팩스번호" style="width:60px">
					<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp,"tel_no", StringUtil.arrayCol(obox.get("fax_no"),1,"-"))%>
				</select> - 
				<input type="text" name="fax_no2" value="<%=StringUtil.arrayCol(obox.get("fax_no"),2,"-")%>" maxlength="4" title="팩스번호" class="form-control autoTab" style="width:50px"> - 
				<input type="text" name="fax_no3" value="<%=StringUtil.arrayCol(obox.get("fax_no"),3,"-")%>" maxlength="4" title="팩스번호" class="form-control" style="width:50px">
			</td>
		</tr>
		<tr>
			<th>담당자 성명</th>
			<td><input type="text" name="charge_person_nm" value="<%=obox.get("charge_person_nm")%>" maxlength="20" title="담당자 성명" class="form-control" style="width:90px;"></td>
			<th>담당자 전화번호</th>
			<td>
				<select name="charge_tel_no1" class="bs-select form-control" title="담당자 전화번호" style="width:60px">
					<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp,"tel_no", StringUtil.arrayCol(obox.get("charge_tel_no"),1,"-"))%>
				</select> - 
				<input type="text" name="charge_tel_no2" value="<%=StringUtil.arrayCol(obox.get("charge_tel_no"),2,"-")%>" maxlength="4" title="담당자 전화번호" class="form-control autoTab" style="width:50px"> - 
				<input type="text" name="charge_tel_no3" value="<%=StringUtil.arrayCol(obox.get("charge_tel_no"),3,"-")%>" maxlength="4" title="담당자 전화번호" class="form-control" style="width:50px">
			</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>
				<select name="charge_hp_no1" title="휴대폰" class="bs-select form-control" style="width:60px">
					<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp,"hp_no", StringUtil.arrayCol(obox.get("charge_hp_no"),1,"-"))%>
				</select> - 
				<input type="text" name="charge_hp_no2" value="<%=StringUtil.arrayCol(obox.get("charge_hp_no"),2,"-")%>" maxlength="4" title="담당자 핸드폰 번호" class="form-control autoTab" style="width:50px"> - 
				<input type="text" name="charge_hp_no3" value="<%=StringUtil.arrayCol(obox.get("charge_hp_no"),3,"-")%>" maxlength="4" title="담당자 핸드폰 번호" class="form-control" style="width:50px">
			</td>
			<th>매입/매출구분</th>
			<td>
				<div class="mt-checkbox-inline">
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" id="buy_sell_type" name="buy_sell_type" value="B" <%=obox.get("buy_sell_type").indexOf("B")>=0?"checked":""%>>매입거래처
						<span></span>
					</label>
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" id="buy_sell_type" name="buy_sell_type" value="S" <%=obox.get("buy_sell_type").indexOf("S")>=0?"checked":""%>>매출거래처
						<span></span>
					</label>
				</div>	
			</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td colspan="3">
				<select name="bank_cd" title="금융기관" class="bs-select form-control" style="width:200px">
					<option value=''>:: 금융기관 선택 ::</option>
			            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
				</select>
				<input type="text" name="account_no" value="<%=obox.get("account_no")%>" maxlength="30" title="계좌번호" class="form-control" style="width:140px">
				&nbsp;예금주 : <input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" maxlength="30" title="예금주" class="form-control" style="width:90px">
			</td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td>
				<select name="use_flag" class="bs-select form-control" style="width:80px">
					<option value='Y' <%=obox.get("use_flag").equals("Y")?"selected":""%>>사용</option>
					<option value='N' <%=obox.get("use_flag").equals("N")?"selected":""%>>사용안함</option>
				</select>
			</td>
			<th>삭제일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="<%=box.get("del_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" id="del_ymd" name="del_ymd" value="<%=obox.get("del_ymd")%>" maxlength="8" title="삭제일자" class="form-control tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
		</tr>
		<tr>
			<th>비고</th>
			<td colspan="3"><textarea name="etc_remark" class="form-control" style="height:70px;width:100%"><%=obox.get("etc_remark")%></textarea></td>
		</tr>
	</table>
	
  	<div class="table-bottom-control">
  		<span style="width:100%;">
  			<span style="float:right;">
	  			<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
	  			<button type="button" class="btn dark" onClick="goDelete()" style="display:<%=!box.get("cust_cd").equals("")?"":"none"%>"><img src="/com/img/ico_btn_delete.png">삭제</button>
	  		</span>
	  	</span>
  	</div>	
 </form>