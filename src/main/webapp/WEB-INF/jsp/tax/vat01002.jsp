<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 부가세자료관리 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(!checkSaupjaNo(document.saveForm.saupja_no1.value+document.saveForm.saupja_no2.value+document.saveForm.saupja_no3.value)) {
				alert('사업자등록번호가 잘못되었습니다.');
				document.saveForm.saupja_no1.select();
				return;
			}else if(!isNumber(document.saveForm.proof_no2)) {
				alert('증빙번호는 숫자로 입력하셔야 합니다.');
				document.saveForm.proof_no2.select();
				return;
			}
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("vat01002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						parent.goSearch('N');
						alert("저장되었습니다.");
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("vat01002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					parent.goSearch('N');
					alert("삭제되었습니다.");
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function goCopy() {
		if(confirm('추가하시겠습니까?')) {
			ajaxSubmitForm("vat01002_copy.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					parent.goSearch('N');
					alert("추가되었습니다.");
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="tax_no" 		value="<%=obox.get("tax_no")%>">
<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
<input type="hidden" name="slip_seq" 	value="<%=obox.get("slip_seq")%>">
<input type="hidden" name="acct_cd" 	value="<%=obox.get("acct_cd")%>">

	<table class="table table-view table-bordered table-cover marB0">
		<tr>
			<td class="td-head">전표번호</td>
			<td colspan="3">
				<a href="javascript:goSlipViewer('<%=obox.get("slip_no")%>')"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
			</td>
		</tr>
		<tr>
			<td class="td-head">계정과목</td>
			<td colspan="3"><%=obox.get("acct_nm")%></td>
		</tr>
		<tr>
			<td class="td-head">거래처</td>
			<td colspan="3">
				<input type="text" name="cust_nm" value="<%=obox.get("cust_nm")%>" title="거래처" size="40" class="form-control" style="width:180px" readOnly><button type="button" class="btn dark" onclick="findCustCode('')"><i class="fa fa-search"></i></button>
				<input type="hidden" name="cust_cd" value="<%=obox.get("cust_cd")%>">
			</td>
		</tr>
		<tr>
			<td class="td-head">사업자번호</td>
			<td>
				<input type="text" name="saupja_no1" value="<%=obox.get("saupja_no1")%>" size="3" maxlength="3" class="form-control required autoTab" title="사업자등록번호" style="width:20%"> -
				<input type="text" name="saupja_no2" value="<%=obox.get("saupja_no2")%>" size="2" maxlength="2" class="form-control required autoTab" title="사업자등록번호" style="width:15%"> -
				<input type="text" name="saupja_no3" value="<%=obox.get("saupja_no3")%>" size="5" maxlength="5" class="form-control required" title="사업자등록번호" style="width:25%">
			</td>
			<td class="td-head">대표자</td>
			<td><input type="text" name="rep_person_nm" value="<%=obox.get("rep_person_nm")%>" title="대표자" size="20" maxlength="30" class="form-control required"" style="width:100px;"></td>
		</tr>
		<tr>
			<td class="td-head">업태</td>
			<td><input type="text" name="uptae" value="<%=obox.get("uptae")%>" title="업태" size="20" maxlength="50" class="form-control" style="width:150px;"></td>
			<td class="td-head">종목</td>
			<td><input type="text" name="upjong" value="<%=obox.get("upjong")%>" title="종목" size="20" maxlength="50" class="form-control" style="width:150px;"></td>
		</tr>
		<tr>
			<td class="td-head">품목</td>
			<td colspan="3"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" class="form-control required" title="품목" size="60" maxlength="100" style="width:150px;"></td>
		</tr>
		<tr>
			<td width="20%" class="td-head">공급가액</td>
			<td width="30%"><input type="text" name="gong_amt" value="<%=obox.get("gong_amt")%>" size="13" class="form-control required tMONEY" title="공급가액" style="width:80px;"> 원</td>
			<td width="20%" class="td-head">부가세</td>
			<td width="30%"><input type="text" name="vat_amt" value="<%=obox.get("vat_amt")%>" size="13" class="form-control required tMONEY" title="부가세" style="width:80px;"> 원</td>
		</tr>	
		<tr>
			<td class="td-head">단가</td>
			<td><input type="text" name="unit_price" value="<%=obox.get("unit_price")%>" size="13" class="form-control tMONEY" title="단가" style="width:80px"> 원</td>
			<td class="td-head">수량</td>
			<td><input type="text" name="qty" value="<%=obox.get("qty")%>" size="7" class="form-control tMONEY" title="수량" style="width:60px"> EA</td>
		</tr>	
		<tr>
			<td class="td-head">세율</td>
			<td colspan="3"><input type="text" name="tax_rate" value="<%=obox.get("tax_rate")%>" size="7" class="form-control tFMONEY" title="세율" style="width:60px"> %</td>
		</tr>	
		<tr>
			<td class="td-head">증빙유형</td>
			<td>
				<select name="vat_cd" class="bs-select form-control required" title="증빙유형" style="width:150px">
					<option value=''>선택</option>
					<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("vat_cd"),"vat_cd","","","","")%>
				</select>
			</td>
			<td class="td-head">증빙일자</td>
			<td>
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("proof_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="proof_ymd" name="proof_ymd" value="<%=obox.get("proof_ymd")%>" size="10" maxlength="8" title="증빙일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</div>
			</td>
		</tr>	
		<tr>
			<td class="td-head">증빙번호</td>
			<td colspan="3">
				<select name="proof_no1" title="계정구분" class="bs-select form-control" style="width:60px">
					<option value='<%=obox.get("proof_no1")%>'><%=obox.get("proof_no1").equals("B")?"매입":"매출"%></option>
				</select> - 
				<input type="text" name="proof_no2" value="<%=obox.get("proof_no2")%>" size="4" maxlength="4" class="form-control required" title="증빙번호" style="width:60px;">
				<button type='button' class='btn btn-primary btn-table' onClick="goCopy();">추가</button>
			</td>
		</tr>
		<tr>
			<td class="td-head">신고기수</td>
			<td colspan="3">
				<select name="tax_year" class="bs-select form-control required" title="신고년도" style="width:80px;">
					<%=DateUtil.getYearOptionTag(obox.get("tax_year"),"2011",DateUtil.getYear(),"desc","년")%>
				</select>
				<select name="tax_gisu" class="bs-select form-control required" title="신고기수" style="width:80px">
					<option value=''>선택</option>
	          		<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("tax_gisu"),"tax_gisu","","","","")%>
				</select>
				<label class="mt-checkbox mt-checkbox-outline">
					<input type="checkbox" name="etax_yn" value="Y" <%=obox.get("etax_yn").equals("Y")?"checked":""%> style="border:none">전자세금계산서<span/>
				</label>
				<label class="mt-checkbox mt-checkbox-outline">						
					<input type="checkbox" name="pass15_yn" value="Y" <%=obox.get("pass15_yn").equals("Y")?"checked":""%> style="border:none">익월 15일 이후 전송자료<span/>
				</label>
			</td>
		</tr>		
	</table>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
	 			<button type="button" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
	    	</span>
	   </span>
	</div>
</form>