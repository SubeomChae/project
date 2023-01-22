<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"    	class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 공지사항 상세조회  -->
<script language="javascript">
	function goEdit() {
		document.main.action = 'inf01003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("inf01002_delete.do","#main", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					goList();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goList() {
		document.main.action = 'inf01001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="inform_no" 	value="<%=obox.get("inform_no")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">

	<h1 class="page-title">공지사항</h1>
	
	<table class="table table-view table-bordered table-cover mar0">
		<colgroup>
			<col style="width:15%;">
			<col style="width:35%;">
			<col style="width:15%;">
			<col style="width:35%;">
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("inform_head"))%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" class="pad0" style="border:none;">
				<%	request.setAttribute("initContents", obox.get("inform_body"));
						request.setAttribute("contents_fld_nm", "inform_body");
						request.setAttribute("form_name", "main");
// 						request.setAttribute("editor_width", "680");
						request.setAttribute("editor_height", "400");
						request.setAttribute("readonly", "true");
						request.setAttribute("display", "none");
				%>
				<%@ include file="/WEB-INF/jsp/com/daumeditor/incDaumEditor.jsp" %>
<%-- 				<%=StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("inform_body", Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;"))%> --%>
				</td>
			</tr>
		<% if(fileWp.getLength() > 0) { %>	
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
				<% for(int i=0; i < fileWp.getLength(); i++) { %>
					<a href="javascript:fileDownload(document.main,'<%=fileWp.get("file_path",i)%>','<%=fileWp.get("file_nm",i)%>')">
					<img src="/com/img/ico_disk.png"><%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a><br>
				<% } %>
				</td>
			</tr>
		<% } %>
			<tr>
				<th>공지기한</th>
				<td><%=obox.get("due_ymd",Box.DEF_DATE_FMT)%></td>								
				<th>자동알림</th>
				<td><%=obox.get("popup_yn").equals("Y")?"로그인 시 팝업":""%></td>								
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=obox.get("sys_reg_nm")%></td>
				<th>작성일</th>
				<td><%=obox.get("sys_upd_date", Box.DEF_DATETIME_FMT_APM)%></td>
			</tr>
		</tbody>
	</table>
</form>
		
<div class="table-bottom-control">
	<span style="width:100%;">
		<span style="float:right;">
		<% if(uSesEnt.use_auth.equals("SA") || (uSesEnt.use_auth.equals("S") && uSesEnt.corp_cd.equals(obox.get("corp_cd")))) { %>
			<button type="button" class="btn dark" onclick="goEdit();"><img src="/com/img/ico_btn_edit.png">수정</button>
			<button type="button" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
		<% } %>
			<button type="button" class="btn dark" onclick="goList();"><img src="/com/img/ico_btn_list.png">목록</button>
		</span>
	</span>
</div>