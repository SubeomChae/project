<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "cong_class@"+uSesEnt.dbo+"|school_flag|condo_cd|sign_status|","","","",""); %>
<!-- 목적사업비집행현황 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		var bugt_cd = document.main.bugt_cd.value
		document.main.page_count.value = '';
		if(gbn == 'E') { 
			document.main.action = 'wel21002_excel.do?excel_yn=Y';
			document.main.target = 'excelFrm';
			document.main.submit();
		}else {
			ajaxReplaceForm("wel21001_list.do", "#main", "#divListData", function() {
				fixTableHeader("MyTable");
			});
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("wel21001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function changeBugtCd(bugt_cd) {
		if(bugt_cd == '') { 
			document.getElementById('trSearch').style.display = 'none';
		}else { 
			document.getElementById('trSearch').style.display = '';
		}
		
		bugt_cd = bugt_cd.substring(0,4);
		var cHtml = '';
		
		if(bugt_cd == 'S001') {
			cHtml = "<b>경조구분</b> : "
				  + "<select name='detail_sel' class='bs-select form-control' style='width:90px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optListJs(codeWp,"cong_class","")%></select>"
				  + "&nbsp;&nbsp;&nbsp;&nbsp;<select name='detail_key' class='bs-select form-control' style='width:90px'>"
				  + "<option value='1'>경조장소</option><option value='2'>성명</option></select> "
				  + "<input type='text' name='detail_val' value='' class='form-control' style='width:150px;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '경조금 지급현황';
		}else if(bugt_cd == 'S002') {
			cHtml = "<select name='detail_key' class='bs-select form-control' style='width:90px'>"
				  + "<option value='1'>질환명</option><option value='2'>의료기관</option><option value='3'>성명</option></select> "
				  + "<input type='text' name='detail_val' value='' class='form-control' style='width:150px; ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '의료비 지원현황';
		}else if(bugt_cd == 'S003') {
			cHtml = "<b>학교구분</b> : "
				  + "<select name='detail_sel' class='bs-select form-control' style='width:90px'>"
			      + "<option value=''>전체</option><%=CodeUtil.optListJs(codeWp,"school_flag","")%></select>"
				  + "&nbsp;&nbsp;&nbsp;&nbsp;<select name='detail_key' class='bs-select form-control' style='width:90px'>"
				  + "<option value='1'>학교명</option><option value='2'>성명</option></select>"
				  + "&nbsp;<input type='text' name='detail_val' value='' class='form-control' style='width:150px;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '학자금 지원현황';
		}else if(bugt_cd == 'S004') {
			cHtml = "<select name='detail_key' class='bs-select form-control' style='width:90px'>"
				  + "<option value='1'>교육명</option><option value='2'>교육기관</option></select> "
				  + "<input type='text' name='detail_val' value='' class='form-control' style='width:150px;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '자기개발비 지원현황';
		}else if(bugt_cd == 'S005') {
			cHtml = "<select name='detail_key class='bs-select form-control' style='width:90px'>"
				  + "<option value='1'>휴양시설명</option></select> "
				  + "<input type='text' name='detail_val' value='' class='form-control' style='width:150px;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '휴양시설이용 지원현황';
		}else if(bugt_cd == 'S006') {
			cHtml = "<b>동호인회</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S006","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '사내동호인회 지원현황';
		}else if(bugt_cd == 'S700') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S700","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '선물지급현황';		
		}else if(bugt_cd == 'S008') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S008","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '연금지급현황';
		}else if(bugt_cd == 'S022') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S022","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '의료비 지원현황';
		}else if(bugt_cd == 'S023') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S023","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '의료비 지원현황';
		}else if(bugt_cd == 'S024') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S024","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '학자금 지원현황';
		}else if(bugt_cd == 'S025') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S025","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '학자금 지원현황';
		}else if(bugt_cd == 'S026') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S026","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '장기근속 지원현황';
		}else if(bugt_cd == 'S027') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='bs-select form-control required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S027","","","",uSesEnt.dbo)%></select> ";
			document.main.excel_file_nm.value = '장기근속 지원현황';
		}else if(bugt_cd == '') {
			cHtml = "";
			document.main.excel_file_nm.value = '목적사업집행현황';
		}

		if(bugt_cd == 'S700') { 
			document.getElementById('divApplyYmd').innerHTML = '지급일자';
			document.getElementById('divText').innerHTML = '세부정보를';
		}else { 
			document.getElementById('divApplyYmd').innerHTML = '신청일자';
			document.getElementById('divText').innerHTML = '목적사업비 신청내역을'; 
		}
		document.getElementById('divDetailKey').innerHTML = cHtml;
	}

	$(function() {
		changeBugtCd('<%=box.get("bugt_cd")%>');
		fixTableHeader("MyTable");
	});
