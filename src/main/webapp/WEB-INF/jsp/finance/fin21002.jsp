<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 미지급금 결제 -->
<script language='javascript'>
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">

	<table class="table table-view table-bordered table-cover">
  		<tr>
			<th colspan="7"><%=obox.get("subject")%></th>
  		</tr>
		<tr>
			<th>No</td>
			<th>적요</td>
			<th>작성부서</th>
			<th>작성자</th>
			<th>금액</th>
			<th>지출거래처</th>
			<th>증빙일자</th>
  		</tr> 
	<% if(rsWp.getLength() == 0) { %>
			<tr height="25"><td colspan="7" class="t-center">등록된 자료가 없습니다.</td></tr>
	<% }else {
	   	   for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr height="25"> 
				<td width="3%" class="t-center"><%=String.valueOf(i+1)%></td>
				<td width="16%"><%=rsWp.get("etc_remark",i)%></td>
				<td width="12%" class="t-center"><%=rsWp.get("wrt_dept_nm",i)%></td>
				<td width="8%" class="t-center"><a href="javascript:goEmployeePop('<%=rsWp.get("wrt_empl_no",i)%>')"><%=rsWp.get("wrt_empl_nm",i)%></a></td>
				<td width="8%" class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
				<td width="13%" class="t-center">
					<a href="javascript:goCustInfo('<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a>
					<a href="javascript:goEmployeeInfo('<%=rsWp.get("empl_no",i)%>')"><%=rsWp.get("empl_nm",i)%></a>
				</td>
				<td width="8%" class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
			</tr>	
		<% } %>
	 <% } %>
	</table>
		</td>
  	</tr>
</table>
</form>