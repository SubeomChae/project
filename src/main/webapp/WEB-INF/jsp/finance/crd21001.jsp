<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 복지카드 사용내역 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		var theURL = 'crd21001_list.do';
			if(gbn == 'E') { 
				theURL = theURL + '?excel_yn=Y'; 
				returnFormSubmit(document.main, theURL);
				return;
			}
		ajaxReplaceForm(theURL, "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="excel_file_nm" value="복지카드 사용내역">

	<h1 class="page-title">복지카드 사용내역</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:60%;">
		</colgroup>
		<tbody>
	  		<tr height="28">
				<td class="td-head">기준년도</td>
				<td>
					<select name="apply_yy" title="기준년도" class="bs-select form-control" style="width:120px" onChange="goSearch('N')">
            			<%=DateUtil.getYearOptionTag(box.get("apply_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
			    </td>
	  		</tr
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">성명을 클릭</span>하면 해당 임직원 세부정보를 조회할 수 있습니다.
		</div>
		<div class="f-right">(단위 : 원)
		</div>
	</div>
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">
	<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<thead>	
				<tr>
					<th width="6%">사번</th>
					<th width="7%">성명</th>
					<th width="10%">부서명</th>
					<th width="6%">1월</th>
					<th width="6%">2월</th>
					<th width="6%">3월</th>
					<th width="6%">4월</th>
					<th width="6%">5월</th>
					<th width="6%">6월</th>
					<th width="6%">7월</th>
					<th width="6%">8월</th>
					<th width="6%">9월</th>
					<th width="6%">10월</th>
					<th width="6%">11월</th>
					<th width="6%">12월</th>
					<th width="6%">합계</th>
          		</tr>
          	</thead>
          	<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="16" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
		   	   <% if(rsWp.get("empl_nm",i).equals("합계")) { %>
				<tr class="tr-summary"> 
		   	   <% }else { %>
				<tr> 
		   	   <% } %>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><% if(!box.get("excel_yn").equals("Y")) { %><%if(!rsWp.get("empl_nm",i).equals("합계")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%}%><%=rsWp.get("empl_nm",i)%><% if(!box.get("excel_yn").equals("Y")) { %></a><%}%></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-right"><%=rsWp.get("amt01",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt02",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt03",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt04",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt05",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt06",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt07",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt08",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt09",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt10",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt11",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt12",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("amt_tot",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
			<% } %>
		<% } %>
			</tbody>
		</table>
	<% if(!box.get("excel_yn").equals("Y")) { %>	
	</div>
	<% } %>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>