</script>

<iframe id="excelFrm" name="excelFrm" style="display:none"></iframe>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn"  		value="Y">
<input type="hidden" name="excel_file_nm"  	value="">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">목적사업비집행현황</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">목적사업</td>
				<td>
					<select name="bugt_cd" title="목적사업" class="bs-select form-control" style="width:150px" onChange="changeBugtCd(this.value.substring(0,4));">
						<option value="">전체</option>
					<% RsWrapper bizWp = CodeUtil.getRsWrapper("PR_BUDTB_CODE01_LIST","LISTCODE", "", "1","S","","","",uSesEnt.dbo);
						for(int i=0; i < bizWp.getLength(); i++) { if(bizWp.get("code",i).equals("S900")) { continue; } %>
		              		<option value="<%=bizWp.get("code",i)%>"><%=bizWp.get("data",i)%></option> 
		            <% } %>
					</select>
				</td>
				<td class="td-head"><div id="divApplyYmd">신청일자</div></td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="시작일" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="종료일" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="form-control" style="width:95%; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
				</td>
				<td class="td-head">결재상태</td>
				<td>
					<select name="sign_status" title="결재상태" class="bs-select form-control" style="width:120px">
						<option value=''>전체</option>
			            <%=CodeUtil.optList(codeWp, "sign_status", box.get("sign_status"))%>
					</select>
				</td>
			</tr>
	 		<tr id="trSearch">
				<td class="td-head">검색조건</td>
				<td colspan="7"><span id="divDetailKey"></span></td>
	 		</tr>
 		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">성명을 클릭</span>하면 해당 사원의 <span id="divText"></span>&nbsp;조회할 수 있습니다.
		</div>
		<span class="f-right">
  			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
  	</div>
  	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 200px)">
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<thead>
			<% int colspan = 5; %>
				<tr>
				<% if(box.get("bugt_cd").equals("")) { %>
					<th>구분</th>
				<% } %>
					<th>사번</th>
					<th>성명</th>
					<th>부서명</th>
					<th>직위</th>
				<% if(!box.get("bugt_cd").equals("S007") && !box.get("bugt_cd").equals("S008")) { colspan += 2; %>
					<th>신청일자</th>
					<th>신청금액</th>
				<% } %>
				<% if(box.get("bugt_cd").equals("S001")) { colspan += 5; %>	
					<th>가족관계/성명</th>
					<th>주민등록번호</th>
					<th>경조구분</th>
					<th>경조일자</th>
					<th>경조장소</th>
				<% }else if(box.get("bugt_cd").equals("S002")) { colspan += 5; %>	
					<th>가족관계/성명</th>
					<th>주민등록번호</th>
					<th>질병명</th>
					<th>의료기관명</th>
					<th>입원기간</th>
				<% }else if(box.get("bugt_cd").equals("S003")) { colspan += 5; %>	
					<th>가족관계/성명</th>
					<th>주민등록번호</th>
					<th>학교명</th>
					<th>학년/학기</th>
					<th>전공</th>
				<% }else if(box.get("bugt_cd").equals("S004")) { colspan += 5; %>
					<th>교육명</th>
					<th>교육일자</th>
					<th>교육기관</th>
					<th>기관연락처</th>
					<th>기관주소</th>
				<% }else if(box.get("bugt_cd").equals("S005")) { colspan += 3; %>
					<th>휴양시설명</th>
					<th>기간</th>
				<% }else if(box.get("bugt_cd").equals("S006")) { colspan += 4; %>
					<th>동호인회</th>
					<th>행사일자</th>
					<th>장소</th>
					<th>행사내용</th>
				<% }else if(box.get("bugt_cd").equals("S007") || box.get("bugt_cd").equals("S008")) { colspan += 6; %>
					<th>입사일자</th>
					<th>주민번호</th>
					<th>사원구분</th>
					<th>재직상태</th>
					<th>지급일자</th>
					<th>지급액</th>
				<% }else if(box.get("bugt_cd").equals("S022")) {  colspan += 2; %>
					<th>구입일자</th>
					<th>비고</th>
				<% }else if(box.get("bugt_cd").equals("S023")) { colspan += 2; %>
					<th>휴양시설명</th>
					<th>기간</th>
				<% }else if(box.get("bugt_cd").equals("S024")) { colspan += 3; %>
					<th>휴양시설명</th>
					<th>기간</th>
				<% }else if(box.get("bugt_cd").equals("S025")) { colspan += 3; %>
					<th>휴양시설명</th>
					<th>기간</th>
				<% } %>
				<% if(box.get("bugt_cd").equals("")) { %>
					<th>비고</th>
				<% } %>
					<th>상태</th>
          		</tr>
          	</thead>
          	<tbody>
			<% if(!box.get("bugt_cd").equals("") && rsWp.getLength() == 0) { %>
				<tr><td colspan="<%=colspan%>" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr>
				<% if(box.get("bugt_cd").equals("")) { %>
					<td width="10%" class="t-center"><%=rsWp.get("bugt_nm",i)%></td>
				<% } %>
					<td width="6%" class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td width="7%" class="t-center">
						<%if(!box.get("excel_yn").equals("Y")){%>
							<%if(!box.get("bugt_cd").equals("S007") && !box.get("bugt_cd").equals("S008")){%>
								<a href="javascript:goWelfareView('<%=rsWp.get("apply_no",i)%>','<%=rsWp.get("bugt_cd",i)%>');">
							<%}else { %>
								<a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')">
							<% } %>
						<% } %><b><%=rsWp.get("empl_nm",i)%></b></a>
					</td>
					<td width="10%" class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center" width="7%" ><%=rsWp.get("position_nm",i)%></td>
				<% if(!box.get("bugt_cd").equals("S007") && !box.get("bugt_cd").equals("S008")) { %>	
					<td width="7%" class="t-center"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td width="7%" class="t-center"><%=rsWp.get("apply_amt",i,Box.THOUSAND_COMMA)%></td>
				<% } %>	
				<% if(box.get("bugt_cd").equals("S001")) { // 경조금  %>	
					<td class="t-center"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center"><%=rsWp.get("cong_class_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("cong_place",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S002")) { // 의료비   %>
					<td class="t-center"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center"><%=rsWp.get("disease_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("medi_org_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("inner_start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("inner_end_ymd",i,Box.DEF_DATE_FMT)%></td>
				<% }else if(box.get("bugt_cd").equals("S003")) { // 학자금   %>
					<td class="t-center"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center"><%=rsWp.get("school_nm",i)%><%=rsWp.get("school_flag_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("school_year",i)%>학년 <%if(!rsWp.get("school_term",i).equals("")){%><%=rsWp.get("school_term",i)%>학기<%}%></td>
					<td class="t-center"><%=rsWp.get("major_nm",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S004")) { // 자기개발비   %>
					<td class="t-center"><%=rsWp.get("course_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("edu_org_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("edu_org_tel",i)%></td>
					<td class="t-center"><%=rsWp.get("edu_org_addr",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S005")) { // 휴양시설이용   %>
					<td class="t-center"><%=rsWp.get("condo_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
				<% }else if(box.get("bugt_cd").equals("S006")) { // 사내동호인회 지원   %>
					<td class="t-center"><%=rsWp.get("sub_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("event_place",i)%></td>
					<td class="t-center"><%=rsWp.get("event_content",i,Box.MULTILINE_TEXT)%></td>
				<% }else if(box.get("bugt_cd").equals("S007") || box.get("bugt_cd").equals("S008")) { // 선물지급, 연금지급  %>
					<td class="t-center"><%=rsWp.get("entry_ymd",i, Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
					<td class="t-center"><%=rsWp.get("empl_class_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_status_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("pay_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("pay_amt",i,Box.THOUSAND_COMMA)%></td>
				<% }else if(box.get("bugt_cd").equals("S010")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S022")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S023")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S024")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S025")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% } %>
				<% if(box.get("bugt_cd").equals("")) { %>
					<td width="10%" class="t-center"><%=rsWp.get("etc_remark",i)%></td>
				<% } %>
					<td width="7%" class="t-center"><%=rsWp.get("sign_status_nm",i)%></td>
				</tr>
				<% } %>
		   	<% } %>
		   	</tbody>
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, request)%>
<% if(!box.get("ajax_yn").equals("Y")) { %>     		
</div>
<% } %>