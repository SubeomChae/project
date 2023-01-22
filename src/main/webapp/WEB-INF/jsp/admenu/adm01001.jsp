<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 회사정보  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.main.page_count.value = '';
		ajaxReplaceForm("adm01001_list.do", "#main", "#divListData", function() {
			var corp_cd = $("tr[id='tr_0']").attr("corp_cd");
			if(corp_cd != undefined) { goDetail(corp_cd); }
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("adm01001_list.do", "#main", "#divListData", function() {
			var corp_cd = $("tr[id='tr_0']").attr("corp_cd");
			if(corp_cd != undefined) { goDetail(corp_cd); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	
	function goDetail(corp_cd) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(corp_cd != '') { $("tr[corp_cd='"+corp_cd+"']").addClass("bg-yellow"); }
		var pageUrl = 'adm01002_select.do?corp_cd='+corp_cd;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		ajaxReplaceForm("adm01003_edit.do", "#main", "#divFrame");
	}
	
	$(function() {
		<% if(box.get("corp_cd").equals("")) { %>
			goWrite();
		<% }else { %>
			<% for(int i=0; i < rsWp.getLength(); i++) { %> 
				<% if(rsWp.get("corp_cd",i).equals(box.get("corp_cd"))) { %>
					$("tr[corp_cd='"+corp_cd+"']").addClass("bg-yellow");
					goDetail('<%=box.get("corp_cd")%>');
		 		<% } %>
			<% } %>
		<% } %>
			fixTableHeader("MyTable");
		});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="page_count"	value="">
<input type="hidden"  name="selectedRow"	value="">
	
	<h1 class="page-title">회사정보</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td class="td-head" style="width:10%">
					<select name="param04" class="bs-select form-control" title="설치유형" style="width:120px" onChange="goSearch()">
						<option value=''>:: 설치유형 ::</option>
						<option value='1' <%=box.get("param04").equals("1")?"selected":""%>>자체서버</option>
						<option value='2' <%=box.get("param04").equals("2")?"selected":""%>>임대서버</option>
					</select>
				</td>
				<td class="td-head" style="width:12%">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>회사명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>대표자 성명</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>사업장소재지</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
					<% if(uSesEnt.use_auth.equals("SA")) { %>
						<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
					<% } %>
					</span>	
				</td>
	  		</tr>
		</tbody>
	</table>
</form>
		
<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 146px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<thead>
						<tr>
							<th>회사코드</th>
							<th>회사명</th>
							<th>대표자</th>
						</tr>
					<thead>
					<tbody>
				<% if(rsWp.getLength() == 0) { %>
						<tr height="25"><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
				<%}else { 
					  for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" corp_cd="<%=rsWp.get("corp_cd",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("corp_cd",i)%>')"> 
							<td class="t-center"><%=rsWp.get("corp_cd",i)%></td>
							<td class="t-left"><%=rsWp.get("corp_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("rep_person_nm",i)%></td>
						</tr>
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>