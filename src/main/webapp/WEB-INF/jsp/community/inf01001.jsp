<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 공지사항 목록  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			ajaxReplaceForm("inf01001_list.do", "#main", "#divListData", function() {
				fixTableHeader("MyTable");
			});
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("inf01001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goDetail(inform_no) {
		document.main.action = 'inf01002_select.do?inform_no='+inform_no;
		document.main.target = '_self';
		document.main.submit();
	}

	function goWrite() {
		document.main.action = 'inf01003_edit.do'
		document.main.target = '_self';
		document.main.submit();
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="menu_id" value="<%=box.get("menu_id")%>">
<input type="hidden" name="page_count"	value="">
	
	<h1 class="page-title">공지사항</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<colgroup>
				<col style="width:150px;">
				<col style="width:auto;">
			</colgroup>
			<tr>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:130px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>제목</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>내용</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="form-control" style="width:200px; ime-mode:active;" onkeydown="if(event.keyCode == 13){goSearch(); return false;}">
	  				<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<span class="f-right marR60">
						<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
					</span>
				<% } %>
				</td>
			</tr>
		</tbody>		
	</table>
</form>		    
			
<div id="divListData" class="contentsRow">			
<% } %>				
	<div class="table-top-control">
		<div class="notice-view">
		  	<span style="color:#01a1db;">제목을 클릭</span>하면 공지사항 세부내용을 검색할 수 있습니다.
		</div>
	</div>	
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 175px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>공지기한</th>
				</tr>
			</thead>
			<tbody>
       		<% for(int i=0; i < rsWp.getLength(); i++) { %>
       			<tr> 
					<td><%=rsWp.get("row_num",i)%></td>
					<td class="t-left"><a href="javascript:goDetail('<%=rsWp.get("inform_no",i)%>');"><%=StringUtil.getReplaceSpecialCharacters(rsWp.get("inform_head",i))%></a>
						<%if(DateUtil.dayDiff(rsWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 7) {%> <img src="/com/img/ico_new_s.gif" border="0"><%}%>
					</td>
					<td><%=rsWp.get("sys_reg_date",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("sys_reg_nm",i)%></td>
					<td><%=rsWp.get("inquiry_cnt",i,Box.THOUSAND_COMMA)%></td>
					<td><%=rsWp.get("due_ymd",i,Box.DEF_DATE_FMT)%></td>
				</tr>
			<% } %>
			<% if(rsWp.getLength() == 0) { %>							
					<tr><td colspan="6" align="t-center">등록된 자료가 없습니다.</td></tr>
			<% } %>
			</tbody>		   	  
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>