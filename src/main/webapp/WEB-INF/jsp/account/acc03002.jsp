<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	boolean isEditable = false;
if(uSesEnt.use_auth.equals("SA")) { isEditable = true; }
%>
<!-- 재무제표배열 -->
<script language="javascript">	
	function goView(report_seq) {
		$("tr[id^='R_tr_']").removeClass("bg-yellow");
		if(report_seq != '') { $("tr[report_seq='"+report_seq+"']").addClass("bg-yellow"); }
		var param = "report_id=<%=box.get("report_id")%>&report_seq="+report_seq;
		ajaxReplace("acc03003_edit.do?actionType=view", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
	
	function goWrite() {
		$("tr[id^='R_tr_']").removeClass("bg-yellow");
		var param = "report_id=<%=box.get("report_id")%>";
		ajaxReplace("acc03003_edit.do?actionType=write", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}	
	
	$(function() {
		fixTableHeader("MyTable1");
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="report_seq" 	value="">
<input type="hidden" name="popup_yn" value="<%=box.get("popup_yn")%>">
<input type="hidden" name="selectedRow" value="">

	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 115px);">
		<table id="MyTable1" class="table table-view table-hover table-bordered">
			<thead>
				<tr>
					<th colspan="6"><%=box.get("report_nm")%></th>
				</tr>
				<tr>
					<th>순서</th>
					<th>표시헤더명</th>
					<th>(+) 증가수식</th>
					<th>(-) 감소수식</th>
					<th>표시위치</th>
					<th>강조표시</th>
			    </tr>
		   </thead>
		   <tbody>
		   <% for(int i=0; i < rsWp.getLength(); i++) { 	
				String bgcolor = "#ffffff";
				if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
				if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#eeeeee"; } %>
				<tr id="R_tr_<%=i%>" report_seq="<%=rsWp.get("report_seq",i)%>" bgcolor="<%=bgcolor%>" <%if(isEditable){%> style="cursor:pointer" onClick="goView('<%=rsWp.get("report_seq",i)%>')"<%}%>>
					<td class="t-center"><%=rsWp.get("report_seq",i)%></td>
					<td><%=StringUtil.replace(rsWp.get("mark_hdr_nm",i),"^","&nbsp;&nbsp;")%></td>
					<td><%=StringUtil.replace(rsWp.get("plus_arr",i),";","; ")%></td>
					<td><%=StringUtil.replace(rsWp.get("minus_arr",i),";","; ")%></td>
					<td class="t-center"><%=rsWp.get("mark_position",i).equals("L")?"좌":"우"%></td>
					<td class="t-center"><%=rsWp.get("row_level",i)%><%=rsWp.get("row_level",i).equals("")?"없음":"단계"%></td>
				</tr>
			<% } %>
			</tbody>
		</table>
	</div>
</form>
<% if(isEditable) { %>	
	<!-- 보고서서식 세부정보 -->
	<div class="table-bottom-control">
		<span style="width: 100%;">
			<span style="float:right;padding-right:5px">
				<button type="button" class="btn dark" onClick="goWrite()"><img src="/com/img/ico_btn_refresh_edit.png">추가</button>
			</span>
		</span>
	</div>
<% } %>
