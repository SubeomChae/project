<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 계정과목 찾기 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">	
	function goSearch() {
		document.pForm.page_count.value = '';
		ajaxReplaceForm("acctCodeSearch.do", "#pForm", "#divListData", function() {
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.pForm.page_count.value = page_count;
		ajaxReplaceForm("acctCodeSearch.do", "#pForm", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goSelect(acct_cd, acct_nm, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_flag, rel_no_type, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr) {			    	  
		var openURL = getMethodFromUrl(opener.location.href).substring(0,8);
		if(!isEmpty(document.pForm.column)) {
			arr = document.pForm.column.value.split(',');
			target_cd = arr[0]; target_nm = arr[1];
			form_nm = arr.length > 2 ? arr[2] : 'main';
			eval('opener.document.'+form_nm+'.'+target_cd).value = acct_cd;
			eval('opener.document.'+form_nm+'.'+target_nm).value = acct_nm;
			if(openURL == 'rpt03001') { // 총계정원장
				if(target_cd == 'acct_cd1' && isEmpty(opener.document.main.acct_cd2)) {
					opener.document.main.acct_cd2.value = acct_cd;
					opener.document.main.acct_nm2.value = acct_nm;
				}
			}//현금등
		}else if(openURL == 'acc01001') {// 계정과목코드
			opener.document.form1.old_acct_cd.value = acct_cd;
		}else if(openURL == 'slp01001') { // 일반전표
			opener.document.main.acct_cd.value = acct_cd;
			opener.document.main.acct_nm.value = acct_nm;
			opener._changeAcctCodePost(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_type, rel_no_flag, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr);
		}else {
			opener.document.main.acct_cd.value = acct_cd;
			opener.document.main.acct_nm.value = acct_nm;
		}
		parent.window.close();
	}
	
	$(function() {
		fixTableHeader("MyTable");
		$(".page-logo-text").html("계정과목찾기");	
	});
</script>

<form id="pForm" name="pForm" method="post" class="fType" action="">
<input type="hidden" name="column" 		value="<%=box.get("column")%>">
<input type="hidden" name="code_lth" 	value="<%=box.get("code_lth")%>">
<input type="hidden" name="edit_yn" 	value="<%=box.get("edit_yn")%>">
<input type="hidden" name="page_count" 	value="">

	<div class="table-top-guide">
		<span style="color:#01a1db;">검색하고자 하는 계정과목 또는 적요를 기재하세요.</span> 
		<p>명칭에 포함되는 일부 문자열을 입력해서 검색할 수 있습니다.(예: '<b>현금</b>', '<b>경조</b>' 등)</p>
	</div>

	<table class="search-panel table table-bordered">
 		<tr> 
			<td>
				<select name="acct_class" class="bs-select form-control" style="width:120px" onChange="goSearch()">
					<option value=''>전체</option>
					<option value='1' <%=box.get("acct_class").equals("1")?"selected":""%>>자산</option>
					<option value='2' <%=box.get("acct_class").equals("2")?"selected":""%>>부채</option>
					<option value='3' <%=box.get("acct_class").equals("3")?"selected":""%>>자본</option>
					<option value='6' <%=box.get("acct_class").equals("6")?"selected":""%>>수익</option>
					<option value='7' <%=box.get("acct_class").equals("7")?"selected":""%>>비용</option>
					<option value='71' <%=box.get("acct_class").equals("71")?"selected":""%>>&nbsp;사업비용</option>
					<option value='72' <%=box.get("acct_class").equals("72")?"selected":""%>>&nbsp;일반관리비</option>
				</select>
				<select name="search_key" class="bs-select form-control" style="width:100px">
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>계정과목명</option>
					<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>적요</option>
				</select>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:120px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
				<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			</td>
		</tr>
	</table>
	<div id="divListData" class="contentsRow">
<% } %>
		<div class="table-scrollable scrollOptionY" style="height:380px">
			<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
				<thead>
					<tr>
						<th width="12%">코드</th>
						<th width="66%">계정과목명</th>
					  	<th width="22%">계정분류</th>
					</tr>
				</thead>
				<tbody>
	  			<% for(int i=0; i < rsWp.getLength(); i++) {  %>
					<tr>
						<td class="t-center"><%=rsWp.get("acct_cd",i)%></td>
						<td class="t-left"><a href="javascript:goSelect('<%=rsWp.get("acct_cd",i)%>','<%=rsWp.get("acct_nm",i)%>','<%=rsWp.get("cust_cd_flag",i)%>', '<%=rsWp.get("cost_dept_flag",i)%>', '<%=rsWp.get("empl_no_flag",i)%>', '<%=rsWp.get("rel_no_flag",i)%>', '<%=rsWp.get("rel_no_type",i)%>', 
						   								'<%=rsWp.get("issue_ymd_flag",i)%>', '<%=rsWp.get("finish_ymd_flag",i)%>', '<%=rsWp.get("intr_rate_flag",i)%>', '<%=rsWp.get("tax_rate_flag",i)%>', '<%=rsWp.get("vat_cd_flag",i)%>',
						   								'<%=rsWp.get("bugt_arr",i)%>');">
					  									 <%=rsWp.get("acct_nm",i)%></a>
						<td class="t-center"><%=rsWp.get("upper_nm",i)%></td>
					</tr>
	  			<% } %>      
  				</tbody>         
			</table>
		</div>
		<% if(rsWp.getLength() > 0) {  %>
    		<%=PageUtil.makePaging(box, rsWp, 100, request)%>
		<% } %>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span>
	        <% if(box.get("use_flag").equals("*")) { %>
				<input type="hidden" name="use_flag" value="<%=box.get("use_flag")%>">
        	<% }else { %>
				<label class="mt-checkbox mt-checkbox-outline">
					<input type="checkbox" name="use_flag" value="A1" <%=box.get("use_flag").equals("A1")?"checked":""%> onClick="goSearch()">자주 사용하는 계정과목만 검색<span/>
				</label>
        	<% } %>
          	</span>
       	</span>	      	
	</div>
<% } %>		      	
</form>