<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="sumWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 보조부 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var days = getDayInterval(document.main.start_ymd.value.replace(/-/g,""), document.main.end_ymd.value.replace(/-/g,""));
			if(days > 365) {
				alert('조회기간은 365일 이내로 지정하셔야 합니다.');
				document.main.end_ymd.focus();
				return;
			}
			
			var pageUrl = 'rpt01001_list.do';
			document.main.page_count.value = '';
			ajaxReplaceForm(pageUrl, "#main", "#divListData", function() {
				fixTableHeader("MyTable1");
			});
	  	}
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("rpt01001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable1");
		});
		return false;
	}

	function goReport(gbn) {
		if(formValidate("#main")) {
			if(gbn == 'P') {
				goRptViewer();
			}else {
				removeMask("#main");
				document.main.action = '/account/fd/rpt01001_excel.do?report_yn=Y&excel_yn=Y';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function findSearchCode() {
		if(document.main.search_key.value == '2') {
			findEmployeeNo('');
		}else if(document.main.search_key.value == '3') {
			findDeptCode('');
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="excel_file_nm" value="보조부">

	<h1 class="page-title">보조부</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">결산반영일</td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="결산반영일(부터)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="결산반영일(까지)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>		
				</td>
				<td class="td-head">계정과목</td>
				<td nowrap>
					<div class="input-group">
						<input type="text" name="acct_nm" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control" style="width:160px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.acct_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findAccountCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="acct_cd" value="<%=box.get("acct_cd")%>">
					</div>
				</td>
				<td class="td-head">회계단위</td>
				<td>
					<select name="acc_unit" title="회계단위" class="bs-select form-control" style="width:160px">
						<option value=''>전체</option>
						<option value='00' <%=box.get("acc_unit").equals("00")?"selected":""%>>목적사업회계</option>
						<option value='20' <%=box.get("acc_unit").equals("20")?"selected":""%>>기금관리회계</option>
					</select>
				</td>
	  		</tr>
	  		<tr>
				<td class="td-head">거래처</td>
				<td>
					<div class="input-group">
						<input type="text" name="cust_nm" value="<%=box.get("cust_nm")%>" class="form-control" style="width:160px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.cust_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findCustCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="cust_cd" value="<%=box.get("cust_cd")%>">	
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%" onChange="if(this.value=='1') $('imgSearch').style.display = 'none'; else $('imgSearch').style.display = '';">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>적요</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사원명</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td nowrap>
					<input type="text" name="search_nm" value="<%=box.get("search_nm")%>" class="form-control" style="width:160px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.search_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
					<button type="button" class="btn dark" onClick="findSearchCode('')" style="display:<%=box.get("search_key").compareTo("1")>0?"":"none"%>"><i class="fa fa-search"></i></button>
					<input type="hidden" name="search_cd" value="<%=box.get("search_cd")%>">
				</td>
				<td class="td-head">
					<select name="rel_no_type" title="관련번호유형" class="bs-select form-control" style="width:90%">
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("rel_no_type"),"rel_no_type","","","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td>
					<input type="text" name="rel_no" value="<%=box.get("rel_no")%>" title="관련번호" class="form-control" style="width:160px; border:1 solid gray;" onkeydown="if(event.keyCode == 13) goSearch('N');">
				</td>
	  		</tr>
	  	</tbody>
	</table>		
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="font-weight:bold; color:#01a1db;">전표번호를 클릭</span>하면 해당 세부내용을 조회할 수 있습니다.
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goReport('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
			<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/rpt01001.jrf','P_PARAM01!<%=box.get("start_ymd")%>!P_PARAM02!<%=box.get("end_ymd")%>!P_PARAM03!<%=box.get("acct_cd")%>|<%=box.get("acct_nm")%>!P_PARAM04!<%=box.get("cust_cd")%>|<%=box.get("cust_nm")%>!P_PARAM05!<%=box.get("search_key")%>!P_PARAM06!<%=box.get("search_cd")%>|<%=box.get("search_nm")%>!P_PARAM07!<%=box.get("rel_no")%>!P_PARAM08!<%=box.get("acc_unit")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
		</span>
	</div>
<% if(sumWp.getLength() > 0) { %>
	<div id="divArea1" class="table-scrollable scrollOptionY" style="height:<%=box.get("popup_yn").equals("Y") ? "520px" : "calc(100vh - 280px)"%>">
<% }else { %>
	<div id="divArea1" class="table-scrollable scrollOptionY" style="height:<%=box.get("popup_yn").equals("Y") ? "520px" : "calc(100vh - 192px)"%>">
<% } %>
		<table id="MyTable1" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:8%;">
				<col style="width:13%;">
				<col style="width:13%;">
				<col style="width:7%;">
				<col style="width:7%;">
				<col style="width:8%;">
				<col style="width:5%;">
				<col style="width:8%;">
				<col style="width:8%;">
				<col style="width:7%;">
				<col style="width:9%;">
				<col style="width:7%;">
			</colgroup>
			<thead>
				<tr>
					<th>결산반영일</th>
					<th>계정과목</th>
					<th>적요</th>
					<th>차변금액</th>
					<th>대변금액</th>
					<th>거래처</th>
					<th>사원명</th>
					<th>비용귀속</th>
					<th>관련번호</th>
					<th>증빙일자</th>
					<th>전표번호</th>
					<th>회계단위</th>
	         	</tr>
	        </thead>
	        <tbody>
		    <% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="12" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
		   		for(int i=0; i < rsWp.getLength(); i++) {	%>
				<tr> 
					<td class="t-center"><%=rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-left"><%=rsWp.get("acct_nm",i)%></td>
					<td class="t-left"><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-right"><%=rsWp.get("cha_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("dae_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%></a></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td><%=rsWp.get("cost_dept_nm",i)%></td>
					<td class="t-left" style="mso-number-format:\@;"><%=rsWp.get("rel_no",i)%></td>
					<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>')"><%}%><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></a></td>
					<td class="t-center"><%=StringUtil.replace(rsWp.get("acc_unit_nm",i),"회계","")%></td>
				</tr>	
				<% } %>
		   	<% } %>
	    	</tbody> 
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 100, request)%>
	
<% if(sumWp.getLength() > 0) { %>
	<div id="divArea2" class="table-scrollable" style="width:100%;overflow-y:auto">
		<table class="table table-striped table-bordered table-hover order-column">
		<% for(int i=0; i < sumWp.getLength(); i++) {	%>
			<tr> 
				<td width="19%" class="td-head"><%=sumWp.get("mark_hdr_nm",i)%></td>
				<td width="10%" class="td-head">증가</td>
				<td width="18%" class="t-right"><%=sumWp.get("incr_amt",i,Box.THOUSAND_COMMA)%></td>
				<td width="10%" class="td-head">감소</td>
				<td colspan="3" width="18%" class="t-right"><%=sumWp.get("decr_amt",i,Box.THOUSAND_COMMA)%></td>
				<td width="10%" class="td-head">잔액</td>
				<td width="18%" class="t-right"><%=sumWp.get("remain_amt",i,Box.THOUSAND_COMMA)%></td>
			</tr>	
		<% } %>
			<tr> 
				<td width="19%" class="td-head">누계금액</td>
				<td width="10%" class="td-head">증가</td>
				<td width="18%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(sumWp.getLong("incr_amt",0)+sumWp.getLong("incr_amt",1)))%></td>
				<td width="10%" class="td-head">감소</td>
				<td colspan="3" width="18%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(sumWp.getLong("decr_amt",0)+sumWp.getLong("decr_amt",1)))%></td>
				<td width="10%" class="td-head">잔액</td>
				<td width="18%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(sumWp.getLong("remain_amt",0)+sumWp.getLong("remain_amt",1)))%></td>
			</tr>	
		</table>
	</div>
<% } %>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
