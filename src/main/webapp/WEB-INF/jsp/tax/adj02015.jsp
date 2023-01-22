<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"    	class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제15호 서식] 소득금액조정합계표 -->

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
	
	<h2 class="page-title-2depths">소득금액조정합계표</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제15호 서식]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
         		<tr>	
				<td colspan="4" class="td-head">익금산입 및 손금불산입</td>
				<td colspan="4" class="td-head">손금산입 및 익금불산입</td>
        		</tr> 
			<tr>
				<td rowspan="2" width="15%" class="td-head">①  과목</td>
				<td rowspan="2" width="15%" class="td-head">②  금액</td>
				<td colspan="2" class="td-head">③  소득처분</td>
				<td rowspan="2" width="15%" class="td-head">④  과목</td>
				<td rowspan="2" width="15%" class="td-head">⑤  금액</td>
				<td colspan="2" class="td-head">⑥  소득처분</td>
         		</tr> 
			<tr>
				<td width="10%" class="td-head">처분</td>
				<td width="10%" class="td-head">코드</td>
				<td width="10%" class="td-head">처분</td>
				<td width="10%" class="td-head">코드</td>
         		</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="8" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			   long slip_sum1 = 0;
			   long slip_sum2 = 0;
		   	   for(int i=0; i < rsWp.getLength(); i++) {	
		   	   		slip_sum1 += rsWp.getLong("slip_amt1",i);
		   	   		slip_sum2 += rsWp.getLong("slip_amt2",i); %>
			<tr> 
				<%	xmlBuf += "<LIST>\n"
						   +  "	<acct_nm1>"+rsWp.get("acct_nm1",i)+"</acct_nm1>\n"
						   +  "	<slip_amt1>"+rsWp.get("slip_amt1",i,Box.THOUSAND_COMMA)+"</slip_amt1>\n"
						   +  "	<dispose_nm1>"+rsWp.get("dispose_nm1",i)+"</dispose_nm1>\n" 
						   +  "	<dispose_cd1>"+rsWp.get("dispose_cd1",i)+"</dispose_cd1>\n"
						   +  "	<acct_nm2>"+rsWp.get("acct_nm2",i)+"</acct_nm2>\n" 
						   +  "	<slip_amt2>"+rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)+"</slip_amt2>\n"
						   +  "	<dispose_nm2>"+rsWp.get("dispose_nm2",i)+"</dispose_nm2>\n" 
						   +  "	<dispose_cd2>"+rsWp.get("dispose_cd2",i)+"</dispose_cd2>\n"
						   +  "</LIST>\n";
				%>
				<td><%=rsWp.get("acct_nm1",i)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt1",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-center"><%=rsWp.get("dispose_nm1",i)%></td>
				<td class="t-center"><%=rsWp.get("dispose_cd1",i)%></td>
				<td><%=rsWp.get("acct_nm2",i)%></td>
				<td class="t-right"><%=rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-center"><%=rsWp.get("dispose_nm2",i)%></td>
				<td class="t-center"><%=rsWp.get("dispose_cd2",i)%></td>
			</tr>	
			<% } %>
			<tr bgcolor="f6f6f6">
				<td class="t-center">합계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum1))%></td>
				<td colspan="2"></td>
				<td class="t-center">합계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_sum2))%></td>
				<td colspan="2"></td>
			</tr>
		<% } %>
		</table>
	</div>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>