<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="/WEB-INF/functions" prefix="f" %>
<script language="javascript">
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

    try {
        if (open_count >= 1) { window.close();}
        if (open_count >= 2) { opener.window.close();} 
        if (open_count >= 3) { opener.opener.window.close();}
        if (open_count >= 4) { opener.opener.opener.window.close();} 
        if (open_count >= 5) { opener.opener.opener.opener.window.close();}

        alert("로그인 정보가 유효하지 않습니다. \n\n다시 로그인하여 주십시오.");
        theURL = "/com/mainForm.do";

        if (parent_count <= 0) {
            if (open_count == 0) { location.href=theURL;}                                                   
            if (open_count == 1) { opener.location.href=theURL;} 
            if (open_count == 2) { opener.opener.location.href=theURL;}
            if (open_count == 3) { opener.opener.opener.location.href=theURL;} 
            if (open_count == 4) { opener.opener.opener.opener.location.href=theURL;}
            if (open_count == 5) { opener.opener.opener.opener.opener.location.href=theURL;} 
        }else if (parent_count == 1) {
            if (open_count == 0) { parent.location.href=theURL;}                                                    
            if (open_count == 1) { opener.parent.location.href=theURL;} 
            if (open_count == 2) { opener.opener.parent.location.href=theURL;}
            if (open_count == 3) { opener.opener.opener.parent.location.href=theURL;} 
            if (open_count == 4) { opener.opener.opener.opener.parent.location.href=theURL;}
            if (open_count == 5) { opener.opener.opener.opener.opener.parent.location.href=theURL;} 
        }else if (parent_count == 2) {
            if (open_count == 0) { parent.parent.location.href=theURL;}                                                 
            if (open_count == 1) { opener.parent.parent.location.href=theURL;} 
            if (open_count == 2) { opener.opener.parent.parent.location.href=theURL;}
            if (open_count == 3) { opener.opener.opener.parent.parent.location.href=theURL;} 
            if (open_count == 4) { opener.opener.opener.opener.parent.parent.location.href=theURL;}
            if (open_count == 5) { opener.opener.opener.opener.opener.parent.parent.location.href=theURL;} 
        }else if (parent_count == 3) {
            if (open_count == 0) { parent.parent.parent.location.href=theURL;}                                                  
            if (open_count == 1) { opener.parent.parent.parent.location.href=theURL;} 
            if (open_count == 2) { opener.opener.parent.parent.parent.location.href=theURL;}
            if (open_count == 3) { opener.opener.opener.parent.parent.parent.location.href=theURL;} 
            if (open_count == 4) { opener.opener.opener.opener.parent.parent.parent.location.href=theURL;}
            if (open_count == 5) { opener.opener.opener.opener.opener.parent.parent.parent.location.href=theURL;} 
        }
    } catch(e) {}
</script>
