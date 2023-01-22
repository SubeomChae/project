<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- 예적금 거래내역 조회 -->
<% if(!box.get("select_yn").equals("Y")) { %>
<script language="javascript"> 
	function goSearchAccount(gbn) {
		if(formValidate("#viewForm")) {
			var theURL = 'fin12001_list.do';
			if(gbn == 'E') { 
				removeMask("#viewForm");
				document.viewForm.action = theURL + '?excel_yn=Y';
				document.viewForm.target = '_self';
				document.viewForm.submit();
			}else {
				ajaxReplaceForm(theURL, "#viewForm", "#divAccountListData", function() {
					fixTableHeader("AccountTable");
				});
			}
		}
	}
	
	function goPage(page_count) {
		document.viewForm.page_count.value = page_count;
		ajaxReplaceForm("fin12001_list.do", "#viewForm", "#divAccountListData", function() {
			fixTableHeader("AccountTable");
		});
		return false;
	}
	
	$(function() {
		fixTableHeader("AccountTable");
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="account_no" 		value="<%=box.get("account_no")%>">
<input type="hidden" name="select_yn"  		value="Y">
<input type="hidden" name="sort_order" 		value="">
<input type="hidden" name="page_count" 		value="">
<input type="hidden" name="excel_file_nm" 	value="예적금거래내역">

	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:15%;">
			<col style="width:75%;">
		</colgroup>
		<tbody>
	 		<tr>
				<td class="td-head">거래일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="거래일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="거래일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
			 			<span class="f-right marR40">
							<button type="button" class="btn btn-primary" onClick="goSearchAccount('N');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn btn-primary" onClick="goSearchAccount('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
				    	</span>
				   </div>	
				</td>
	 		</tr>
	 	</tbody>
	</table>
</form>
			
<div id="divAccountListData" class="contentsRow">
<% } %>


<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">전표번호를 클릭</span>하면 해당 입출금 세부내용을 조회할 수  있습니다.
		</div>
	</div>
	
	<div id="divAccountArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 262px)">	
<% } %>
		<table id="AccountTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:4%">
				<col style="width:12%">
				<col style="width:13%">
				<col style="width:13%">
				<col style="width:15%">
				<col style="width:*">
				<col style="width:15%">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>거래일자</th>
					<th>입금</th>
					<th>출금</th>
					<th>잔액</th>
					<th>적요</th>
					<th>전표번호</th>
     			</tr>
     		</thead>
     		<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="7" class="t-center">거래내역이 존재하지 않습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr bgcolor="<%=rsWp.get("sort_key",i).equals("z")?"f6f6f6":""%>"> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("txn_ymd",i).equals("00000000") ? "전기이월" : (rsWp.get("txn_ymd",i).equals("합계")?rsWp.get("txn_ymd",i):rsWp.get("txn_ymd",i,Box.DEF_DATE_FMT))%></td>
					<td class="t-right"><%=rsWp.get("cha_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("dae_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("remain_amt",i,Box.THOUSAND_COMMA)%></td>
					<td	class="t-left"><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>')"><%}%><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></a></td>
				</tr>
				<% } %>
			<% } %>
			</tbody>
		</table>

<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 100, 5, "COUNT", request)%>
<% } %>
<% if(!box.get("select_yn").equals("Y")) { %>
</div>
<% } %>