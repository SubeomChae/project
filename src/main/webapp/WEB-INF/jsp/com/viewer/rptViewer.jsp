<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="wsfw.lib.util.*,
				 wsfw.lib.CD,
				 java.util.*" %>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"		class="wsfw.lib.util.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="wsfw.biz.com.SesUserEntity" scope="session" />
<html>
<head>
<title>인쇄 미리보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<script language="javascript">
</script>
<style type="text/css">html{overflow:hidden;}</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	<tr>
		<td style="padding:5 5 5 5">
			<iframe id="rptBody" name="rptBody" marginwidth="0" src="/upload_data/report/<%=box.get("report_id")%>.pdf" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>	
		</td>
	</tr>
</table>		
</body>
</html>