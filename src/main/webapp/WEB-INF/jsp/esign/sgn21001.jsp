<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 기록물등록대장  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
	    	var pageUrl = 'sgn21001_list.do';
	      	if(gbn == 'E') { 
	        	if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
	            	pageUrl += '?excel_yn=P&excel_form_no=SGN21001';
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
		ajaxReplaceForm("sgn21001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('N');
	}
	
	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn"  		value="Y"> 
<input type="hidden" name="sort_order"  	value=""> 
<input type="hidden" name="page_count" 		value="">
<input type="hidden" name="excel_file_nm" 	value="기록물등록대장">

	<h1 class="page-title">기록물등록대장</h1>

	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:16%;">
			<col style="width:10%;">
			<col style="width:21%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:13%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">문서구분</td>
	  			<td>
					<select name="msg_type" class="bs-select form-control" style="width:160px;">
						<option value=''>전체</option>
					<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "", "msg_type","","","","");
						for(int i=0; i < codeWp.getLength(); i++) { %>
						<option value="<%=codeWp.get("code",i)%>" <%=codeWp.get("code",i).equals(box.get("msg_type"))?"selected":""%>><%=codeWp.get("data",i)%></option>
					<%  } %>
					</select>
				</td>
				<td class="td-head">문서제목</td>
				<td><input type="text" name="subject" value="<%=box.get("subject")%>" class="form-control" style="width:95%;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N');"></td>
				<td class="td-head">생산부서</td>
				<td>
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<div class="input-group f-left" style="width:95%;">
						<input type="text" name="dept_nm" value="<%=box.get("dept_nm")%>" class="form-control" style="ime-mode:active;" onKeyUp="document.main.dept_cd.value='';" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="find_dept_code('')"><i class="fa fa-search"></i></button></span>
					</div>
				<% }else { %>
					<%=uSesEnt.dept_nm%>
				<% } %>
					<input type="hidden" name="dept_cd" value="<%=box.get("dept_cd")%>">
				</td>
				<td class="td-head">결재상태</td>
				<td>
					<select name="sign_status" class="bs-select form-control" style="width:70px">
						<option value=''>전체</option>
						<option value='3' <%=box.get("sign_status").equals("3")?"selected":""%>>완료</option>
						<option value='2' <%=box.get("sign_status").equals("2")?"selected":""%>>진행</option>
						<option value='1' <%=box.get("sign_status").equals("1")?"selected":""%>>대기</option>
						<option value='4' <%=box.get("sign_status").equals("4")?"selected":""%>>반려</option>
					</select>
				</td>
	  		</tr>
	  		<tr>
				<td class="td-head">문서번호</td>
				<td nowrap style="padding-left:5px">
					<input type="text" name="msg_no1" value="<%=box.get("msg_no1")%>" class="form-control" maxlength="8" style="width:82px;"> - 
					<input type="text" name="msg_no2" value="<%=box.get("msg_no2")%>" class="form-control" style="width:63px;" onkeydown="if(event.keyCode == 13) goSearch('N')">
				</td>
				<td class="td-head">기안일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="기안일자(부터)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="기안일자(까지)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>기안자성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>기안자사번</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:95%;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N');">
				</td>
				<td colspan="2" class="t-center">
					<button type="button" id="btnSearch" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" id="btnExcel" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
				</td>
	  		</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-guide">
		<span style="color:#01a1db;">문서번호를 클릭</span>하면 해당 기록물 세부내용을 조회할 수 있습니다.
	</div>
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 200px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgorup>
				<col style="width:12%">
				<col style="width:26%">
				<col style="width:16%">
				<col style="width:15%">
				<col style="width:10%%">
				<col style="width:8%">
				<col style="width:13%">
			</colgorup>
			<thead>
				<tr>
					<th>문서번호</th>
					<th>문서제목</th>
					<th>기안일시</th>
					<th>생산부서</th>
					<th>기안자</th>
					<th>결재상태</th>
					<th>문서구분</th>
				</tr> 
			</thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr class="odd gradeX"> 
					<td><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDocuViewer('<%=rsWp.get("msg_no",i)%>')"><%}%><span style="letter-spacing:0px"><%=FormatUtil.msgNo(rsWp.get("msg_no",i))%></span></a></td>
					<td><%if(!box.get("excel_yn").equals("Y") && !rsWp.get("open_scope",i).equals("") && !rsWp.get("open_scope",i).equals("4")){%><img src="/com/img/icon_noxo.gif" border=0 align="absmiddle" alt="<%=rsWp.get("open_scope_nm",i)%>"> <%}%><%=StringUtil.getReplaceSpecialCharacters(rsWp.get("subject",i))%></td>
					<td><%=rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
					<td style="letter-spacing:-1px"><%=rsWp.get("send_dept_nm",i)%></td>
					<td style="letter-spacing:-1px"><%=rsWp.get("send_empl_nm",i)%></td>
					<td style="letter-spacing:-1px"><%=rsWp.get("sign_status_nm",i)%></td>
					<td style="letter-spacing:-1px"><%=rsWp.get("msg_type_nm",i)%></td>
				</tr>
			<% } %>
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="7" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% } %>
			</tbody>
		</table>
	</div>

	<%=PageUtil.makePaging(box, rsWp, 30, request)%>

<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
	