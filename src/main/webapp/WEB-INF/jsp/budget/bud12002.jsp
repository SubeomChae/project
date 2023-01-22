<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%-- <%@ include file="/com/include/excel_header.jsp" %> --%>
<% } %>

<title>사업계획수립 :: 수입예산 :: 대부이자수익</title>

<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'bud12002_list.do';
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	$(function() {
		$(".page-logo-text").html("<%=box.get("bugt_yy")%>년 대부이자수익 세부내역");	
	});
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_yy" value="<%=box.get("bugt_yy")%>">
<div id="divListData" class="contentsRow">
    <div>
<%--     	<h1 class="page-title-2depth"><%=box.get("bugt_yy")%>년 대부이자 수익</h1> --%>
		<div class="table-top-control">
			<span class="f-right">
				<button id="btnSave" type="button" class="btn btn-primary" onClick="screenToExcel('#divListData', '<%=box.get("bugt_yy")%>년 대부이자수익 세부내역');"><img src="/com/img/ico_btn_excel.png">엑셀다운</button>
			</span>
		</div>
	</div>
<% } %>	
	<table class="table table-striped table-bordered table-hover order-column table-cover">
		<colgroup>
			<col width="4%"/>
			<col width="7%"/>
			<col width="8%"/>
			<col width="16%"/>
			<col width="12%"/>
			<col width="11%"/>
			<col width="21%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="11%"/>
		</colgroup>			
		<tr height="28" align="center" class="table01_title">
			<th>No</th>  
			<th>사번</th>  
			<th>성명</th>  
			<th>부서</th>  
			<th>대부종류</th> 
			<th>대부잔액</th> 
			<th>이자기산일</th>
			<th>일수</th>   
			<th>이자율 </th> 
			<th>이자수입</th> 
		</tr>
		<% if(rsWp.getLength() == 0) { %>
		<tr height="25"><td colspan="11" align="center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr height="28" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
				<td align="center"><%=String.valueOf(i+1)%></td>
				<td align="center"><%=rsWp.get("empl_no",i)%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("empl_nm",i)%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("cost_dept_nm",i)%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("bugt_nm",i)%></td>
				<td align="right" style="padding-right:2px"><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
				<td align="center"><%=rsWp.get("issue_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("finish_ymd",i,Box.DEF_DATE_FMT)%></td>
				<td align="center"><%=DateUtil.dayDiff(rsWp.get("issue_ymd",i), rsWp.get("finish_ymd",i)) + 1%></td>
				<td align="center"><%=rsWp.get("intr_rate",i)%>%</td>
				<td align="right" style="padding-right:2px"><%=rsWp.get("bugt_amt",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
			<% } %>
		<% } %>
	</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
</div>
</form>
<% } %>