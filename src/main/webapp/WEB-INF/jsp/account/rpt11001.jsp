<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 계정명세서 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'rpt11001_list.do';
			if(gbn == 'E') { 
				document.main.action = theURL + '?excel_yn=Y';
				document.main.target = '_self';
				document.main.submit();
			}else {
				ajaxReplaceForm(theURL, "#main", "#divListData", function() {
					fixTableHeader("MyTable");
				});
			}
		}
	}

	function findSearchCode() {
		if(document.main.search_key.value == '1') {
			findCustCode('');
		}else if(document.main.search_key.value == '2') {
			findEmployeeNo('');
		}
	}

	// 보조부 호출
	function goDetail(acct_cd, acct_nm) {
		var params = '&acct_cd='+acct_cd +'&acct_nm='+acct_nm +'&select_yn=Y&popup_yn=Y';
		popupOpen("/account/pd/rpt01001_list.do?1=1"+encodeURI(params), "rpt01001", 1200, 830);
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 		value="Y">
<input type="hidden" name="excel_file_nm" 	value="계정명세서">

	<h1 class="page-title">계정명세서</h1>
	
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
				<td class="td-head">기준년월</td>
				<td nowrap>
					<select name="std_year" title="기준년도" class="bs-select form-control" style="width:100px;">
						<%=DateUtil.getYearOptionTag(box.get("std_year"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select> 
					<select name="std_month" title="기준월" class="bs-select form-control" style="width:65px" onChange="goSearch();">
            			<%=DateUtil.getMonthOptionTag(box.get("std_month"),"월")%>
					</select>		
				</td>
				<td class="td-head">계정과목</td>
				<td nowrap>
					<div class="input-group">
						<input type="text" name="acct_nm" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control" style="width:170px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.acct_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findAccountCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="acct_cd" value="<%=box.get("acct_cd")%>">						
					</div>
				</td>
				<td class="td-head">회계단위</td>
				<td>
					<select name="acc_unit" title="회계단위" class="bs-select form-control" style="width:150px">
						<option value=''>전체</option>
						<option value='00' <%=box.get("acc_unit").equals("00")?"selected":""%>>목적사업회계</option>
						<option value='20' <%=box.get("acc_unit").equals("20")?"selected":""%>>기금관리회계</option>
					</select>
				</td>
	  		</tr>
	  		<tr>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>거래처</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사원명</option>
					</select>
				</td>
				<td nowrap>
					<div class="input-group">
						<input type="text" name="search_nm" value="<%=box.get("search_nm")%>" class="form-control" style="width:170px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.search_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findSearchCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="search_cd" value="<%=box.get("search_cd")%>">						
					</div>
				</td>
				<td class="td-head">
					<select name="rel_no_type" title="관련번호유형" class="bs-select form-control" style="width:90%">
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("rel_no_type"),"rel_no_type","","","","",uSesEnt.dbo)%>
					</select>
				</td>
				<td colspan="3">
					<input type="text" name="rel_no" value="<%=box.get("rel_no")%>" title="관련번호" class="form-control" style="width:170px; border:1 solid gray;" onkeydown="if(event.keyCode == 13) goSearch('N');">
			  		<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
				</td>
	  		</tr>
	  	</tbody>
	</table>		
</form>

<div id="divListData" class="contentsRow">
<% } %>

<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="font-weight:bold; color:#01a1db;">계정과목을 클릭</span>하면 보조부로 연결됩니다.
		</div>
		<span class="f-right">(단위 : 원)</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 180px)">
<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:15%;">
				<col style="width:12%;">
				<col style="width:8%;">
				<col style="width:12%;">
				<col style="width:11%;">
				<col style="width:11%;">
				<col style="width:11%;">
				<col style="width:11%;">
				<col style="width:9%;">
			</colgroup>
			<thead>
				<tr>
					<th>계정과목</th>
					<th>거래처</th>
					<th>사원명</th>
					<th>관련번호</th>
					<th>전기이월</th>
					<th>당기증가</th>
					<th>당기감소</th>
					<th>당기잔액</th>
					<th>발생일자</th>
	         	</tr>
	        </thead>
	        <tbody> 
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="9" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
				int pass_cnt = 0;
				for(int row_index = 0; row_index < rsWp.getLength(); row_index++) { 
					if(rsWp.get("sort_key",row_index).equals("z")) { continue; } %>	
				<tr bgcolor="<%=rsWp.get("sort_key",row_index).indexOf("z")>=0?"f0f0f0":"ffffff"%>"> 
				<%  if(pass_cnt == 0) {
						int span_cnt = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("acct_nm",row_index).equals(rsWp.get("acct_nm",tmp_index))) { break; }
							span_cnt ++;
						}
						if(!box.get("excel_yn").equals("Y") && !rsWp.get("sort_key",row_index).equals("z")) {
							out.println("<td align='center' rowspan='"+span_cnt+"' valign='top' style='padding-top:5px'><a href=\"javascript:goDetail('"+rsWp.get("sort_key",row_index).substring(0,7)+"','"+rsWp.get("acct_nm",row_index)+"')\">"+rsWp.get("acct_nm",row_index)+"</a></td>");
						}else {
							out.println("<td align='center' rowspan='"+span_cnt+"' valign='top' style='padding-top:5px'>"+rsWp.get("acct_nm",row_index)+"</td>");
						}
						
						pass_cnt = span_cnt - 1;
					}else {
						pass_cnt --;
					}
				%>
					<td class="t-<%=rsWp.get("cust_nm",row_index).equals("소계")?"center":"left"%>"><%if(!box.get("excel_yn").equals("Y") && !rsWp.get("cust_cd",row_index).equals("")){%><a href="javascript:go_cust_info('<%=rsWp.get("cust_cd",row_index)%>')"><%}%><%=rsWp.get("cust_nm",row_index)%></a></td>
					<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",row_index)%>')"><%}%><%=rsWp.get("empl_nm",row_index)%></a></td>
					<td class="t-left"><%=rsWp.get("rel_no",row_index)%><%=box.get("excel_yn").equals("Y")?"&nbsp;":""%></td>
					<td class="t-right"><%=rsWp.get("pre_iwol_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_incr_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_decr_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_acum_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("issue_ymd",row_index,Box.DEF_DATETIME_FMT)%></td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
		</table>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
