<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 자료실 등록/수정 -->
<script language='javascript'>
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				var pageUrl = "pds01002_update.do?action_type=" + (isEmpty(document.saveForm.file_no) ? 'INSERT' : 'UPDATE');
				ajaxSubmitForm(pageUrl, "#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						self.close();
						opener.goSearch();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}	
	
	function goCancel() {
		document.main.action = 'pds01001_list.do';
		document.main.target = '_self';
		document.main.submit();	
	}
	
	$(function() {
		$(".page-logo-text").html("자료실");	
	});
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="file_no" value="<%=box.get("file_no")%>">

	<table class="search-panel table table-bordered table-cover marB0">
	 	<tbody>
		  	<tr>
				<td class="td-head" style="width:20%">자료분류</td>
				<td colspan="3">
					<select name="file_category" title="자료분류" class="bs-select form-control required" style="width:160px">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("file_category"),"file_category","","","","")%>
		    		</select>
		       	</td>
		     </tr>
		  	 <tr>
				<th>파일명</th>
				<td>
				<% if(!obox.get("file_nm").equals("")) { %>
					<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><%=obox.get("file_nm")%>
					<input type="hidden" name="old_file_path" value="<%=obox.get("file_path")%>">
				<% } %>
					<div class="form-inline">
						<div class="form-group">
							<div class="fileinput fileinput-new input-group" data-provides="fileinput">
								<div class="form-control input-fixed required" data-trigger="fileinput" style="width:346px;">
									<i class="fa fa-file fileinput-exists"></i>&nbsp;<span id="file_nm" class="fileinput-filename"></span>
								</div>	
								<span class="input-group-addon btn dark btn-file">
									<span class="fileinput-new">파일찾기</span><span class="fileinput-exists">파일교체</span>
									<input type="file" id="file_path" name="file_path"  title="파일명"  class="required">
								</span>
							
							</div>
						</div>
					</div>
				</td>
		     </tr>
		     <tr height="100">
				<th>파일설명</th>
				<td colspan="3"><textarea name="file_desc" title="파일설명" class="form-control required" style="width:100%;height:90px;"><%=obox.get("file_desc")%></textarea></td>
		     </tr>
		<% if(uSesEnt.use_auth.equals("SA")) { %>	
			 <tr> 
				<th>공지대상</th>
				<td colspan="3">
					<select name="corp_cd" title="공지대상" class="bs-select form-control" style="width:200px">
						<option value=''>전체</option>
						<%=CodeUtil.optList("PR_COMTB_CORP01_LIST","LISTCODE","","","","","","")%>
	              	</select> 
				</td>
			 </tr>
		<% }else { %>	
		 	<input type="hidden" name="corp_cd" value="<%=uSesEnt.dbo%>">
		<% } %>	
		     <tr>
				<th>등록자</th>
				<td colspan="3"><%=box.get("file_no").equals("") ? uSesEnt.user_nm : obox.get("sys_reg_nm")%></td>
		     </tr>
		     <tr>
				<th>등록일시</th>
				<td colspan="3"><%=box.get("file_no").equals("") ? DateUtil.defFmtDateTimeAPM(DateUtil.toString("yyyyMMddHHmmss")) : obox.get("sys_upd_date", Box.DEF_DATETIME_FMT_APM)%></td>
			</tr>
	  	</tbody>
 	</table>
</form>

<div class="table-bottom-control">
	<span style="width:100%;">
		<span style="float:right;">
			<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
			<button type="button" class="btn dark marR5" onclick="self.close();"><img src="/com/img/ico_btn_cancel.png">취소</button>
		</span>
	</span>
</div>