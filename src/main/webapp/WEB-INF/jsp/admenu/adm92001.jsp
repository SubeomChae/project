<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"  scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템 접속로그  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch() {
		document.main.page_count.value = '';
		ajaxReplaceForm("adm92001_list.do", "#main", "#divListData", function(){
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("adm92001_list.do", "#main", "#divListData", function(){
			fixTableHeader("MyTable");	
		});
		return false;
	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="menu_id" 	value="<%=box.get("menu_id")%>">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">시스템 접속로그</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:25%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">회사명</td>
				<td>
					<select name="corp_cd" class="bs-select form-control" title="회사명" style="width:99%">
						<option value=''>전체</option>
			            <%=CodeUtil.optList("PR_COMTB_CORP01_LIST","LISTCODE",box.get("corp_cd"),"","","","","")%>
					</select>
				</td>
				<td class="td-head">접속일자</td>	
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="시작일" class="form-control tYMD">
							<span class="input-group-btn"><button type="button" class="btn dark"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="종료일" class="form-control tYMD">
							<span class="input-group-btn"><button type="button" class="btn dark"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>사번</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>client IP</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>action_type</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:120px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>	
				</td>
			</tr>
		</tbody>
	</table>
</form>					
					
<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 148px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:5%">
				<col style="width:26%">
				<col style="width:10%">
				<col style="width:12%">
				<col style="width:20%">
				<col style="width:15%">
				<col style="width:12%">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>Company Name</th>
					<th>User Name</th>
					<th>Client IP</th>
					<th>connect date</th>
					<th>Procedure Name</th>
					<th>Action_type</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++){ %>
				<tr>
					<td><%=rsWp.get("row_num",i)%></td>
					<td><%=rsWp.get("corp_nm",i)%></td>
					<td><%=rsWp.get("empl_nm",i)%></td>
					<td><%=rsWp.get("client_ip",i)%></td>
					<td><%=rsWp.get("slog_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
					<td><%=rsWp.get("proc_nm",i)%></td>
					<td><%=rsWp.get("action_type",i)%></td>
				</tr>
			<% } %>
			</tbody>	
	  	</table>
  	</div>
  	
  	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
  	
<% if(!box.get("ajax_yn").equals("Y")) { %>  	
</div>
<% } %>