<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>유지보수일지 상세조회</title>

<script language="javascript">
	function goEdit() {
		document.main.action = 'adm93003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	function goDelete(maint_no) {
		if(confirm('삭제하시겠습니까?')) {
			document.main.action = 'adm93002_delete.do?maint_no'+maint_no;
			document.main.target = '_self';
			document.main.submit();
		}
	}
</script>


<form name="main" method="post" action="" class="fType">
<input type="hidden" name="maint_no" value="<%=box.get("maint_no")%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td width="15%" class="table01_title">업체명</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("corp_nm")%></td>
					<td width="15%" class="table01_title">요청일자</td>
					<td width="35%" align="center"><%=obox.get("req_ymd",Box.DEF_DATE_FMT)%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">요청자</td>
					<td style="padding-left:5px"><%=obox.get("req_dept_nm")%> <%=obox.get("req_person_nm")%></td>
					<td class="table01_title">요청구분</td>
					<td align="center"><%=obox.get("maint_gbn_nm")%></td>
				</tr>
				<tr height="200">
					<td class="table01_title">요청내용</td>
					<td colspan="3" style="padding:5 5 5 5"><%=obox.get("req_content")%></td>
				</tr>
				<tr height="120">
					<td class="table01_title">처리내용</td>
					<td colspan="3" style="padding:5 5 5 5"><%=obox.get("pro_content")%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">처리일자</td>
					<td style="padding-left:5px"><%=obox.get("start_ymd",Box.DEF_DATE_FMT)%><%if(!obox.get("end_ymd").equals("") && !obox.get("end_ymd").equals(obox.get("start_ymd"))){%> ~ <%=obox.get("end_ymd",Box.DEF_DATE_FMT)%><%}%>
					</td>
					<td class="table01_title">처리담당자</td>
					<td style="padding-left:5px"><%=obox.get("pro_person_nm")%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">최초등록일</td>
					<td style="padding-left:5px"><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%></td>
					<td class="table01_title">최종수정일</td>
					<td style="padding-left:5px"><%=obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%></td>
				</tr>
			</table>
    	</td>
  	</tr>
  	<tr height="28" align="right" style="padding:5 0 0 0">
  		<td align="right">
			<a href="javascript:goEdit()"><img src="/com/img/bn_modify.gif" border="0"></a>
			<a href="javascript:goDelete('<%=box.get("maint_no")%>')"><img src="/com/img/bn_delete.gif" border="0"></a>	
 		</td>
  	</tr>
</table>
</form>

