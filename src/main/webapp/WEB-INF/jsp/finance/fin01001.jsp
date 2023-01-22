<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 자금운용현황 -->

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'fin01001_list.do';
			if(gbn == 'E') { 
				removeMask("#main");
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
	
	// 보조부 호출
	function goDetail(acct_cd, acct_nm) {
		var params = '?start_ymd='+document.main.std_year.value+'0101'
				   + '&end_ymd='+document.main.std_year.value+document.main.std_month.value+'<%=DateUtil.getDayCount(box.getInt("std_year"),box.getInt("std_month"))%>'
				   + '&acct_cd='+acct_cd + '&acct_nm='+acct_nm + '&select_yn=Y&popup_yn=Y';
		popupOpen("/account/pd/rpt01001_list.do?1=1"+encodeURI(params), "rpt01001", 1200, 830);
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 		value="Y">
<input type="hidden" name="excel_file_nm" 	value="자금운용현황">

	<h1 class="page-title">자금운용현황</h1>
	
	<table class="search-panel table table-bordered">
  		<tr>
			<th width="15%">기준년월</th>
			<td width="55%">
				<select name="std_year" title="기준년도"  class='bs-select form-control'  style="width:90px" >
           			<%=DateUtil.getYearOptionTag(box.get("std_year"),"2010",DateUtil.nextYear(),"desc","년")%>
				</select>&nbsp;
				<select name="std_month" title="기준월"  class='bs-select form-control' style="width:60px">
           			<%=DateUtil.getMonthOptionTag(box.get("std_month"),"월")%>
				</select>
			</td>
		    <td>
		  		<span class="f-right">
					<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
				</span>
		    </td>
  		</tr>
	</table>	
</form>

<div id="divListData" class="contentsRow">
<% } %>	   

<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="table-top-control form-inline">
		<div class="notice-view">
			<span style="color:#01a1db;">계정과목을 클릭</span>하면 보조부를 검색할 수 있습니다.
		</div>
		<span class="f-right">
			(단위 : 원)
		</span>
	</div>
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">
<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:13%;">
				<col style="width:14%;">
				<col style="width:18%;">
				<col style="width:12%;">
				<col style="width:11%;">
				<col style="width:12%;">
				<col style="width:20%;">
			</colgroup>
			<thead>	
                <tr>
					<th>구분</th>
					<th>계정과목</th>
					<th>계좌번호(사원명)</th>
					<th>전월잔액</th>
					<th>당월증감</th>
					<th>당월잔액</th>
					<th>비고</th>
          		</tr>
          	</thead>
          	<tbody>
       		<%  int pass_cnt1 = 0; int pass_cnt2 = 0;
				for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
				<tr bgcolor="<%=rsWp.get("sort_key",row_index).indexOf("z")>=0?"f6f6f6":"ffffff"%>">
				<%	if(pass_cnt1 == 0) {
						int span_cnt1 = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("acct_class_nm",row_index).equals(rsWp.get("acct_class_nm",tmp_index))) { break; }
							span_cnt1 ++;
						}
						out.println("<td align='center' rowspan='"+span_cnt1+"'>"+rsWp.get("acct_class_nm",row_index)+"</td>");
						pass_cnt1 = span_cnt1 - 1;
					}else {
						pass_cnt1 --;
					}
					if(pass_cnt2 == 0) {
						int span_cnt2 = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("acct_nm",row_index).equals(rsWp.get("acct_nm",tmp_index))) { break; }
							span_cnt2 ++;
						}
						if(!box.get("excel_yn").equals("Y") && rsWp.get("sort_key",row_index).indexOf("z") < 0) {
							out.println("<td align='center' rowspan='"+span_cnt2+"'><a href=\"javascript:goDetail('"+rsWp.get("sort_key",row_index)+"','"+rsWp.get("acct_nm",row_index)+"')\">"+rsWp.get("acct_nm",row_index)+"</a></td>");
						}else {
							out.println("<td align='center' rowspan='"+span_cnt2+"'>"+rsWp.get("acct_nm",row_index)+"</td>");
						}
						pass_cnt2 = span_cnt2 - 1;
					}else {
						pass_cnt2 --;
					} %>
					<td class="t-left"><%=rsWp.get("sub_nm",row_index)%></td>
					<td class="t-right"><%=rsWp.get("pre_remain",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("cur_remain",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-left"><%=rsWp.get("etc_remark",row_index)%></td>
				</tr>	
			<% } %>
          	</tbody>
		</table>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>