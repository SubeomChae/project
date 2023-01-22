<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>예산대비집행현황(총괄표)</title>
<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'bud24001_list.do';
	
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	// 계정별잔액 증감현황 or 보조부 호출
	function goDetail(acct_cd_arr, acct_nm) {
		var pageUrl = '';
		var arr = acct_cd_arr.split(';');
		
		if(arr.length == 2 && arr[0].length == 7) {
			pageUrl = '/account/pd/rpt01001_list.do'
					+ '?start_ymd=<%=box.get("bugt_yy")%>0101'
				    + '&end_ymd=<%=box.get("bugt_yy")%>1231'
				    + '&acct_cd='+arr[0] + '&acct_nm='+acct_nm + '&select_yn=Y&popup_yn=Y';
		}else {
			pageUrl = '/account/pd/rpt12001_list.do'
					+ '?std_year=<%=box.get("bugt_yy")%>&std_month=12'
				    + '&acct_cd_arr='+acct_cd_arr + '&select_yn=Y&popup_yn=Y';
		}
		popupOpen(encodeURI(pageUrl), "rpt12001", 1200, 830);
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
	
	<h1 class="page-title">예산 대비 집행현황(총괄표)</h1>
	
	<table class="search-panel table table-bordered">
  		<tr height="28">
			<th width="13%"  align="center">기준년도</td>
			<td width="27%" style="padding-left:5px">
				<select name="bugt_yy" title="기준년도" class="bs-select form-control" style="width:100px">
					<option value=''>선택</option>
					<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
				</select>
			</td>
			<th width="13%"  align="center">조회기준</th>
			<td width="47%" style="padding-left:5px">
				<select name="report_id" title="조회기준"   class="bs-select form-control" style="width:120px">
					<option value='ACC002P' <%=box.get("report_id").equals("ACC002P") ? "selected":""%>>손익예산</option>
					<option value='ACC001P' <%=box.get("report_id").equals("ACC001P") ? "selected":""%>>자본예산</option>
				</select>
	  			<span class="f-right marR60">
					<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" class="btn btn-primary" onClick="screenToExcel('#divArea', '예산 대비 집행현황(총괄표)');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/budget/report/bud24001.jrf', 'P_PARAM01!<%=box.get("report_id")%>!P_PARAM02!<%=box.get("bugt_yy")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
				</span>
		    </td>
  		</tr>
	</table>
	
<div id="divListData" class="contentsRow">
	<div>
		<span style="color:#01a1db;">계정과목별 집행실적 금액을 클릭</span>하면 세부내용을 검색할 수 있습니다.
	</div>
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 140px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:30%;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:10%;">
			</colgroup>
			<thead>
				<tr height="22px">
					<th rowspan="2" class="td-head">계정과목</th>
					<th colspan="3" class="td-head"><%=box.get("bugt_yy")%>년 예산</th>
					<th rowspan="2" class="td-head">집행실적</th>
					<th rowspan="2" class="td-head">비율(%)</th>
					</tr>
				<tr height="22px">
					<th class="td-head">목적사업회계</th>
					<th class="td-head">기금관리회계</th>
					<th class="td-head">계</th>
				</tr> 
			</thead>
			<tbody>
		<% for(int i=0; i < rsWp.getLength(); i++) {	
				String bgcolor = "#ffffff";
				if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
				if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#eeeeee"; } %>
			<tr class="odd gradeX" bgcolor="<%=bgcolor%>"> 
				<td class="t-left"><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></td>
				<td class="t-right"><%=rsWp.get("bugt_amt1",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("bugt_amt2",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("bugt_amt3",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><span style="letter-spacing:0px"><%=rsWp.get("real_amt",i,Box.THOUSAND_COMMA)%></span></a></td>
				<td class="t-right"><%=rsWp.get("exec_rate",i).equals("") ? "N/A" : rsWp.get("exec_rate",i)%></td>
			</tr>	
		<% } %>
			</tbody>
		</table>
	</div>
</div>
</form>