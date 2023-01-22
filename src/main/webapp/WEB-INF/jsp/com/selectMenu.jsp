<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 메뉴를 선택하세요 -->
<script language="javascript">
</script>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id" value="<%=box.get("menu_id")%>">
<div class="contentsRow marT50" style="padding-left:350px">
	<img src="/com/img/select_menu.gif">
</div>
</form>