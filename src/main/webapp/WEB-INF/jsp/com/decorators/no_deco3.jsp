<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"                        scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity"   scope="session" />

<% if(!box.get("ajax_yn").equals("Y")) { %>
<html lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>::: 사내근로복지기금 :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<style>
	body, td, button {
		color:#123456;
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		line-height:1.5;
		letter-spacing:0px;
	}
	
	.tblHead {
		border-collapse: collapse;
		border: 1px solid black;
		width:630px;
	}
	
	.tblHead tr {
		height:25px;
	}
	
	.tblHead th {
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		text-align:center;
		vertical-align:middle;
		background-color:#efefef;
		border: 1px solid black;
	}
	
	.tleft {
		text-align:left !important;
		padding-left:2pt;
	}
	
	.tblHead td {
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		text-align:center;
		vertical-align:middle;
		border: 1px solid black;
	}
	
	#divHtml table {
		white-space:normal
	}
	
	#divHtml p {
		margin: 0px;
		padding: 0px;
		word-break:break-all;
	}
	
	#divCont {
		width:620px;
		margin-top:20px;
		padding:5px;
		min-height:100px;
		border: 1px solid black;
	}
	
	#pDocTitle {
		font-size:22pt;
		font-weight:bold;
		width:630px;
		text-align:center;
	}
</style>
</head>
<body>
	<decorator:body />
</body>
</html>
<% }else { %>
    <decorator:body />
<% } %>