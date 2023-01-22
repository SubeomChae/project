<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 사용자별 접속현황 -->
<script language="javascript">
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form name="main" method="post" action="" style="margin:0px">

	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 570px);">
		<table id="MyTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:8%">
				<col style="width:*">
				<col style="width:19%">
				<col style="width:19%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:19%">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>사번</th>
					<th>성명</th>
					<th>부서</th>								
					<th>직위</th>																
					<th>접속횟수</th>
					<th>최종접속일시</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++){ %>
				<tr>
					<td class="t-center"><%=rsWp.get("row_num",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>','<%=box.get("corp_cd") %>')"><font color="<%=rsWp.get("empl_status",i).equals("T")?"red":""%>"><%=rsWp.get("empl_nm",i)%></font></a></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("position_nm",i)%></td>									
					<td class="t-center"><%=rsWp.get("connect_cnt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("sys_upd_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
				</tr>
			<% } %>
			</tbody>
		</table>
	</div>		 
	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
</form>