<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"                        scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity"   scope="session" />

<% if(!box.get("ajax_yn").equals("Y")) { %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta charset="utf-8" />
<title>::: 사내근로복지기금 :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="/com/favicon.ico" />
<%@ include file="/WEB-INF/jsp/com/include/inc.jsp" %>
<link href="/com/css/child_window.css" rel="stylesheet" type="text/css" />
<script language='javascript'>
	$(function() {
		if($(".page-title").length) {
			$(".page-logo-text").html($(".page-title").text());	
			$(".page-title").hide();
		}
	});
</script>
</head>
<body class="page-content-white page-child page-window-popup">
	<div class="page-wrapper">
		<div class="page-header navbar navbar-fixed-top">
			<div class="page-header-inner">
				<div class="page-logo">
					<span class="page-logo-text">팝업타이틀</span>
				</div>
			</div>
		</div>
		
		<div class="clearfix"> </div>
			
		<div class="page-container">
			<div class="page-content-wrapper">
				<div class="page-content">
					<!-- 컨텐츠  -->
					<div class="contentWrapper">
		
						<decorator:body />
		
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="dialog-form" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false" data-backdrop="static">

	</div>
	
</body>
</html>
<% }else { %>
    <decorator:body />
<% } %>