<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"    	class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제15호 서식 부표2] 과목별소득금액조정명세서(2) -->
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
	
	<h2 class="page-title-2depths">과목별소득금액조정명세서(2)</h2>
		
	<div class="table-top-control">
		<span style="float:right;">[별지 제15호 서식 부표2]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
         		<tr>
				<th colspan="5" class="t-left">2. 손금산입 및 익금불산입</th>
         		</tr> 
			<tr>
				<td width="15%" class="td-head">①과목</td>
				<td width="15%" class="td-head">②금액</td>
				<td width="16%" class="td-head">③영업손익조정금액</td>
				<td width="15%" class="td-head">④처분</td>
				<td width="39%" class="td-head">⑤조정내용</td>
         		</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="5" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				    <tr> 
						<%	xmlBuf += "<LIST>\n"
								   +  "	<acct_nm>"+rsWp.get("acct_nm",i)+"</acct_nm>\n"
								   +  "	<slip_amt>"+rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)+"</slip_amt>\n" 
								   +  "	<adj_amt>"+rsWp.get("adj_amt",i,Box.THOUSAND_COMMA)+"</adj_amt>\n"
								   +  "	<dispose_result>"+rsWp.get("dispose_result",i)+"</dispose_result>\n" 
								   +  "	<adj_content>"+rsWp.get("adj_content",i)+"</adj_content>\n" 
								   +  "</LIST>\n";
						%>
						<td><%=rsWp.get("acct_nm",i)%></td>
						<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
						<td class="t-right"><%=rsWp.get("adj_amt",i,Box.THOUSAND_COMMA)%></td>
						<td class="t-center"><%=rsWp.get("dispose_result",i)%></td>
						<td><%=rsWp.get("adj_content",i)%></td>
				  	</tr>	
				<% } %>
		  	<% } %>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>