<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%  int slip_amt_sum = 0;
	for(int i=0; i < rsWp.getLength(); i++) {
		slip_amt_sum += rsWp.getInt("slip_amt",i);
	}
%>
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 미지급금 결제 -->
<% if(!box.get("excel_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
	<% if(box.get("cd_flag").equals("2")) { %>
		var days = getDayInterval(document.main.start_ymd.value.replace(/-/g,""), document.main.end_ymd.value.replace(/-/g,""));
		if(days > 365) {
			alert('조회기간은 365일 이내로 지정하셔야 합니다.');
			document.main.end_ymd.focus();
			return;
		}
	<% } %>
		
		var theURL = 'fin21001_list.do';
		if(gbn == 'E') { theURL = theURL + '?excel_yn=Y&excel_file_nm=지급대상리스트'; }
		removeMask("#main");
		document.main.action = encodeURI(theURL);
		document.main.target = '_self';
		document.main.submit();
		fixTableHeader("MyTable");
	}

	function goSave() {
		if(formValidate("#main")) {
			if(isEmpty(document.main.dae_acct_cd)) {
				alert('결제계정과목이 선택되지 않았습니다.');
				document.main.dae_acct_cd.focus();
				return;
			}else if(isEmpty(document.main.account_no)) {
				alert('계좌번호가 선택되지 않았습니다.');
				document.main.account_no.focus();
				return;
			}
			
			if(confirm('저장하시겠습니까?')==true) {
				for(var i=0; i < <%=rsWp.getLength()%>; i++) {
					if(document.all['slip_key'+i].checked) { 
						document.main.slip_key.value += document.all['slip_key'+i].value; 
					}
				}
				
				if(isEmpty(document.main.slip_key)) {
					alert('대체할 자료가 선택되지 않았습니다.');
					return;
				}
				removeMask("#main");
				document.main.action = 'fin21001_insert.do';
				document.main.target = '_self';
				document.main.submit();
			}else{
				return;
			}
		}	
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'fin21001_delete.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function autoCalc() {
		var dae_amt = 0;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			if(document.all['slip_key'+i].checked) { dae_amt += parseInt2(document.all['slip_amt'+i]); }
		}
		document.main.dae_amt.value = dae_amt;
		formatMaskElm(document.main.dae_amt);
	}
	
	function changeAcctCd(acct_cd) {
		document.main.account_no.options.length=0;
		if(acct_cd != '') {
			setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.main.account_no, '', acct_cd, '', '', '', '', ':: 계좌번호 선택 ::');
		}
	}
	
	function goSelectAll() {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				$("input:checkbox[name='slip_key"+i+"']").prop("checked", $("#checkbox").is(":checked"));
				autoCalc();
			} catch(e) {}
		}
	}
	
	function CalendarSettingPost(target) {
		if(!isEmpty(document.main.p_slip_ymd)) {
			document.main.p_slip_no.options.length = 0;
			var slip_ymd = document.main.p_slip_ymd.value.replace(/-/g,"");
			setOptionByProc('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.p_slip_no, '', slip_ymd, 'B20', '', '', '', '선택');
		}
	}
	
	function signRequestPost() { goSearch(); }

	$(function() {
		$("#date-top").data("datepicker")._process_options({ orientation: "auto" + " " + "left" });
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="slip_key"  	value="">

	<h1 class="page-title">미지급금 결제</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:15%;">
		<% if(box.get("cd_flag").equals("2")) { %>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:40%;">
		<% }else { %>
			<col style="width:10%;">
			<col style="width:75%;">
		<% } %>
		</colgroup>
		<tbody>
	  		<tr>
				<td class="t-center">
					<div class="mt-radio-inline">
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="cd_flag" value="2" <%=box.get("cd_flag").equals("2")?"checked":""%> onClick="goSearch('N');">대체<span></span>
						</label>
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="cd_flag" value="1" <%=box.get("cd_flag").equals("1")?"checked":""%> onClick="goSearch('N');">취소<span></span>
						</label>
					</div>
				</td>
			<% if(box.get("cd_flag").equals("2")) { %>
				<td class="td-head">기준일자</td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="기준일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="기준일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>작성자성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>작성자사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>작성부서</option>
						<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>적요</option>
					</select>
				</td>
				<td>
					<div class="form-inline">
						<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:120px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')">
			<% }else { %>
				<td class="td-head">전표번호</td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="p_slip_ymd" value="<%=box.get("p_slip_ymd")%>" maxlength="8" title="전표일자" class="form-control tYMD" onChange="CalendarSettingPost('')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<select name="p_slip_no" title="전표번호" class="bs-select form-control" style="width:70px" onChange="if(this.value!='') goSearch('N');">
							<option value=''>선택</option>
						<% if(!obox.get("slip_no").equals("")) { %>
							<%=CodeUtil.optList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("p_slip_no"),box.get("p_slip_ymd"),"B20","","","",uSesEnt.dbo)%>
						<% } %>
						</select>
					<% if(obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
					<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
					<% } %>
			<% } %>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						</span>
					</div>
				</td>
	  		</tr>
	  	</tbody>
	</table>	

<div id="divListData" class="contentsRow">
	<div class="table-top-control">
		<div class="notice-view">
			<span style="color:#01a1db;">전표번호를 클릭</span>하면 해당 세부내용을 조회할 수  있습니다.</td>
		</div>
		<% if(rsWp.getLength() > 0) { %>
		<div class="form-inline t-right marR5" style="width: 1240px;">
			<% if(box.get("cd_flag").equals("2")) { %>
				<select name="dae_acct_cd" title="결제계정과목" class="bs-select form-control" onChange="changeAcctCd(this.value)">
					<option value=''>:: 결제계정과목 선택 ::</option>
		            <option value="1110103">보통예금</option> 
					<option value="1110105">기업자유예금</option>
				<% if(uSesEnt.dbo.equals("SABOK55")) { %>
					<option value='1110108'>RP</option>
				<% } %>
				</select>
				<select name="account_no" title="계좌번호" class="bs-select form-control">
					<option value=''>:: 계좌번호 선택 ::</option>
				</select>
				<input type="text" name="dae_amt" value="" class="form-control tMONEY" style="width:120px;" readOnly>
				&nbsp;(증빙일자 :
				<div id="date-top" class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="proof_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="증빙일자" class="form-control required tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<% }else if(obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { %>
				<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("3")) { %>
				대체전표가 <font color=red><b><%=obox.get("sign_status").equals("2")?"승인대기":"승인"%></b></font>상태에 있으므로 취소할 수 없습니다.
			<% } %>
		</div>
    	<% } %>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 160px)">
<% } %>

<% if(!box.get("excel_yn").equals("Y")) { %>
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:2%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:16%;">
				<col style="width:12%;">
				<col style="width:8%;">
				<col style="width:8%;">
				<col style="width:13%;">
				<col style="width:8%;">
			</colgroup>
			<thead>
				<tr>
					<th>
					<%if(box.get("cd_flag").equals("2")){%>
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" id="checkbox" name="checkbox" value="Y" style="border:none" onClick="goSelectAll()">
							<span></span>
						</label>
					<%}else {%>
						No
					<% } %>
					</th>
					<th>전표번호</th>
					<th>업무유형</th>
					<th>적요</th>
					<th>작성부서</th>
					<th>작성자</th>
					<th>금액</th>
					<th>지출거래처</th>
					<th>증빙일자</th>
          		</tr> 
          	</thead>
          	<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="9" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center">
					<% if(box.get("cd_flag").equals("2")) { %>
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="slip_key<%=i%>" value="<%=rsWp.get("slip_no",i)%><%=rsWp.get("slip_seq",i)%>|" onClick="autoCalc()">
							<span></span>
						</label>
					<% }else { %>
						<%=String.valueOf(i+1)%>
					<% } %>
					</td>
					<td class="t-center"><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>')"><span style="letter-spacing:0px"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></span></a></td>
					<td class="t-center"><%=rsWp.get("biz_type_nm",i)%></td>
					<td><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-center"><%=rsWp.get("wrt_dept_nm",i)%></td>
					<td class="t-center"><a href="javascript:goEmployeePop('<%=rsWp.get("wrt_empl_no",i)%>')"><%=rsWp.get("wrt_empl_nm",i)%></a></td>
					<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center">
						<a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a>
						<a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%=rsWp.get("empl_nm",i)%></a>
					</td>
					<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
					<input type="hidden" name="slip_amt<%=i%>" 	value="<%=rsWp.get("slip_amt",i)%>">
				</tr>	
				<% } %>
		 	<% } %>
		 	</tbody>
		</table>
<%}else { %>
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th>No</th>
					<th>전표번호</th>
					<th>적요</th>
					<th>금액</th>
					<th>지출거래처</th>
					<th>계좌번호</th>
          		</tr> 
          	</thead>
          	<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></td>
					<td><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cust_nm",i).equals("") ? rsWp.get("empl_nm",i) : rsWp.get("cust_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("bank_nm",i)%> <%=rsWp.get("account_no",i)%> (예금주:<%=rsWp.get("account_owner",i)%>)</td>
				</tr>	
				<% } %>
		 	<% } %>
		 	</tbody>
		</table>
<% } %>
	</div>
</div>
</form>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="<%=obox.get("subject")%>">
<input type="hidden" name="msg_type" 		value="SLP003">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>">
<input type="hidden" name="etc_remark" 		value="">
<input type="hidden" name="proof_ymd" 		value="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="slip_amt" 		value="<%=FormatUtil.insertComma(String.valueOf(slip_amt_sum))%>">
<input type="hidden" name="nextUrl" 		value="">
</form>