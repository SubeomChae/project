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
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta charset="utf-8" />
	<title>ERROR PAGE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="shortcut icon" href="/com/favicon.ico" /> 

	<!-- 공통 -->
	<link href="/com/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
	<link href="/com/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

	<!-- layout & themes -->
	<link href="/com/skin/layout/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
	<link href="/com/skin/layout/css/plugins.css" rel="stylesheet" type="text/css" />
	<link href="/com/skin/layout/css/layout.css" rel="stylesheet" type="text/css" />

	<!-- customizing -->
	<link href="/com/css/default.css" rel="stylesheet" type="text/css" />
	<link href="/com/css/custom.css" rel="stylesheet" type="text/css" />
	<link href="/com/css/error.css" rel="stylesheet" type="text/css" />
	
</head>
<body class="error-page">
	<!-- 로고 시작 -->
	<div class="logo">
		<a><img src="/com/img/img_logo.png" alt="logo"></a>
	</div>
	<!-- 로고 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="content">

		<div class="contentsRow t-center">
			<img src="/com/img/bg_error_img_01.png" alt="에러이미지">
		</div>
		<hr>
		<div class="contentsRow marT40">
			<div class="number font-red"> 404 </div>
			<div class="details">
				<h3>HTTP 404 Error</h3>
				<p>해당 웹페이지를 찾을 수 없습니다.</p>
				<div class="contentsRow t-left marT30">
					<a href="javascript:history.back();"><button type="button" class="btn btn-primary"><img src="/com/img/ico_btn_arrLeft.png" class="marL0"> 이전페이지</button></a>
				</div>
			</div>
		</div>

	</div>
	<!-- 컨텐츠 끝 -->
</body>
</html>