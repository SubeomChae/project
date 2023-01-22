<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box" 		class="egovframework.cbiz.Box" 			scope="request" />
<jsp:useBean id="rsWp" 		class="egovframework.cbiz.RsWrapper" 	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 임직원정보 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(empl_no) {
		document.main.page_count.value = '';
		ajaxReplaceForm("ins01001_list.do", "#main", "#divListData", function() {
			if(empl_no == '') {
				if ($("tr[id='tr_0']").attr("empl_no") != undefined) {
					goDetail($("tr[id='tr_0']").attr("empl_no"));
				} else {
					$("#ulTab").hide();
				}
			}else {
				goDetail(empl_no); 
			}
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("ins01001_list.do", "#main", "#divListData", function() {
			var empl_no = $("tr[id='tr_0']").attr("empl_no");
			if(empl_no != undefined) { goDetail(empl_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goDetail(empl_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(empl_no != '') { $("tr[empl_no='"+empl_no+"']").addClass("bg-yellow"); }
		$("[name='empl_no']").val(empl_no);
		$('ul .active').trigger('click');
		$("#tabDef2").show();
		$("#tabDef3").show();
	}
	
	function goTabpage(tabIdx) {
		var empl_no =	$("#main [name='empl_no']").val();
		var theUrl = "";
		if(tabIdx == 0) {
			theUrl = "/insa/fd/ins01002_select.do";
		}else if(tabIdx == 1) {
			theUrl = "/insa/fd/ins02001_list.do";
		}else if(tabIdx == 2) {
			theUrl = "/insa/fd/ins03001_list.do";
		}	
		$('#ifrm').attr('src', theUrl+"?empl_no="+ empl_no);
	} 

	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		$("#ulTab> li").removeClass('active');
		$("#tabDef1").addClass('active');
		$("#tabDef2").hide();
		$("#tabDef3").hide();
		document.ifrm.location.href = "/insa/fd/ins01003_edit.do";
	} 
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('');
	}
	
	function goUpload() {
    	var file_nm = document.tempForm.uploadFile.value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'xls') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[xls 형식만 업로드 가능)');
    		return;
    	}
		if(confirm('업로드하시겠습니까?')) {
			ajaxSubmitForm("ins01001_upload.do","#tempForm", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					alert('업로드되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
				$("#uploadFile").val('');
			});
		}
    }
	
	$(function() {
	<% if(rsWp.getLength() > 0) { 
		out.println("goDetail('"+rsWp.get("empl_no",0)+"');");
	   }
	%>
		fixTableHeader("MyTable");
	});
</script>

<table class="table-top-control">
	<tr height="35">
		<td><h1 class="page-title">임직원정보</h1></td>
	<% if(uSesEnt.use_auth.startsWith("S")) { %>
		<td>
			<form id="tempForm" name="tempForm" method="post" action="" enctype="multipart/form-data" style="margin:0px">
			<input type="hidden" name="pathKey"		value="template">
			<input type="hidden" name="file_nm"		value="">
			<input type="hidden" name="file_path"	value="">
			<div class="form-inline f-right">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="fileDownload(document.tempForm, 'emplTemplate.xls', 'emplTemplate.xls')"><img src="/com/img/ico_btn_excel.png">임직원정보 입력템플릿 다운로드</button>
					<label class="btn btn-primary marL5" for="uploadFile"><img src="/com/img/ico_btn_save.png"> 업로드</label>
					<input type="file" id="uploadFile" name="uploadFile" onChange="goUpload()" style="position:absolute; clip:rect(0, 0, 0, 0);">
				</div>
			</div>
			</form>
		</td>	
	<% } %>
	</tr>
</table>
<form id="main" name="main" method="post" action="" class="fType" style="margin: 0px">
<input type="hidden" name="empl_no" 	value="">
<input type="hidden" name="tab_index" 	value="1">
<input type="hidden" name="sort_order" 	value="">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count" 	value="">
	
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
					<select name="search_key" class='bs-select form-control' style="width:95%" >
						<option value='1' <%=box.get("search_key").equals("1") ? "selected" : ""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2") ? "selected" : ""%>>사번</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
					<label class="mt-checkbox mt-checkbox-outline" style="width:140px"> 
						<input type="checkbox" name="retire_flag" value="Y" <%=box.get("retire_flag").equals("Y") ? "checked" : ""%>>퇴직자포함<span/>
					</label>
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색	</button>
						<%if (uSesEnt.use_auth.startsWith("S")) {%><button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규	</button><%}%>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 140px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:80px;">
						<col style="width:80px;">
						<col style="width:90px;">
						<col style="width:*;">
					</colgroup>
					<thead>
						<tr height="20">
							<th><a href="javascript:goSort('t1.empl_no')">사번</a></th>
							<th><a href="javascript:goSort('t1.empl_nm')">성명</a></td>
							<th><a href="javascript:goSort('position_nm')">직위</a></td>
							<th><a href="javascript:goSort('t2.dept_nm')">부서명</a></td>
						</tr>
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
						<tr height="25">
							<td colspan="4" class="t-center">등록된 자료가 없습니다.</td>
						</tr>
					<%}else { 
						for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" empl_no="<%=rsWp.get("empl_no",i)%>" class="odd gradeX" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("empl_no",i)%>')">
								<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
								<td class="t-center"><font color="<%=rsWp.get("empl_status",i).equals("T")?"red":"black"%>"> <%=rsWp.get("empl_nm",i)%></font></td>
								<td class="t-center"><%=rsWp.get("position_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
							</tr>
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
		
		</div>
		
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div class="portlet-body">
				<div class="contentsRow portlet-body-hr">
					<ul id="ulTab" class="nav nav-tabs">
						<li id="tabDef1" class="active" onclick="goTabpage(0)"><a href="#" data-toggle="tab">기본인적사항</a></li>
						<li id="tabDef2" onclick="goTabpage(1)"><a href="#" data-toggle="tab">학력사항</a></li>
						<li id="tabDef3" onclick="goTabpage(2)"><a href="#" data-toggle="tab">가족사항</a></li>
					</ul>
				</div>
			</div>
			
			<iframe name="ifrm" id="ifrm" marginwidth="0" frameborder="0" style="width:100%;height:calc(100vh - 183px);" scrolling="no"></iframe>
			
		</div>
	</div>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>

