<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 일정 등록 -->
<script language='javascript'>
	function goSearch(gbn) {
		var pageUrl = 'dia11002_select.do';
		removeMask("#main");				
		document.main.action = pageUrl;
		document.main.target = '_self';
		document.main.submit();
	}
	function goEdit() {
		removeMask("#main");
	    document.main.action = "dia11003_edit.do";
	    document.main.target = "_self";
	    document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
		    document.main.action = "dia11002_delete.do";
		    document.main.target = "_parent";
		    document.main.submit();
		}
	}
	
	function goTabpage(tab_index) {
		document.main.tab_index.value = tab_index;
		for(var i=0; i <= 1; i++) {
			document.getElementById('tabImage'+i).style.backgroundImage = 'url(/com/img/bg_tab120_' + (tab_index == i ? 'on' : 'off') + '.gif)';
		}
		var pageUrl = '';
	}
	$(function() {
	<% if(!obox.get("wrt_user_id").equals(uSesEnt.user_id)) { %>
		document.getElementById('isEditTable').style.display = 'none';
	<% } %>
	<% if(box.get("popup_yn").equals("Y")) { %>
		$(".page-logo-text").html("일정");
	<% } %>
	});
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="plan_no" 		value="<%=obox.get("plan_no")%>">
<input type="hidden" name="popup_yn" 		value="<%=box.get("popup_yn")%>">

	<table class="table table-view table-bordered table-cover mar0">
  		<tr>
			<th width="20%">제목</th>
			<td width="80%" style="padding:0 5 0 5"><%=obox.get("subject").replace("@@FONT@@","<font color='red'><b>").replace("@@FONT_END@@","</b></font>")%></td>
  		</tr>
  		<tr>
			<th>구분</th>
			<td><%=obox.get("plan_class_nm")%></td>
  		</tr>
  		<%
      		String dateStr = obox.get("start_ymd").substring(4,6)+"."+obox.get("start_ymd").substring(6)+"("+obox.get("start_week")+")";
      		if(!obox.get("start_hhmm").equals("")) { dateStr += " "+obox.get("start_hhmm").substring(0,2)+":"+obox.get("start_hhmm").substring(2); }
      		if(!obox.get("end_ymd").equals(obox.get("start_ymd"))) { dateStr += " ~ "+obox.get("end_ymd").substring(4,6)+"."+obox.get("end_ymd").substring(6)+"("+obox.get("end_week")+")"; }
      		if(!obox.get("end_hhmm").equals("") && (!obox.get("end_ymd").equals(obox.get("start_ymd")) || !obox.get("end_hhmm").equals(obox.get("start_hhmm")))) { 
      			if(dateStr.indexOf(" ~ ") < 0) { dateStr += " ~ "; }
      			dateStr += " "+obox.get("end_hhmm").substring(0,2)+":"+obox.get("end_hhmm").substring(2);
      		}
		%>
  		<tr>
			<th>기간</th>
			<td><%=dateStr.equals("")?obox.get("start_date",Box.DEF_DATETIME_FMT_APM)+(obox.get("end_date").equals("")?"":" ~ "+obox.get("end_date",Box.DEF_DATETIME_FMT_APM)):dateStr%></td>
  		</tr>
  		<tr height="80">
			<th>내용</th>
			<td><%=obox.get("plan_memo")%></td>
		</tr>
  		<tr>
			<th>공개범위</th>
			<td><%=obox.get("public_scope_nm")%></td>
  		</tr>
	</table>
	
	<div id="isEditTable" class="table-bottom-control padR5">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goEdit();"><img src="/com/img/ico_btn_edit.png">수정</button>
				<button type="button" class="btn dark" onClick="goCancel();"><img src="/com/img/ico_btn_delete.png">삭제</button>
			</span>
		</span>
	</div>
</form>