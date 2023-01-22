<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- ::: 사내근로복지기금 공지사항 :::  -->
<script language="javascript">	
	function onClose() {
		if(document.main.first.checked) {
			setCookie("alert<%=box.get("inform_no")%>", "done1", 1);
		}
		window.close();
	}					
	
	function goDownload(file_no, file_nm, file_path) {
		document.main.file_no.value = file_no;
		document.main.file_path.value = file_path;
		document.main.action='downFile.do?proc=PR_COMTB_FILE01&file_nm='+file_nm;
		document.main.submit();
	}
	
	$(function() {
		$(".page-logo-text").html("공지사항");	
	});
</script>

<form name="main" method="post" class="fType" action="" style="margin:0px">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_path"	value="">
   
	<h2 class="page-title-2depth"><%=StringUtil.getReplaceSpecialCharacters(obox.get("inform_head"))%></h2>
	
	<div class="table-scrollable" style="height:350px; overflow-y:auto">
		<table class="table table-view table-bordered"> 
			<colgroup>
				<col style="width:18%;">
				<col style="width:42%;">
				<col style="width:18%;">
				<col style="width:22%;">
			</colgroup>
			<tbody>
				<tr>
					<th>작성일</th>
					<td class="t-center"><%=obox.get("sys_reg_date", Box.DEF_DATETIME_FMT_APM)%></td>
					<th>작성자</th>
					<td calss="t-center"><%=FormatUtil.nvl2(obox.get("sys_reg_nm"),"관리자")%></td>
				</tr>
				<tr>
					<td colspan="4" valign="top" style="line-height:150%;padding:10 10 10 10"><%=StringUtil.getReplaceSpecialCharacters(obox.get("inform_body"))%>
					<% if(fileWp.getLength() > 0) { %>
						<br><br>	
						<% for(int i=0; i < fileWp.getLength(); i++) { %>
							<a href="javascript:goDownload('<%=fileWp.get("file_no",i)%>','<%=fileWp.get("file_nm",i)%>','<%=fileWp.get("file_path",i)%>')">
							<img src="/com/img/icn_disk.gif" align="absmiddle" border="0"> <%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a><br>
						<% } %>
					<% } %>	
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="cookieArea" style="margin-top:5px; float:right">
		<label class="mt-checkbox mt-checkbox-outline">
			오늘 하루 창 열지 않기 <input type="checkbox" name="first" style="border:none" onClick="javascript:onClose();"><span/>
	    </label>
	</div>
</form>

    