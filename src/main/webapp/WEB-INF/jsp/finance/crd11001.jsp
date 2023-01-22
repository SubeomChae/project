<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 복지카드 정산 -->
<% if(!box.get("excel_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'crd11001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }
	
			removeMask("#main");
			fixTableHeader("MyTable");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goUpload() {
    	var file_nm = document.main.uploadFile.value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'xls') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[xls 형식만 업로드 가능)');
    		return;
    	}
    	
    	if(confirm('청구서파일을 업로드하시겠습니까?')) {
			ajaxSubmitForm("crd11001_upload.do","#main", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					alert('업로드되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
    				return;
				}
				$("#uploadFile").val('');
			});
		}
    }
		
	function goCreateSlip() {
		if(formValidate("#main")) {
			if(confirm('복지카드 정산전표를 생성하시겠습니까?')) {
				removeMask("#main");
				document.main.action = 'crd11001_create_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDeleteAll() {
		if(formValidate("#main")) {
			if(confirm('<%=box.get("apply_yy")%>년 <%=box.get("apply_mm")%>월 복지카드 청구서를 전체 삭제하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'crd11001_delete_all.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function sign_request_post() { 
		goSearch('N'); 
	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="pathKey"		value="template">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="excel_file_nm" 	value="복지카드 정산">

	<h1 class="page-title">복지카드 정산</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
	  		<tr>
				<td width="10%" class="td-head">청구년월</td>
				<td width="35%" nowrap>
					<div class="form-inline f-left marL5">
						<select name="apply_yy" title="청구년도" class="bs-select form-control" style="width:90px" onChange="goSearch('N')">
	            			<%=DateUtil.getYearOptionTag(box.get("apply_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
						</select>&nbsp;
						<select name="apply_mm" title="청구월" class="bs-select form-control" style="width:70px" onChange="goSearch('N')">
	            			<%=DateUtil.getMonthOptionTag(box.get("apply_mm"),"월")%>
						</select>
					<% if(rsWp.getLength() == 0) { %>	
						<div class="form-group marL10">
							<button type="button" id="btnDownFile" class="btn btn-primary" onclick="fileDownload(document.main, 'cardBillTemplate.xls', 'cardBillTemplate.xls')"><img src="/com/img/ico_btn_excel.png">업로드 양식 다운로드</button>
							<label id="btnUpFile" class="btn btn-primary marL5" for="uploadFile"><img src="/com/img/ico_btn_save.png"> 업로드</label>
							<input type="file" id="uploadFile" name="uploadFile" onChange="goUpload()" style="position:absolute; clip:rect(0, 0, 0, 0);">
						</div>
					<% }else if(rsWp.getLength() > 0 && !obox.get("sign_status").equals("2") && !obox.get("sign_status").equals("3")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goDeleteAll()">전체삭제</button>
		  			<% } %>
					</div>
			    </td>
		 		<td width="10%" class="td-head">전표번호</td>
				<td width="45%" nowrap>
			 		<div class="form-inline">
				<% if(!obox.get("slip_no").equals("")) { %>
					<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
					&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
					<% if(obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
					<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
					<% } %>
				<% }else { %>
						미작성
			 		<% if(rsWp.getLength() > 0) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goCreateSlip()">전표분개</button>
						<b>(증빙일자 : 
						<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="proof_ymd" name="proof_ymd" value="<%=DateUtil.toString("yyyyMMdd")%>" maxlength="8" title="증빙일자" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
			  		<% } %>
				<% } %>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						</span>
					</div>
			    </td>
		 	</tr>
		</tbody>
	</table>			
</form>

<div id="divListData" class="contentsRow">
	<div class="table-top-guide">
  	<% if(obox.getInt("card_cnt") > 0) { %>
  		<span style="color:#01a1db;">카드수 : </span> <%=obox.get("card_cnt",Box.THOUSAND_COMMA)%>개,&nbsp;
  		<span style="color:#01a1db;">청구건수 : </span> <%=obox.get("apply_cnt",Box.THOUSAND_COMMA)%>건,&nbsp;
  		<span style="color:#01a1db;">청구금액 : </span> <%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>원
  	<% }else { %>
  		<span style="color:#01a1db;">당월 청구서 엑셀파일</span>을 카드회사에서 수령해서 등록하신 후, 정산전표를 분개하시기 바랍니다.
  	<% } %>
	</div>
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">	
<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:5%">
				<col style="width:15%">
				<col style="width:7%">
				<col style="width:8%">
				<col style="width:15%">
				<col style="width:8%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:10%">
				<col style="width:*">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>카드번호</th>
					<th>사번</th>
					<th>성명</th>
					<th>부서명</th>
					<th>청구건수</th>
					<th>청구금액</th>
					<th>수수료</th>
					<th>합계</th>
					<th>비고</th>
	         	</tr> 
	        <tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="10" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("card_no_x",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><% if(!box.get("excel_yn").equals("Y")) { %><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%}%><%=rsWp.get("empl_nm",i)%><% if(!box.get("excel_yn").equals("Y")) { %></a><%}%></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-right"><%=rsWp.get("apply_cnt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("apply_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("charge_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("tot_amt",i,Box.THOUSAND_COMMA)%></td>
					<td><%=rsWp.get("etc_remark",i)%></td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
</div>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="복지카드 정산(<%=obox.get("apply_ym",Box.DEF_DATE_FMT)%>)">
<input type="hidden" name="msg_type" 		value="SLP004">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_ym")%>">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="apply_ym" 		value="<%=box.get("apply_yy")%>년 <%=box.get("apply_mm")%>월">
<input type="hidden" name="apply_cnt" 		value="<%=obox.get("apply_cnt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="apply_amt" 		value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
<% } %>