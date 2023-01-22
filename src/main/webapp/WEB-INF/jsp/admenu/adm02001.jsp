<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 공통코드  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.main.page_count.value = '';
		ajaxReplaceForm("adm02001_list.do", "#main", "#divListData", function() {
			var code_group = $("tr[id='tr_0']").attr("code_group");
			if(code_group != undefined) { goEdit(code_group); }
			fixTableHeader("MyTable");
		});
	}

	function goEdit(code_group) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(code_group != '') { $("tr[code_group='"+code_group+"']").addClass("bg-yellow"); }
		var pageUrl = 'adm02002_edit.do?code_group='+code_group;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}
	
	$(function() {
		<% if(box.get("code_group").equals("")) {  %>
			goEdit('');
		<% }else { %>
		<% for(int i=0; i < rsWp.getLength(); i++) { %> 
			<% if(rsWp.get("code_group",i).equals(box.get("code_group"))) { %>
				$("tr[code_group='"+code_group+"']").addClass("bg-yellow");
				goEdit('<%=box.get("code_group")%>');
	 		<% } %>
		<% } %>
	<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="selectedRow" value="">
	 
	 <h1 class="page-title">공통코드</h1>
	 
	 <table class="search-panel table table-bordered">
	 	<tbody>
	 		<tr>
	 			<td>
	 				<select name="search_key" class="bs-select form-control" style="width:100px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>코드</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>명칭</option>
					</select>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
		  			<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
		  		<% if(uSesEnt.use_auth.equals("SA")) { %>
					<button type="button" class="btn dark f-right marR60" onClick="goEdit('');"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
				<% } %>
	 			</td>
	 		</tr>
	 	</tbody>
	 </table>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0" >
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 121px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:30px">
						<col style="width:110px">
						<col style="width:160px">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>코드</th>
							<th>명칭</th>
						</tr>
					</thead>
					<tbody>
					<% for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" code_group="<%=rsWp.get("code_group",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("code_group",i)%>')"> 
							<td><%=String.valueOf(i+1)%></td>
							<td class="t-left"><%=rsWp.get("code_group",i)%></td>
							<td class="t-left"><%if(rsWp.get("edit_flag",i).equals("X")){%><font color=red>(회사별)</font> <%}%><%=rsWp.get("group_nm",i)%></td>
						</tr>	
					<% } %>
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>			
</div>