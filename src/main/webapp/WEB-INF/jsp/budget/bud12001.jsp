<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>수입예산/비용예산/자본예산</title>

<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'bud12001_list.do';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=<%=StringUtil.arrayCol(box.get("acct_nm"),3,"|")%>'; }
	
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goEdit(bugt_seq, bugt_amt, etc_remark, acc_unit) {
		document.main.bugt_seq.value = bugt_seq;
		document.main.bugt_amt.value = bugt_amt;
		document.main.etc_remark.value = replaceSpecial(etc_remark);
		document.main.acc_unit.value = acc_unit;
		formatMaskElm(document.main.bugt_amt);
		$("#ListTable").hide();
		$("#btnDelete").show();
		$("#EditTable").show();
		document.main.etc_remark.focus();
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		document.main.bugt_seq.value = '';
		document.main.bugt_amt.value = '';
		document.main.etc_remark.value = '';
		document.main.acc_unit.value = '00';
		$("#ListTable").hide();
		$("#btnDelete").hide();
		$("#EditTable").show();
		document.main.etc_remark.focus();
	}
	
	function goCancel() {
		$("#ListTable").show();
		$("#EditTable").hide();
	}
	
	function goSave() {
		if(formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("bud12001_update.do","#main", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						$("#EditTable").hide();
						toastPop1('저장되었습니다.');
						returnFormSubmit(document.main, 'bud12001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete(bugt_cd, row_id) {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("bud12001_delete.do","#main", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					$("#EditTable").hide();
					toastPop1('삭제되었습니다.');
					returnFormSubmit(document.main, 'bud12001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

// 	function go_loan_revenue() {
// 		wdt = 800; hgt = 600;
//     	xPos = Math.ceil((screen.width - wdt) / 2);
//         yPos = Math.ceil((screen.height- hgt) / 2);
<%--     	window.open('bud12002_list.do?bugt_yy=<%=box.get("bugt_yy")%>&acct_cd=<%=box.get("acct_cd")%>', 'bud12002', "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=yes,resizable=no,left="+xPos+",top="+yPos); --%>
// 	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_yy" 	value="<%=box.get("bugt_yy")%>">
<input type="hidden" name="acct_cd" 	value="<%=box.get("acct_cd")%>">
<input type="hidden" name="acct_nm" 	value="<%=box.get("acct_nm")%>">
<input type="hidden" name="selectedRow" value="">
<div id="divListData" class=" contentsRow">
	<div id="ListTable" class="row row-set table-scrollable">
		<table id="MyTable"  class="table table-striped table-bordered table-hover order-column">
			<tr height="28" class="table01_title">
				<th  colspan="4"><b><%=StringUtil.replace(box.get("acct_nm"),"|","&nbsp;&gt;&nbsp;")%></b>
				<% if(box.get("acct_cd").startsWith("61002") && rsWp.getLength() > 0) { // 대부이자수익 세부내역 %> 
				&nbsp;&nbsp;&nbsp;&nbsp;대부이자수익<button id="btnSave" type="button" class="btn btn-primary btn-table" onClick="goLoanRevenue('&bugt_yy=<%=box.get("bugt_yy")%>&acct_cd=<%=box.get("acct_cd")%>')">세부내역</button>
			   <% } %> 
				</th>
			</tr> 
			<tr height="28" align="center" class="table01_title">
				<th width="55%">적요</th>
				<th width="20%">금액</th>
				<th width="20%">회계단위</th>
				<th width="5%">
					<button type="button" class="btn btn-primary btn-table" onClick="goWrite();">추가</button>
				</th>
			</tr>
			<% if(rsWp.getLength() == 0) { %>
				<tr height="25"><td colspan="4" align="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else {
					for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>"> 
							<td><%=rsWp.get("etc_remark",i)%></td>
							<td align="t-right"><%=rsWp.get("bugt_amt",i,Box.THOUSAND_COMMA)%></td>
							<td><%=rsWp.get("acc_unit_nm",i)%></td>
							<td>
								<button type="button" class="btn btn-primary btn-table" onClick="goEdit('<%=rsWp.get("bugt_seq",i)%>','<%=rsWp.get("bugt_amt",i)%>','<%=rsWp.get("etc_remark",i,Box.JAVASCRIPT)%>','<%=rsWp.get("acc_unit",i)%>')">수정</button>
							</td>
						</tr>	
				<% } %>
			<% } %>
		</table>
	</div>
	<div id= "EditTable"  style="display: none" class="row row-set table-scrollable">
		<table class="table table-striped table-bordered">
			<tr height="28" class="table01_title">
				<th colspan="3"><b><%=StringUtil.replace(box.get("acct_nm"),"|","&nbsp;&gt;&nbsp;")%></b>
				<% if(box.get("acct_cd").startsWith("61002") && rsWp.getLength() > 0) { // 대부이자수익 세부내역 %>
				&nbsp;&nbsp;&nbsp;&nbsp;대부이자수익<button id="btnSave" type="button" class="btn btn-primary btn-table" onClick="goLoanRevenue('&bugt_yy=<%=box.get("bugt_yy")%>&acct_cd=<%=box.get("acct_cd")%>')">세부내역</button>
				<% } %>
				</th>
			</tr> 
			<tr height="25" align="center" class="table01_title">
				<th width="55%">적요</th>
				<th width="20%">금액</th>
				<th width="25%">회계단위</th>
			</tr> 
			<tr height="28"> 
				<td><input type="text" name="etc_remark" value="" maxlength="100" title="적요" class="form-control required" style="width:95%;"></td>
				<td><input type="text" name="bugt_amt" value="" maxlength="10" title="금액" class="form-control required tMONEY" style="width:95%;"></td>
				<td>
					<select name="acc_unit" title="회계단위" class="bs-select form-control required" style="width:95%">
						<option value='00'>목적사업회계</option>
						<option value='20'>기금관리회계</option>
					</select>
					<input type="hidden" name="bugt_seq" value="">
				</td>
			</tr>	
		</table>
		<div class="table-bottom-control">
			<span class="padR5 padB5" style="float:right;">
				<button id="btnSave" type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_edit.png">저장</button>
				<button id="btnDelete" type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
				<button id="btnCancel" type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_cancel.png">취소</button>
			</span>
		</div>
	</div>
</div>	
</form>
