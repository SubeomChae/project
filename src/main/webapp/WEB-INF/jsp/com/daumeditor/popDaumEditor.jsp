<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/functions" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::: 사내근로복지기금 :::</title>
<link rel="stylesheet" href="/com/plugins/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<%@ include file="/WEB-INF/jsp/com/js_inc.jsp" %>
<script src="/com/plugins/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function goSave() {
		opener.setHtmlData('${param.fldNm }', Editor.getContent());
		window.close();
	}
	function goClose() {
		if(confirm('창을 닫으시겠습니까?')) {
			window.close();
		}
	}
</script>
</head>
<body rightmargin="0" topmargin="0" leftmargin="0"> 
<div id="popupwrap2">
	<div class="topnav"><h1>HTML Editor로 작성하기 </h1></div>
	<div class="popcont">
		<form id="main" name="main" method="post" action="popDaumEditor.jsp">
						<c:set var="initContents" value="openerscript" />
						<c:set var="contentsFldNm" value="${param.fldNm }" />
						<c:set var="formName" value="main" />
						<c:set var="editorSize" value="900" />
						<c:set var="divWidth" value="950" />
						<%@ include file="../com/plugins/daumeditor/incDaumEditor.jsp" %>
			<br/>
			<p style="text-align:center"><a href="javascript:goSave();"><img src="${pageContext.request.contextPath}/home/images/btn_confirm2.gif" alt="확인" /></a>
		<a href="javascript:goClose();"><img src="${pageContext.request.contextPath}/home/images/btn_close.gif" alt="닫기" /></a></p>
		</form>
	</div>
</div>
</body>
</html>