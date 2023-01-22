<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(dept_cd) {
		document.main.page_count.value = '';
		ajaxReplaceForm("ins21001_list.do", "#main", "#divListData", function() {
			if(dept_cd == '') {
				if ($("tr[id='tr_0']").attr("dept_cd") != undefined) {
					goDetail($("tr[id='tr_0']").attr("dept_cd"));
				}
			}else {
				goDetail(dept_cd); 
			}
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("ins21001_list.do", "#main", "#divListData", function() {
			var dept_cd = $("tr[id='tr_0']").attr("dept_cd");
			if(dept_cd != undefined) { goDetail(dept_cd); }
			fixTableHeader("MyTable");
		});
		return false;
	}

	function goDetail(dept_cd) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(dept_cd != '') { $("tr[dept_cd='"+dept_cd+"']").addClass("bg-yellow"); }
        var theUrl= '/insa/fd/ins21002_select.do'
		document.main.dept_cd.value = dept_cd;
		document.ifrm.location.href = theUrl+"?dept_cd="+ dept_cd;	

	}

	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		document.ifrm.location.href = "/insa/fd/ins21003_edit.do";
	}
	
	function goUpload() {
    	var file_nm = document.tempForm.uploadFile.value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'xls') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[xls 형식만 업로드 가능)');
    		return;
    	}
		if(confirm('업로드하시겠습니까?')) {
			ajaxSubmitForm("ins21001_upload.do","#tempForm", function(rtn) {
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
    
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('');
	}
	
	$(function() {
	<% if(rsWp.getLength() > 0) { 
		out.println("goDetail('"+rsWp.get("dept_cd",0)+"');");
	   }
	%>
		fixTableHeader("MyTable");
	});
</script>

<table class="table-top-control">
	<tr height="35">
		<td><h1 class="page-title">부서정보</h1></td>
	<% if(uSesEnt.use_auth.startsWith("S")) { %>
		<td>
			<form id="tempForm" name="tempForm" method="post" action="" enctype="multipart/form-data" style="margin:0px">
			<input type="hidden" name="pathKey"		value="template">
			<input type="hidden" name="file_nm"		value="">
			<input type="hidden" name="file_path"	value="">
			<div class="form-inline f-right">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="fileDownload(document.tempForm, 'deptTemplate.xls', 'deptTemplate.xls')"><img src="/com/img/ico_btn_excel.png">부서정보 입력템플릿 다운로드</button>
					<label class="btn btn-primary marL5" for="uploadFile"><img src="/com/img/ico_btn_save.png"> 업로드</label>
					<input type="file" id="uploadFile" name="uploadFile" onChange="goUpload()" style="position:absolute; clip:rect(0, 0, 0, 0);">
				</div>
			</div>
			</form>
		</td>	
	<% } %>
	</tr>
</table>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="dept_cd" 	value="">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count" 	value="">
	
	<table class="search-panel table table-bordered">
  		<tr>
			<td width="10%" class="td-head">
				<select name="search_key" class="bs-select form-control" style="width:90%">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>부서명</option>
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>부서설명</option>
				</select>
			</td>
			<td width="*%">
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;" onkeydown="if(event.keyCode == 13) goSearch('');">&nbsp;
				<label class="mt-checkbox mt-checkbox-outline" style="width:140px"> 
					<input type="checkbox" name="use_yn" value="Y" <%=box.get("use_yn").equals("Y")?"checked":""%> style="border:none"> 폐지부서포함<span/>
				</label>
				<span class="f-right marR60">
		  		   	<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
					<% if(uSesEnt.use_auth.startsWith("S")) { %>
						<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
					<% } %>
				</span>
			</td>
		</tr>
	</table>
	
</form>		
<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div class="table-scrollable" style="width:100%; height:calc(100vh - 140px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:25%;">
						<col style="width:55%;">
					</colgroup>
					<thead>
						<tr>
							<th><a href="javascript:goSort('t1.dept_cd')">부서코드</a></th>
							<th><a href="javascript:goSort('t1.dept_nm')">부서명</a></th>
						</tr>
					</thead> 
					<tbody>	
					<% if(rsWp.getLength() == 0) { %>
						<tr height="25"><td colspan="2" class="t-center">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						  for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" dept_cd="<%=rsWp.get("dept_cd",i)%>" class="odd gradeX" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("dept_cd",i)%>')"> 
							<td class="t-center"><%=rsWp.get("dept_cd",i)%></td>
							<td><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":"black"%>"><%=rsWp.get("dept_nm",i)%></font></td>
						</tr>
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			
			<%=PageUtil.makePaging(box, rsWp, 100, 5, "COUNT", request)%>
		</div>
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col" style="overflow-y:none;">
			<iframe name="ifrm" marginwidth="0"  style="width:100%; height:800px;" frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>