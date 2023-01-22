<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 계정과목코드  -->
<% if(!box.get("excel_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'acc01001_list.do';
			if(gbn == 'E') {theURL = theURL + '?excel_yn=Y&excel_file_nm=계정과목코드'; }
			removeMask("#main");
			document.main.action = encodeURI(theURL);
			document.main.target = '_self';
			document.main.submit();
			fixTableHeader("MyTable");
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("acc01001_list.do", "#main", "#divListData")
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		ajaxReplaceForm("acc01002_edit.do", "#main", "#divFrame");
	}
	
	function goEdit(acct_cd) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(acct_cd != '') { $("tr[acct_cd='"+acct_cd+"']").addClass("bg-yellow"); }
		var pageUrl = 'acc01002_edit.do?acct_cd='+acct_cd;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}
	
	$(function() {
	<% if(box.get("acct_cd").equals("")) { %>
		goWrite();
	<% }else { %>
		<% for(int i=0; i < rsWp.getLength(); i++) { %> 
			<% if(rsWp.get("acct_cd",i).equals(box.get("acct_cd"))) { %>
				$("tr[acct_cd='"+acct_cd+"']").addClass("bg-yellow");
				goEdit('<%=box.get("acct_cd")%>');
	 		<% } %>
		<% } %>
	<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">계정과목코드</h1>
	
	<table class="search-panel table table-bordered">
		<tr>
			<td width="12%" class="td-head">계정과목구분</td>
			<td width="12%">
				<select name="acct_class" class="bs-select form-control" style="width:80px">
					<option value=''>전체</option>
					<option value='1' <%=box.get("acct_class").equals("1")?"selected":""%>>자산</option>
					<option value='2' <%=box.get("acct_class").equals("2")?"selected":""%>>부채</option>
					<option value='3' <%=box.get("acct_class").equals("3")?"selected":""%>>자본</option>
					<option value='6' <%=box.get("acct_class").equals("6")?"selected":""%>>수익</option>
					<option value='7' <%=box.get("acct_class").equals("7")?"selected":""%>>비용</option>
				</select>
			</td>
			<td width="12%" class="td-head">
				<select name="search_key" class="bs-select form-control" style="width:120px">
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>계정과목명</option>
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>계정과목코드</option>
				</select>
			</td>
			<td>
				<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="form-control" style="width:200px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
				<label class="mt-checkbox mt-checkbox-outline">
					<input type="checkbox" name="use_flag" value="*" <%=box.get("use_flag").equals("*")?"checked":""%> style="border:none">폐지코드 포함<span/>
				</label>
				<span class="f-right marR60">
		  			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
		  		<% if(uSesEnt.use_auth.startsWith("S")) { %>
		  			<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>	
		  		<% } %>	
		  			<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
		  		</span> 
			</td>
  		</tr>
	</table>
</form>
<div id="divListData" class="contentsRow">
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 140px);">
<% } %>
				<table id="MyTable" class="table table-bordered table-hover order-column">
					<thead>
						<tr>
						<% if(!box.get("excel_yn").equals("Y")) { %>
							<th>코드</th>
							<th>계정과목명</th>
						<% }else { %>
							<th>코드</th>
							<th>계정과목명</th>
							<th>사용구분</th>
						<% } %>
		          		</tr>
		          	</thead>
		          	<tbody> 
				<% if(rsWp.getLength() == 0) { %>
						<tr height="25"><td colspan="<%=box.get("excel_yn").equals("Y")?"4":"2"%>" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% } else {
					for(int i=0; i < rsWp.getLength(); i++) { %>
				   		<% if(rsWp.get("acct_cd",i).length() < 7) { %>
							<tr height="25" bgcolor="f6f6f6"> 
					    <% }else { %>
							<tr id="tr_<%=i%>" acct_cd="<%=rsWp.get("acct_cd",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("acct_cd",i)%>')"> 
					    <% } %>
							<% if(!box.get("excel_yn").equals("Y")) { %>
								<td class="t-left" width="50"><%=rsWp.get("acct_cd",i)%></td>
								<td class="t-left" width="*" style="padding-left:<%=(rsWp.get("acct_cd",i).length()-1)*10%>px"><font color="<%=rsWp.get("use_flag",i).equals("X")?"red":""%>"><%=rsWp.get("acct_nm",i)%></font></td>
							<% }else { %>
								<td style="mso-number-format:\@;padding-left:5px"><%=rsWp.get("acct_cd",i)%></td>
								<td class="t-left" style="padding-left:<%=(rsWp.get("acct_cd",i).length()-1)*10%>px"><%=rsWp.get("acct_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("use_flag",i).equals("X")?"폐지":""%></td>
							<% } %>
							</tr>	
						<% } %>
			   		<% } %>
			   		</tbody>
				</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 100, 5, "COUNT", request)%>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>
</div>
<% } %>
