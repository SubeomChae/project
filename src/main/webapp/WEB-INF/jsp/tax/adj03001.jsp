<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- 접대비 지출명세서 -->
<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'adj03001_list.do';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=접대비 지출명세서'; }
	
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('N');
	}
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="sort_order" 	value="">
<input type="hidden" name="select_yn" 	value="Y">

	<h1 class="page-title">접대비 지출명세서</h1>
	
	<table class="search-panel table table-bordered">
  		<tr>
			<td class="td-head" width="13%">기준년도</td>
			<td width="67%">
				<select name="std_yy" class="bs-select form-control required" title="기준년도" style="width:80px">
					<option value=''>선택</option>
					<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2009",DateUtil.getYear())%>
				</select>
				<span style="float:right;">
					<button type="button" class="btn dark" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
				</span>
			</td>
  		</tr>
	</table>
</from>

<div id="divListData" class="contentsRow">
<% } %>			    
	<div class="table-top-control">
		<div class="notice-view">
	  		<span style="color:#01a1db;">상호(성명)를 클릭</span>하면 해당 거래처(사원)의 상세정보를 조회할 수 있습니다.
		</div>
	</div>
          		
    <div class="table-scrollable">
		<table class="table table-striped table-bordered table-hover order-column">
			<tr>
				<th rowspan="2" width="10%">지출일자</th>
				<th rowspan="2" width="10%">지출금액</th>
				<th colspan="3">접대자</th>
				<th colspan="2">접대장소</th>
				<th rowspan="2" width="30%">적요</th>
       		</tr> 
			<tr>
				<th width="8%">성명</th>
				<th width="8%">직위</th>
				<th width="10%">부서</th>
				<th width="13%">상호</th>
				<th width="11%">사업자번호</th>
       		</tr> 
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="20" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_employee_info('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
					<td class="t-center"><%=rsWp.get("position_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%><%if(!box.get("excel_yn").equals("Y")){%></a><%}%></td>
					<td class="t-center"><%=rsWp.get("saupja_no",i)%><%=box.get("excel_yn").equals("Y")?"&nbsp;":""%></td>
					<td><%=rsWp.get("remark",i)%></td>
				</tr>	
				<% } %>
		 	<% } %>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
</div>
<% } %>