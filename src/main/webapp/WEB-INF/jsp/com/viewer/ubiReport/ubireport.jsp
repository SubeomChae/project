<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<%@page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<%  String report_id = box.get("report_id");
	String params    = box.get("params"); %>
<!--[if IE]><script src='./js/ubiexcanvas.js'></script><![endif]-->
<script src='/com/viewer/ubiReport/js/ubihtml.js'></script>
<script language='javascript'>
<!--
	/* 기본 정보 */
	var protocol = self.location.protocol;							// 요청 Protocol
	var host = self.location.host;									// ip:port
	var app = "";												// Web Application 명
	var url = protocol + "//" + host + (app==""?"":("/" + app));	// Web Application URL
	
	var htmlViewer = null;

/* 뷰어 Param 정보 */ var pKey = '<%=session.getId()%>'; var pServerUrl = url + '/UbiServer'; var pTimeout = '600000'; var pResId = 'UBIHTML'; var pResUrl = url + '/com/viewer/ubiReport/js/'; var pToolbar = 'true'; var pScale = '-9999'; var pDivId = 'UbiHTMLViewer'; var pIsStreaming = 'true'; var pScrollpage = 'true';

	var pJrf = '<%=report_id%>';
	var pArg = 'P_DBO#<%=box.get("dbo")%>#<%=StringUtil.replace(params,"!","#")%>';
	var wGap = 10;	// 가로 크기 조정.
	var hGap = 10;	// 세로 크기 조정.
	// 미리보기
	function UbiLoadReport() {
		var w = ((self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth)) - wGap;
		var h = ((self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight)) - hGap;
		document.getElementById(pDivId).style.width = w + "px";
		document.getElementById(pDivId).style.height = h + "px";

		htmlViewer = new UbiViewer( {

			key : pKey,
			ubiserverurl : pServerUrl,
			timeout : pTimeout,
			resid : pResId,
			resource : pResUrl,
			toolbar : pToolbar,
			scale : pScale,
			divid : pDivId,
			isStreaming : pIsStreaming,
			scrollpage : pScrollpage,

			jrffile : pJrf,
			arg : pArg
		});
		htmlViewer.showReport();
	}

	// 브라우저 리사이즈 처리
	function UbiResize() {

		var w = ((self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth)) - wGap;
		var h = ((self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight)) - hGap;
		document.getElementById(pDivId).style.width = w + "px";
		document.getElementById(pDivId).style.height = h + "px";
	}
	
	$(function() {
		UbiLoadReport()
	});
//-->
</script>
	<div id="UbiHTMLViewer" onresize='UbiResize()' style='border:solid 1px #808080;'></div>
