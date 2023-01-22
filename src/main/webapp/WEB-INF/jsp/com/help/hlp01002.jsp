<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 사내근로복지기금종합관리시스템 도움말 -->
<script language="javascript">	
	function go_print() {
		wdt = 700; hgt = 750;
		xPos = Math.ceil((screen.width - wdt) / 2);
		yPos = Math.ceil((screen.height - hgt) / 2);
		window.open("/com/other.do?method=sabokHelp&menu_id=&menu_id=<%=box.get("menu_id")%>&print_yn=Y", "sabokHelpPrint", "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=yes,resizable=no,left="+xPos+",top="+yPos);
	}
	
	function page_init() {
	<% if(!obox.get("file_path").equals("")) { %>
		var imgWidth = document.getElementById('imgExample').width;
		var imgHeight = document.getElementById('imgExample').height;
		var zoomRatio = 575 / imgWidth;
		document.getElementById('imgExample').width  = imgWidth * zoomRatio;
		document.getElementById('imgExample').height = imgHeight * zoomRatio;
	<% } %>	
	<% if(box.get("print_yn").equals("Y")) { %>
		window.print();
		self.close();
	<% }else if(box.get("menu_id").length() > 1 && obox.get("menu_nm").equals("")) { %>
		alert('준비 중입니다.');
		self.close();
	<% } %>	
	}
</script>

<form id="helpForm" name="helpForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id"  value="<%=box.get("menu_id")%>">

	<h1 class="page-title"><%=obox.get("menu_nm")%></h1>
	<div class="table-top-control">
		<span style="width:100%">
			<span style="float:right;">
				<button type="button" class="btn btn-primary btn-table" onclick="goUbiViewer('WEB-INF/jsp/com/help/hlp01001.jrf','!');">미리보기</button>
			</span>
		</span>
	</div>		
	<!-- <%if(!box.get("print_yn").equals("Y")){%><img src="/com/img/btn_map_print.gif" border="0" alt="화면내용인쇄" align="absmiddle" style="cursor:hand" onClick="go_print()"><%}%> -->

		<% if(!box.get("print_yn").equals("Y")) { %>		
			<div>
		<% } %>
				<div class="contentsRow">
					<p class="help-con-lg">
						<%=StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("intro_msg",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;"))%>
					</p>
				</div>
			<% if(!obox.get("file_path").equals("")) { %>
				<h1 class="page-title-2depth">화면예시</h1>
				<tr>
					<td style="padding:5 0 0 15">
						<img id="imgExample" src="/upload_data/userfile/<%=obox.get("file_path")%>" border="0" align="absmiddle">
					</td>
				</tr>
			<% } %>
				
				<h1 class="page-title-2depth">주요 기능 설명</h1>
				<div class="contentsRow">
					<p class="help-con-sm">
						<%=StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("help_content",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;"))%>
					</p>
				</div>
			<% if(!obox.get("etc_remark").equals("")) { %>
				<h1 class="page-title-2depth">그 밖의 참고사항</h1>
				<div class="contentsRow">
					<p class="help-con-sm">
						<%=StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("etc_remark",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;"))%>
					</p>
				</div>
			<% } %>
		<% if(!box.get("print_yn").equals("Y")) { %>	
			</div>
		<% } %>
		</td>
	</tr>
</form>