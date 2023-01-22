<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- [별지 제43호의5서식] 법인지방소득세 특별징수세액명세서(을) -->
<script language='javascript'>
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">

	<h2 class="page-title-2depths">법인지방소득세 특별징수세액명세서(을)</h2>
		
	<div class="table-top-control">
		<span style="float:right;">[별지 제43호의5서식(을)]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td class="t-left" width="30%">법인명 : <%=obox.get("corp_nm")%></td>
				<td class="t-left" width="30%">사업자등록번호 : <%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				<td class="t-left" width="40%">사업연도 : <%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>							
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="9" class="t-left"><b>원천징수 및 특별징수 명세내용</b></th>
			</tr>
			<tr>
				<td class="td-head" width="16%">①  채권등의명칭<br>(액면금액)</td>
				<td class="td-head" width="16%">②  유가증권<br>표준코드</td>
				<td class="td-head" width="16%">③  채권이자<br>구분</td>
				<td class="td-head" width="16%">④  취득일</td>
				<td class="td-head" width="16%">⑤  매도일</td>
				<td class="td-head"width="*">⑥  보유기간<br>(이자계산일수)</td>
			</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			   long int_sum = 0;
			   long tax_sum = 0;
			   for(int i=0; i < rsWp.getLength(); i++) {	
					if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }
					int_sum += rsWp.getLong("rel_amt",i);
					tax_sum += rsWp.getLong("slip_amt",i); %>
			<tr onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td class="t-center"></td>
				<td class="t-center"></td>
			</tr>
			<% } %>
		<% } %>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<td rowspan="2" class="td-head" width="10%">⑦ 이자율</td>
				<td rowspan="2" class="td-head" width="12%">⑧ =①×⑥×⑦<br>보유기간이자<br>상당액</td>
				<td rowspan="2" class="td-head" width="*">⑨ 원천(특별)<br>징수의무자<br>(사업자등록번호)</td>
				<td rowspan="2" class="td-head" width="8%">⑩ 세율</td>
				<td colspan="2" class="td-head">법인세</td>
				<td colspan="3" class="td-head">법인지방소득세</td>
			</tr>
			<tr>								
				<td class="td-head" width="11%">⑪ 세액</td>
				<td class="td-head" width="11%">⑫ 납부일<br>(징수일)</td>
				<td class="td-head" width="11%">⑬ 세액</td>
				<td class="td-head" width="11%">⑭ 납부일<br>(징수일)</td>
				<td class="td-head" width="11%">⑮ 납세지</td>								
			</tr>
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="9" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			   long int_sum = 0;
			   long tax_sum = 0;
			   for(int i=0; i < rsWp.getLength(); i++) {	
					if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }
					int_sum += rsWp.getLong("rel_amt",i);
					tax_sum += rsWp.getLong("slip_amt",i); %>
				<tr> 
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-right"></td>
					<td class="t-center"></td>
					<td class="t-right"></td>
				</tr>
			<% } %>
				<tr bgcolor="f6f6f6"> 
					<td class="t-center">합계</td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(int_sum))%></td>
					<td class="t-center"></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(tax_sum))%></td>
				</tr>
		<% } %>
		</table>
	</div>
</form>