<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"    	class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제16호의2서식] 수입배당금액명세서 -->
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

	<h2 class="page-title-2depths">수입배당금액명세서</h2>

	<div class="table-top-control">
		<span style="float:right;">[별지 제16호의2서식]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB10">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>	
       		<tr>
				<td width="10%">사업연도</td>
				<td><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
				<td width="10%">법인명</td>
				<td><%=obox.get("corp_nm")%></td>
				<td width="15%">사업자등록번호</td>
				<td><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
       		</tr> 
       	</table>
        
         <table class="table table-bordered order-column table-cover marB10">
          	<tr>
				<td colspan="6" class="t-left"><strong>1. 지주회사 또는 출자법인 현황</strong></td>								
       		</tr> 
       		<tr>
       			<td width="15%">①법인명</td>
       			<td width="10%">②구분</td>
       			<td width="15%">③사업자등록번호</td>
       			<td width="30%">④소재지</td>
       			<td width="15%">⑤대표자 성명</td>
       			<td width="15%">⑥업태종목</td>
       		</tr>
      		<% if(rsWp.getLength() == 0) { %>
			<tr height="25"><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
	   	   for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr height="28"> 
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<% } %>
		<% } %>
		</table>
  
       	<table class="table table-bordered order-column table-cover marB10">
       		<tr>
				<td colspan="7" class="t-left"><strong>2. 자회사 또는 배당금 지금법인 현황</strong></td>								
       		</tr>
       		<tr>
       			<td width="15%">⑦법인명</td>
       			<td width="10%">⑧구분</td>
       			<td width="15%">⑨사업자등록번호</td>
       			<td width="25%">⑩소재지</td>
       			<td width="10%">⑪대표자</td>
       			<td width="10%">⑫발행<br>주식총수</td>
       			<td width="15%">⑬지분율(%)</td>
       		</tr>
	 	<% if(rsWp.getLength() == 0) { %>
			<tr height="25"><td colspan="7" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
	   	   for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr height="28" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<% } %>
		<% } %>
       	</table>
        
	   	<table class="table table-bordered order-column table-cover marB0">			
			<tr>
				<td colspan="6" class="t-left"><strong>3. 수입배당금 및 익금불산입 금액 명세</strong></td>								
	      		</tr> 
	      		<tr>
	      			<td width="16%">(14)자회사 또는<br>배당금<br>지급법인명</td>
	      			<td width="16%">(15)배당금액</td>
	      			<td width="17%">(16)익금불산입<br>비율(%)</td>
	      			<td width="17%">(17)익금불산입<br>대상금액<br>(15×16)</td>
	      			<td width="17%">(18)지급이자 관련<br>익금불산입<br>배제금액</td>
	      			<td width="17%">(19)익금불산입액(17×18)</td>
	      		</tr>
	       	<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
	   	   for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr> 
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<% } %>							
			<tr> 
				<td class="t-center">계</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		<% } %>
		</table>
	</div>	
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
