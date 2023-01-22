<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="fileWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템문의사항 상세조회 -->
<script language="javascript">
	function goEdit() {
		if (formValidate("#main")) {
			document.main.action = 'boa01003_edit.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goAnswer() {
		document.main.action = 'boa01004_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete() {
		if (formValidate("#main")) {
			if (confirm('삭제하시겠습니까?')) {
				document.main.action = 'boa01002_delete.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}
	
	function goList() {
		document.main.action = 'boa01001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="board_no" 	value="<%=obox.get("board_no")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">

	<h1 class="page-title">시스템문의사항</h1>
	
	<table class="table table-view table-bordered table-cover mar0">
		<colgroup>
			<col style="width:15%;">
			<col style="width:50%;">
			<col style="width:15%;">
			<col style="width:25%;">
		</colgroup>
		<tbody>
			<tr> 
				<th>질문제목</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("req_head"))%></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td colspan="3" class="pad0" style="border:none;">
						<%	request.setAttribute("initContents", obox.get("req_body"));
							request.setAttribute("contents_fld_nm", "req_body");
							request.setAttribute("form_name", "main");
							//request.setAttribute("editor_width", "680");
							request.setAttribute("editor_height", "200");
							request.setAttribute("readonly", "true");
							request.setAttribute("display", "none");
						%>
						<%@ include file="/WEB-INF/jsp/com/daumeditor/incDaumEditor.jsp" %>
				</td>
			</tr>
		<% if(fileWp.getLength() > 0) { %>	
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
				<% for(int i=0; i < fileWp.getLength(); i++) { %>
					<a href="javascript:fileDownload(document.main,'<%=fileWp.get("file_path",i)%>','<%=fileWp.get("file_nm",i)%>')">
					<img src="/com/img/ico_disk.png"> <%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a><br>
				<% } %>
				</td>
			</tr>
		<% } %>													
			</tr>
			<tr>
				<th>질문자</th>
				<td><b><a href="javascript:goEmployeePop('<%=obox.get("req_empl_no")%>')"><%=obox.get("req_empl_nm")%><%if(!obox.get("req_email_id").equals("")){ %>(<%=obox.get("req_email_id")%>)<%}%></b></a></td>
				<th>질문일</th>
				<td><%=obox.get("req_ymd", Box.DEF_DATE_FMT)%></td>
			</tr>
		</tbody>
	</table>
	
	<div class="table-bottom-control marB10">
		<span style="width:100%;">
			<span style="float:right;">
			<% if(obox.get("ans_ymd").equals("")) { %>
				<% if(uSesEnt.empl_no.equals(obox.get("req_empl_no"))) { %>
					<button type="button" id="btnModify" class="btn dark" onClick="goEdit();"><img src="/com/img/ico_btn_edit.png">수정</button>
					<button type="button" id="btnDelete" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
				<% } %>
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<button type="button" id="btnAnswer" class="btn dark" onClick="goAnswer();"><img src="/com/img/ico_btn_reply.png">답변</button>
				<% } %>
			<% } %>
				<button type="button" id="btnList" class="btn dark" onClick="goList();"><img src="/com/img/ico_btn_list.png">목록</button>
			</span>
		</span>
	</div>
	
<% if(box.get("search_flag").equals("ans")) { %>
	<table class="table table-view table-bordered table-hover table-cover mar0">
		<colgroup>
			<col style="width:15%;">
			<col style="width:40%;">
			<col style="width:15%;">
			<col style="width:25%;">
		</colgroup>
		<tbody>
			<tr> 
				<th>답변제목</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("ans_head"))%></td>
			</tr>
			<tr height="100">
				<th>답변내용</th>
				<td colspan="3" valign="top"><%=StringUtil.getReplaceSpecialCharacters(obox.get("ans_body", Box.MULTILINE_TEXT))%></td>													
			</tr>
			<tr>
				<th>답변자</th>
				<td><%=obox.get("ans_empl_nm")%></td>
				<th>답변일</th>
				<td><%=obox.get("ans_ymd", Box.DEF_DATE_FMT)%></td>
			</tr>
		</tbody>
	</table>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
		<% if(uSesEnt.use_auth.startsWith("S")) { %>
			<button type="button" id="btnAnswerModify" class="btn dark" onClick="goAnswer();"><img src="/com/img/ico_btn_edit.png">답변수정</button>
		<% } %>
			</span>
		</span>
	</div>
<% } %>
</form>