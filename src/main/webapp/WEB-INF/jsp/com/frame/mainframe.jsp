<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<html>
<title>::: 사내근로복지기금관리시스템 :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<script language="javascript">
	function resizing_frame() {
		var dummy_wdt = Math.max(document.body.clientWidth - 1600, 0) / 2;
		document.body.cols = dummy_wdt + ',*,' + dummy_wdt;
	}
	
	function mainframe_init() {
		if(!document.all && !document.getElementById) { return; }
		if(document.body!=null) {
			resizing_frame();
		}else {
			setTimeout("mainframe_init()",100);
		}
	}
	setTimeout("mainframe_init()",100);
</script>
<script for=window event="onresize" language="JScript">resizing_frame();</script>
<frameset cols="0,*,0" frameborder="no" border="0" framespacing="0">
	<frame src="/com/redirect.do?reqUrl=/com/frame/dummy" name="dummyLeft" frameborder="0" scrolling="no">
	<frameset cols="236,*" frameborder="no" border="0" framespacing="0">
		<frame src="/com/leftFrame.do?menu_id=<%=box.get("menu_id")%>" name="leftFrame" frameborder="0" scrolling="no" noresize>
		<frameset rows="*,<%=box.get("frame_yn").equals("Y")?"0":"0"%>" frameborder="no" border="0" framespacing="0">
			<frame src="/com/subFrame.do?menu_id=<%=box.get("menu_id")%>&default_page=<%=StringUtil.encodeURL(box.get("default_page"))%>" name="middleFrame" frameborder="0" scrolling="no">
			<frame src="/com/bottomFrame.do" name="bottomFrame" frameborder="0" scrolling="no" noresize>		
		</frameset>
	</frameset>
	<frame src="/com/redirect.do?reqUrl=/com/frame/dummy" name="dummyRight" frameborder="0" scrolling="no">
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>

	
	
