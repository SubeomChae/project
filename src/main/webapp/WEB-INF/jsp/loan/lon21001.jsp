<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 대부금 현황 조회 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
	    	var pageUrl = 'lon21001_list.do';
	      	if(gbn == 'E') { 
	        	if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
	            	pageUrl += '?excel_yn=P&excel_form_no=LON21001';
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
			document.main.page_count.value = '';
	     	ajaxReplaceForm(pageUrl, "#main", "#divListData", function() {
				fixTableHeader("MyTable");
	     	});
	  	}
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("lon21001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="excel_file_nm" value="대부금현황조회">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">대부금 현황 조회</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:25%">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">대부종류</td>
				<td>
					<select name="bugt_cd" title="대부종류" class="bs-select form-control" style="width:100%">
						<option value=''>전체</option>
			            <%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",box.get("bugt_cd"),"1","L","","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">대부일자</td>
				<td nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="대부일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="대부일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>		
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:100%;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
				</td>
				<td class="td-head">진행상태</td>
				<td>
					<select name="pro_status" title="진행상태" class="bs-select form-control" style="width:120px" onChange="if(this.value=='-') this.value='';">
						<option value=''>진행중+완료</option>
						<option value='-'>------------</option>
						<option value='31' <%=box.get("pro_status").equals("31")?"selected":""%>>진행중</option>
						<option value='32' <%=box.get("pro_status").equals("32")?"selected":""%>>상환완료</option>
						<option value='-'>------------</option>
						<option value='20' <%=box.get("pro_status").equals("20")?"selected":""%>>승인대기</option>
						<option value='14' <%=box.get("pro_status").equals("14")?"selected":""%>>미승인</option>
					</select>
				</td>
	  		</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">대부종류를 클릭</span>하면 해당 대부금의 세부내용을 조회할 수 있습니다.
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 170px)">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:3%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:8%">
				<col style="width:9%">
				<col style="width:6%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:5%">
				<col style="width:6%">
				<col style="width:6%">
				<col style="width:6%">
				<col style="width:7%">
				<col style="width:6%">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>사번</th>
					<th>성명</th>
					<th>부서</th>
					<th>대부종류</th>
					<th>대부일자</th>
					<th>거치만료일</th>
					<th>대부만료일</th>
					<th>대부금액</th>
					<th>1회상환금액</th>
					<th>이자율</th>
					<th>상환금액</th>
					<th>대부잔액</th>
					<th>진행상태</th>
					<th>상환완료일</th>
					<th>퇴직일자</th>
          		</tr>
          	</thead>
          	<tbody> 
		<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="16" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
			for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goLoanDetail('<%=rsWp.get("loan_no",i)%>')"><%}%><%=rsWp.get("bugt_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("defer_end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("end_plan_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("unit_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("intr_rate",i)%>%</td>
					<td class="t-right"><%=rsWp.get("refund_sum",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("remain_amt",i)))%></td>
					<td class="t-center"><%=rsWp.get("pro_status_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("finish_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("retire_ymd",i,Box.DEF_DATE_FMT)%></td>
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