<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 분개장 -->
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
			
	    	var pageUrl = 'rpt02001_list.do';
	      	if(gbn == 'E') { 
	        	if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
	            	pageUrl += '?excel_yn=P&excel_form_no=RPT02001';
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
		ajaxReplaceForm("rpt02001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="excel_file_nm" value="분개장">

	<h1 class="page-title">분개장</h1>
	
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
				<td class="td-head">거래처/사원명</td>
				<td>
					<div class="input-group">
						<input type="text" name="cust_nm" value="<%=box.get("cust_nm")%>" class="form-control" style="width:160px; border:1 solid gray;ime-mode:active;" onKeyUp="document.main.cust_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<button type="button" class="btn dark" onClick="findCustCode('')"><i class="fa fa-search"></i></button>
						<input type="hidden" name="cust_cd" value="<%=box.get("cust_cd")%>">
					</div>	
				</td>
				<td class="td-head">적요</td>
				<td nowrap>
					<input type="text" name="etc_remark" value="<%=box.get("etc_remark")%>" class="form-control" style="width:160px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N');">					
				</td>
				<td class="td-head">
					<select name="rel_no_type" title="관련번호유형" class="bs-select form-control" style="width:99%">
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
			<span style="font-weight:bold; color:#01a1db;">전표번호를 클릭</span>하면 전표세부내용을 조회할 수 있습니다.
		</div>
		<span class="f-right">
			<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
			<button type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
		</span>
	</div>
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 200px)">
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:10%;">
				<col style="width:18%;">
				<col style="width:17%;">
				<col style="width:10%;">
				<col style="width:18%;">
				<col style="width:17%;">
				<col style="width:10%;">
			</colgroup>
			<thead>
				<tr>
					<th rowspan="3">결산반영일</th>
					<th colspan="3">차&nbsp;&nbsp;&nbsp;&nbsp;변</th>
					<th colspan="3">대&nbsp;&nbsp;&nbsp;&nbsp;변</th>
	         	</tr> 
				<tr>
					<th>계정과목</th>
					<th>거래처/사원명</th>
					<th>금액</th>
					<th>계정과목</th>
					<th>거래처/사원명</th>
					<th>금액</th>
	         	</tr> 
				<tr>
					<th>관리항목</th>
					<th colspan="2">적&nbsp;&nbsp;&nbsp;&nbsp;요</th>
					<th>관리항목</th>
					<th colspan="2">적&nbsp;&nbsp;&nbsp;&nbsp;요</th>
	         	</tr>
	        </thead>
	        <tbody> 
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="7" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
				int pass_cnt = 0;
		   		for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
				<tr> 
				<%  if(pass_cnt == 0) {
						int span_cnt = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("slip_no",row_index).equals(rsWp.get("slip_no",tmp_index))) { break; }
							span_cnt ++;
						}
				%>
					<td class="t-center td-head" rowspan="<%=(span_cnt*2)%>">
						<%=rsWp.get("sign_ymd",row_index,Box.DEF_DATE_FMT)%>
						<br><div style="font-size:11px;">(<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",row_index)%>')"><%}%><b><%=rsWp.get("slip_no",row_index,Box.SLIP_NO)%></b></a>)</div>
					</td>
				<%		pass_cnt = span_cnt - 1;
					}else {
						pass_cnt --;
					}
				%>
					<td class="t-left"><%=rsWp.get("acct_nm1",row_index)%></td>
					<td class="t-left"><%=rsWp.get("item_nm1",row_index)%></td>
					<td class="t-right"><%=rsWp.get("slip_amt1",row_index,Box.THOUSAND_COMMA)%></td>
					<td class="t-left"><%=rsWp.get("acct_nm2",row_index)%></td>
					<td class="t-left"><%=rsWp.get("item_nm2",row_index)%></td>
					<td class="t-right"><%=rsWp.get("slip_amt2",row_index,Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr> 
					<td class="t-left"><%=rsWp.get("cust_nm1",row_index)%></td>
					<td colspan="2" class="t-left"><%=rsWp.get("etc_remark1",row_index)%></td>
					<td class="t-left"><%=rsWp.get("cust_nm2",row_index)%></td>
					<td colspan="2" class="t-left"><%=rsWp.get("etc_remark2",row_index)%></td>
				</tr>	
				<% } %>
		   	<% } %>
	   		</tbody>
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 100, request)%>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
