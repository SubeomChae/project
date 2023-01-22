<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="pbox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(box.get("action_type").equals("edit") && rsWp.getLength() > 0) { isEditable = true; }
%>
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y");%>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 직원 복지연금 일괄지급 -->

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {		
			var theURL = '/welfare/fd/wel03001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }
	
			removeMask("#main");	
			fixTableHeader("MyTable");
			<% if(rsWp.getLength() > 0) { %> document.main.unit_count.value = document.form1.unit_count.value; <% } %>
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goSave() {
		if(formValidate("#main")) {
			var new_empl_no = '';
			for(var i=0; i < <%=rsWp.getLength()%>; i++) {
				if(document.all['new_empl_no'+i].checked) { new_empl_no += document.all['new_empl_no'+i].value; }
			}
			if(new_empl_no == '') {
				alert('지급대상자가 선택되지 않았습니다.');
				return;
			}
	
			if(confirm('대상자를 일괄 저장하시겠습니까?')) {
				removeMask("#main");			
				document.main.old_empl_no.value = document.form1.old_empl_no.value;
				document.main.new_empl_no.value = new_empl_no;
				document.main.action = 'wel03001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goCreateSlip() {
		if(formValidate("#main")) {
			if(confirm('전표를 생성하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel03001_create_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDelete() {
		if(formValidate("#main")) {
			if(confirm('대상자를 일괄 삭제하시겠습니까?')) {
				removeMask("#main");			
				document.main.action = 'wel03001_delete.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDeleteSlip() {
		if(formValidate("#main")) {
			if(confirm('전표를 삭제하시겠습니까?')) {
				removeMask("#main");			
				document.main.action = 'wel03001_delete_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function signRequestPost() { goSearch('N'); }

	function clickCheckAll(bool) {
		document.main.pay_amt.value = 0;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				$("input:checkbox[name^='new_empl_no']").prop("checked", bool);
				if($("#checkAll").prop("checked")) {
					document.main.pay_amt.value = parseInt2(document.main.pay_amt) + parseInt2(document.all['support_amt'+i]);
				}
			} catch(e) {}
		}
		autoCalc('');
	}
	
	function autoCalc(inx) {
	<%  int cnt = obox.getInt("member_cnt");
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(rsWp.get("exist_yn",i).equals("Y")) { cnt--; }
		}
	%>	
		if(inx == '') {
			document.main.member_cnt.value = $("#checkAll").prop("checked") ? <%=cnt+rsWp.getLength()%> : <%=cnt%>;
		}else {
			document.main.member_cnt.value = parseInt2(document.main.member_cnt) + (document.all['new_empl_no'+inx].checked ? 1 : -1);
			if(document.all['new_empl_no'+inx].checked) {
				document.main.pay_amt.value = parseInt2(document.main.pay_amt) + parseInt2(document.all['support_amt'+inx]);
			}else {
				document.main.pay_amt.value = parseInt2(document.main.pay_amt) - parseInt2(document.all['support_amt'+inx]);
			}
		}
		formatMaskElm(document.main.member_cnt);
		formatMaskElm(document.main.pay_amt);
	}
	
	function changePayYmd(pay_yy, pay_term){
		var pay_md = '';	
		if(pay_term == '1') { pay_md = '0331'; }
		else if(pay_term == '2') { pay_md = '0630'; }
		else if(pay_term == '3') { pay_md = '0930'; }
		else if(pay_term == '4') { pay_md = '1231'; }
		document.main.pay_ymd.value = document.main.pay_yy.value + pay_md;
	}

	$(function() {
		changePayYmd(document.main.pay_yy.value, document.main.pay_term.value);
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 		value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="old_empl_no" 	value="">
<input type="hidden" name="new_empl_no" 	value="">
<input type="hidden" name="sort_order" 		value="">
<input type="hidden" name="unit_count" 		value="">
<input type="hidden" name="pay_ymd" 		value="">
<input type="hidden" name="pay_no"	 		value="<%=obox.get("pay_no")%>">
<input type="hidden" name="excel_file_nm" 	value="직원 복지연금 일괄지급">

<% if(!box.get("msg_popup").equals("Y")) { %>
	<h1 class="page-title marT10">직원 복지연금 일괄지급</h1>
<% } %>

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
		<% if(!box.get("msg_popup").equals("Y")) { %>
	  		<tr>
				<td class="td-head">지급일자</td>
				<td>
					<select name="pay_yy" title="지급년도" class="bs-select form-control" style="width:100px" onChange="changePayYmd(this.value, document.main.pay_term.value)">
						<%=DateUtil.getYearOptionTag(box.get("pay_yy").equals("")?DateUtil.getYear():box.get("pay_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
					<select name="pay_term" title="지급분기" class="bs-select form-control" style="width:100px" onChange="changePayYmd(document.main.pay_yy.value, this.value)">
						<option value="1" <%=box.get("pay_term").equals("1")? "selected":""%>>1/4분기</option>
						<option value="2" <%=box.get("pay_term").equals("2")? "selected":""%>>2/4분기</option>
						<option value="3" <%=box.get("pay_term").equals("3")? "selected":""%>>3/4분기</option>
						<option value="4" <%=box.get("pay_term").equals("4")? "selected":""%>>4/4분기</option>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:160px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
				</td>
				<td class="td-head">신청일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="신청일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="신청일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
	  		</tr>
	  	<% } %>	
	  		<tr>
				<td class="td-head">지원항목</td>
				<td>
					<select name="support_item" class="bs-select form-control required" title="지원항목" style="width:170px" onChange="goSearch('N')">
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("support_item"),"support_item@",box.get("bugt_cd"),"","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">총 지급액</td>
				<td colspan="3" nowrap>
					<div class="form-inline">
				  	<% if(!obox.get("slip_no").equals("")) { %>
						<span style="font-weight:bold; color:#01a1db;">대상자 : </span><%=obox.getInt("member_cnt")%> 명,  <span style="font-weight:bold; color:#01a1db;">총 지급액 : </span><%=obox.get("pay_amt",Box.THOUSAND_COMMA)%> 원 
				  	<% }else if(rsWp.getLength() > 0) { %>
						<span style="font-weight:bold; color:#01a1db;">대상자 : </span><input type="text" name="member_cnt" value="<%=obox.getInt("member_cnt")%>" title="인원수" class="form-control acc-border tNUM" style="width:30px;height:16px" readOnly> 명  ,
						<span style="font-weight:bold; color:#01a1db;">총 지급액 : </span><input type="text" name="pay_amt" value="<%=obox.get("pay_amt")%>" title="지원금액" class="form-control acc-border tNUM tMONEY" style="widht:60px;height:16px" readOnly> 원
						<button type="button" class="btn btn-primary btn-table" onClick="goSave()">저장</button>
						<% if(obox.getInt("member_cnt") > 0) {%>
							<button type="button" class="btn btn-primary btn-table" onClick="goDelete();">전체삭제</button>
						<% } %>
					<% } %>
					</div>
				</td>
	  		</tr>
		<% if(obox.getInt("member_cnt") > 0) { %>
	  		<tr>
				<td class="td-head">전표번호</td>
				<td colspan="5">
				<% if(obox.get("slip_no").equals("")) { %>
					<%if(obox.getInt("member_cnt") > 0) { %>
						미작성&nbsp;<button type="button" class="btn btn-primary btn-table" onClick="goCreateSlip();">전표분개</button>
					<% } %>
				<% }else { %>
					<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
					&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
					<% if(obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
						<button type="button" class="btn btn-primary btn-table" onClick="goDeleteSlip();">전표삭제</button>
					<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
					<% } %>
				<% } %>
	  		</tr>
	  	<% } %>
	  	</tbody>
	</table>
</form>

<form name="form1" method="post" action="" class="fType" style="margin:0px">
	<div id="divListData" class="contentsRow">
<% } %>
		<% if(!box.get("excel_yn").equals("Y")) { %>
		<div class="table-top-control form-inline">
			<div class="notice-view">
				<span style="color:#01a1db;">성명을 클릭</span>하면 해당 사원의 상세정보를 검색할 수 있습니다.</td>
			</div>
	    	<span class="f-right">
				<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
				<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
			</span>
		</div>
		
		<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 270px)">
		<% } %>
			<table id="MyTable" class="table table-bordered table-hover order-column">
				<colgroup>
					<col style="width:4%;">
					<col style="width:6%;">
					<col style="width:8%;">
					<col style="width:*;">
					<col style="width:10%;">
					<col style="width:8%;">
					<col style="width:10%;">
					<col style="width:9%;">
					<col style="width:9%;">
					<col style="width:9%;">
				<%if(isEditable){%>
					<col style="width:4%;">
				<% } %>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>사번</th>
						<th>성명</th>
						<th>부서</th>
						<th>직위</th>
						<th>신청일자</th>
						<th>본인부담금(원)</th>
						<th>지원금액(원)</th>
						<th>최초지급월</th>
						<th>문서번호</th>
					<%if(isEditable && !box.get("excel_yn").equals("Y")){%>
						<th>
							<label class="mt-checkbox mt-checkbox-outline">
								<input type="checkbox" id="checkAll" name="checkAll" value="Y" onClick="clickCheckAll(this.checked);"><span/>
							</label>
						</th>
					<%}%>
	          		</tr>
	          	</thead>
	          	<tbody> 
				<% if(!box.get("bugt_cd").equals("") && rsWp.getLength() == 0) { %>
					<tr><td colspan="<%=isEditable ? 11 : 10%>" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else if(rsWp.getLength() > 0) {
			   		String old_empl_no = rsWp.get("sort_key",0) + "@" + rsWp.get("sort_key",rsWp.getLength()-1);
		   	   		for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr> 
							<td class="t-center"><%=String.valueOf(i+1)%></td>
							<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
							<td class="t-center"><% if(!box.get("excel_yn").equals("Y")) { %><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%}%><%=rsWp.get("empl_nm",i)%><% if(!box.get("excel_yn").equals("Y")) { %></a><%}%></td>
							<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("position_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
							<td class="t-right"><%=rsWp.get("self_pay_amt",i,Box.THOUSAND_COMMA)%></td>
							<td class="t-right"><%=rsWp.get("support_amt",i,Box.THOUSAND_COMMA)%></td>
							<td class="t-center"><%=rsWp.get("start_ym",i,Box.DEF_DATE_FMT)%></td>
							<td class="t-center"><% if(!box.get("excel_yn").equals("Y")) { %><%if(!rsWp.get("msg_no",i).equals("")){%><a href="javascript:goDocuViewer('<%=rsWp.get("msg_no",i)%>');"><%}%><%}%><%=FormatUtil.msgNo(rsWp.get("msg_no",i))%><% if(!box.get("excel_yn").equals("Y")) { %></a><%}%></td>
						<%if(isEditable && !box.get("excel_yn").equals("Y")){%>
							<td class="t-center">
								<label class="mt-checkbox mt-checkbox-outline">
									<input type="checkbox" name="new_empl_no<%=i%>" value="<%=rsWp.get("empl_no",i)%>," <%=rsWp.get("exist_yn",i).equals("Y")?"checked":""%> onClick="autoCalc('<%=i%>')"><span/>
								</label>
							</td>
						<%}%>
							<input type="hidden" name="support_amt<%=i%>" value="<%=rsWp.get("support_amt",i)%>">
						</tr>	
					<% } %>
					<input type="hidden" name="old_empl_no" value="<%=old_empl_no%>">
				<% } %>
				</tbody>
			</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
		</div>
	<%=PageUtil.makePaging(box, rsWp, box.get("unit_count").equals("") ? 500 : box.getInt("unit_count"), request)%>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
<% if(rsWp.getLength() > 0) { 
	String unit_count = FormatUtil.nvl2(box.get("unit_count"),"100");%>	
	<hr style="border:1px solid #666; margin:40px 0 5px;">
	<div style="float:right">
		<select name="unit_count" title="페이지당 조회수" class="bs-select form-control" style="width:140px">
			<option value='150' <%=unit_count.equals("100")?"selected":""%>>150명</option>
			<option value='500' <%=unit_count.equals("500")?"selected":""%>>500명</option>
		</select>
	</div>
<% } %>
</form>
<% } %>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="직원 복지연금 지급(<%=obox.get("support_item_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP010">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("bugt_cd")%>|<%=obox.get("pay_ymd")%>|<%=obox.get("pay_no")%>|<%=obox.get("support_item")%>">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="target_term"		value="<%=box.get("pay_yy")%>년도 <%=box.get("pay_term")%>분기">
<input type="hidden" name="member_cnt" 		value="<%=obox.get("member_cnt")%>">
<input type="hidden" name="pay_amt" 		value="<%=obox.get("pay_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
<% } %>