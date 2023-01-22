<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 개인별 목적사업지원현황  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			if(gbn == 'E') { 
				document.main.action = 'wel22001_excel.do?excel_yn=Y';
				document.main.target = 'excelFrm';
				document.main.submit();
			}else {
				ajaxReplaceForm("wel22001_list.do", "#main", "#divListData", function() {
					fixTableHeader("MyTable");
				});
			}
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("wel22001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<iframe name="excelFrm" style="display:none"></iframe>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="excel_file_nm" value="개인별목적사업지원현황">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">개인별 목적사업지원현황</h1>
	        
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:12%;">
			<col style="width:28%;">
			<col style="width:12%;">
			<col style="width:48%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">기준년도</td>
				<td>
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:100px" onChange="goSearch('N')">
	           			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2013",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
			    	</span>
			    </td>
	  		</tr>
	  	</tbody>
	</table>
</form>    

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">성명을 클릭</span>하면 해당 임직원 세부정보를 조회할 수 있습니다.
		</div>
		<div class="f-right">(단위 : 원)</div>
	</div>
		
 	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 170px)">
 	<% RsWrapper codeWp = CodeUtil.getRsWrapper("PR_BUDTB_CODE01_LIST","LIST001", "", "S","","","N","",uSesEnt.dbo); 
	   int column_cnt = codeWp.getLength() + 4; int col_width = 100 / column_cnt; %>	
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:<%=col_width%>%">
				<col style="width:<%=col_width%>%">
				<col style="width:<%=col_width%>%">
				<col style="width:<%=col_width%>%">
				<col style="width:<%=col_width%>%">
			</colgroup>
			<thead>
				<tr>
					<th>사번</th>
					<th>성명</th>
					<th>부서명</th>
				<% for(int k=0; k < codeWp.getLength(); k++) { %>	
					<th><%=codeWp.get("bugt_nm",k)%></th>
				<% } %>	
					<th>합계</th>
	       		</tr>
	       </thead>
	       <tbody> 
			<% if(rsWp.getLength() == 0) { %>
					<tr><td colspan="<%=column_cnt%>" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else {
			   	   for(int i=0; i < rsWp.getLength(); i++) { %>
			   	   <% if(rsWp.get("empl_nm",i).equals("합계")) { %>
					<tr bgcolor="f6f6f6"> 
			   	   <% }else { %>
					<tr > 
			   	   <% } %>
						<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
						<td class="t-center">
							<%if(!box.get("excel_yn").equals("Y") && !rsWp.get("empl_nm",i).equals("합계")) { %>
								<a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')">
							<% } %><%=rsWp.get("empl_nm",i)%></a>
						</td>
						<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<% for(int k=0; k < codeWp.getLength(); k++) { %>	
						<td class="t-right"><%=rsWp.get("amt_"+codeWp.get("bugt_cd",k).toLowerCase(),i,Box.THOUSAND_COMMA)%></td>
					<% } %>	
						<td class="t-right"><%=rsWp.get("amt_tot",i,Box.THOUSAND_COMMA)%></td>
					</tr>	
				<% } %>
			<% } %>
			</tbody>
		</table>
	</div>
<% if(!box.get("excel_yn").equals("Y")) { %>
	<%=PageUtil.makePaging(box, rsWp, 50, request)%>
<% } %>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>