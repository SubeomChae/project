<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 복지카드 관리  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<%	String biz_nm = box.get("card_type").equals("A") ? "법인카드" : "복지카드"; %>
<script language="javascript">
	function goSearch(card_no) {
		document.main.page_count.value = '';
		ajaxReplaceForm("crd01001_list.do", "#main", "#divListData", function() {
			if(card_no == '') {
				if ($("tr[id='tr_0']").attr("card_no") != undefined) {
					goEdit($("tr[id='tr_0']").attr("card_no"));
				}
			}else {
				goEdit(card_no); 
			}
			fixTableHeader("MyTable");
		});
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("crd01001_list.do", "#main", "#divListData", function() {
			var card_no = $("tr[id='tr_0']").attr("card_no");
			if(card_no != undefined) { goEdit(card_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}

	function goWrite(){
		$("tr[id^='tr_']").removeClass("bg-yellow");
		var theURL = "crd01002_edit.do?1=1&card_type=<%=box.get("card_type")%>"
		ajaxReplaceForm(theURL, "#main", "#divFrame");
	}
	
	function goEdit(card_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(card_no != '') { $("tr[card_no='"+card_no+"']").addClass("bg-yellow"); }
		var pageUrl = 'crd01002_edit.do?card_no='+card_no;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}

 	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('');
	}

	$(function() {
		<% if(rsWp.getLength() < 1) { %>
			goWrite();
		<% }else { %>
			var card_no = <%=rsWp.get("card_no",0)%>
			$("tr[card_no='"+card_no+"']").addClass("bg-yellow");
			goEdit(card_no);
		<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="card_type" 	value="<%=box.get("card_type")%>">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title"><%=biz_nm%>관리</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:12%;">
			<col style="width:88%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:110px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>카드번호</option>
			            <option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>카드소지자</option>
					</select>
				</td>
				<td>
					<div class="form-inline">
						<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="bs-select form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="use_yn" value="Y" <%=box.get("use_yn").equals("Y")?"checked":""%>>폐기카드 포함<span/>
						</label>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
						<% if(uSesEnt.use_auth.startsWith("S")) { %>
							<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
						<% } %>
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
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 140px)">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">	
					<colgroup>
						<col style="width:45%">
						<col style="width:22%">
						<col style="width:33%">
					</colgroup>
					<thead>	
						<tr>
							<th><a href="javascript:goSort('t1.card_no')">카드번호</a></th>
							<th><a href="javascript:goSort('t2.empl_nm')">소지자</a></th>
							<th><a href="javascript:goSort('t1.bank_cd')">발급은행</a></th>
		          		</tr> 
		          	</thead>
		          	<tbody>
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" card_no="<%=rsWp.get("card_no",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("card_no",i)%>')"> 
							<td><font color="<%=rsWp.get("use_yn",i).equals("Y")?"black":"red"%>"><%=rsWp.get("card_no_x",i)%></font></td>
							<td><%=rsWp.get("empl_nm",i)%></a></td>
							<td><%=rsWp.get("bank_nm",i)%></td>
						</tr>	
						<% } %>
					<% } %>	
					</tbody>
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "", request)%>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>