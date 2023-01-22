<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- 부가세자료관리 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'vat01001.do';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y'; }
	
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
			fixTableHeader("MyTable");			
		}
	}
	
	function goCreate() {
		if(confirm('부가세 자료를 생성하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'vat01001_create.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}

	function goEdit(tax_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(tax_no != '') { $("tr[tax_no='"+tax_no+"']").addClass("bg-yellow"); }

		var pageUrl = '/tax/fd/vat01002_edit.do?tax_no='+tax_no;
		$('#ifrm').attr('src', pageUrl);
	}

	function goUpload() {
    	var file_nm = document.main.upload_file.value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'xls') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[xls 형식만 업로드 가능)');
    		return;
    	}
    	
    	if(confirm('등록하시겠습니까?')) {
    		displaySinjaxAlert(200,100,'처리중입니다. 잠시만 기다려 주십시오.');
	        document.main.filename.value = file_nm; 
	        document.main.action = 'vat01001_upload';
	    	document.main.target = '_self';
	    	document.main.submit();
    	}
    }
    
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('N');
	}
	
	$(function() {
		<% if(rsWp.getLength() > 0) { %>
			setBackColor(0);
			goEdit('<%=rsWp.get("tax_no",0)%>');
		<% } %>
		fixTableHeader("MyTable");
	})
</script>


<form name="main" method="post" action="" class="fType" style="margin:0px" enctype="multipart/form-data">
<input type="hidden" name="selectedRow" 	value="">
<input type="hidden" name="sort_order"  	value="">
<input type="hidden" name="select_yn" 		value="Y">
<input type="hidden" name="excel_file_nm" 	value="부가세자료관리">

	<h1 class="page-title">부가세 자료관리</h1>

	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td class="td-head" style="width:10%">신고기수</td>
				<td>
					<select name="tax_year" title="신고년도" class="bs-select form-control required" style="width:80px;">
						<%=DateUtil.getYearOptionTag(box.get("tax_year"),"2011",DateUtil.getYear(),"desc","년")%>
					</select>
					<select name="tax_gisu" title="신고기수" class="bs-select form-control required" style="width:80px">
						<option value=''>선택</option>
	           			<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("tax_gisu"),"tax_gisu","","","","")%>
					</select>
					<%if(!box.get("tax_gisu").equals("")) { %>
						<button type='button' class='btn btn-primary btn-table' onClick="goCreate();">자료생성</button>
					<% } %>
					
				</td>
				<td class="td-head" width="10%">증빙구분</td>
				<td>
					<select name="acct_flag" title="계정구분" class="bs-select form-control" style="width:60px">
						<option value='B' <%=box.get("acct_flag").equals("B")?"selected":""%>>매입</option>
						<option value='S' <%=box.get("acct_flag").equals("S")?"selected":""%>>매출</option>
					</select>
					<select name="vat_cd" title="증빙유형" class="bs-select form-control" style="width:150px">
						<option value=''>전체</option>
	           			<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("vat_cd"),"vat_cd","","","","")%>
					</select>
				</td>
				<td class="td-head" width="10%">
					<select name="search_key" class="bs-select form-control" style="width:90px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>거래처</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>적요</option>
					</select>
				</th>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')">
					<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
				</td>
  			</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-guide">
		<span style="color:#01a1db;">부가세 신고대상 자료를 관리</span>하는 화면입니다.
		<% if(rsWp.getLength() > 0 && false) { %>
			<div width="290">
      			※ <span style="color:#01a1db;">전자세금계산서 등 일괄작업</span>&nbsp;&nbsp;
				<a href="javascript:goSearch('E');"><img src="/com/img/icon_xls.gif" border="0" align="absmiddle"> 엑셀다운로드</a>&nbsp;
       		</div>	
			<div style="overflow:hidden; width:53; height:20;background-image:url(/com/img/btn_upload.gif)">
				<input type="file" name="upload_file" style="width:50; height:20; filter:Alpha(Opacity=0);Opacity:0" onChange="go_upload()">
				<input type="text" name="filename" style="display:none"> 
			</div>
       	<% }else { %>	
       		<div width="350"></div>
       	<% } %>
	</div>
	
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 165px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<thead>
						<tr>
						<% if(!box.get("excel_yn").equals("Y")) { %>	
							<th width="20%"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.proof_ymd')"><%}%>증빙일자</a></th>
							<th width="35%"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.cust_nm')"><%}%>거래처</a></th>
							<th width="25%"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.vat_cd')"><%}%>구분</a></th>
							<th width="20%"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('nvl(t1.vat_amt,0) desc')"><%}%>부가세</a></th>
						<% }else { %>	
							<th>업로드Key</td>
							<th>증빙일자</td>
							<th>거래처</td>
							<th>사업자번호</td>
							<th>증빙유형</td>
							<th>품명</td>
							<th>공급가액</td>
							<th>부가세액</td>
							<th>전자(Y/N)</td>
							<th>15일(Y/N)</td>
							<th>전표번호</td>
							<th>증빙번호</td>
						<% } %>	
		          		</tr>
	          		</thead>
	          		<tbody>
				    <% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
							<tr><td colspan="15" class="t-center">검색된 자료가 없습니다.</td></tr>
					<% }else if(rsWp.getLength() > 0) { 
	 						for(int i=0; i < rsWp.getLength(); i++) { %> 
							<% if(!box.get("excel_yn").equals("Y")) { %>	
							<tr id="tr_<%=i%>" tax_no="<%=rsWp.get("tax_no",i)%>" style="cursor:pointer" onClick="goEdit('<%=rsWp.get("tax_no",i)%>')"> 
								<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
								<td><%=rsWp.get("cust_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("vat_nm",i)%></td>
								<td class="t-right" style="padding-right:2px"><%=rsWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
							</tr>	
							<% }else { %>	
							<tr> 
								<td class="t-center" bgcolor="yellow"><%=rsWp.get("tax_no",i)%></td>
								<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
								<td><%=rsWp.get("cust_nm",i)%></td>
								<td class="t-center"><%=FormatUtil.bizRegiNoFormat(rsWp.get("saupja_no",i))%></td>
								<td><%=rsWp.get("vat_nm",i)%></td>
								<td><%=rsWp.get("remark",i)%></td>
								<td class="t-right"><%=rsWp.get("gong_amt",i,Box.THOUSAND_COMMA)%></td>
								<td class="t-right"><%=rsWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
								<td class="t-center" bgcolor="white"><%=rsWp.get("etax_yn",i)%></td>
								<td class="t-center" bgcolor="white"><%=rsWp.get("pass15_yn",i)%></td>
								<td class="t-center"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></td>
								<td class="t-center"><%=rsWp.get("proof_no",i)%></td>
							</tr>	
							<% } %>	
						<% } %>
		  			<% } %>
	  				</tbody>
				</table>				
			</div>
			<% if(rsWp.getLength() > 0) { %>
				<%=PageUtil.makePaging(box, rsWp, 30, 5, "", request)%>
			<% } %>
		</div>
		
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
	    	<iframe name="ifrm" id="ifrm"  marginwidth="0" frameborder="0" width="100%" height="800" scrolling="no"></iframe>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>	
</div>
<% } %>