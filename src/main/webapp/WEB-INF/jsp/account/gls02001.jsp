<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rBox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 고유목적사업준비금 수입대체 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>

<script language="javascript">
	function goSearch(gbn) {
		var theURL = 'gls02001_list.do';
		if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }

		removeMask("#main");
		document.main.action = theURL;
		document.main.target = "_self";
		document.main.submit();
	}

	function goExecute(acc_ym, cost_amt, slip_no) {
		if(formValidate("#main")) {
			if(confirm(acc_ym.substring(0,4)+'년  '+acc_ym.substring(4)+'월 고유목적사업비 지출액을 수입대체하시겠습니까?')) {
				document.main.action = 'gls02001_execute.do?acc_ym='+acc_ym+'&slip_no='+slip_no+'&cost_amt='+cost_amt;
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}
	
	function goSign(slip_no) {
		document.signForm.search_key.value = 'ACCTB_SLIP01|' + slip_no;
		document.signForm.subject.value = '고유목적사업준비금 수입대체(' + slip_no.substring(0,4) + '-' + slip_no.substring(4,6) + ')';
		goSignRequest(document.signForm);
	}
	
	function signRequestPost() { goSearch('N');  }
	
	function goDelete(slip_no) {
		if(confirm('삭제하시겠습니까?')) {
			document.main.action = 'gls02001_delete.do?slip_no='+slip_no;
			document.main.target = '_self';
			document.main.submit();
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="excel_file_nm" 	value="고유목적사업준비금 수입대체">

	<h1 class="page-title">고유목적사업준비금 수입대체</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
	  		<tr>
				<td width="10%" class="td-head">기준년도</td>
				<td>
					<select name="std_year" title="기준년도" class="bs-select form-control" style="width:100px" onChange="goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("std_year"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="f-right marR60">
					  	<button type="button" id="btnSearch" class="btn btn-primary" onclick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			  		<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
					  	<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
			  		<% } %>
			  		</span>
			  	</td>
	  		</tr>
		</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
	
	<div class="table-top-guide marB5">
		<img src="/com/img/icon_again.gif"> 표시가 된 년월은 비용지출액과 수입대체금액이 다르므로 <span style="color:#01a1db;">수입대체를 실행</span>하셔야 합니다.
	</div>	
<% } %>
	<div id="divArea" class="table-scrollable">
	
		<table class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:6%;">
				<col style="width:9%;">
				<col style="width:8%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:9%;">
				<col style="width:4%;">
				<col style="width:10%;">
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">년월</th>
					<th colspan="3">비용지출액</th>
					<th colspan="3">고유목적사업준비금 잔액</th>
					<th colspan="3">수입대체금액</th>
					<th rowspan="2">실행</th>
					<th rowspan="2">대체전표번호</th>
          		</tr> 
				<tr>
					<th>고유목적<br>사업비</th>
					<th>일반관리비</th>
					<th>계</th>
					<th>준비금1</th>
					<th>준비금2</th>
					<th>계</th>
					<th>준비금1</th>
					<th>준비금2</th>
					<th>계</th>
          		</tr> 
			</thead>
			<tbody>
	 			<% if(rsWp.getLength() == 0) { %>
						<tr height="25"><td colspan="12" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else {
					   Box rbox = CodeUtil.getRsBox("PR_DUAL", "EXEC_QUERY", "COMTB_CORP01", "repl_cycle", "corp_cd='"+uSesEnt.dbo+"'", "",""); 
					   boolean isMonthly = rBox.get("repl_cycle").equals("M") ? true : false; // 월별 대체 or 반기별 누적대체
					   Long amt_7 		= 0L;		
					   Long amt_64001   = 0L;		
					   Long amt_22008   = 0L;		
				   	   for(int i=0; i < rsWp.getLength(); i++) { 
				   	   		amt_7 		= rsWp.getLong("amt_71",i) + rsWp.getLong("amt_72",i);
				   	   		amt_64001 	= rsWp.getLong("amt_6400101",i) + rsWp.getLong("amt_6400102",i);
				   	   		amt_22008 	= rsWp.getLong("amt_2200801",i) + rsWp.getLong("amt_2200802",i); 
				   	   		boolean isOk = false;
				   	   		if(isMonthly && rsWp.get("sort_key",i).length() == 6) { isOk = true; }
				   	   		if(!isMonthly && rsWp.get("sort_key",i).length() > 6) { isOk = true; }
				   	   	%>
						<tr <%if(rsWp.get("sort_key",i).indexOf("z") >= 0){%>class="tr-summary"<%}%>> 
							<td class="t-center" style="mso-number-format:\@"><%=rsWp.get("acc_ym",i,Box.DEF_DATE_FMT)%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_71",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_72",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_7))%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_2200801",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_2200802",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_22008))%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_6400101",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=rsWp.get("amt_6400102",i, Box.THOUSAND_COMMA)%></td>
							<td align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_64001))%></td>
							<td class="t-center">
							<% if(!box.get("excel_yn").equals("Y") && isOk) { %>
								<% if(amt_7 > 0 && String.valueOf(amt_7).equals(String.valueOf(amt_64001))) { %>
									<%if(!rsWp.get("sign_status",i).equals("2") && !rsWp.get("sign_status",i).equals("3")){%><a href="javascript:goExecute('<%=rsWp.get("sort_key",i).substring(0,6)%>','<%=amt_7%>','<%=rsWp.get("slip_no",i)%>');" title="수입대체 재실행"><%}%><img src="/com/img/icon_good.gif" border="0" align="absmiddle"></a>
								<% }else if(!String.valueOf(amt_7).equals(String.valueOf(amt_64001))) { %>
									<%if(!rsWp.get("sign_status",i).equals("2") && !rsWp.get("sign_status",i).equals("3")){%><a href="javascript:goExecute('<%=rsWp.get("sort_key",i).substring(0,6)%>','<%=amt_7%>','<%=rsWp.get("slip_no",i)%>');" title="수입대체 실행"><%}%><img src="/com/img/icon_again.gif" border="0" align="absmiddle"></a>
								<% } %>
							<% } %>
							</td>
							<td class="t-center" nowrap>
							<% if(!box.get("excel_yn").equals("Y") && !rsWp.get("slip_no",i).equals("")) { %>
								<a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>');" title="대체전표 보기"><span style="letter-spacing:0px"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></span></a>
								<% if(rsWp.get("sign_status",i).equals("1") || rsWp.get("sign_status",i).equals("4")) { %><br>
									<button type="button" class="btn btn-primary btn-table" onClick="goSign('<%=rsWp.get("slip_no",i)%>')">기안문작성</button>
									<button type="button" class="btn btn-primary btn-table" onClick="goDelete('<%=rsWp.get("slip_no",i)%>');">삭제</button>
								<% } %>
							<% }else { %>
								<%=rsWp.get("slip_no",i,Box.SLIP_NO)%>
							<% } %>
							</td>
						</tr>	
					<% } %>
				<% } %>
			</tbody>
		</table>
	</div>

<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>

<form id="signForm" name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="">
<input type="hidden" name="msg_type" 		value="SLP008">
<input type="hidden" name="search_key" 		value="">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>