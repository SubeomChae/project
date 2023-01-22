<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp1"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="rsWp2"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="rsWp3"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제27호 서식] 고유목적 사업준비금 조정명세서(을) -->
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

	<h2 class="page-title-2depths">고유목적사업준비금조정명세서(을)</h2>

	<div class="table-top-control">
		<span>[별지 제27호 서식(을)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>

	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; 
			%>
			<tr>
				<td class="td-head" rowspan="2" width="15%">①  구분</td>
				<td class="td-head" rowspan="2" width="20%">②  적요</td>
				<td class="td-head" colspan="2">③  지출처</td>
				<td class="td-head" rowspan="2" width="10%">④  금액</td>
				<td class="td-head" rowspan="2" width="25%">⑤  비고</td>
         		</tr> 
			<tr>
				<td class="td-head" width="15%">상호(성명)</td>
				<td class="td-head" width="15%">사업자등록번호<br>(주민등록번호)</td>
         		</tr> 
		<!-- 지정기부금 -->
			<tr> 
				<td class="t-left">I.&nbsp;&nbsp;지정기부금</td>
		<% long slip_amt_sum1 = 0;
			   Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
		   slip_amt_sum1 = rbox.getLong("cur_acum");  //이자수익+대부이자수익 
	    %>
				<td></td>
				<td class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td></td>
			</tr>
		<% int row_cnt2=0;
		   String span_cnt = "";
		   for(int i=0; i < rsWp3.getLength(); i++) { 
				slip_amt_sum1 -= rsWp3.getLong("slip_amt",i);
				if(slip_amt_sum1 <= 0) { slip_amt_sum1=0; row_cnt2=i+1; break;}
				if(i==rsWp3.getLength()-1) { row_cnt2=i+1; break;}
		   } 
		   if(rsWp2.getLength() == 0) {
			   span_cnt = "10";
		   }else if(rsWp2.getLength() > 10) {
			   int row_cnt1 = 0;
			   long slip_amt_sum1_tmp = slip_amt_sum1;
			   for(int j=0; j < rsWp2.getLength(); j++) { 
				   slip_amt_sum1_tmp -= rsWp2.getLong("slip_amt",j);
					if(slip_amt_sum1_tmp <= 0) { row_cnt1=j+1; break;}
			   } 
			   if(row_cnt1 > 10) { span_cnt = String.valueOf(row_cnt1+1); }else { span_cnt = "11"; }
		   }else {
			   span_cnt = "11";  
		   } %>
		<!-- 고유목적사업비 -->
			<tr> 
				<td id="td_0" class="t-left" rowspan="<%=span_cnt%>">II.&nbsp;고유목적사업비</td>
		<% long slip_amt_sum2 = 0;
		   long slip_amt_tmp = 0;
		   int row_cnt = 0;
		   for(int i=0; i < rsWp2.getLength(); i++) {	
				if(slip_amt_sum1 == 0) { 
					out.println("<script language=javascript>document.getElementById('td_0').rowspan = \""+(i<10?"11":String.valueOf(i))+"\";</script>");
					if(i==0){out.println("<td></td><td></td><td></td><td></td><td></td></tr>");};
					break; 
				} 
				slip_amt_sum1 -= slip_amt_tmp; 
				slip_amt_tmp = rsWp2.getLong("slip_amt",i); 
				if(slip_amt_sum1 <= slip_amt_tmp) { slip_amt_tmp=slip_amt_sum1; slip_amt_sum1=0;} 
				slip_amt_sum2 += slip_amt_tmp; 
				row_cnt = i; 
				
				xmlBuf += "<LIST>\n"
					   +  "	<acct_nm>"+rsWp2.get("acct_nm",i)+"</acct_nm>\n"
					   +  "	<empl_no>"+rsWp2.get("empl_no",i)+"</empl_no>\n"
					   +  "	<empl_nm>"+rsWp2.get("empl_nm",i)+"</empl_nm>\n" 
					   +  "	<cust_cd>"+rsWp2.get("cust_cd",i)+"</cust_cd>\n" 
					   +  "	<cust_nm>"+rsWp2.get("cust_nm",i)+"</cust_nm>\n" 
					   +  "	<reside_no>"+FormatUtil.juminNo(rsWp2.get("reside_no",i),"x")+"</reside_no>\n" 
					   +  "	<cust_reg_no>"+FormatUtil.bizRegiNoFormat(rsWp2.get("cust_reg_no",i))+"</cust_reg_no>\n" 
					   +  "	<slip_amt_tmp>"+FormatUtil.insertComma(String.valueOf(slip_amt_tmp))+"</slip_amt_tmp>\n" 
					   +  "	<etc_remark>"+rsWp2.get("etc_remark",i)+"</etc_remark>\n" 
					   +  "	<biz_type>71</biz_type>\n" 
					   +  "</LIST>\n"; %>

			<%if(i>0){%><tr><%}%>
				<td><%=rsWp2.get("acct_nm",i)%></td>
			<% if(rsWp2.get("cust_cd",i).equals("")) { %>
				<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp2.get("empl_no",i)%>')"><%}%><%=rsWp2.get("empl_nm",i)%></a></td>
				<td class="t-center"><%=FormatUtil.juminNo(rsWp2.get("reside_no",i),"x")%></td>
			<% }else { %>
				<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp2.get("cust_cd",i)%>')"><%}%><%=rsWp2.get("cust_nm",i)%></a></td>
				<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp2.get("cust_reg_no",i))%><%=box.get("excel_yn").equals("Y")?"&nbsp;":""%></td>
			<% } %>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_amt_tmp))%></td>
				<td><%=rsWp2.get("etc_remark",i)%></td>
			</tr>	
		<% } %>
		<% if(rsWp2.getLength() == 0) { %>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<% } %>	
		<% for(int i=0; i < 9-row_cnt; i++) { %>
				<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<% } %>
		<% if(rsWp2.getLength() != 0)  { %>
			<tr>
				<td class="t-center">소계</td>
				<td></td>
				<td></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_amt_sum2))%></td>
				<td></td>
			</tr>
		<% } %>
		<!-- 고유목적사업 관련 운영경비 -->
			<tr> 
				<td rowspan="<%=row_cnt2+1%>" class="t-left">III.고유목적사업<br>&nbsp;&nbsp;&nbsp;&nbsp;관련 운영경비</td>
		<% long slip_amt_sum3 = 0;
			   long slip_amt_tmp3 = 0;
			   long cur_acum = rbox.getLong("cur_acum"); 
			   for(int i=0; i < row_cnt2; i++) {	
					slip_amt_tmp3 = rsWp3.getLong("slip_amt",i);
					if(cur_acum == 0) { break; }
					if(cur_acum <= slip_amt_tmp3) { slip_amt_tmp3=cur_acum; cur_acum=0;} 
					slip_amt_sum3 += slip_amt_tmp3; 
				
					xmlBuf += "<LIST>\n"
						   +  "	<acct_nm>"+rsWp3.get("acct_nm",i)+"</acct_nm>\n"
						   +  "	<empl_no>"+rsWp3.get("empl_no",i)+"</empl_no>\n"
						   +  "	<empl_nm>"+rsWp3.get("empl_nm",i)+"</empl_nm>\n" 
						   +  "	<cust_cd>"+rsWp3.get("cust_cd",i)+"</cust_cd>\n" 
						   +  "	<cust_nm>"+rsWp3.get("cust_nm",i)+"</cust_nm>\n" 
						   +  "	<reside_no>"+FormatUtil.juminNo(rsWp3.get("reside_no",i),"x")+"</reside_no>\n" 
						   +  "	<cust_reg_no>"+FormatUtil.bizRegiNoFormat(rsWp3.get("cust_reg_no",i))+"</cust_reg_no>\n" 
						   +  "	<slip_amt_tmp>"+FormatUtil.insertComma(String.valueOf(slip_amt_tmp3))+"</slip_amt_tmp>\n" 
						   +  "	<etc_remark>"+rsWp3.get("etc_remark",i)+"</etc_remark>\n" 
						   +  "	<biz_type>72</biz_type>\n" 
					   +  "</LIST>\n"; %>
			<%if(i>0){%><tr><%}%>
				<td><%=rsWp3.get("acct_nm",i)%></td>
			<% if(rsWp3.get("cust_cd",i).equals("")) { %>
				<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp3.get("empl_no",i)%>')"><%}%><b><%=rsWp3.get("empl_nm",i)%></b></a></td>
				<td class="t-center"><%=FormatUtil.juminNo(rsWp3.get("cust_reg_no",i),"x")%></td>
			<% }else { %>
				<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp3.get("cust_cd",i)%>')"><%}%><b><%=rsWp3.get("cust_nm",i)%></b></a></td>
				<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp3.get("cust_reg_no",i))%><%=box.get("excel_yn").equals("Y")?"&nbsp;":""%></td>
			<% } %>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_amt_tmp3))%></td>
				<td><%=rsWp3.get("etc_remark",i)%></td>
			</tr>	
		<% } %>
		<% if(rsWp3.getLength() == 0) { %>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<% }else { %>
			<tr>
				<td class="t-center">소계</td>
				<td></td>
				<td></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_amt_sum3))%></td>
				<td></td>
			</tr>
		<% } %>
		<!-- 합계 -->
		<% if(rsWp1.getLength() > 0 || rsWp2.getLength() > 0 || rsWp3.getLength() > 0) { %>
			<tr>
				<td colspan="4" class="t-center">⑥  합계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(slip_amt_sum1+slip_amt_sum2+slip_amt_sum3))%></td>
				<td></td>
			</tr>
		<% } %>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>