<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- [별지 제10호 서식] 원천납부세액명세서(을) -->
<script language='javascript'>
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
	
	<h2 class="page-title-2depths">원천납부세액명세서(을)</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제10호 서식(을)]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<td class="td-head" width="20%">①  채권등의명칭<br>(액면금액)</td>
				<td class="td-head" width="20%">②  유가증권코드</td>
				<td class="td-head" width="25%">③  채권이자구분</td>
				<td class="td-head" width="10%">④  취득일</td>
				<td class="td-head" width="10%">⑤  매도일</td>
				<td class="td-head" width="15%">⑥  보유기간<br>(이자계산일수)</td>
			</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   long int_sum = 0;
		   long tax_sum = 0;
		   for(int i=0; i < rsWp.getLength(); i++) {	
				/*if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }*/
				int_sum += rsWp.getLong("rel_amt",i);
				tax_sum += rsWp.getLong("slip_amt",i); %>
			<tr> 
				<td><%=rsWp.get("etc_remark",i)%></td>
				<td class="t-center"><%=rsWp.get("saupja_no_x",i)%></td>
				<td class="t-center"><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a></td>
				<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
				<td class="t-right" style="padding-right:5px"><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-center"><%=rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)%> %</td>
			</tr>
			<% } %>
		<% } %>
			<tr class="t-center" class="table01_title">
				<td class="td-head" width="20%">⑦  이자율</td>
				<td class="td-head" width="20%">⑧ =①×⑥×⑦<br>보유기간이자 상당액</td>
				<td class="td-head" width="25%">⑨  원천징수의무자<br>(사업자등록번호)</td>
				<td class="td-head" width="10%">⑩  세율</td>
				<td class="td-head" width="10%">⑪  법인세</td>
				<td class="td-head" width="15%">⑫  납부일<br>(징수일)</td>
			</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			   long int_sum = 0;
			   long tax_sum = 0;
			   for(int i=0; i < rsWp.getLength(); i++) {	
				/*if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }*/
				int_sum += rsWp.getLong("rel_amt",i);
				tax_sum += rsWp.getLong("slip_amt",i); %>
				<tr> 
					<td><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-center"><%=rsWp.get("saupja_no_x",i)%></td>
					<td class="t-center"><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right" style="padding-right:5px"><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)%> %</td>
				</tr>
			<% } %>
			<tr bgcolor="f6f6f6"> 
				<td class="t-center">합계</td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(int_sum))%></td>
				<td class="t-center"></td>
			</tr>
		<% } %>
		</table>
	</div>
</form>