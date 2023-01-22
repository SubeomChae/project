<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 거래처정보 -->

<script language="javascript">
	$(function() {
		$(".page-logo-text").html("<%=obox.get("cust_nm")%>");	
	});
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType">
	
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tbody>
				<tr>
					<th width="22%">거래처구분</th>
					<td width="28%"><%=obox.get("cust_flag").equals("2")?"개인":"사업자"%></td>
					<th width="22%"><%=obox.get("cust_flag").equals("1")?"사업자번호":"주민등록번호"%></th>
					<td width="28%"><%=obox.get("cust_flag").equals("2") ? FormatUtil.juminNo(obox.get("cust_reg_no")) : FormatUtil.bizRegiNoFormat(obox.get("cust_reg_no"))%></td>
				</tr>
				<tr>
					<th>거래처명</th>
					<td colspan="3"><%=obox.get("cust_nm")%></td>
				</tr>
				<tr>
					<th>약칭</th>
					<td><%=obox.get("abbr_nm")%></td>
					<th>법인등록번호</th>
					<td><%=obox.get("corp_reg_no")%></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><%=obox.get("uptae")%></td>
					<th>종목</th>
					<td><%=obox.get("upjong")%></td>
				</tr>
				<tr>
					<th>사업장소재지</th>
					<td colspan="3">&nbsp;[<%=obox.get("zip_no",Box.ZIP_CODE)%>] <%=obox.get("addr")%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=obox.get("tel_no")%></td>
					<th>팩스번호</th>
					<td><%=obox.get("fax_no")%></td>
				</tr>
				<tr>
					<th>대표자 성명</th>
					<td colspan="3"><%=obox.get("rep_person_nm")%></td>
				</tr>
				<tr>
					<th>담당자 성명</th>
					<td colspan="3"><%=obox.get("charge_person_nm")%></td>
				</tr>
				<tr>
					<th>담당자 전화번호</th>
					<td><%=obox.get("charge_tel_no")%></td>
					<th>담당자 휴대폰</th>
					<td><%=obox.get("charge_hp_no")%></td>
				</tr>
				<tr>
					<th>은행명</th>
					<td><%=obox.get("bank_nm")%></td>
					<th>계좌번호</th>
					<td><%=obox.get("account_no")%></td>
				</tr>
				<tr>
					<th>비고</th>
					<td colspan="3"><%=obox.get("etc_remark")%></td>
				</tr>
			</tbody>
		</table>
	</div>
</form>