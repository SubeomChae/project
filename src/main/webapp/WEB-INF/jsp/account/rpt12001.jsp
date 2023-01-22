<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 계정별잔액증감현황 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'rpt12001_list.do';
			if(gbn == 'E') { 
				document.main.action = theURL + '?excel_yn=Y';
				document.main.target = '_self';
				document.main.submit();
			}else {
				ajaxReplaceForm(theURL, "#main", "#divListData", function() {
					fixTableHeader("MyTable");
				});
			}
		}
	}

	// 보조부 호출
	function goDetail(acct_cd, acct_nm) {
		var params = '&acct_cd='+acct_cd +'&acct_nm='+acct_nm +'&select_yn=Y&popup_yn=Y';
		popupOpen("/account/pd/rpt01001_list.do?1=1"+encodeURI(params), "rpt01001", 1200, 830);
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 		value="Y">
<input type="hidden" name="acct_cd_arr" 	value="<%=box.get("acct_cd_arr")%>">
<input type="hidden" name="excel_file_nm" 	value="계정별잔액 증감현황">

	<h1 class="page-title">계정별잔액 증감현황</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:30%;">
			<col style="width:10%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
	 		<tr height="28">
				<td class="td-head" width="11%">기준년월</td>
				<td>
					<select name="std_year" title="기준년도" class="bs-select form-control" style="width:70px;">
						<%=DateUtil.getYearOptionTag(box.get("std_year"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select> 
					<select name="std_month" title="기준월" class="bs-select form-control" style="width:60px" onChange="goSearch();">
	          			<%=DateUtil.getMonthOptionTag(box.get("std_month"),"월")%>
					</select>			
				</td>
				<td class="td-head">계정과목</td>
				<td>
					<div class="input-group">
						<input type="text" name="acct_nm" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control" style="width:180px;ime-mode:active;" onKeyUp="document.main.acct_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findAccountCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="acct_cd" value="<%=box.get("acct_cd")%>">					
					</div>	
				</td>
				<td class="td-head">회계단위</td>
				<td>
					<select name="acc_unit" title="회계단위" class="bs-select form-control" style="width:150px">
						<option value=''>전체</option>
						<option value='00' <%=box.get("acc_unit").equals("00")?"selected":""%>>목적사업회계</option>
						<option value='20' <%=box.get("acc_unit").equals("20")?"selected":""%>>기금관리회계</option>
					</select>
				</td>
			</tr>
		</tbody>
	</table>	
</form>

<div id="divListData" class="contentsRow">
<% } %>

<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">계정과목을 클릭</span>하면 보조부로 연결됩니다.
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:<%=box.get("popup_yn").equals("Y") ? "650px" : "calc(100vh - 150px)"%>">
<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:24%;">
				<col style="width:19%;">
				<col style="width:19%;">
				<col style="width:19%;">
				<col style="width:19%;">
			</colgroup>
			<thead>
				<tr>
					<th>계정과목</th>
					<th>전기이월</th>
					<th>당기증가</th>
					<th>당기감소</th>
					<th>당기잔액</th>
	         	</tr> 
         	</thead>
         	<tbody>
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="5" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")&&!rsWp.get("acct_cd",i).equals("z")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd",i)%>','<%=rsWp.get("acct_nm",i)%>')"><%}%><%=rsWp.get("acct_nm",i)%></a></td>
					<td class="t-right"><%=rsWp.get("pre_iwol_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_incr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_decr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("pre_iwol_amt",i)+rsWp.getLong("cur_incr_amt",i)-rsWp.getLong("cur_decr_amt",i)))%></td>
				</tr>	
				<% } %>
		   	<% } %>
	   		</tbody>
		</table>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
