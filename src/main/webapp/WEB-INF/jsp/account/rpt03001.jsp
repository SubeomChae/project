<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 총계정원장 -->
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
			var theURL = 'rpt03001_list.do';
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
		var params = '&acct_cd='+acct_cd +'&acct_nm='+acct_nm +'&select_yn=Y&popup_yn=Y';
		popupOpen("/account/pd/rpt01001_list.do?1=1"+encodeURI(params), "rpt01001", 1200, 830);
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 		value="Y">
<input type="hidden" name="excel_file_nm" 	value="총계정원장">

	<h1 class="page-title">총계정원장</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:30%;">
			<col style="width:10%;">
			<col style="width:15%;">
		</colgroup>
		<tbody>
	  		<tr height="28">
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
					<div class="form-inline">
						<div class="input-group">
							<input type="text" name="acct_nm1" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control required" style="width:140px" readOnly>
							<button type="button" class="btn dark" onClick="findAccountCode('&column=acct_cd1,acct_nm1')"><i class="fa fa-search"></i></button>
						</div>&nbsp;~
						<div class="input-group">
							<input type="text" name="acct_nm2" value="<%=box.get("acct_nm")%>" title="계정과목" class="form-control required" style="width:140px" readOnly>
							<button type="button" class="btn dark" onClick="findAccountCode('&column=acct_cd2,acct_nm2')"><i class="fa fa-search"></i></button>
						</div>
						<input type="hidden" name="acct_cd1" value="<%=box.get("acct_cd1")%>">
						<input type="hidden" name="acct_cd2" value="<%=box.get("acct_cd2")%>">
					</div>				
				</td>
				<td class="td-head">회계단위</td>
				<td style="padding-left:5px">
					<select name="acc_unit" title="회계단위" class="bs-select form-control" style="width:120px">
						<option value=''>전체</option>
						<option value='00' <%=box.get("acc_unit").equals("00")?"selected":""%>>목적사업회계</option>
						<option value='20' <%=box.get("acc_unit").equals("20")?"selected":""%>>기금관리회계</option>
					</select>
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
			<span style="color:#01a1db;">계정과목을 클릭</span>하면 보조부로 연결됩니다.</td>
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">
<% } %>
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:20%;">
				<col style="width:12%;">
				<col style="width:32%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:12%;">
			</colgroup>
			<thead>
				<tr>
					<th>계정과목</th>
					<th>결산반영일</th>
					<th>적요</th>
					<th>차변</th>
					<th>대변</th>
					<th>잔액</th>
	         	</tr>
	        </thead>
	        <tbody> 
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="6" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
				int pass_cnt = 0;
				for(int row_index = 0; row_index < rsWp.getLength(); row_index++) { %>	
				<tr bgcolor="<%=rsWp.get("sort_key",row_index).indexOf("z")>=0?"f6f6f6":"ffffff"%>"> 
			<%  if(pass_cnt == 0) {
					int span_cnt = 1;
					for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
						if(!rsWp.get("acct_nm",row_index).equals(rsWp.get("acct_nm",tmp_index))) { break; }
						span_cnt ++;
					}
					if(!box.get("excel_yn").equals("Y") && !rsWp.get("sort_key",row_index).equals("z")) {
						out.println("<td class='t-center' rowspan='"+span_cnt+"' valign='top'><a href=\"javascript:goDetail('"+rsWp.get("sort_key",row_index).substring(0,7)+"','"+rsWp.get("acct_nm",row_index)+"')\">"+rsWp.get("acct_nm",row_index)+"</a></td>");
					}else {
						out.println("<td class='t-center' rowspan='"+span_cnt+"' valign='top'>"+rsWp.get("acct_nm",row_index)+"</td>");
					}
					
					pass_cnt = span_cnt - 1;
				}else {
					pass_cnt --;
				}
				String sign_ymd = "";
				if(rsWp.get("sort_key",row_index).indexOf("z") >= 0) {
					sign_ymd = rsWp.get("sign_ymd",row_index);
				}else if(rsWp.get("sign_ymd",row_index).length() == 6) {
					sign_ymd = "전기이월";
				}else {
					sign_ymd = rsWp.get("sign_ymd",row_index,Box.DEF_DATE_FMT);
				}
			%>
					<td class="t-center"><%=sign_ymd%></td>
					<td><%=rsWp.get("etc_remark",row_index)%></td>
					<td class="t-right"><%=rsWp.get("cha_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("dae_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("remain_amt",row_index,Box.THOUSAND_COMMA)%></td>
				</tr>	
				<% } %>
		  	<% } %>
		  	</tbody>
		</table>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>