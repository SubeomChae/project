<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<jsp:useBean id="box"	  	class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="menuWp"  	class="egovframework.cbiz.RsWrapper"    scope="session" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity"   scope="session" />
<% if(!box.get("ajax_yn").equals("Y")) { %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>::: 사내근로복지기금 :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="/com/favicon.ico" />
<%@ include file="/WEB-INF/jsp/com/include/inc.jsp" %>
<script language='javascript'>
	function goMenu(menu_id, default_page) {
		if(default_page == '') { return; }
		
		ajaxProcJsonUpdate("PR_SYSTB_SLOG05@INSERT", {'menu_id':menu_id, 'user_id':'<%=uSesEnt.isLogin() ? uSesEnt.user_id : "GUEST"%>'});
		
		if(!menuPopupChk(default_page)) {
			document.menu.menu_id.value = menu_id;
			if(isSecurityPage(default_page)) { default_page = '<%=CustomProperty.ssl_domain%>' + default_page; }
			document.menu.action = default_page;
			document.menu.target = '_self'; 
			document.menu.submit();
		}
	}
	
	$(function() {
		var isMenuFound = false;
		$(".classic-menu-dropdown").each(function() {
			if($(this).text().replace(/ /g,"") == $(".page-title").text().replace(/ /g,"")) { 
				isMenuFound = true; 
				return false; 
			}
		});
		if(!isMenuFound) { $(".page-breadcrumb").append("<li class='classic-menu-dropdown' aria-haspopup='true'>"+$(".page-title").text()+"</li>"); }
		var method_nm = getMethodFromUrl(location.href).substring(0,8);
		if("usr01004,usr01005,usr01006,usr01007".indexOf(method_nm) >= 0) { hideLeftFrame(); }
		try {
			var parentUrl = $(parent.location).attr('href');
			if(parentUrl.indexOf('mainFrame.do') > 0) {
				try { setMessageCnt(parent.dummyFrame.getNewMessageCnt()); }catch(e) {}
			}
		}catch(e) {}
	});
</script>	
</head>

<body class="page-content-white page-front  /*page-full-screen*/">
	<div class="page-wrapper">
		<!-- 상단메뉴 -->
		<div class="page-container">
			<div class="page-content-wrapper">
				<div class="page-content">
					<!-- 컨텐츠 -->
					<div class="contentWrapper" id="divRightFrame" style="padding:10px 0 0 1px">
						<decorator:body />
					</div>					
				</div>
			</div>
		</div>
		<!-- footer -->
	</div>
	
	<div class="modal fade ui-draggable" id="dialog-form" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false" data-backdrop="static">

	</div>

</body>
</html>
<% }else { %>
	<decorator:body />
<% } %>