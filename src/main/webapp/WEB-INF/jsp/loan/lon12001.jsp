<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 대부금 일시상환 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(loan_no) {
		document.main.page_count.value = '';
		ajaxReplaceForm("lon12001_list.do", "#main", "#divListData", function() {
			if(loan_no == '') {
				if ($("tr[id='tr_0']").attr("loan_no") != undefined) {
					goDetail($("tr[id='tr_0']").attr("loan_no"));
				}
			}else {
				goDetail(loan_no); 
			}
			fixTableHeader("MyTable");
		});
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("lon12001_list.do", "#main", "#divListData", function() {
			var loan_no = $("tr[id='tr_0']").attr("loan_no");
			if(loan_no != undefined) { goDetail(loan_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goDetail(loan_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(loan_no != '') { $("tr[loan_no='"+loan_no+"']").addClass("bg-yellow"); }
		var pageUrl = 'lon12002_list.do?loan_no='+loan_no;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}

	$(function() {
	<% if(!box.get("loan_no").equals("")) { %>
		goDetail('<%=box.get("loan_no")%>');
	<% }else if(rsWp.getLength() > 0) { %>
		goDetail('<%=rsWp.get("loan_no",0)%>');
	<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">대부금 일시(중도/퇴직)상환</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:18%;">
			<col style="width:10%;">
			<col style="width:18%;">
			<col style="width:10%;">
			<col style="width:34%;">
		</colgroup>
		<tbody>
	  		<tr height="28">
				<td class="td-head">대부종류</td>
				<td>
					<select name="bugt_cd" title="대부종류" class="bs-select form-control" style="width:150px">
						<option value=''>전체</option>
			            <%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",box.get("bugt_cd"),"1","L","","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td><input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:120px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');"></td>
				<td class="td-head">진행상태</td>
				<td>
					<select name="finish_flag" title="진행상태" class="bs-select form-control" style="width:90px">
			            <option value='1' <%=box.get("finish_flag").equals("1")?"selected":""%>>진행중</option>
			            <option value='2' <%=box.get("finish_flag").equals("2")?"selected":""%>>상환완료</option>
					</select>
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
					</span>
			    </td>
	  		</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>

	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 140px)">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:20%;">
						<col style="width:15%;">
						<col style="width:35%">
						<col style="width:30%;">
					</colgroup>
					<thead>	
						<tr>
							<th>대부일자</th>
							<th>성명</th>
							<th>대부종류</th>
							<th>대부잔액</th>
		          		</tr>
		          	</thead>
		          	<tbody> 
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="4" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" loan_no="<%=rsWp.get("loan_no",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("loan_no",i)%>')"> 
							<td class="t-center"><%=rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT)%></td>
							<td class="t-center"><%=rsWp.get("empl_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("bugt_nm",i)%></td>
							<td class="t-right"><%=rsWp.get("remain_amt",i,Box.THOUSAND_COMMA)%></td>
						</tr>	
						<% } %>
					<% } %>	
					</tbody>	
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>