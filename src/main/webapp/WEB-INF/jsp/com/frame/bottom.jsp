<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%-- <jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" /> --%>
<jsp:useBean id="obox"    class="egovframework.cbiz.Box"          scope="request" />
<%-- <jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" /> --%>

<div class="page-footer" style="padding:0px !important;">
	<div class="f-left" style="padding:15px 20px 0px 10px">
		<select id="ref_site" class="bs-select form-control" style="width: 170px">
			<option value="" selected>::: 관련사이트 바로가기 :::</option>
			<option value="http://www.hometax.go.kr/">국세청 홈택스</option>
			<option value="http://www.molab.go.kr/">고용노동부</option>
			<option value="http://www.molab.go.kr/seoul">&nbsp;&nbsp;&nbsp;&nbsp;서울지방노동청</option>
			<option value="http://www.molab.go.kr/busan">&nbsp;&nbsp;&nbsp;&nbsp;부산지방노동청</option>
			<option value="http://www.molab.go.kr/daegu">&nbsp;&nbsp;&nbsp;&nbsp;대구지방노동청</option>
			<option value="http://www.molab.go.kr/gyeongin">&nbsp;&nbsp;&nbsp;&nbsp;경인지방노동청</option>
			<option value="http://www.molab.go.kr/gwangju">&nbsp;&nbsp;&nbsp;&nbsp;광주지방노동청</option>
			<option value="http://www.molab.go.kr/daejeon">&nbsp;&nbsp;&nbsp;&nbsp;대전지방노동청</option>
			<option value="">-----------------------------</option>
			<option value="http://cafe.daum.net/sanegikum">사내근로복지기금동아리</option>
			<option value="http://cafe.naver.com/sanegikum">사내근로복지기금포럼</option>
		</select>
	
	</div>
	<span class="f11" style="padding-top:15px;display:inline-block;line-height:1.2">
		시스템 문의사항 : (우)10387 경기도 고양시 일산서구 중앙로 1456 (주엽동, 서현프라자) 408호 <br>
		TEL : 031-915-8934&nbsp;&nbsp;FAX : 070-7614-3234&nbsp;&nbsp;E-mail : sinjinitc@gmail.com&nbsp;&nbsp;Copyright (C) 2015 ~ 2019  (주)신진아이티컨설팅 All rights Reserved<br>
	</span>
	<div class="f-right" style="padding-top:10px">
		<% if(!obox.get("logo_file").equals("")) { %>
			<img src="/upload_data/photo/<%=StringUtil.urlEncode(obox.get("logo_file"))%>" width="157" height="36" border="0" alt="<%=obox.get("corp_nm")%>" align="absmiddle">
		<% }else { %>
			<span style="font-family:궁서체; font-weight:bold; font-size:12pt; color:purple"><%=obox.get("corp_nm")%></span>
		<% } %>
	</div>
</div>
