<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- 회계전표 승인/취소 -->
<% if(!box.get("excel_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var days = getDayInterval(document.main.start_ymd.value.replace(/-/g,""), document.main.end_ymd.value.replace(/-/g,""));
			if(days > 365) {
				alert('조회기간은 365일 이내로 지정하셔야 합니다.');
				document.saveForm.end_ymd.focus();
				return;
			}

			var theURL = 'slp31001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y&excel_file_nm=회계전표 승인'; }
			fixTableHeader("MyTable");
			removeMask('#main');
			document.main.action = encodeURI(theURL);
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goSign() {
		var msg = document.main.sign_yn[0].checked ? '승인' : '승인취소';
		var isOK = false;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { if(document.all['slip_no'+i].checked) { isOK = true; break; }
			}catch(e) {}
		}
		
		if(!isOK) {
			alert(msg+'할 자료가 선택되지 않았습니다.');
			return;
		}
		
		if (formValidate("#main")) {
			if(confirm(msg+'처리하시겠습니까?')) {
				removeMask(document.main);
				document.main.action = 'slp31001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}	
	}
	
	function goSelectAll() {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				$("input:checkbox[name='slip_no"+i+"']").prop("checked", $("#checkbox").is(":checked"));
				clickSlipNo(i);
			} catch(e) {}
		}
	}
	
	function clickSlipNo(inx) {
		if(document.all['slip_no'+inx].checked) {
			changeObjectProperty(document.all['sign_ymd'+inx], 'required');
			document.all['sign_ymd'+inx].value = document.all['proof_ymd'+inx].value;
			formatMaskElm(document.all['sign_ymd'+inx]);
		}else {
			changeObjectProperty(document.all['sign_ymd'+inx], 'enabled');
			document.all['sign_ymd'+inx].value = '';
		}
		autoCalc();
	}
	
	function autoCalc() {
		var slip_cnt_tot = 0;
		var slip_amt_tot = 0;
	<% for(int i=0; i < rsWp.getLength(); i++) { %>
		if(isObject('slip_no<%=i%>') && document.all['slip_no<%=i%>'].checked) { 
			slip_amt_tot = slip_amt_tot + <%=rsWp.getInt("dae_amt",i)%>;
			slip_cnt_tot++;
		}
	<% } %>
		document.all['slip_cnt'].value = slip_cnt_tot;
		document.all['slip_amt_tot'].value = slip_amt_tot;
		formatMaskElm(document.all['slip_cnt']);
		formatMaskElm(document.all['slip_amt_tot']);
		if(slip_cnt_tot > 0) { 
			$("#slip_summary").show();
		}else {
			$("#slip_summary").hide();
		}
	}
	
	function __Calendar_Setting_Post(target) {
		if(!isEmpty(document.saveForm.slip_ymd)) {
			document.main.slip_no.options.length = 0;
			var slip_ymd = document.main.slip_ymd.value.replace(/-/g,"");
			setOptionByProc('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.slip_no, '', slip_ymd, '', '', '', '3', '선택');
		}
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="sort_order" value="">
<input type="hidden" name="select_yn"  value="Y">
<input type="hidden" name="input_cnt"  value="<%=rsWp.getLength()%>">

	<h1 class="page-title">회계전표 승인/취소</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td rowspan="2" class="t-center">
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="sign_yn" value="N" <%=box.get("sign_yn").equals("Y")?"":"checked"%> onClick="document.main.sign_yn.value='N'; goSearch('');">결의전표<span></span>
					</label><br>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="sign_yn" value="Y" <%=box.get("sign_yn").equals("Y")?"checked":""%> onClick="document.main.sign_yn.value='Y'; goSearch('');">승인전표<span></span>
					</label>
				</td>
				<td class="td-head"><%=box.get("sign_yn").equals("Y")?"회계일자":"접수일자"%></td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="기준일자(부터)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="기준일자(까지)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
				<td class="td-head">업무유형</td>
				<td>
					<select name="biz_type" class="bs-select form-control" style="width:184px">
						<option value=''>전체</option>
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("biz_type"),"biz_type","","","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:99%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>작성자성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>작성자사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>작성부서</option>
						<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>적요</option>
					</select>
				</td>
				<td><input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')"></td>
	  		</tr>
	  		<tr>
				<td class="td-head">전표번호</td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("slip_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="slip_ymd" name="slip_ymd" value="<%=box.get("slip_ymd")%>" maxlength="8" title="전표일자" class="form-control tYMD" onChange="__Calendar_Setting_Post('')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div> ~
						<select name="slip_no" title="전표번호" class="bs-select form-control" style="width:90px" onChange="goSearch('N');">
							<option value=''>선택</option>
						<% if(!box.get("slip_ymd").equals("")) { %>
							<%=CodeUtil.optList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("slip_no"),box.get("slip_ymd"),"","","","",uSesEnt.dbo)%>
						<% } %>
						</select>
					</div>
				</td>
				<td class="td-head">계정과목</td>
				<td colspan="3" nowrap>
					<div class="form-inline">
						<div class="input-group">
							<input type="text" name="acct_nm" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control" style="width:150px;ime-mode:active;" onKeyUp="document.main.acct_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
							<button type="button" class="btn dark" onClick="findAccountCode('')"><i class="fa fa-search"></i></button>
							<input type="hidden" name="acct_cd" value="<%=box.get("acct_cd")%>">
						</div>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						</span>
					</div>
				</td>
	  		</tr>
	  	</tbody>
	</table>

	<div id="divListData" class="contentsRow">
		<div class="table-top-control">
			<div class="notice-view">
				<span style="color:#01a1db;">전표번호, 거래처, 작성자를 클릭</span>하면 해당 세부내용을 조회할 수  있습니다.
			</div>
			<div class="form-inline f-right">
		  	<% if(box.get("sign_yn").equals("N")) { %>
				<span id="slip_summary" style="display:none;">
				[전체 <input type="text" name="slip_cnt" value="" class="form-control acc-border tFMONEY" style="width:30px;height:16px" readOnly> 건],&nbsp;&nbsp;
				[<input type="text" name="slip_amt_tot" value="" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
				</span>
			<% } %>
			<% if(rsWp.getLength() > 0) { %>
				<% if(box.get("sign_yn").equals("Y")) { %>
					<button type="button" id="imgCancel" class="btn dark" onClick="javascript:goSign();"><img src="/com/img/ico_btn_cancel.png">승인취소</button>
				<% }else { %>
					<button type="button" id="imgSign" class="btn dark" onClick="javascript:goSign();"><img src="/com/img/ico_btn_confirm.png">일괄승인</button>
				<% } %>
			<% } %>
			</div>
		</div>
		<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 180px)">
<% } %>
			<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
				<colgroup>
					<col style="width:3%;">
					<col style="width:12%;">
					<col style="width:10%;">
					<col style="width:14%;">
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:12%;">
					<col style="width:8%;">
				</colgroup>
				<thead>
					<tr>
					<% if(!box.get("excel_yn").equals("Y")) { %>
						<th>
							<label class="mt-checkbox mt-checkbox-outline">
								<input type="checkbox" id="checkbox" name="checkbox" value="Y" style="border:none" onClick="goSelectAll()">
								<span></span>
							</label>
						</th>
					<% } %>
						<th>전표번호</th>
						<th>업무유형</th>
						<th>적요</th>
						<th>작성자</th>
						<th>계정과목</th>
						<th>차변</th>
						<th>대변</th>
						<th>거래처</th>
						<th>증빙일자</th>
	          		</tr> 
	          	</thead>
	          	<tbody>
				<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
					<tr><td colspan="10" align="center">조회할 자료가 없습니다.</td></tr>
				<% }else if(rsWp.getLength() > 0) {
					int pass_cnt = 0;
			   		for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
					<tr> 
					<%	if(pass_cnt == 0) {
						int span_cnt = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("slip_no",row_index).equals(rsWp.get("slip_no",tmp_index))) { break; }
							span_cnt ++;
						} %>
						<% if(!box.get("excel_yn").equals("Y")) { %>
							<td rowspan="<%=span_cnt%>" class="t-center">
								<label class="mt-checkbox mt-checkbox-outline">
									<input type="checkbox" name="slip_no<%=row_index%>" value="<%=rsWp.get("slip_no",row_index)%>" style="border:none" <%if(!box.get("sign_yn").equals("Y")){%>onClick="clickSlipNo('<%=row_index%>')"<%}%>>
									<span></span>
								</label>
							</td>
						<% } %>
						<td rowspan="<%=span_cnt%>" class="t-center">
							<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",row_index)%>')"><%}%><%=rsWp.get("slip_no",row_index,Box.SLIP_NO)%></a>
						<% if(!box.get("excel_yn").equals("Y") && !box.get("sign_yn").equals("Y")) { %>
							<br>
							<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
								<input type="text" id="sign_ymd<%=row_index%>" name="sign_ymd<%=row_index%>" value="" maxlength="8" title="결산반영일" class="form-control tYMD">
								<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
							</div>
						<% }else { %>
							<br><div style="font-size:11px; letter-spacing:-1px;">(<%=rsWp.get("sign_no",row_index)%>)</div>
						<% } %>
						</td>
						<td rowspan="<%=span_cnt%>" class="t-center">
							<%=rsWp.get("biz_type_nm",row_index)%>
							<br><div style="font-size:11px; letter-spacing:-1px;">(<%=rsWp.get("docu_no",row_index)%>)</div>
						</td>
						<td rowspan="<%=span_cnt%>" class="t-center"><%=rsWp.get("etc_remark",row_index)%></td>
						<td rowspan="<%=span_cnt%>" class="t-center">
							<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("wrt_empl_no",row_index)%>')"><%}%><%=rsWp.get("wrt_dept_nm",row_index)%><br><%=rsWp.get("wrt_empl_nm",row_index)%></a>
						</td>
						<%	pass_cnt = span_cnt - 1;
					}else {
						pass_cnt --;
					} %>
						<td><%=rsWp.get("acct_nm",row_index)%></td>
						<td class="t-right"><%=rsWp.get("cd_flag",row_index).equals("1") ? rsWp.get("slip_amt",row_index,Box.THOUSAND_COMMA) : ""%></td>
						<td class="t-right"><%=rsWp.get("cd_flag",row_index).equals("2") ? rsWp.get("slip_amt",row_index,Box.THOUSAND_COMMA) : ""%></td>
						<td>
							<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",row_index)%>')"><%}%><%=rsWp.get("cust_nm",row_index)%></a>
							<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",row_index)%>')"><%}%><%=rsWp.get("empl_nm",row_index)%></a>
						</td>
						<td class="t-center"><%=rsWp.get("proof_ymd",row_index,Box.DEF_DATE_FMT)%></td>
						<input type="hidden" name="proof_ymd<%=row_index%>"  value="<%=rsWp.get("proof_ymd",row_index)%>">
						<input type="hidden" name="slip_amt<%=row_index%>"  value="<%=rsWp.get("slip_amt",row_index)%>">
					</tr>	
					<% } %>
				<% } %>
				</tbody>
			</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
		</div>
	</div>
</form>
<% } %>