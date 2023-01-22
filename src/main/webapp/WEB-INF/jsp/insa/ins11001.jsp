<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 사원명부 검색  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var pageUrl = 'ins11001_list.do';
			if(gbn == 'E') { 
				if(confirm('엑셀파일로 다운로드받으시겠습니까?')) {
					pageUrl += '?excel_yn=P&excel_form_no=INS11001';
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
		ajaxReplaceForm("ins11001_list.do", "#main", "#divListData", function() {
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
<input type="hidden" name="sort_order" 		value=""> 
<input type="hidden" name="page_count" 		value=""> 
<input type="hidden" name="excel_file_nm" 	value="사원명부"> 
	
	<h1 class="page-title">사원명부</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:40%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">사원구분</td>
				<td>
					<select name="empl_class" title="사원구분" class='bs-select form-control' style="width:150px" >
						<option value=''>전체</option>
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST", "LISTCODE", box.get("empl_class"),"empl_class@" + uSesEnt.dbo, "", "", "", "")%>
					</select>
				</td>
				<td class="td-head">부서</td>
				<td>
					<select name="dept_cd" title="부서" class='bs-select form-control' style="width:150px">
						<option value=''>전체</option>
						<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",box.get("dept_cd"), "", "", "", "", "", uSesEnt.dbo)%>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class='bs-select form-control' style="width:90%" >
						<option value='1' <%=box.get("search_key").equals("1") ? "selected" : ""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2") ? "selected" : ""%>>사번</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" class="form-control" value="<%=box.get("search_val")%>" style="width:200px; ime-mode: active;" onkeydown="if(event.keyCode == 13) goSearch();" />
					<label class="mt-checkbox mt-checkbox-outline" style="width:140px">
						<input type="checkbox" name="retire_flag" value="Y" <%=box.get("retire_flag").equals("Y") ? "checked" : ""%>>퇴직자포함<span/>
					</label>
					<span class="t-right">
						<button id="btnSearch" type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button id="btnExcel" type="button" class="btn btn-primary" onClick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</form>
	<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-guide">
		<span style="color:#01a1db;">성명을 클릭</span>하면 해당 사원의 상세정보를 검색할 수 있습니다.<%if(box.get("retire_flag").equals("Y")){%>	(<font color=red>적색</font>은 퇴직자 표시)<%}%>
	</div>
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 160px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:7%;">
				<col style="width:7%;">
				<col style="width:14%;">
				<col style="width:8%;">
				<col style="width:8%;">
				<col style="width:13%;">
				<col style="width:11%;">
				<col style="width:11%;">
				<col style="width:25%;">
			</colgroup>
			<thead>
				<tr>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.empl_no')"><%}%>사번	</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.empl_nm')"><%}%>성명	</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t2.dept_nm')"><%}%>부서 </a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.position_cd')"><%}%>직위</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.entry_ymd')"><%}%>입사일자</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.reside_no')"><%}%>주민등록번호</a>	</th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.hp_no')"><%}%>휴대폰번호</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.tel_no')"><%}%>전화번호</a></th>
					<th><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goSort('t1.addr')"><%}%>주소</a></th>
				</tr>
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr>
					<td colspan="9" class="t-center">등록된 자료가 없습니다.</td>
				</tr>
			<% }else {
		   	   	   for(int i=0; i < rsWp.getLength(); i++) { %>
					<tr class="odd gradeX">
						<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
						<td class="t-center">
							<%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><%}%>
							<font color="<%=rsWp.get("empl_status",i).equals("T")?"red":"black"%>"><%=rsWp.get("empl_nm",i)%></font>
						</a>
						</td>
						<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
						<td class="t-center"><%=rsWp.get("position_nm",i)%></td>
						<td class="t-center"><%=rsWp.get("entry_ymd",i, Box.DEF_DATE_FMT)%></td>
						<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
						<td class="t-center"><%=rsWp.get("hp_no",i)%></td>
						<td class="t-center"><%=rsWp.get("tel_no",i)%></td>
						<td><%=rsWp.get("addr",i)%></td>
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
