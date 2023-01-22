<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 거래처코드  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">

	function goSearch(cust_cd) {
		document.main.page_count.value = '';
		ajaxReplaceForm("acc02001_list.do", "#main", "#divListData", function() {
			if(cust_cd == '') {
				if ($("tr[id='tr_0']").attr("cust_cd") != undefined) {
					goEdit($("tr[id='tr_0']").attr("cust_cd"));
				}
			}else {
				goEdit(cust_cd); 
			}
			fixTableHeader("MyTable");
		});
	}

	function goExcel() {
		document.main.action = "acc02001_list.do?excel_yn=Y";
		document.main.target = "_self";
		document.main.submit();
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("acc02001_list.do", "#main", "#divListData", function() {
			var cust_cd = $("tr[id='tr_0']").attr("cust_cd");
			if(cust_cd != undefined) { goEdit(cust_cd); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		ajaxReplaceForm("acc02002_write.do", "#main", "#divFrame");
	}
	
	function goEdit(cust_cd) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(cust_cd != '') { $("tr[cust_cd='"+cust_cd+"']").addClass("bg-yellow"); }
		var pageUrl = 'acc02002_edit.do?cust_cd='+cust_cd;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}
	
	$(function() {
		<% if(rsWp.getLength() < 1) { %>
			goWrite();
		<% }else { %>
			var cust_cd = <%=rsWp.get("cust_cd",0)%>
			$("tr[cust_cd='"+cust_cd+"']").addClass("bg-yellow");
			goEdit(cust_cd);
		<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="cust_cd" 		value="">
<input type="hidden" name="page_count"		value="">
<input type="hidden" name="selectedRow" 	value="">
<input type="hidden" name="excel_file_nm" 	value="거래처코드">

	<h1 class="page-title">거래처코드</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td class="td-head" style="width:12%">거래처유형</td>
				<td style="width:12%">
					<select name="cust_type" class="bs-select form-control" style="width:100px">
						<option value=''>전체</option>
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("cust_type"),"cust_type","","","","")%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>거래처명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사업자번호</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>주민등록번호</option>
						<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>대표자성명</option>
						<option value='5' <%=box.get("search_key").equals("5")?"selected":""%>>담당자성명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;ime-mode:active;display:<%=box.get("search_key").equals("6")?"none":""%>" onkeydown="if(event.keyCode == 13) goSearch('');">
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="use_flag" value="N" <%=box.get("use_flag").equals("N")?"checked":""%> style="border:none">삭제코드 포함<span/>
					</label>
					<span class="f-right marR60">
			  			<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
		  			<%if(uSesEnt.use_auth.startsWith("S")||uSesEnt.use_auth.equals("GA")){%>
		  				<button type="button" id="btnExcel" class="btn btn-primary" onclick="goExcel();"><img src="/com/img/ico_btn_excel.png">엑셀</button>
	  				<% } %>
			  			<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">		
<% } %>
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 140px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<thead>
						<tr>
						<% if(!box.get("excel_yn").equals("Y")) { %>
							<th>거래처명</th>
							<th>사업자번호</th>
						<% }else { %>
							<th>코드</th>
							<th>거래처명</th>
							<th>사업자번호</th>
							<th>대표자</th>
							<th>업태</th>
							<th>종목</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>전화번호</th>
						<% } %>
		          		</tr>
		          	</thead>
		          	<tbody> 
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="2" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% }else {
				   			for(int i=0; i < rsWp.getLength(); i++) {	%>
							<% if(!box.get("excel_yn").equals("Y")) { %>
								<tr id="tr_<%=i%>" height="25" cust_cd="<%=rsWp.get("cust_cd",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("cust_cd",i)%>')"> 
									<td class="t-left"><%=rsWp.get("cust_nm",i)%></td>
									<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i))%></td>
								</tr>
							<% }else { %>
								<tr height="25"> 
									<td class="t-center" style="mso-number-format:\@;"><%=rsWp.get("cust_cd",i)%></td>
									<td><%=rsWp.get("cust_nm",i)%></td>
									<td class="t-center"><%=rsWp.get("cust_flag",i).equals("1") ? FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i)) : FormatUtil.juminNo(rsWp.get("cust_reg_no",i),"x")%></td>
									<td class="t-center"><%=rsWp.get("rep_person_nm",i)%></td>
									<td class="t-center"><%=rsWp.get("uptae",i)%></td>
									<td class="t-center"><%=rsWp.get("upjong",i)%></td>
									<td class="t-center"><%=rsWp.get("zip_no",i,Box.ZIP_CODE)%></td>
									<td><%=rsWp.get("addr",i)%></td>
									<td class="t-center"><%=rsWp.get("tel_no",i)%></td>
								</tr>	
						 	<% } %>
					  	<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
		<% if(!box.get("excel_yn").equals("Y")) { %>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
		<% } %>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>