<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- 부가세명세서 -->
<script language='javascript'>
	function goSort(sort_order) {
		parent.document.main.sort_order.value = sort_order;
		parent.goSearch('N');
	}
	
	$(function(){
		fixTableHeader("MyTable");
	});
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="sort_order"  value="">

	<div id="divListData" class="contentsRow" style="padding:0px">
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 120px);">
			<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
				<colgroup>
					<col style="width:25px;">
					<col style="width:97px;">
					<col style="width:282px;">
					<col style="width:120px;">
					<col style="width:96px;">
					<col style="width:123px;">
					<col style="width:133px;">
					<col style="width:227px;">
					<col style="width:203px;">
					<col style="width:100px;">
					<col style="width:80px;">
					<col style="width:145px;">
					<col style="width:125px;">
					<col style="width:97px;">
					<col style="width:51px;">
					<col style="width:50px;">
				</colgroup>
				<thead>
					<tr height="28">
						<th>No</th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.proof_ymd')"><%}%>증빙일자</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.cust_nm')"><%}%>거래처</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.saupja_no')"><%}%>사업자번호</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.rep_person_nm')"><%}%>대표자</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.uptae')"><%}%>업태</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.upjong')"><%}%>업종</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.etc_remark')"><%}%>적요</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.vat_cd')"><%}%>증빙유형</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.gong_amt')"><%}%>공급가액</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.vat_amt')"><%}%>부가세</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.slip_no')"><%}%>전표번호</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.acct_cd')"><%}%>계정과목</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.proof_no')"><%}%>증빙번호</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.etax_yn')"><%}%>전자</a></th>
						<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.pass15_yn')"><%}%>15일</a></th>
		         	</tr>
	         	</thead> 
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="16" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else {
					for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr height="25"> 
							<td class="t-center"><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
							<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
							<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
							<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp.get("saupja_no",i))%></td>
							<td class="t-center"><%=rsWp.get("rep_person_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("uptae",i)%></td>
							<td class="t-center"><%=rsWp.get("upjong",i)%></td>
							<td class="t-left"><%=rsWp.get("etc_remark",i)%></td>
							<td class="t-center"><%=rsWp.get("vat_nm",i)%></td>
							<td class="t-right"><%=rsWp.get("gong_amt",i,Box.THOUSAND_COMMA)%></td>
							<td class="t-right"><%=rsWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
							<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('<%=rsWp.get("slip_no",i)%>')"><%}%><%=rsWp.get("slip_no",i,Box.SLIP_NO)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
							<td class="t-left"><%=rsWp.get("acct_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("proof_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("etax_yn",i).equals("Y")?"Y":""%></td>
							<td class="t-center"><%=rsWp.get("pass15_yn",i).equals("Y")?"Y":""%></td>
						</tr>	
					<% } %>
			<% } %>
			</table>
		</div>
	</div>
</form>