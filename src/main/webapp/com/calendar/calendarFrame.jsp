<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>달력</title>
<link href="./css/calendar.css" rel="stylesheet" type="text/css">
<meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
<script language="javascript">
	function setValue(yyyymmdd) {
		if(yyyymmdd != "") {
			window.returnValue = yyyymmdd;
			window.close();
		}
	}
</script>
</head>
<frameset border="0" frameborder="no">
	<frame src="calendarMain.jsp" marginwidth="0" marginheight="0" scrolling="no" noresize>
</frameset>
</html>

