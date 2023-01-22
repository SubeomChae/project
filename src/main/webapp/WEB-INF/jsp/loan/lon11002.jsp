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
<!-- 대부금 월별상환 결과 -->
<script language='javascript'>
	function goSearch(gbn) {
		document.main.page_count.value = '';
		var theURL = 'lon11001_list.do';
		if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }
		removeMask(document.main);
		document.main.action = theURL;
		document.main.target = '_self';
		document.main.submit();
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		var theURL = 'lon11001_list.do';
		removeMask(document.main);
		document.main.action = theURL;
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="page_count"		value="">
<input type="hidden" name="excel_file_nm" 	value="대부금월별상환">

	<% if(box.get("msg_popup").equals("Y")) { %>
	<img src="/com/img/title_bullet.gif" border="0" align="absmiddle"> <b>대부금 정기상환(<%=obox.get("std_ym",Box.DEF_DATE_FMT)%>)</b>
	<% }else { %>
	<h1 class="page-title">대부금 월별 상환</h1>
	<% } %>
	
	<% if(!box.get("msg_popup").equals("Y")) { %>
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%">
			<col style="width:18%">
			<col style="width:10%">
			<col style="width:18%">
			<col style="width:10%">
			<col style="width:34%">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">기준년월</td>
				<td>
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:120px">
            			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
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
		</tbody>   
	</table>		    
	<% } %>	
</form>	    
			
<div id="divListData" class="contentsRow">
	<div class="table-top-control marT10">
		<div class="form-inline">
	  		<span style="font-weight:bold; color:#01a1db;">대상자 : </span> <%=obox.get("refund_cnt",Box.THOUSAND_COMMA)%>명,&nbsp;
	  		<span style="font-weight:bold; color:#01a1db;">원금상환 : </span> <%=obox.get("refund_sum",Box.THOUSAND_COMMA)%>원,&nbsp;
	  		<span style="font-weight:bold; color:#01a1db;">이자상환 : </span> <%=obox.get("intr_sum",Box.THOUSAND_COMMA)%>원
	  		<span class="f-right">
		  		<b>전표번호</b> : 
		  		<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
				<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><B><%=obox.get("slip_no",Box.SLIP_NO)%></B></a>
				&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
				<button type="button" id="btnSignLine" class="btn btn-primary btn-table" onClick="goSignLine('', 'SLP007', 'ACCTB_SLIP01|<%=obox.get("slip_no")%>|L21|<%=obox.get("std_ym")%>');">결재라인</button>
			</span>
		</div>
	</div>
	
	<div id="divArea" class="table-scrollable" style="height:calc(100vh - 160px);overflow-x:auto;overflow-y:auto">
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
				<col style="width:80px">
				<col style="width:200px">
				<col style="width:70px">
				<col style="width:70px">
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
					<th colspan="4">이자계산</th>
					<th colspan="3">당월공제</th>
					<th rowspan="2">공제후<br>대부잔액</th>
          		</tr> 
				<tr>
					<th>공제전<br>대부잔액</th>
					<th>이자율</th>
					<th>이자기산일</th>
					<th>일수</th>
					<th>원금</th>
					<th>이자</th>
					<th>계</th>
          		</tr>
          	</thead>
          	<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="15" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goLoanDetail('<%=rsWp.get("loan_no",i)%>')"><%}%><%=rsWp.get("bugt_nm",i)%></a></td>
					<td class="t-center"><%=rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("remain_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("intr_rate",i)%>%</td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("intr_ilsu",i)%></td>
					<td class="t-right"><%=rsWp.get("refund_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("intr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("tot_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("remain_amt",i)-rsWp.getLong("refund_amt",i)))%></td>
				</tr>	
				<% } %>
		    <% } %>
	    	</tbody>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, request)%>
</div>
<% } %>