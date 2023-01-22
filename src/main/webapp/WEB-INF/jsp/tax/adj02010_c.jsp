<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"    	class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제43호의5서식(갑)] 법인지방소득세 특별징수세액명세서(갑)  -->

<script language='javascript'>
	$(function() {
		ajaxSubmitForm("xmlUpdate.do","#taxForm", function(rtn) {
			if(rtn.isOk == "Y") {
				hideServerWorking();
			}else {
				alert(rtn.errMsg);
			}
		});
	});
</script>

<form id="taxForm" name="taxForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 		value="<%=box.get("std_yy")%>">
	
	<h2 class="page-title-2depths">법인지방소득세 특별징수세액명세서(갑)</h2>

	<div class="table-top-control">
		<span style="color:#01a1db;">상호를 클릭</span>하면 해당 거래처의 상세정보를 조회할 수 있습니다.
		<span style="float:right;">[별지 제43호의5서식(갑)]</span>
	</div>

	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB10">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
			<tr>
				<td width="30%" class="t-left">법인명</td>
				<td width="35%" class="t-left">사업자등록번호</td>
				<td width="35%" class="t-left">사업연도</td>
			</tr>		
			<tr>
				<td class="t-left"><%=obox.get("corp_nm")%></td>
				<td class="t-left"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				<td class="t-left"><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>							
			</tr>
		</table>
	
		<table class="table table-bordered order-column table-cover marB0">			
			<tr>
				<th colspan="9" class="t-left"><b>원천징수 및 특별징수 명세내용</b></th>
       		</tr>
			<tr>
				<td rowspan="2" width="*" class="td-head">①  적요</td>
				<td colspan="2" class="td-head">②  원천(특별)징수의무자</td>
				<td rowspan="2" width="12%" class="td-head">③  원천징수일</td>
				<td rowspan="2" width="10%" class="td-head">④  이자금액</td>
				<td rowspan="2" width="7%" class="td-head">⑤  세율</td>
				<td rowspan="2" width="10%" class="td-head">⑥  법인세</td>
				<td colspan="2" class="td-head">법인지방소득세</td>
       		</tr> 
			<tr>
				<td width="15%" class="td-head">사업자(주민)<br>등록번호</td>
				<td width="15%" class="td-head">상호(성명)</td>
				<td width="8%" class="td-head">⑦ 세액</td>
				<td width="8%" class="td-head">⑧ 납세지</td>
       		</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="9">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   long int_sum = 0;
		   long tax_sum = 0;
		   long tax_sum2 = 0;
	   	   for(int i=0; i < rsWp.getLength(); i++) {	
	   	   		if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }
	   	   		int_sum += rsWp.getLong("rel_amt",i);
	   	   		tax_sum += rsWp.getLong("slip_amt",i);
	   	   		tax_sum2 += rsWp.getLong("slip_amt2",i); %>
			<tr> 
				<%	xmlBuf += "<LIST>\n"
						   +  "	<etc_remark>"+StringUtil.getSpecialCharacters(rsWp.get("etc_remark",i))+"</etc_remark>\n"
						   +  "	<cust_reg_no>"+FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i))+"</cust_reg_no>\n" 
						   +  "	<cust_nm>"+rsWp.get("cust_nm",i)+"</cust_nm>\n"
						   +  "	<proof_ymd>"+rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)+"</proof_ymd>\n" 
						   +  "	<rel_amt>"+rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)+"</rel_amt>\n" 
						   +  "	<tax_rate>"+rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)+"</tax_rate>\n" 
						   +  "	<slip_amt>"+rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)+"</slip_amt>\n" 
						   +  "	<slip_amt2>"+rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)+"</slip_amt2>\n" 
						   +  "	<tax_office>"+obox.get("tax_office")+"</tax_office>\n" 
						   +  "</LIST>\n";
				%>
				<td><%=rsWp.get("etc_remark",i)%></td>
				<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i))%></td>
				<td class="t-center"><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",i)%>')"><%=rsWp.get("cust_nm",i)%></a></td>
				<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
				<td class="t-right"><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-center"><%=rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)%> %</td>
				<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-center"><%=obox.get("tax_office")%></td>
			</tr>
			<% } %>
			<tr> 
				<td class="t-center">합계</td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(int_sum))%></td>
				<td class="t-center"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(tax_sum))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(tax_sum2))%></td>
				<td class="t-center"></td>
			</tr>
		<% } %>
		</table>
	</div>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>