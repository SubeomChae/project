<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 학력사항 -->
<script language="javascript">
	function goView(school_seq) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(school_seq != '') { $("tr[school_seq='"+school_seq+"']").addClass("bg-yellow"); }
		var param = "empl_no=<%=box.get("empl_no")%>&school_seq="+school_seq
		ajaxReplace("ins02002_edit.do?actionType=view", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
	
	function goWrite() {
		var param = "empl_no=<%=box.get("empl_no")%>";
		ajaxReplace("ins02002_edit.do?actionType=write", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
</script>

<form id="listForm" name="listForm" method="post" action="" class="fType">
<input type="hidden" name="empl_no" value="<%=box.get("empl_no")%>">
<input type="hidden" name="popup_yn" value="<%=box.get("popup_yn")%>">
<input type="hidden" name="school_seq" value="">
<input type="hidden" name="selectedRow" value="">

	<div class="table-scrollable scrollOptionY" style="width: 100%;height:100%;">
		<table class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:5%;">
				<col style="width:15%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:15%;">
				<col style="width:10%;">
				<col style="width:*;">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>학교명</th>
					<th>입학년도</th>
					<th>졸업년도</th>
					<th>구분</th>
					<th>전공</th>
					<th>학위</th>
					<th>소재지</th>
				</tr>
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr>
					<td colspan="8">등록된 자료가 없습니다.</td>
				</tr>
			<% }else { 			
            	for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" school_seq="<%=rsWp.get("school_seq",i)%>" class="odd gradeX" style="cursor:pointer" onClick="goView('<%=rsWp.get("school_seq",i)%>')">
					<td><%=String.valueOf(i+1)%></td>
					<td><%=rsWp.get("school_nm",i)%></td>
					<td><%=rsWp.get("entry_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("graduate_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("complete_flag_nm",i)%></td>
					<td><%=rsWp.get("major_nm",i)%></td>
					<td><%=rsWp.get("hakwi_nm",i)%></td>
					<td><%=rsWp.get("school_loc",i)%></td>
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