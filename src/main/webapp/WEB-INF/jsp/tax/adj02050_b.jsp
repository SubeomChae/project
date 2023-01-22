<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- [별지 제50호 서식] 자본금과 적립금 조정명세서(을) -->
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
<input type="hidden" name="report_id" 		value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 			value="<%=box.get("std_yy")%>">

	<h2 class="page-title-2depths">자본금과 적립금 조정명세서(을)</h2>
		
	<div class="table-top-control">
		<span>[별지 제50호 서식(을)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<saupja_no>"+obox.get("saupja_no")+"</saupja_no>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n";
			%>
			<tr>
				<th colspan="6">세무조정유보소득 계산</th>
         		</tr> 
			<tr>
				<td rowspan="2" class="td-head" width="20%">①  과목 또는 사항</td>
				<td rowspan="2" class="td-head" width="15%">②  기초잔액</td>
				<td colspan="2" class="td-head">당기중 증감</td>
				<td rowspan="2" class="td-head" width="15%">⑤  기말잔액<br>(익기초현재)</td>
				<td rowspan="2" class="td-head" width="20%">비고</td>
         		</tr> 
			<tr>
				<td class="td-head" width="15%">③ 감소</td>
				<td class="td-head" width="15%">④ 증가</td>
       		</tr> 
	<% if(rsWp.getLength() == 0) { %>
			<tr height="25"><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
	<% }else {
		   long slip_sum2 = 0;
		   long slip_sum3 = 0;
		   long slip_sum4 = 0;
		   long slip_sum5 = 0;
	   	   for(int i=0; i < rsWp.getLength(); i++) {	
	   	   		slip_sum2 += rsWp.getLong("slip_amt2",i);
	   	   		slip_sum3 += rsWp.getLong("slip_amt3",i);
	   	   		slip_sum4 += rsWp.getLong("slip_amt4",i);
	   	   		slip_sum5 += rsWp.getLong("slip_amt5",i); 
				xmlBuf += "<LIST>\n" 
					   +  "<acct_nm1>"+rsWp.get("acct_nm1",i)+"</acct_nm1>\n"
					   +  "<slip_amt2>"+rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)+"</slip_amt2>\n"
					   +  "<slip_amt3>"+rsWp.get("slip_amt3",i,Box.THOUSAND_COMMA)+"</slip_amt3>\n"
					   +  "<slip_amt4>"+rsWp.get("slip_amt4",i,Box.THOUSAND_COMMA)+"</slip_amt4>\n"
					   +  "<slip_amt5>"+rsWp.get("slip_amt5",i,Box.THOUSAND_COMMA)+"</slip_amt5>\n"
					   +  "<remark>"+rsWp.get("remark",i)+"</remark>\n"
					   +  "</LIST>\n";
			%>
			<tr> 
				<td><%=rsWp.get("acct_nm1",i)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt3",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt4",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt5",i,Box.THOUSAND_COMMA)%></td>
				<td><%=rsWp.get("remark",i)%></td>
			</tr>	
		<% } %>
			<tr bgcolor="f6f6f6">
				<td class="t-center">합계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum2))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum3))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum4))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum5))%></td>
				<td></td>
			</tr>
			<%	xmlBuf += "<LIST>\n" 
					   +  "<acct_nm1>합      계</acct_nm1>\n"
					   +  "<slip_amt2>"+FormatUtil.insertComma(String.valueOf(slip_sum2))+"</slip_amt2>\n"
					   +  "<slip_amt3>"+FormatUtil.insertComma(String.valueOf(slip_sum3))+"</slip_amt3>\n"
					   +  "<slip_amt4>"+FormatUtil.insertComma(String.valueOf(slip_sum4))+"</slip_amt4>\n"
					   +  "<slip_amt5>"+FormatUtil.insertComma(String.valueOf(slip_sum5))+"</slip_amt5>\n"
					   +  "<remark></remark>\n"
					   +  "</LIST>\n";
			 } %>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
