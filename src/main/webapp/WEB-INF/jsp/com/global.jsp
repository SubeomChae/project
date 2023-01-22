<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<script type="text/javaScript" language="javascript">
	var message = {'total_cnt':0, 'sign_cnt':0, 'conf_cnt':0};
	
	function getNewMessageCnt() {
		return message;	
	}
	
	function start_timer() {
		var total_cnt = 0;
		var sign_cnt = 0;
		var conf_cnt = 0;
		ajaxProcJsonList("PR_COMTB_MESG01_LIST@LIST006", {'param01' : '<%=uSesEnt.user_id%>|<%=uSesEnt.group_cd%>'}, function(rtn) {
			for(var i=0; i < rtn.data.length; i++) {
				if(rtn.data[i].msg_type == 'CONF') { conf_cnt += parseInt(rtn.data[i].cnt); }
				else if(rtn.data[i].msg_type == 'TALK') {}
				else if(rtn.data[i].msg_type == 'QNAS') {}
				else { sign_cnt += parseInt(rtn.data[i].cnt); }
				total_cnt += parseInt(rtn.data[i].cnt);
			}
			message = {'total_cnt':total_cnt, 'sign_cnt':sign_cnt, 'conf_cnt':conf_cnt};
			try {
				if(parent.location.href.indexOf("mainForm.do") > 0) {
					$("span[id='sign_message_cnt']",parent.document).html("결재대기 "+sign_cnt+" 개");
					$("span[id='sign_message_badge']",parent.document).css("display", (sign_cnt > 0 ? "" : "none"));

					$("span[id='conf_message_cnt']",parent.document).html("수신확인 "+conf_cnt+" 개");
					$("span[id='conf_message_badge']",parent.document).css("display", (conf_cnt > 0 ? "" : "none"));

					$("span[id='new_message_cnt']",parent.document).html(total_cnt);
					$("span[id='new_message_badge']",parent.document).css("display", (total_cnt > 0 ? "" : "none"));
				}else {
					parent.mainFrame.setMessageCnt(message);
				}
			}catch(e) {}
		});
		
		// 10분 간격으로 알림메시지 새로고침
		setTimeout("start_timer()", 1000*60*10);
	}
	
	$(function() {
		<%if(uSesEnt.isLogin()){%>start_timer();<%}%>
	});
</script>