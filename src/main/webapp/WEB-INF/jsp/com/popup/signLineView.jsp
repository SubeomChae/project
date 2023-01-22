<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 결재라인 조회  -->

<script language="javascript">	
	function goMouseEvent(event_nm, sign_seq) {
		$('#tr_'+sign_seq).css("background-color", event_nm == 'over' ? '#b2e1f1' : '#ffffff');
	}
	
	$(function() {
		$(".page-logo-text").html("결재라인 조회");	
	}); 
</script>

<form name="pForm" method="post" class="fType" action="">
<input type="hidden" name="msg_no" 		value="<%=box.get("msg_no")%>">

<div class="marB5">
	<b>제목 : <%=obox.get("subject")%></b> (작성자 : <%=obox.get("send_empl_nm")%>)
</div>

<div class="table-scrollable">
	<table class="table table-view table-bordered">
		<tr>
			<th width="5%">No</th>
			<th width="15%">결재단계</th>
			<th width="10%">결재자</th>
			<th width="15%">결재상태</th>
			<th width="25%">결재일시</th>
			<th width="30%">의견</th>
       	</tr> 
	<% if(rsWp.getLength() == 0) { %>
		<tr><td colspan="6" class="t-center">결재라인이 생성되지 않았습니다.</td></tr>
	<% }else {
		for(int i=0; i < rsWp.getLength(); i++) { %>
		<tr id="tr_<%=i%>" onMouseOver="goMouseEvent('over','<%=i%>')" onMouseOut="goMouseEvent('out','<%=i%>')"> 
			<td class="t-center"><%=String.valueOf(i+1)%></td>
			<td class="t-center"><%=rsWp.get("sign_step_nm",i)%></td>
			<td class="t-center">
			<% if(!rsWp.get("real_empl_no",i).equals("")) { %>
				<a href="javascript:goEmployeePop('<%=rsWp.get("real_empl_no",i)%>')"><%=rsWp.get("sign_empl_nm",i)%></a>
			<% }else { %>
				<%if(rsWp.get("sign_empl_no",i).length() > 3){%><a href="javascript:goEmployeePop('<%=rsWp.get("sign_empl_no",i)%>')"><%}%><%=rsWp.get("sign_empl_nm",i)%></a>
			<% } %>
			</td>
			<td class="t-center"><%=rsWp.get("sign_status_nm",i)%></td>
			<td class="t-center"><%=rsWp.get("sign_date",i)%></td>
			<td><%=rsWp.get("opinion",i)%></td>
		</tr>	
	<% }
	} %>
	</table>
</div>
</form>

<div class="table-bottom-control">
	<span style="width:100%;">
		<span style="float:right;">
			<button type="button" class="btn dark" onClick="window.close();"><img src="/com/img/ico_btn_cancel.png">닫기</button>
		</span>
	</span>
</div>