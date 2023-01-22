<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 예적금관리 -->

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript"> 	
	function goSearch(account_no) {
		document.main.page_count.value = '';
		ajaxReplaceForm("fin11001_list.do", "#main", "#divListData", function() {
			if(account_no == '') {
				if ($("tr[id='tr_0']").attr("account_no") != undefined) {
					goEdit($("tr[id='tr_0']").attr("account_no"));
				} else {
					$("#ulTab").hide();
				}
			}else {
				goEdit(account_no); 
			}
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("fin11001_list.do", "#main", "#divListData", function() {
			var account_no = $("tr[id='tr_0']").attr("account_no");
			if(account_no != undefined) { goEdit(account_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goTabpage(tabIdx) {
		var account_no = $("[name='account_no']").val();
		var theUrl = "";
		if(tabIdx == 1) {
			theUrl = "/finance/fd/fin11002_edit.do";
		}else if(tabIdx == 2) {
			theUrl = "/finance/fd/fin12001_list.do";
		}
		ajaxReplaceForm(theUrl+"?account_no="+ account_no, "#main", "#divFrame");
	}
	
// 	function goEdit(account_no) {
// 		$('.nav-tabs a[href="#tab1"]').tab('show');
// 		$("tr[id^='tr_']").removeClass("bg-yellow");
// 		if(account_no != '') { $("tr[account_no='"+account_no+"']").addClass("bg-yellow"); }
// 		var pageUrl = 'fin11002_edit.do?account_no='+account_no;
// 		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
// 	}
	
	function goEdit(account_no) {
		$('.nav-tabs a[href="#tab1"]').tab('show');
		$("#tabDef2").show();
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(account_no != '') { $("tr[account_no='"+account_no+"']").addClass("bg-yellow"); }
		var pageUrl = 'fin11002_edit.do?account_no='+account_no;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
		
	}
	
	function goWrite(){
		$("tr[id^='tr_']").removeClass("bg-yellow");
		$("#ulTab> li").removeClass('active');
		$("#tabDef1").addClass('active');
		$("#tabDef2").hide();
		ajaxReplaceForm("fin11002_edit.do", "#main", "#divFrame");
	}

	$(function() {
	<% if(!box.get("account_no").equals("")) { %>
		goEdit('<%=box.get("account_no")%>');
	<% }else if(rsWp.getLength() > 0) { %>
		goEdit('<%=rsWp.get("account_no",0)%>');
	<% }else { %>
		goWrite();
	<% } %>
		fixTableHeader("MyTable");
	});
	
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="tab_index" 	value="1">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count" 	value="">

	<h1 class="page-title">예적금관리</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:*;">
		</colgroup>
		<tbody>
	 		<tr>
				<td class="td-head">은행명</td>
				<td>
					<select name="bank_cd" title="은행명"  class="bs-select form-control"  style="width:120px">
						<option value=''>전체</option>
				        <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("bank_cd"),"bank_cd","","","","A")%>
					</select>
				</td>
				<td class="td-head">예적금유형</td>
				<td>
					<select name="acct_cd" title="예적금유형" class='bs-select form-control' style="width:120px">
						<option value=''>전체</option>
				        <%=CodeUtil.optList("PR_ACCTB_CODE01_LIST","LISTCODE",box.get("acct_cd"),"1","","11","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>계좌번호</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>비고</option>
					</select>
				</td>
				<td nowrap>
					<div class="form-inline">
						<input type="text" name="search_val" class="form-control" value="<%=box.get("search_val")%>" style="width:120px; border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('')">
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="use_yn" value="Y" <%=box.get("use_yn").equals("Y")?"checked":""%>>폐기계좌 포함
							<span></span>
						</label>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
						</span>
					</div>
				</td>
	 		</tr>
	 	</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>
    <div class="row row-set">
        <div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 140px)">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">	
					<colgroup>
						<col style="width:35%;">
						<col style="width:25%;">
						<col style="width:40%;">
					</colgroup>
					<thead>
						<tr>
							<th>예적금유형</th>
							<th>은행명</th>
							<th>계좌번호</th>
						</tr>
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
							<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						  for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" account_no="<%=rsWp.get("account_no",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("account_no",i)%>')"> 
								<td class="t-center"><%=rsWp.get("acct_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("bank_nm",i)%></td>
								<td class="t-center"<%if(rsWp.get("use_yn",i).equals("N")){%> style="color:red"<%}%>><%if(!rsWp.get("rep_account",i).equals("")){%><span class="f11 f-green marR5">(대표)</span> <%}%><%=rsWp.get("account_no",i)%></td>
							</tr>
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
		</div>
		
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
        	<div class="portlet-body">
				<div class="contentsRow portlet-body-hr">
		        	<ul id="ulTab"class="nav nav-tabs">
		                <li id="tabDef1" class="active" onclick="goTabpage(1)">
		                    <a href="#tab1" data-toggle="tab">예적금관리</a>
		                </li>
		                <li id="tabDef2" onclick="goTabpage(2)" >
		                    <a href="#tab2"  data-toggle="tab">예적금거래내역</a>
		                </li>
		              
		            </ul>
		        </div>
			</div>
			<div id="divFrame">

			</div>
		</div>
		
	</div>	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>