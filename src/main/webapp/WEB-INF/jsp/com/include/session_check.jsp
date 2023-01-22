<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="egovframework.cbiz.CD" %>
<%
	egovframework.ubiz.mapper.ent.SesUserEntity uSesEnt = (egovframework.ubiz.mapper.ent.SesUserEntity)session.getAttribute(CD.USER_SES_KEY);
	if (uSesEnt == null) {
%>
<script language=javascript> 
	var open_count = 0;
	var opener_name; 
	try {
		opener_name = opener.name; 
		open_count = 1;
		opener_name = opener.opener.name;
		open_count = 2;
		opener_name = opener.opener.opener.name; 
		open_count = 3;
		opener_name = opener.opener.opener.opener.name;
		open_count = 4;
		opener_name = opener.opener.opener.opener.opener.name; 
		open_count = 5;
	} catch(e) {}

	var parent_count = 0;
	var parent_name; 
	try {
		parent_name = parent;																	
		parent_count = 1;
		parent_name = parent.parent;															
		parent_count = 2;
		parent_name = parent.parent.parent;													
		parent_count = 3;
	} catch(e) {}

	alert('세션이 만료되었습니다.')																
	try {
		if (open_count >= 1) { window.close();}
		if (open_count >= 2) { opener.window.close();} 
		if (open_count >= 3) { opener.opener.window.close();}
		if (open_count >= 4) { opener.opener.opener.window.close();} 
		if (open_count >= 5) { opener.opener.opener.opener.window.close();}

		if (parent_count == 0) {
			if (open_count == 0) { location.href='/com/mainForm.do';}											
			if (open_count == 1) { opener.location.href='/com/mainForm.do';} 
			if (open_count == 2) { opener.opener.location.href='/com/mainForm.do';}
			if (open_count == 3) { opener.opener.opener.location.href='/com/mainForm.do';} 
			if (open_count == 4) { opener.opener.opener.opener.location.href='/com/mainForm.do';}
			if (open_count == 5) { opener.opener.opener.opener.opener.location.href='/com/mainForm.do';} 
		}else if (parent_count == 1) {
			if (open_count == 0) { parent.location.href='/com/mainForm.do';}											
			if (open_count == 1) { opener.parent.location.href='/com/mainForm.do';} 
			if (open_count == 2) { opener.opener.parent.location.href='/com/mainForm.do';}
			if (open_count == 3) { opener.opener.opener.parent.location.href='/com/mainForm.do';} 
			if (open_count == 4) { opener.opener.opener.opener.parent.location.href='/com/mainForm.do';}
			if (open_count == 5) { opener.opener.opener.opener.opener.parent.location.href='/com/mainForm.do';} 
		}else if (parent_count == 2) {
			if (open_count == 0) { parent.parent.location.href='/com/mainForm.do';}											
			if (open_count == 1) { opener.parent.parent.location.href='/com/mainForm.do';} 
			if (open_count == 2) { opener.opener.parent.parent.location.href='/com/mainForm.do';}
			if (open_count == 3) { opener.opener.opener.parent.parent.location.href='/com/mainForm.do';} 
			if (open_count == 4) { opener.opener.opener.opener.parent.parent.location.href='/com/mainForm.do';}
			if (open_count == 5) { opener.opener.opener.opener.opener.parent.parent.location.href='/com/mainForm.do';} 
		}else if (parent_count == 3) {
			if (open_count == 0) { parent.parent.parent.location.href='/com/mainForm.do';}											
			if (open_count == 1) { opener.parent.parent.parent.location.href='/com/mainForm.do';} 
			if (open_count == 2) { opener.opener.parent.parent.parent.location.href='/com/mainForm.do';}
			if (open_count == 3) { opener.opener.opener.parent.parent.parent.location.href='/com/mainForm.do';} 
			if (open_count == 4) { opener.opener.opener.opener.parent.parent.parent.location.href='/com/mainForm.do';}
			if (open_count == 5) { opener.opener.opener.opener.opener.parent.parent.parent.location.href='/com/mainForm.do';} 
		}
	} catch(e) {}
</script>
<%
	}
%>
