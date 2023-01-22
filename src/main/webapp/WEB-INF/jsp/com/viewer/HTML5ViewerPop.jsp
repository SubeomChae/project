<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String report_head = new String(request.getParameter("report_head").getBytes("8859_1"), "UTF-8");
	String report_id   = new String(request.getParameter("report_id").getBytes("8859_1"), "UTF-8");
	String param       = new String(request.getParameter("param").getBytes("8859_1"), "UTF-8");
	
//	String svr_domain = request.getRequestURL().toString();
//	int startPos = svr_domain.indexOf("http://");
//	int endPos = svr_domain.indexOf("/", startPos+7);
//	svr_domain = svr_domain.substring(startPos, endPos);
//	String cxServer = svr_domain.substring(startPos+7);
	String svr_domain = request.getParameter("svr_domain");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/com/viewer/html5/js/jquery-1.11.0.min.js"></script>
<script src="/com/viewer/html5/js/crownix-viewer.min.js"></script>
<link rel="stylesheet" type="text/css" href="/com/viewer/html5/css/crownix-viewer.min.css">
</head>
<body style="margin:0;height:100%">
<div id="crownix-viewer" style="position:absolute;width:100%;height:100%;"></div>
<script>
	window.onload = function() {
		var viewer = new m2soft.crownix.Viewer('<%=svr_domain%>/ReportingServer/service', 'crownix-viewer');
		viewer.openFile("<%=svr_domain%><%=report_id%>","<%=param%>",{timeout:1800});
	};
</script>
<form name="fmsForm" action="/ReportingServer/invoker_fms_statistics.jsp">
<input type="hidden" name="mrd_param" value="<%=param%>">
</form>
</body>
</html>
