<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 마이페이지  -->
<script language="javascript">
	$(function() {
		var gbn = '<%=box.get("gbn")%>';
		if(gbn == 'mesg') {
			$(".nav-item:eq(0) ul li:eq(0) a").find("span").trigger("click");
		}else if(gbn == 'conf') {
			goMyMenu('mesg','CONF');
		}else {
			goMyMenu('user','/user/fd/usrMain.do?biz_id=myPage&popup_yn=Y&menu_id=H20');
		}
	});
	
	function iframeLoading() {
		var pageTitle = $("#ifrm").contents().find(".page-title").text();
		if(pageTitle != '') {
			if($("#page-breadcrumb-frame-title").length == 1) {
				$("#page-breadcrumb-frame-title").html(pageTitle);
			}else {
				if($(".classic-menu-dropdown:last").html() == "") {
					$(".classic-menu-dropdown:last").remove();
				}
				$(".page-breadcrumb").append("<li id='page-breadcrumb-frame-title' class='classic-menu-dropdown' aria-haspopup='true'>"+pageTitle+"</li>");
			}
		}
	}
</script>

<iframe name="ifrm" id="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="800" scrolling="no" onLoad="iframeLoading()"></iframe>
