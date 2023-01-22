<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "biz_type|sign_status|","","","","",uSesEnt.dbo); %>
<!-- 전표현황 조회 -->

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var pageUrl = 'slp11001_list.do';
			if(gbn == 'E') { 
				if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
					pageUrl += '?excel_yn=P&excel_form_no=SLP11001';
					ajaxSubmitForm(pageUrl,"#main", function(rtn) {
						hideServerWorking();
						if(rtn.isOk == "Y") {
							poiExcelDownload(rtn.excelPath);
						}else {
							alert(rtn.errMsg);
						}
					});
				}
				return;
			}
			document.main.page_count.value = '';
			ajaxReplaceForm(pageUrl, "#main", "#divListData", function() {
				fixTableHeader("MyTable");
			});
		}
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("slp11001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}

	function __Calendar_Setting_Post(target) {
		if(!isEmpty(document.main.slip_ymd)) {
			document.main.slip_no.options.length = 0;
			var slip_ymd = document.main.slip_ymd.value.replace(/-/g,"");
			var dept_cd = '<%=uSesEnt.use_auth.startsWith("S")? "" : uSesEnt.dept_cd%>';
			setOptionByProc('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.slip_no, '', slip_ymd, '', dept_cd, '', '', '선택');
		}
	}
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('N');
	}
	
	function changeSearchKey(search_key) {
		if(search_key == 4) {
			$("#search_val").addClass("tNUM");
		}else {
			$("#search_val").removeClass("tNUM");
		}
	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="sort_order"  	value="">
<input type="hidden" name="excel_file_nm"	value="전표현황조회">
<input type="hidden" name="page_count"		value="">

	<h1 class="page-title">전표현황 조회</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:30%;">
		</colgroup>
		<tbody>
	  		<tr>
				<th>
					<select name="ymd_flag" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("ymd_flag").equals("1")?"selected":""%>>전표일자</option>
						<option value='2' <%=box.get("ymd_flag").equals("2")?"selected":""%>>회계일자</option>
					</select>
				</th>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="전표일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="전표일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
				<th>작성부서</th>
				<td>
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="dept_cd" title="작성부서" class="bs-select form-control" style="width:200px" onChange="if(this.value.length > 1) goSearch('N');">
						<option value='*'>전체</option>
						<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",box.get("dept_cd"),"","","","","Y",uSesEnt.dbo)%>
					</select>
				<% }else { %>
					<%=uSesEnt.dept_nm%><input type="hidden" name="dept_cd"  value="<%=uSesEnt.dept_cd%>">
				<% } %>
				</td>
				<th>업무유형</th>
				<td>
					<select name="biz_type" class="bs-select form-control" style="width:150px">
						<option value=''>전체</option>
						<%=CodeUtil.optList(codeWp, "biz_type", box.get("biz_type"))%>
					</select>
				</td>
	  		</tr>
	  		<tr>
				<th>전표번호</th>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("slip_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="slip_ymd" name="slip_ymd" value="<%=box.get("slip_ymd")%>" maxlength="8" title="전표일자" class="form-control tYMD" onChange="__Calendar_Setting_Post('')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div> ~
						<select name="slip_no" title="전표번호" class="bs-select form-control" style="width:90px" onChange="goSearch();">
							<option value=''>선택</option>
						<% if(!box.get("slip_ymd").equals("")) { %>
							<%=CodeUtil.optList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("slip_no"),box.get("slip_ymd"),"","","","",uSesEnt.dbo)%>
						<% } %>
						</select>
					</div>
				</td>
				<th>결재상태</th>
				<td>
					<select name="sign_status" class="bs-select form-control" style="width:90px">
						<option value=''>전체</option>
						<%=CodeUtil.optList(codeWp, "sign_status", box.get("sign_status"))%>
					</select>
				</td>
				<th>
					<select name="search_key" class="bs-select form-control" style="width:90%" onChange="changeSearchKey(this.value)">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>작성자</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>작성부서</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>적요</option>
						<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>금액</option>
					</select>
				</th>
				<td>
					<input type="text" id="search_val" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N')">
				</td>
	  		</tr>
	  	</tbody>
	</table>		    
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">문서번호, 전표번호를 클릭</span>하면 해당 세부내용을 조회할 수 있습니다.
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 200px)">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:3%;">
				<col style="width:8%;">
				<col style="width:9%;">
				<col style="width:10%;">
				<col style="width:19%;">
				<col style="width:6%;">
				<col style="width:6%;">
				<col style="width:9%;">
				<col style="width:6%;">
				<col style="width:6%;">
				<col style="width:6%;">
				<col style="width:6%;">
				<col style="width:6%;">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.msg_no')"><%}%>문서번호</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.slip_no')"><%}%>전표번호</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.biz_type')"><%}%>업무유형</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.subject')"><%}%>적요</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.cha_amt')"><%}%>차변금액</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.dae_amt')"><%}%>대변금액</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.dept_cd')"><%}%>작성부서</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.empl_no')"><%}%>작성자</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.sys_reg_date desc')"><%}%>작성일자</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.acc_unit')"><%}%>회계단위</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.sign_ymd desc')"><%}%>회계일자</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.sign_status')"><%}%>결재상태</a></th>
    			</tr>
    		</thead>
    		<tbody> 
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="13">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDocuViewer('<%=rsWp.get("msg_no",i)%>')"><%}%><%=FormatUtil.msgNo(rsWp.get("msg_no",i))%></a></td>
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>')"><%}%><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></a></td>
					<td><%=rsWp.get("biz_type_nm",i)%></td>
					<td class="t-left"><%=rsWp.get("subject",i)%></td>
					<td class="t-right"><%=rsWp.get("cha_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("dae_amt",i,Box.THOUSAND_COMMA)%></td>
					<td><%=rsWp.get("dept_nm",i)%></td>
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td><%=rsWp.get("sys_reg_date",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("acc_unit_nm",i)%></td>
					<td><%=rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><a title="<%=rsWp.get("reject_reason",i)%>"><%=rsWp.get("sign_status_nm",i)%></a></td>
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

