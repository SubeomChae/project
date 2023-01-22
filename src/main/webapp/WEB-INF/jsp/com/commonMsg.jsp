<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("__alert_type").equals("alertNRedirect") || box.get("__alert_type").equals("Redirect")) { %>
<form id="msgForm" name="msgForm" method="post" action="<%=box.get("__move_url")%>">
<% for(Enumeration e = box.keys() ; e.hasMoreElements() ;) {
	String key = (String)e.nextElement();
	if(key.startsWith("__")) { continue; } %>
	<input type="hidden" name="<%=key%>" value="<%=box.get(key)%>">
<% } %>
</form>
<% } %>
<script>
<% if(box.get("__alert_type").equals("alertNBack")) { %>
	alert("<%=box.get("__alert_msg")%>");
	<%=box.get("__js_scripts")%>
	history.back();
<% }else if(box.get("__alert_type").equals("alertNClose")) { %>
	alert("<%=box.get("__alert_msg")%>");
	<%=box.get("__js_scripts")%>
	this.close();
<% }else if(box.get("__alert_type").equals("alertNRedirect")) { %>
	alert("<%=box.get("__alert_msg")%>");
	<%=box.get("__js_scripts")%>
	document.msgForm.submit();
<% }else if(box.get("__alert_type").equals("Redirect")) { %>
	<%=box.get("__js_scripts")%>
	document.msgForm.submit();
<% }else if(box.get("__alert_type").equals("scriptOnly")) { %>
	<%=box.get("__js_scripts")%>
<% } %>
</script>