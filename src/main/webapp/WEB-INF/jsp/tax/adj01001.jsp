<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 법인세과세표준신고 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		var method_nm = document.taxList.report_id.value.toLowerCase();
		var pageUrl = '';
		if(gbn == 'E') { 
			pageUrl = '/tax/fd/'+method_nm+'_excel.do?include=Y';
			document.taxList.action = pageUrl + '&excel_yn=Y';
			document.taxList.target = '_self';
			document.taxList.submit();
		}else {
			pageUrl = 'adj01001.do?include=Y';
			ajaxReplaceForm(pageUrl, "#taxList", "#divListData", function() {
				var report_id = document.taxList.report_id.value;
				if(report_id != undefined) { goDetail(report_id,""); }
				fixTableHeader("MyTable");
			});
		}
	}

	function goDetail(report_id, report_nm) {
		document.taxList.report_id.value = report_id;
		document.taxList.excel_file_nm.value = report_nm;
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(report_id != '') { $("tr[report_id='"+report_id+"']").addClass("bg-yellow"); }
		var pageUrl = '/tax/fd/'+report_id.toLowerCase()+'.do?include=Y';
		ajaxReplaceForm(pageUrl, "#taxList", "#divFrame");
	}

	function goReport() {
		var params = 'P_PARAM01!<%=box.get("std_yy")%>!P_PARAM02!'+document.taxList.report_id.value+'!';
		goUbiViewer('/WEB-INF/jsp/tax/report/'+document.taxList.report_id.value.toLowerCase()+'.jrf', params);
	}

	$(function() {
	<% if(!box.get("report_id").equals("")) { %>
		goDetail('<%=box.get("report_id")%>','<%=box.get("excel_file_nm")%>');
	<% }else if(rsWp.getLength() > 0) { %>
		goDetail('<%=rsWp.get("code1",0)%>','<%=rsWp.get("data1",0)%>');
	<% } %>
		fixTableHeader("MyTable");
	});
	
</script>

<form id="taxList" name="taxList" method="post" action="" class="fType">
<input type="hidden" id="report_id"		name="report_id" 		value="">
<input type="hidden" id="excel_file_nm"	name="excel_file_nm" 	value="">
<input type="hidden" name="selectedRow" 	value="">

	<h1 class="page-title">법인세과세표준신고</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td class="td-head" width="15%">기준년도</td>
				<td>
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:80px">
						<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="f-right marR60">
			  			<button type="button" class="btn btn-primary" onclick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			  			<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
			  			<button type="button" id="btnRptViewer" class="btn dark marL5" onclick="goReport();"><img src="/com/img/ico_btn_print.png">인쇄</button>
		  			</span>
					
				</td>
			</tr>
		</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col" >
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 125px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgorup>
						<col style="width:40%">
						<col style="width:60%">
					</colgorup>
					<thead>
						<tr>
							<th>규정</th>
							<th>서식명</th>
						</tr>
					</thead>
					<tbody>
				   	<% for(int i=0; i < rsWp.getLength(); i++) { %>
				 	  	<% if(!uSesEnt.use_auth.equals("SA") && (rsWp.get("code1",i).equals("ADJ02003_2_1") || rsWp.get("code1",i).equals("ADJ02003_3_1") || rsWp.get("code1",i).equals("ADJ02010_B") || rsWp.get("code1",i).equals("ADJ02010_C") || rsWp.get("code1",i).equals("ADJ02010_D"))) { continue; }%>
						<tr id="tr_<%=i%>" report_id="<%=rsWp.get("code1",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("code1",i)%>','<%=rsWp.get("data1",i)%>')"> 
							<td class="t-left"><a title="<%=rsWp.get("code1",i)%>"><%=rsWp.get("data2",i)%></a></td>
							<td class="t-left"><%=rsWp.get("data1",i)%></td>
						</tr>
					<% } %>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="2" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col pad0">
			<div id="divFrame" class="table-cover scrollOptionY" style="height:calc(100vh - 125px)">
			
			</div>
	  	</div>
			    
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>