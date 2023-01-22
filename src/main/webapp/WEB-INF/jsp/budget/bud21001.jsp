<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>추정재무제표</title>
<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'bud21001_list.do';
			
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">

	<h1 class="page-title">추정 재무제표</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:13%;">
			<col style="width:27%;">
			<col style="width:13%;">
			<col style="width:47%;">
		</colgroup>
		<tbody>	
			<tr>
				<td class="td-head">기준년도</td>
				<td>
					<select name="bugt_yy" class="bs-select form-control" title="기준년도" style="width:100px">
						<option value=''>선택</option>
						<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<td class="td-head">보고서종류</td>
				<td>
					<select name="report_id" class="bs-select form-control" title="보고서종류" style="width:140px">
						<option value='ACC001P' <%=box.get("report_id").equals("ACC001P")?"selected":""%>>추정 재무상태표</option>
						<option value='ACC002P' <%=box.get("report_id").equals("ACC002P")?"selected":""%>>추정 손익계산서</option>
					</select>
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="screenToExcel('#divListData', '<%=box.get("report_id").equals("ACC001P")?"추정 재무상태표":"추정 손익계산서"%>');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/budget/report/bud21001.jrf', 'P_PARAM01!<%=box.get("report_id")%>!P_PARAM02!<%=box.get("bugt_yy")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>		    
	<div id="divListData" class="contentsRow">
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 127px);">
			<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
				<colgroup>
					<col style="width:30px;">
					<col style="width:25px;">
					<col style="width:15px;">
					<col style="width:15px;">
					<col style="width:15px;">
					<col style="width:15px;">
				</colgroup>
				<thead>
					<tr height="22">
						<th rowspan="2">과목</th>
						<th colspan="3"><%=box.get("bugt_yy")%>년 예산</th>
						<th rowspan="2">비고</td>
					</tr> 
					<tr height="22">
						<th>목적사업회계</th>
						<th>기금관리회계</th>
						<th>계</th>
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
						<td></td>
					</tr>	
				<% } %>
				</tbody>
			</table>
		</div>
	</div>
</form>