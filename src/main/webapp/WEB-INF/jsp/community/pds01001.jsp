<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String law_id = box.get("tab_index").equals("2")?"00001":"00002";%>
<!-- 자료실(관련법령, 각종서식, 시스템사용법, 소프트웨어,기타) -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			ajaxReplaceForm("pds01001_list.do", "#main", "#divListData", function(){
				fixTableHeader("MyTable");
			});
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("pds01001_list.do", "#main", "#divListData", function(){
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goTabpage(tab_index, file_category) {
		document.main.tab_index.value = tab_index;
		document.main.file_category.value = file_category;
		goSearch();
	}
	
	function goWrite() {
		if (document.main.tab_index.value == '2'){
			popupOpen('/community/pd/law02003_write.do?law_id=00001', "law02002" , 600, 400);
		}else if (document.main.tab_index.value == '3'){
			popupOpen('/community/pd/law02003_write.do?law_id=00002',"law02002", 600, 400);	
		} else {
			popupOpen('/community/pd/pds01002_edit.do',"pds01002", 600, 400);	
		}
	}

	function goEdit(file_no) {
		popupOpen('/community/pd/pds01002_edit.do?file_no='+file_no,"pds01002" , 600, 400);
	}

	function goDelete(file_no, file_path) {
		if (confirm('삭제하시겠습니까?')) {
			document.main.file_no.value = file_no;
			document.main.file_path.value = file_path;
			document.main.action = 'pds01001_delete.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}

	function goDownload(file_no, file_nm, file_path) {
		document.main.file_no.value = file_no;
		document.main.file_nm.value = file_nm;
		document.main.file_path.value = file_path;
		document.main.action = 'downFile.do?proc=PR_COMTB_DATA01';
		document.main.submit();
	}
	
	$(function() {
		goTabpage('1','01');
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="tab_index" 		value="<%=box.get("tab_index")%>">
<input type="hidden" name="file_category" 	value="<%=box.get("file_category")%>">
<input type="hidden" name="pathKey"			value="community">
<input type="hidden" name="file_no"			value="">
<input type="hidden" name="file_nm"			value="">
<input type="hidden" name="file_path"		value="">
<input type="hidden" name="page_count"		value="">

	<h1 class="page-title">자료실</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:100px;">
			<col style="width:auto;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>파일명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>파일설명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="bs-select form-control" style="width:200px;ime-mode:active;" onkeydown="if(event.keyCode == 13) { goSearch(); return false; }">
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
	<ul id="pdsTabMenu" class="nav nav-tabs">
		<li id="tabMenu1" onClick="goTabpage('1','01')" <%if(box.get("tab_index").equals("1")){%>class="active"<%}%>><a data-toggle="tab">관련법령</a></li>
		<li id="tabMenu2" onClick="goTabpage('2','07')" <%if(box.get("tab_index").equals("2")){%>class="active"<%}%>><a data-toggle="tab">정관</a></li>
		<li id="tabMenu3" onClick="goTabpage('3','08')" <%if(box.get("tab_index").equals("3")){%>class="active"<%}%>><a data-toggle="tab">운영규정</a></li>
		<li id="tabMenu4" onClick="goTabpage('4','02')" <%if(box.get("tab_index").equals("4")){%>class="active"<%}%>><a data-toggle="tab">각종서식</a></li>
		<li id="tabMenu5" onClick="goTabpage('5','03')" <%if(box.get("tab_index").equals("5")){%>class="active"<%}%>><a data-toggle="tab">시스템사용법</a></li>
		<li id="tabMenu6" onClick="goTabpage('6','04')" <%if(box.get("tab_index").equals("6")){%>class="active"<%}%>><a data-toggle="tab">소프트웨어</a></li>
		<li id="tabMenu7" onClick="goTabpage('7','09')" <%if(box.get("tab_index").equals("7")){%>class="active"<%}%>><a data-toggle="tab">기타</a></li>
	</ul>
	<% if("2,3".indexOf(box.get("tab_index")) < 0) { %>	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 190px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:5%">
				<col style="width:27%">
				<col style="width:*;">
				<col style="width:9%">
				<col style="width:9%">
				<col style="width:9%">
				<col style="width:7%">
				<col style="width:4%">
				<col style="width:4%">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>파일명</th>
					<th>파일설명</th>
					<th>크기(Byte)</th>
					<th>등록자 </th>
					<th>등록일</th>
					<th>다운로드</th>
					<% if(uSesEnt.use_auth.startsWith("S")) { %>
						<th>수정</th>
						<th>삭제</th>
					<% } %>
         		</tr>
			</thead>
			<tbody>
		 	<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=rsWp.get("row_num",i)%></td>
					<td class="t-left"><a href="javascript:fileDownload(document.main,'<%=rsWp.get("file_path",i)%>','<%=rsWp.get("file_nm",i)%>')"><%=rsWp.get("file_nm",i)%></a></td>
					<td class="t-left"><%=rsWp.get("file_desc",i)%></td>
					<td class="t-right"><%=rsWp.get("file_size",i, Box.THOUSAND_COMMA)%></td>
					<td><%=rsWp.get("sys_reg_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("sys_reg_date",i, Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.getInt("download_cnt",i)%></td>
					<% if(uSesEnt.use_auth.startsWith("S")) { %>
						<td class="t-center"><%if(uSesEnt.use_auth.equals("SA") || (uSesEnt.use_auth.startsWith("S") && uSesEnt.corp_cd.equals(rsWp.get("corp_cd",i)))){%><button type="button" class="btn btn-primary btn-table" onClick="goEdit('<%=rsWp.get("file_no",i)%>');">수정</button><%}%></td>
						<td class="t-center"><%if(uSesEnt.use_auth.equals("SA") || (uSesEnt.use_auth.startsWith("S") && uSesEnt.corp_cd.equals(rsWp.get("corp_cd",i)))){%><button type="button" class="btn btn-primary btn-table" onClick="goDelete('<%=rsWp.get("file_no",i)%>','<%=rsWp.get("file_path",i)%>');">삭제</button><%}%></td>
					<% } %>
				</tr>	
			<% } %>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="9" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% } %>
			</tbody>
		</table>
		<% } %>
	</div>
	
	<% if("2,3".indexOf(box.get("tab_index")) < 0) { %>
		<%=PageUtil.makePaging(box, rsWp, 30, 5, "", request)%>
	<% } %>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
<% if(box.get("tab_index").equals("2")) { %>
	<iframe id="ifrm" name="ifrm" src="law02001_list.do?law_id=<%=law_id%>" marginwidth="0"  frameborder="0" width="100%" height="800" scrolling="no"></iframe>
<% } else if(box.get("tab_index").equals("3")) { %>
	<iframe id="ifrm" name="ifrm" src="law02001_list.do?law_id=<%=law_id%>" marginwidth="0" frameborder="0" width="100%" height="800" scrolling="no"></iframe>
<% } %>