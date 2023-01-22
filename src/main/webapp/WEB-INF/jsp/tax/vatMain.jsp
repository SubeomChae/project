<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%-- <%	File dir = new File(Config.getInstance().getProperty("nTax")); --%>
<!-- 	String[] nTaxFile = dir.list(); -->
<!-- 	String fileName1 = "I105.200"; -->
<!-- 	String fileName2 = "C107.200"; -->
<!-- %> -->
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 부가세신고자료 -->
<% if(!box.get("excel_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		debugger;
		var tab_index = document.main.tab_index.value;
		var theURL = '';
		if(tab_index == '1') { // 부가세 명세서
			theURL = 'vat11001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y&excel_file_nm=부가세명세서'; }
		}else if(tab_index == '2') { // 부가세 매입장
			theURL = 'vat12001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y&excel_file_nm=매입장'; } 
			$('#nTaxSpan').hide();
			$('#print').hide();
		}else if(tab_index == '3') { // 세금계산서 합계표
			theURL = 'vat13001_list.do';
			$('#nTaxSpan').show();
			$('#print').show();
			$('#excel').hide();
		}else if(tab_index == '4') { // 계산서 합계
			theURL = 'vat14001_list.do';
			$('#nTaxSpan').show();
			$('#print').show();
			$('#excel').hide();
		}

		if (formValidate("#main")) {
			removeMask("#main");				
			document.main.action = encodeURI(theURL);
			document.main.target = 'ifrm';
			document.main.submit();
		}
	}
	
	function goViewer() {
		var params = document.main.tax_year.value+'|'+document.main.tax_gisu.value+'|';
		var index = document.main.tab_index.value;
		if(index == '3') {
			goUbiViewer('WEB-INF/jsp/tax/report/vat13001.jrf', params);
		}else{
			goUbiViewer('WEB-INF/jsp/tax/report/vat14001.jrf', params);
		}
	}

	function goTabpage(tab_index) {
		document.main.tab_index.value = tab_index;
		for(var i=1; i <= 4; i++) {
			$("#vatTabMenu li").removeClass('active');
			$("#vatTabMenu #tabMenu"+tab_index).addClass('active');
		}

		var pageUrl = '';
		var params = '&tax_year='+document.main.tax_year.value+'&tax_gisu='+document.main.tax_gisu.value;
		if(tab_index == '1') { // 부가세 명세서
			pageUrl = 'tax/vat11001_list.do';
			$('#nTaxSpan').hide();
			$('#excel').show();
			$('#print').hide();
		}else if(tab_index == '2') { // 부가세 매입장
			pageUrl = 'tax/vat12001_list.do';
			$('#nTaxSpan').hide();
			$('#excel').show();
			$('#print').hide();
		}else if(tab_index == '3') {// 세금계산서 합계표
			pageUrl = 'tax/vat13001_list.do';
			$('#nTaxSpan').show();
			$('#excel').hide();
			$('#print').show();
		}else if(tab_index == '4') { // 계산서 합계
			pageUrl = 'tax/vat14001_list.do';
			$('#nTaxSpan').show();
			$('#excel').hide();
			$('#print').show();
		}
		$('#ifrm').attr('src', pageUrl);
	}
	
	$(function () {
		goTabpage('1');
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="tab_index" 	value="<%=FormatUtil.nvl2(box.get("tab_index"),"1")%>">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="pathKey"		value="temp">
<input type="hidden" name="file_nm"  	value="">
<input type="hidden" name="file_path"	value="">

	<h1 class="page-title">부가세신고자료</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td class="td-head" style="width:10%">신고기수</td>
				<td>
					<select name="tax_year" class="bs-select form-control required" title="신고년도" style="width:80px;">
					<%=DateUtil.getYearOptionTag(box.get("tax_year"),"2011",DateUtil.getYear(),"desc","년")%>
					</select>
					<select name="tax_gisu" class="bs-select form-control required" title="신고기수" style="width:80px">
						<option value=''>선택</option>
	         			<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("tax_gisu"),"tax_gisu","","","","")%>
					</select>
				</td>
				<td class="td-head" style="width:10%">증빙구분</td>
				<td>
					<select name="vat_cd" class="bs-select form-control" title="증빙유형" style="width:150px">
						<option value=''>전체</option>
	         			<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("vat_cd"),"vat_cd","","","","")%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>거래처</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>적요</option>
					</select>
				</th>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')">
					<span id="excel" class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
					<span id="print"  class="f-right marR60" style="display:none;">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" id="btnRptViewer" class="btn dark marL5" onclick="goViewer();"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
<% } %>
	<div class="col-md-12 col-xs-12 col-sm-12 row-set-col pad0">
		<div class="portlet-body">
			<div class="contentsRow portlet-body-hr">
				<ul id="vatTabMenu" class="nav nav-tabs mar0">
					<li id="tabMenu1" onClick="goTabpage('1')" <%if(box.get("faq_category").equals("01")){%>class="active"<%}%>><a data-toggle="tab">부가세명세서</a></li>
					<li id="tabMenu2" onClick="goTabpage('2')" <%if(box.get("faq_category").equals("02")){%>class="active"<%}%>><a data-toggle="tab">부가세매입장</a></li>
					<li id="tabMenu3" onClick="goTabpage('3')" <%if(box.get("faq_category").equals("03")){%>class="active"<%}%>><a data-toggle="tab">세금계산서 합계표</a></li>
					<li id="tabMenu4" onClick="goTabpage('4')" <%if(box.get("faq_category").equals("04")){%>class="active"<%}%>><a data-toggle="tab">계산서 합계표</a></li>
				</ul>	
			</div>
		</div>
		<iframe  id="ifrm" name="ifrm" src="about:blank" marginwidth="0" width="100%" height="800" frameborder="0" scrolling="no">

		</iframe>
	</div>
</form>