<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 재무제표 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>

<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			if(isEmpty(document.main.report_id)) {
				alert('보고서종류를 선택하세요.');
				document.main.report_id.focus();
				return;
			}
			var theURL = '';
			if(gbn == 'E') { 
				theURL = '/account/fd/rpt21001_excel.do?excel_yn=Y';
			}else {
				theURL = 'rpt21001_list.do';
			}
			document.main.report_nm.value = getSelectedText(document.main.report_id);
			fixTableHeader("MyTable");
	
			removeMask("#main");	
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goCreate() {
		if (formValidate("#main")) {
			if(confirm(document.main.std_year.value + '년 ' + document.main.std_month.value + '월 재무제표를 다시 생성하시겠습니까?')) {
				removeMask(document.main);				
				document.main.action = 'rpt21001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function changeReportid(report_id) {
		if(report_id == 'ACC001') {
			$("#spanSummaryYn").show();
			$("#spanAccUnitYn").show();
			$("#spanMonthFlag").show();
		}else if(report_id == 'ACC002') {
			$("#spanSummaryYn").show();
			$("#spanAccUnitYn").show();
			$("#spanMonthFlag").show();
		}else if(report_id == 'ACC003') {
			document.main.accunit_yn.checked = false;
			$("#spanSummaryYn").show();
			$("#spanAccUnitYn").hide();
			$("#spanMonthFlag").hide();
		}else if(report_id == 'ACC004' || report_id == 'ACC005') {
			document.main.summary_yn.checked = false;
			$("#spanSummaryYn").hide();
			$("#spanAccUnitYn").show();
			$("#spanMonthFlag").hide();
		}else {
			$("#spanSummaryYn").show();
			$("#spanAccUnitYn").show();
			$("#spanMonthFlag").hide();
		}
	}
	
	// 계정별잔액 증감현황 or 보조부 호출
	function goDetail(acct_cd_arr, acct_nm) {
		var pageUrl = '';
		var arr = acct_cd_arr.split(';');
		if(arr.length == 2 && arr[0].length == 7) {
			pageUrl = '/account/pd/rpt01001_list.do?1=1'
					+ '&start_ymd=<%=box.get("std_year")%><%=box.get("month_flag").equals("M")?box.get("std_month"):"01"%>01'
				    + '&end_ymd=<%=box.get("std_year")%><%=box.get("std_month")%><%=DateUtil.getDayCount(box.getInt("std_year"),box.getInt("std_month"))%>'
				    + '&acct_cd='+arr[0] + '&acct_nm='+acct_nm + '&select_yn=Y&popup_yn=Y';
		}else {
			pageUrl = '/account/pd/rpt12001_list.do?1=1'
					+ '&std_year=<%=box.get("std_year")%>&std_month=<%=box.get("std_month")%>'
				    + '&acct_cd_arr='+acct_cd_arr + '&select_yn=Y&popup_yn=Y';
		}
		popupOpen(encodeURI(pageUrl), "rpt01001", 1200, 830);
	}
	
	$(function() {
		changeReportid(document.main.report_id.value);
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="report_nm"		value="<%=box.get("report_nm")%>">
<input type="hidden" name="excel_file_nm"	value="<%=box.get("report_nm")%>">
<input type="hidden" name="select_yn"		value="Y">

	<h1 class="page-title form-inline">
		재무제표
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goCreate()"><img src="/com/img/ico_btn_history.png">당월 재무제표 DB 재생성</button>
		</span>
	</h1>
			
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">보고서 종류</td>
				<td>
					<select name="report_id" title="보고서종류" class="bs-select form-control" style="width:160px" onChange="changeReportid(this.value)">
						<option value='ACC001' <%=box.get("report_id").equals("ACC001") ? "selected":""%>>재무상태표</option>
						<option value='ACC002' <%=box.get("report_id").equals("ACC002") ? "selected":""%>>손익계산서</option>
						<option value='ACC003' <%=box.get("report_id").equals("ACC003") ? "selected":""%>>합계잔액시산표</option>
						<option value='ACC004' <%=box.get("report_id").equals("ACC004") ? "selected":""%>>고유목적사업명세서</option>
						<option value='ACC005' <%=box.get("report_id").equals("ACC005") ? "selected":""%>>일반관리비명세서</option>
					</select>
					<label id="spanSummaryYn" class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="summary_yn" value="S" <%=box.get("summary_yn").equals("S")?"checked":""%> style="border:none">요약<span></span>
					</label>
					<label id="spanAccUnitYn" class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="accunit_yn" value="G" <%=box.get("accunit_yn").equals("G")?"checked":""%> style="border:none">구분<span></span>
					</label>
				</td>
				<td class="td-head">기준년월</td>
				<td>
					<select name="std_year" title="기준년도" class="bs-select form-control" style="width:100px">
            			<%=DateUtil.getYearOptionTag(box.get("std_year"),"2010",DateUtil.nextYear(2),"desc","년")%>
					</select>&nbsp;
					<select name="std_month" title="기준월" class="bs-select form-control" style="width:90px">
            			<%=DateUtil.getMonthOptionTag(box.get("std_month"),"월")%>
					</select>
					<label id="spanMonthFlag" class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="month_flag" value="M" <%=box.get("month_flag").equals("M")?"checked":""%> style="border:none">월별<span></span>
					</label>
				</td>
				<td class="td-head">회계단위</td>
				<td>
					<select name="acc_unit" title="회계단위" class="bs-select form-control" style="width:160px">
						<option value=''>전체</option>
						<option value='00' <%=box.get("acc_unit").equals("00")?"selected":""%>>목적사업회계</option>
						<option value='20' <%=box.get("acc_unit").equals("20")?"selected":""%>>기금관리회계</option>
					</select>
			  	</td>
	  		</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>

	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">계정과목을 클릭</span>하면 계정별 세부거래내역을 조회할 수 있습니다.
		</div>
		<span class="f-right">
		  	<button type="button" id="btnSearch" class="btn btn-primary" onclick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
		  	<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
  		<% if(box.get("accunit_yn").equals("G")) { %>
  			<button type="button" class="btn dark" onclick="goUbiViewer('WEB-INF/jsp/account/report/ACC001G.jrf','P_PARAM01!<%=box.get("report_id")+box.get("summary_yn")%>!P_PARAM02!<%=box.get("std_year")+box.get("std_month")%>!P_PARAM03!<%=box.get("acc_unit")%>!P_PARAM04!<%=box.get("month_flag")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
		<% }else if(box.get("report_id").equals("ACC003")){ %>
  			<button type="button" class="btn dark" onclick="goUbiViewer('WEB-INF/jsp/account/report/ACC003.jrf','P_PARAM01!<%=box.get("report_id")+box.get("summary_yn")%>!P_PARAM02!<%=box.get("std_year")+box.get("std_month")%>!P_PARAM03!<%=box.get("acc_unit")%>!P_PARAM04!<%=box.get("month_flag")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
		<% }else if(box.get("report_id").equals("ACC004") || box.get("report_id").equals("ACC005")){ %>
			<button type="button" class="btn dark" onclick="goUbiViewer('WEB-INF/jsp/account/report/ACC004.jrf','P_PARAM01!<%=box.get("report_id")+box.get("summary_yn")%>!P_PARAM02!<%=box.get("std_year")+box.get("std_month")%>!P_PARAM03!<%=box.get("acc_unit")%>!P_PARAM04!<%=box.get("month_flag")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
		<% }else { %>
			<button type="button" class="btn dark" onclick="goUbiViewer('WEB-INF/jsp/account/report/ACC001.jrf','P_ACTION_TYPE!<%=box.get("report_id").equals("ACC001")?"LIST001":"LIST002"%>!P_PARAM01!<%=box.get("report_id")+box.get("summary_yn")%>!P_PARAM02!<%=box.get("std_year")+box.get("std_month")%>!P_PARAM03!<%=box.get("acc_unit")%>!P_PARAM04!<%=box.get("month_flag")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
		<% } %>
		</span>
	</div>
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 140px)">
		<% if(box.get("report_id").startsWith("ACC001")) { %>
				<%@ include file="rpt21002.jsp" %>
		<% }else if(box.get("report_id").startsWith("ACC002")) { %> 
				<%@ include file="rpt21003.jsp" %>
		<% }else if(box.get("report_id").startsWith("ACC003")) { %> 
				<%@ include file="rpt21004.jsp" %> 
		<% }else if(box.get("report_id").startsWith("ACC004")) { %> 
				<%@ include file="rpt21005.jsp" %> 
		<% }else if(box.get("report_id").startsWith("ACC005")) { %> 
				<%@ include file="rpt21006.jsp" %> 
		<% } %>
	</div>

<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>