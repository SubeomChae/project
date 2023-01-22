<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>                                                                                         
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	String default_page = StringUtil.decodeURL(box.get("default_page"));
	if(box.get("menu_id").equals("") && default_page.equals("")) { default_page = "/com/rightFrame.do"; }
	if(!uSesEnt.isLogin()) { default_page = "about:blank"; }
%>
<html>
<head>
<title>::: 사내근로복지기금관리시스템 :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script language="JavaScript" type="text/JavaScript">
	var FrameModel = ''; var setIndex = '';
	function getCurrentSetting() {
		if(document.body)
		return (document.body.cols)? document.body.cols : document.body.rows;
	}

	function setframevalue(coltype, settingvalue) {
		if(coltype=="rows") {
			document.body.rows=settingvalue;
		}else if(coltype=="cols") {
			document.body.cols=settingvalue;
		}
	}

	function FrameChange(contractsetting) {
		if(getCurrentSetting()!=setIndex) {
			setframevalue(FrameModel, setIndex);
		}else {
			setframevalue(FrameModel, contractsetting);
		}
	}
	
	function subframe_init() {
		if(!document.all && !document.getElementById) return
		if(document.body!=null){
			FrameModel=(document.body.cols)? "cols" : "rows";
			setIndex=(document.body.cols)? document.body.cols : document.body.rows;
		}else {
			setTimeout("subframe_init()",100);
		}
	}
	setTimeout("subframe_init()",100);
</script>
<frameset rows="70,*" frameborder="no" border="0" framespacing="0">
	<frame src="/com/topFrame.do?menu_id=<%=box.get("menu_id")%>" name="topFrame" frameborder="0" scrolling="no" noresize>
	<frameset cols="10,*" frameborder="no" border="0" framespacing="0" >
		<frame src="about:blank" name="dummy" frameborder="0" scrolling="no">
		<frame src="<%=default_page%>" name="rightFrame" frameborder="0" noresize scrolling="no">
	</frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>