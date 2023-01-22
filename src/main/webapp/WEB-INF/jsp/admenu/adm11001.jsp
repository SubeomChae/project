<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 도움말  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.main.page_count.value = '';
		ajaxReplaceForm("adm11001_list.do", "#main", "#divListTable", function() {
			fixTableHeader("MyTable");	
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("adm11001_list.do", "#main", "#divListTable", function(){
			fixTableHeader("MyTable");	
		});
		return false;
	}
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch();
	}
	
	function goEdit(menu_id, menu_nm) {
		var params = '&menu_id='+menu_id;
		popupOpen("/admenu/pd/adm11002_edit.do?1=1"+params, "adm11002", 1200, 800);
	}

	$(function(){
		fixTableHeader("MyTable");
	});
</script>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id"	value="<%=box.get("menu_id")%>">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">도움말</h1>

	<table class="search-panel table table-bordered">
  		<tr>
			<td>
				<select name="search_key" class="bs-select form-control" style="width:100px">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>제목</option>
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>도움말개요</option>
				</select>							
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
  				<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>							
			</td>
  		</tr>
	</table>
</form>
		
<div id="divListTable" class="contentsRow">
<% } %>
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 150px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th width="5%">No</th>
					<th width="25%"><a href="javascript:goSort('t1.menu_nm')">목차</a></th>
					<th width="*"><a href="javascript:goSort('t1.intro_msg')">도움말개요</a></th>
					<th width="15%">이미지파일</th>
					<%if(uSesEnt.use_auth.equals("SA")){ %>
						<th width="20"></th>
					<% } %>
				</tr>
			<thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>"> 
					<td><%=rsWp.get("row_num",i)%></td>
					<td class="t-left"><a href="javascript:sabokHelp('<%=rsWp.get("menu_id",i)%>')"><%=rsWp.get("menu_id",i)%>. <%=rsWp.get("menu_nm",i)%></a></td>
					<td class="t-left"><%=rsWp.getCutStr("intro_msg",i,100)%></td>
					<td class="t-left">
					<% if(!rsWp.get("file_no",i).equals("")) { %>
						<a onClick="popupOpen('/popup/imgPopup.do?imgPath=userfile&file_nm=<%=StringUtil.urlEncode(rsWp.get("file_path",i))%>','imgPopup', 200, 200);">
							<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><%=rsWp.get("file_nm",i)%>
						</a>&nbsp;&nbsp;
					<% } %>
					</td>
				<% if(uSesEnt.use_auth.equals("SA")) { %>	
					<td>
						<button type="button" class="btn btn-primary btn-table" onClick="goEdit('<%=rsWp.get("menu_id",i)%>', '<%=rsWp.get("menu_nm",i)%>')">수정</button>
					</td>
				<% } %>
				</tr>
			<% } %>
			</tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="<%=uSesEnt.use_auth.equals("SA")?"5":"4"%>" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% } %>
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
</div>