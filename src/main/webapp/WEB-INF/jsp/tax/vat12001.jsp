<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 부가세매입장 -->
<script language='javascript'>
	$(function(){
		fixTableHeader("MyTable");
	});
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="select_yn" value="Y">

	<div id="divListData" class="contentsRow">
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 120px);">
			<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
				<colgroup>
					<col style="width:2%;">
					<col style="width:2%;">
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:7%;">
					<col style="width:7%;">
					<col style="width:7%;">
					<col style="width:3%;">
					<col style="width:9%;">
					<col style="width:10%;">
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">일자</th>
						<th rowspan="2">거래처</th>
						<th colspan="4">거래내역</th>
						<th rowspan="2">거래<br>구분</th>
						<th colspan="2">매입</th>
	         		</tr> 
					<tr>
						<th>월</th>
						<th>일</th>
						<th>품명</th>
						<th>단가</th>
						<th>수량</th>
						<th>회계일자</th>
						<th>금액</th>
						<th>세액</th>
	         		</tr>
	         	</thead>
	         	<tbody>
				<% if(rsWp.getLength() == 0) { %>
					<tr><td colspan="15" class="t-center">검색된 자료가 없습니다.</td></tr>
				<% }else if(rsWp.getLength() > 0) {
						long gong_amt1_sum = 0;
						long vat_amt1_sum = 0;
						for(int i=0; i < rsWp.getLength(); i++) { 
							gong_amt1_sum += rsWp.getLong("gong_amt1",i);
							vat_amt1_sum += rsWp.getLong("vat_amt1",i);
						%>
					<tr> 
						<td class="t-center"><%=rsWp.get("proof_mm",i)%></td>
						<td class="t-center"><%=rsWp.get("proof_dd",i)%></td>
						<td class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
						<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('<%=rsWp.get("slip_no",i)%>')"><%}%><%=rsWp.get("remark",i)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
						<td class="t-right"><%=rsWp.get("unit_price",i,Box.THOUSAND_COMMA)%></td>
						<td class="t-center"><%=rsWp.get("item_qty",i)%></td>
						<td class="t-center"><%=rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT)%></td>
						<td class="t-center"><%=rsWp.get("acct_flag",i)%></td>
						<td class="t-right"><%=rsWp.get("gong_amt1",i,Box.THOUSAND_COMMA)%></td>
						<td class="t-right"><%=rsWp.get("vat_amt1",i,Box.THOUSAND_COMMA)%></td>
					</tr>	
			 	<% } %>
					<tr> 
						<td class="t-center" colspan="8">합계</td>
						<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(gong_amt1_sum))%></td>
						<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vat_amt1_sum))%></td>
					</tr>	
				<% } %>
				</tbody>
			</table>
		</div>
	</div>
</form>