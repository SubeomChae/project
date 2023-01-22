<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box" class="egovframework.cbiz.Box" scope="request" />
<%@ page errorPage="/com/error.jsp" %>
<%-- <%	Box box = HttpUtility.getBox(request);	%> --%>
<!-- 이미지뷰어 -->
<script language="javascript">	
	function page_init() {
		resizeTo(document.getElementById('img01').width + 60, document.getElementById('img01').height + 60);
    }
	$(function() {
		$(".page-logo-text").html("이미지뷰어");
		imgWdt = $('#img01').width();
		imgHgt = $('#img01').height();
		minWdt = Math.min(imgWdt, 800);
		if(imgWdt > minWdt) {
			$('#img01').width(minWdt);
			$('#img01').height(imgHgt * (minWdt / imgWdt));
		}
		
		resizeTo($('#img01').width() + 80, $('#img01').height() + 150);
	});
</script>

<table width="100%" border="0">
	<tr>
		<td width="100%" class="t-center v-middle" style="padding:5px">
			<img id="img01" src="/upload_data/<%=box.get("imgPath")%>/<%=StringUtil.urlEncode(box.get("file_nm"))%>" alt="<%=box.get("file_nm")%>"></td>
		</td>
	</tr>
</table>

