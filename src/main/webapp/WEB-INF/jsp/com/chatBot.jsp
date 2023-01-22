<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- chatbot -->
<script src="/com/js/chatbot/chatbotModule.min.js" type="text/javascript"></script>
<script src="/com/plugins/CryptoJS-v3.1.2/hmac-sha256.js" type="text/javascript"></script>
<script src="/com/plugins/CryptoJS-v3.1.2/enc-base64-min.js" type="text/javascript"></script>
<script type="text/javaScript" language="javascript">
<%
	String user_ip = uSesEnt.login_ip;
	if(StringUtils.isEmpty(user_ip)) {
		String X_FORWARDED_FOR = request.getHeader("X-FORWARDED-FOR");
		user_ip = StringUtils.isEmpty(X_FORWARDED_FOR) ? request.getRemoteAddr() : X_FORWARDED_FOR;
	}
%>

$(document).ready(function(){
	var that = this;
	chatbotModule.init({
		"sendMessage" : "#sendMessage",
		"chatbox" : "#chatbox",
		"sendForm" : "#sendChatForm",
		"user_id":'<%=uSesEnt.user_id%>',
		"user_ip":'<%=user_ip%>',
		"crypto_function" : CryptoJS.HmacSHA256,
		"encode_function" : CryptoJS.enc.Base64.stringify,
		"encode_context" : CryptoJS.enc.Base64
	});
});
</script>

<nav class="quick-nav">
	<a class="quick-nav-trigger tooltips" href="#0" data-container="body" data-placement="top" data-original-title="더블클릭">
		<span aria-hidden="true"></span>
	</a>
	<div class="quick-nav-title">
		FMS 봇
	</div>
	<!-- 쳇봇 시작 -->
	<form name="sendChatForm" id="sendChatForm" method="post" onsubmit="return false;">
		<div class="portlet light bordered portlet-chat">
			<div class="portlet-body">
				<div class="scroller" style="height: calc(100vh - 500px);" data-always-visible="1" data-rail-visible1="1">
					<ul class="chats" id="chatbox">
					</ul>
				</div>
				<div class="chat-form">
					<div class="input-cont">
						<input id="sendMessage" name="sendMessage" class="form-control" type="text" placeholder="질문을 입력해주세요."> </div>
					<div class="btn-cont">
						<a href="javascript:;" class="btn blue icn-only">
							<i class="fa fa-check icon-white"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</form>	
	<!-- 쳇봇 끝 -->
	<span aria-hidden="true" class="quick-nav-bg"></span>
</nav>
<script src="/com/js/quick-sidebar.js" type="text/javascript"></script>
