<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 가족사항 -->
<script language="javascript">
	function goView(family_id) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(family_id != '') { $("tr[family_id='"+family_id+"']").addClass("bg-yellow"); }
		var param = "empl_no=<%=box.get("empl_no")%>&family_id="+family_id
		ajaxReplace("ins03002_edit.do?actionType=view", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		var param = "empl_no=<%=box.get("empl_no")%>";
		ajaxReplace("ins03002_edit.do?actionType=write", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
</script>

<form id="listForm" name="listForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="empl_no" 	value="<%=box.get("empl_no")%>">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">

	<div class="table-scrollable scrollOptionY" style="height:100%;">
		<table class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:5%;">
				<col style="width:11%;">
				<col style="width:11%;">
				<col style="width:16%;">
				<col style="width:12%;">
				<col style="width:*;">
				<col style="width:22%;">
				<col style="width:6%;">
				<col style="width:6%;">
			</colgroup>
			<thead>
				 <tr>
					<th>No</th>
					<th>성명</th>
					<th>관계</th>
					<th>주민번호</th>
					<th>최종학력</th>
					<th>직업</td>
					<th>근무처</th>
					<th>부양</th>
					<th>동거</th>
				</tr>
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="9">등록된 자료가 없습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" family_id="<%=rsWp.get("family_id",i)%>" class="odd gradeX" style="cursor:pointer" onClick="goView('<%=rsWp.get("family_id",i)%>')">
					<td><%=String.valueOf(i+1)%></td>
					<td><%=rsWp.get("family_nm",i)%></td>
					<td><%=rsWp.get("family_rel_nm",i)%></td>
					<td><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
					<td><%=rsWp.get("school_career_nm",i)%></td>
					<td><%=rsWp.get("work_nm",i)%></td>
					<td><%=rsWp.get("work_place",i)%></td>
					<td><%=rsWp.get("buyang_yn",i)%></td>
					<td><%=rsWp.get("living_yn",i)%></td>
				</tr>
				<% } %>
			<% } %>	
			</tbody>
		</table>
		
		<div class="table-bottom-control">
			<span style="width: 100%;">
				<span style="float:right;padding-right:5px">
					<button type="button" class="btn dark" onClick="goWrite()"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
				</span>
			</span>
		</div>
	</div>
</form>