<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<% if(!box.get("excel_yn").equals("Y")) { %>
<!-- 대부금 월별 상환 -->
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			var theURL = 'lon11001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}

	function goPage(page_count) {
		if(formValidate("#main")) {
			document.main.page_count.value = page_count;
			var theURL = 'lon11001_list.do';
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}

	function goCalculate() {
		if(formValidate("#main")) {
			if(document.main.ib_changed.value == 'Y') {
				alert('검색조건이 변경되었습니다. 다시 검색하신 후, 이자계산을 하시기 바랍니다.');
				return;
			}
			
			if(confirm('<%=box.get("std_yy")%>년 <%=box.get("std_mm")%>월 대부금 이자계산을 하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'lon11001_calculate.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDeleteAll() {
		if(formValidate("#main")) {
			if(confirm('<%=box.get("std_yy")%>년 <%=box.get("std_mm")%>월 대부금 상환자료를 전체 삭제하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'lon11001_delete.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goCreateSlip() {
		if(formValidate("#main")) {
			if(document.main.ib_changed.value == 'Y') {
				alert('검색조건이 변경되었습니다. 다시 검색하신 후, 전표분개를 하시기 바랍니다.');
				return;
			}else if(isEmpty(document.main.cha_acct_cd)) {
				alert('입금계정이 선택되지 않았습니다.');
				document.main.cha_acct_cd.focus();
				return;
			}else if(isEmpty(document.main.account_no1)) {
				alert('원금 계좌번호가 선택되지 않았습니다.');
				document.main.account_no1.focus();
				return;
			}else if(isEmpty(document.main.account_no2)) {
				alert('이자 계좌번호가 선택되지 않았습니다.');
				document.main.account_no2.focus();
				return;
			}
			
			if(confirm('전표분개하시겠습니까?')) {
				document.main.action = 'lon11001_create_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}
	
	function changeAcctCd(acct_cd) {
		document.main.account_no1.options.length=0;
		document.main.account_no2.options.length=0;
		if(acct_cd != '') {
			setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.main.account_no1, '', acct_cd, '', '', '', '', ':: 원금 계좌번호 선택 ::');
			copyOptions(document.main.account_no1, document.main.account_no2, '');
			document.main.account_no2.options[0].text = ':: 이자 계좌번호 선택 ::';
		}
	}

	function signRequestPost() { goSearch('N'); }

	// 대부금 상환기준
	function goRefundCond() {
		var params = '&std_yy='+<%=box.get("std_yy")%>
		popupOpen("/loan/pd/lon13001_list.do?1=1"+params, "lon13001", 530, 550);
	}
	
	function goUpload() {
    	var file_nm = document.main.uploadFile.value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'xls') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[xls 형식만 업로드 가능)');
    		return;
    	}

		if(confirm('<%=box.get("std_yy")%>년 <%=box.get("std_mm")%>월 대부금 상환자료를 업로드하시겠습니까?')) {
			ajaxSubmitForm("lon11001_upload.do?pay_key=<%=box.get("std_yy")%><%=box.get("std_mm")%>","#main", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					alert('업로드되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
				$("#uploadFile").val('');
			});
		}
    }
</script>

<form id="main" name="main" method="post" action="" enctype="multipart/form-data" class="fType" style="margin:0px">
<input type="hidden" name="ib_changed" 		value="N">
<input type="hidden" name="pathKey"			value="template">
<input type="hidden" name="file_nm"			value="">
<input type="hidden" name="file_path"		value="">
<input type="hidden" name="page_count"		value="">
<input type="hidden" name="excel_file_nm" 	value="대부금월별상환">

	<h1 class="page-title">대부금 월별 상환
		<div class="form-inline f-right marT10>
		<% if(uSesEnt.use_auth.startsWith("S")) { %>
			<div class="form-group">
				<button type="button" id="btnDownFile" class="btn btn-primary" onclick="fileDownload(document.main, 'loanTemplate.xls', 'loanTemplate.xls')"><img src="/com/img/ico_btn_excel.png">대부금 월별 상환 입력템플릿 다운로드</button>
				<label id="btnUpFile" class="btn btn-primary marL5" for="uploadFile"><img src="/com/img/ico_btn_save.png"> 업로드</label>
				<input type="file" id="uploadFile" name="uploadFile" onChange="goUpload()" style="position:absolute; clip:rect(0, 0, 0, 0);">
			</div>
	 	<% } %>
		</div>
	</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%">
			<col style="width:20%">
			<col style="width:10%">
			<col style="width:20%">
			<col style="width:10%">
			<col style="width:30%">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">기준년월</td>
				<td>
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:120px" onChange="document.main.ib_changed.value='Y';">
            			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2009",DateUtil.nextYear(),"desc","년")%>
					</select>&nbsp;
					<select name="std_mm" title="기준월" class="bs-select form-control" style="width:90px" onChange="goSearch('N')">
            			<%=DateUtil.getMonthOptionTag(box.get("std_mm"),"월")%>
					</select> 
					<input type="hidden" name="refund_ymd" 	value="<%=obox.get("refund_ymd")%>">
				</td>
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
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
					<span class="f-right marR50">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
				</td>
	  		</tr>
	  		<tr>
				<td class="td-head">월별상환기준</td>
				<td colspan="5">
		  		<% if(!obox.get("refund_ymd").equals("")) { %>
					기산일 : <%=obox.get("start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("end_ymd",Box.DEF_DATE_FMT)%> (<%=obox.get("intr_ilsu")%>일), &nbsp;&nbsp;공제회수 : <%=obox.get("gongje_cnt")%>회
		  		<% }else { %>
		  			미등록
		  		<% } %>&nbsp;
					<button type="button" class="btn btn-primary btn-table" onClick="goRefundCond()">수정</button>
		  		<% if(!obox.get("refund_ymd").equals("") && !obox.get("sign_status").equals("2") && !obox.get("sign_status").equals("3")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goCalculate()">이자계산</button>
		  		<% } %>
		  		<% if(obox.getInt("refund_cnt") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goDeleteAll()">전체삭제</button>
		  		<% } %>
			    </td>
	  		</tr>
		<% if(obox.getInt("refund_cnt") > 0) { %>
			<tr>
				<td class="td-head">전표번호</td>
				<td colspan="5">
				<% if(obox.get("slip_no").equals("")) { %>
					<select name="cha_acct_cd" title="입금계정" class="bs-select form-control" style="width:110px" onChange="changeAcctCd(this.value);">
						<option value=''>:: 입금계정 ::</option>
						<option value='1110103'>보통예금</option>
						<option value='1110105'>기업자유예금</option>
					<% if(uSesEnt.dbo.equals("SABOK55") || uSesEnt.dbo.equals("SABOK57")) { %>
						<option value='1110108'>RP</option>
					<% } %>
					</select>
					<select name="account_no1" title="원금계좌번호" class="bs-select form-control" style="width:170px">
						<option value=''>:: 원금 계좌번호 선택 ::</option>
					</select>
					<select name="account_no2" title="이자계좌번호" class="bs-select form-control" style="width:170px">
						<option value=''>:: 이자 계좌번호 선택 ::</option>
					</select>
					<button type="button" class="btn btn-primary btn-table" onClick="goCreateSlip()">전표분개</button>
				<% }else { %>
					<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
					&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
					<% if(obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
					<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
					<% } %>
				<% } %>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>	
</form>
			
<div id="divListData" class="contentsRow">
	<div class="table-top-control">
		<div class="notice-view">
		  	<% if(obox.getInt("refund_cnt") > 0) { %>
		  		<span style="color:#01a1db;">대상자 : </span> <%=obox.get("refund_cnt",Box.THOUSAND_COMMA)%>명,&nbsp;
		  		<span style="color:#01a1db;">원금상환 : </span> <%=obox.get("refund_sum",Box.THOUSAND_COMMA)%>원,&nbsp;
		  		<span style="color:#01a1db;">이자상환 : </span> <%=obox.get("intr_sum",Box.THOUSAND_COMMA)%>원
		  	<% }else { %>
		  		<span style="color:#01a1db;">대부종류를 클릭</span>하면 해당 대부금의 세부내용을 조회할 수 있습니다.
		  	<% } %>
		</div>
	</div>
	
	<div id="divArea" class="table-scrollable" style="height:calc(100vh - 220px);overflow-x:auto;overflow-y:auto">
<% } %>
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column" style="width:1880px !important">
			<colgroup>
				<col style="width:40px">
				<col style="width:90px">
				<col style="width:90px">
				<col style="width:120px">
				<col style="width:120px">
				<col style="width:90px">
				<col style="width:100px">
				<col style="width:100px">
				<col style="width:100px">
				<col style="width:100px">
				<col style="width:80px">
				<col style="width:200px">
				<col style="width:70px">
				<col style="width:70px">
				<col style="width:70px">
				<col style="width:70px">
				<col style="width:90px">
				<col style="width:90px">
				<col style="width:90px">
				<col style="width:100px">
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">No</th>
					<th rowspan="2">사번</th>
					<th rowspan="2">성명</th>
					<th rowspan="2">부서</th>
					<th rowspan="2">대부종류</th>
					<th rowspan="2">대부일자</th>
					<th rowspan="2">대부금액</th>
					<th rowspan="2">1회<br>상환금액</th>
					<th rowspan="2">공제전<br>상환금액</th>
					<th colspan="7">이자계산</th>
					<th colspan="3">당월공제</th>
					<th rowspan="2">공제후<br>대부잔액</th>
          		</tr> 
				<tr>
					<th>공제전<br>대부잔액</th>
					<th>이자율</th>
					<th>이자기산일</th>
					<th>일수</th>
					<th>구분</th>
					<th>공제</th>
					<th>회수</th>
					<th>원금</th>
					<th>이자</th>
					<th>계</th>
          		</tr> 
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="20" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					<td class="t-center"><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goLoanDetail('<%=rsWp.get("loan_no",i)%>')"><%}%><%=rsWp.get("bugt_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("unit_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("pre_refund_sum",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("loan_amt",i)-rsWp.getLong("pre_refund_sum",i)))%></td>
					<td class="t-center"><%=rsWp.get("intr_rate",i)%>%</td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("intr_ilsu",i)%></td>
					<td class="t-center"><%=rsWp.get("defer_yn",i).equals("Y")?"거치":"상환"%></td>
					<td class="t-center"><%=rsWp.get("gongje_cnt",i)%></td>
					<td class="t-center"><%=rsWp.get("cur_refund_cnt",i)%></td>
					<td class="t-right"><%=rsWp.get("cur_refund_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_intr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_gongje_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("loan_amt",i)-rsWp.getLong("pre_refund_sum",i)-rsWp.getLong("cur_refund_amt",i)))%></td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
<%=PageUtil.makePaging(box, rsWp, 30, request)%>
</div>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="대부금 정기상환(<%=obox.get("std_ym",Box.DEF_DATE_FMT)%>)">
<input type="hidden" name="msg_type" 		value="SLP007">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|L21|<%=obox.get("std_ym")%>">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="refund_cnt"		value="<%=obox.get("refund_cnt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="refund_sum"		value="<%=obox.get("refund_sum",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="intr_sum"		value="<%=obox.get("intr_sum",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="std_yy"			value="<%=box.get("std_yy")%>">
<input type="hidden" name="std_mm"			value="<%=box.get("std_mm")%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
<% } %>