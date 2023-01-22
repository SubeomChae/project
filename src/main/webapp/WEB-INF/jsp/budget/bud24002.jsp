<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(!box.get("ajax_yn").equals("Y")) { %>

<title>예산집행실적조회</title>

<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
	    	var pageUrl = 'bud24002_list.do';
	      	if(gbn == 'E') { 
	        	if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
	            	pageUrl += '?excel_yn=P&excel_form_no=BUD24002';
	            	//showServerWorking('엑셀파일을 생성중입니다. 잠시만 기다려 주세요.' ,$("#btnExcel").offset().top ,$("#btnExcel").offset().left);
	            	ajaxSubmitForm(pageUrl,"#main", function(rtn) {
	            		hideServerWorking();
						fixTableHeader("MyTable");
	            		if(rtn.isOk == "Y") {
	                		poiExcelDownload(rtn.excelPath);
	               		}else {
	                		alert(rtn.errMsg);
	             		}
	         		});
	     		}
	     		return;
	    	}
			ajaxReplaceForm(pageUrl, "#main", "#divListData");
	  	}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("bud24002_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function set_bugt_option(bugt_yy, bugt_class) {
		document.main.bugt_cd.options.length=0;
		if(bugt_class != '') {
			setOptionByProcDbo('PR_BUDTB_BUGT01_LIST@LISTCODE', document.main.bugt_cd, '', bugt_yy, bugt_class, '', '', 'Y', ':: 사업명 선택 ::', '', '<%=uSesEnt.dbo%>');
		}
	}

	function goPrint() {
		var bugt_cd = document.main.bugt_cd.value
		goUbiViewer('WEB-INF/jsp/budget/report/bud24002.jrf', 'P_PARAM01!<%=box.get("bugt_yy")%>!P_PARAM02!'+bugt_cd+'!');
	}
	$(function() {
		document.main.bugt_cd.options.length=0;
		setOptionByProcDbo('PR_BUDTB_BUGT01_LIST@LISTCODE', document.main.bugt_cd, '<%=box.get("bugt_cd")%>', '<%=box.get("bugt_yy")%>', '<%=box.get("bugt_class")%>', '', '', 'Y', ':: 사업명 선택 ::', '','<%=uSesEnt.dbo%>');
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" value="Y">
<input type="hidden" name="excel_file_nm" value="예산집행실적조회">
<input type="hidden" name="page_count" 	value="">
	
	<h1 class="page-title">예산집행실적 조회</h1>

	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:35%;">
		</colgroup>
		<tbody>	
			<tr>
				<th>기준년도</th>
				<td style="padding-left:5px">
					<select name="bugt_yy" title="기준년도" class="bs-select form-control" style="width:100px" onChange="set_bugt_option(this.value, document.main.bugt_class.value)">
						<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<th>사업명</th>
				<td nowrap style="padding-left:5px">
					<select name="bugt_class" class="bs-select form-control" title="사업구분" onChange="set_bugt_option(document.main.bugt_yy.value, this.value)" style="width:100px">
						<option value='S' <%=box.get("bugt_class").equals("S")?"selected":""%>>목적사업</option>
						<option value='L' <%=box.get("bugt_class").equals("L")?"selected":""%>>대부사업</option>
					</select>
					<select name="bugt_cd" title="사업명" class="bs-select form-control required" style="width:150px" >
						<option value=''>:: 사업명 선택 ::</option>
					</select>
				<th>
					<select name="search_key" class="bs-select form-control" style="width:90%" >
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
						<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>적요</option>
					</select>
				</th>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class='form-control' style="width:120px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						<button type="button" class="btn dark" onClick="goPrint()"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<div id="divListData" class="contentsRow">
<% } %>
	<div>
		<span style="color:#01a1db;">전표번호를 클릭</span>하면 전표세부내용을 조회할 수 있습니다. 
		<span class="f-right">(단위 : 원)</span>
	</div>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 210px);">
		<table class="table table-striped table-bordered table-hover order-column padB5">
			<colgroup>
				<col style="width:5%;">
				<col style="width:10%;">
				<col style="width:20%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:8%;">
				<col style="width:15%;">
				<col style="width:10%;">
				<col style="width:12%;">
			</colgroup>
			<thaed>
				<tr>
					<th>No</th>
					<th>집행일자</th>
					<th>적요</th>
					<th>집행금액</th>
					<th>원인행위</th>
					<th>성명</th>
					<th>부서</th>
					<th>직위</th>
					<th>전표번호</th>
				</tr> 
			</thaed>
			<tbody>
		<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr height="25"><td colspan="9" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else if(rsWp.getLength() > 0) {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr class="odd gradeX">
					<td><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
					<td><%=rsWp.get("sign_ymd",i).equals("") ? rsWp.get("wrt_ymd",i,Box.DEF_DATE_FMT) : rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-left" style="letter-spacing:-1px"><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-right" style="padding-right:5px"><%=rsWp.get("sign_status",i).equals("3") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : ""%></td>
					<td class="t-right" style="padding-right:5px"><%=rsWp.get("sign_status",i).equals("3") ? "" : rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td><%=rsWp.get("dept_nm",i)%></td>
					<td><%=rsWp.get("position_nm",i)%></td>
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>')"><%}%><span style="letter-spacing:0px"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></span></a></td>
				</tr>	
			<% } %>
		<% } %>
			</tbody>
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, request)%>

	<% if(box.get("select_yn").equals("Y")) { %>
		<table class="table table-view table-bordered table-cover marT40">
			<tr> 
				<th width="12%" class="td-head">예산금액</th>
				<td width="12%" class="t-right" style="padding-right:10px"><%=obox.get("bugt_amt",Box.THOUSAND_COMMA)%></td>
				<th width="12%" class="td-head">집행금액</th>
				<td width="12%" class="t-right" style="padding-right:10px"><%=obox.get("exec_amt",Box.THOUSAND_COMMA)%></td>
				<th width="12%" class="td-head">원인행위</th>
				<td width="12%" class="t-right" style="padding-right:10px"><%=obox.get("cause_amt",Box.THOUSAND_COMMA)%></td>
				<th width="12%" class="td-head">사용한도금액</th>
				<td width="12%" class="t-right" style="padding-right:10px"><%=obox.get("remain_amt",Box.THOUSAND_COMMA)%></td>
			</tr>	
		</table>
	<% } %>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
