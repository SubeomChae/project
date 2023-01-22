<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 사원정보  -->
<script language="javascript">
	$(function() {
		$(".page-logo-text").html("사원정보");	
	}); 
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType" style="margin:0px">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tbody>
				<tr>
					<th width="18%" class="table01_title">사번</th>
					<td width="32%" style="padding-left:5px"><%=obox.get("empl_no")%></td>
					<th width="18%" class="table01_title">성명</th>
					<td width="32%" style="padding-left:5px"><%=obox.get("empl_nm")%></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
					<th>생년일일</th>
					<td><%=obox.get("birth_ymd",Box.DEF_DATE_FMT)%><%if(!obox.get("solar_lunar").equals("")){%> (<%=obox.get("solar_lunar").equals("S")?"양력":"음력"%>)<%}%></td>
				</tr>
				<tr>
					<th>부서</th>
					<td colspan="3"><%=obox.get("dept_nm")%></td>
				</tr>
				<tr>
					<th>직위</th>
					<td><%=obox.get("position_nm")%></td>
					<th>직급</th>
					<td><%=obox.get("grade_nm")%></td>
				</tr>
				<tr>
					<th>보직</th>
					<td><%=obox.get("bojik_nm")%></td>
					<th>재직상태</th>
					<td><%=obox.get("empl_status_nm")%></td>
				</tr>
				<tr>
					<th>입사일자</th>
					<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
					<th>휴(퇴)직일자</th>
					<td><%=obox.get("hyutoi_ymd",Box.DEF_DATE_FMT)%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3" style="padding-left:5px"><%if(!obox.get("zip_no").equals("")){%>[<%=obox.get("zip_no",Box.ZIP_CODE)%>]<%}%> <%=obox.get("addr")%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=obox.get("tel_no")%></td>
					<th>휴대폰번호</th>
					<td><%=obox.get("hp_no")%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3" style="padding-left:5px"><%=obox.get("email_id")%></td>
				</tr>
				<tr>
					<th>사원구분</th>
					<td colspan="3" style="padding-left:5px"><%=obox.get("empl_class_nm")%></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>