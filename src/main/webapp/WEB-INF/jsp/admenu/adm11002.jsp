<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 도움말 등록/수정  -->
<script language="javascript">
	function goSave() {
		if(formValidate("#upload")) { 
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("adm11002_update.do", '#upload', function(rtn) {
					if(rtn.isOk == "Y") {
						self.close();
						opener.goSearch();
						alert('저장되었습니다.');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	$(function() {
		$(".page-logo-text").html("도움말");	
	});
</script>
<form id="upload" name="upload" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="menu_id"		    value="<%=box.get("menu_id")%>">
<input type="hidden" name="pathKey"		    value="userfile">
<input type="hidden" name="file_no"			value="">
<input type="hidden" name="file_nm"			value="">
<input type="hidden" name="file_path"		value="">

	<table class="table table-view table-bordered table-cover marB0">
		<colgroup>
			<col style="width:15%;">
			<col style="width:80%;">
		</colgroup>			
			<tr>
				<th>도움말개요</th>
				<td class="t_left"><textarea name="intro_msg" title="도움말개요" class="required" style="width:100%;height:80px;;ime-mode:active;"><%=obox.get("intro_msg")%></textarea></td>
			</tr>
			<tr>
				<th>이미지파일</th>
				<td>
					<% if(!obox.get("file_nm").equals("")) { %>
						<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><%=obox.get("file_nm")%>
					<% } %>
					<div class="form-inline">
						<div class="form-group">
							<div class="fileinput fileinput-new input-group" data-provides="fileinput">
								<div class="form-control input-fixed" data-trigger="fileinput" style="width:300px;">
									<i class="fa fa-file fileinput-exists"></i>&nbsp;<span class="fileinput-filename"></span>
									
								</div>
								
								<span class="input-group-addon btn dark btn-file">
									<span class="fileinput-new">파일찾기</span><span class="fileinput-exists">파일교체</span>
									<input type="file" id="upload_file" name="upload_file" onChange="checkUploadFile(this.value, 'img')">
									
								</span>	
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>세부내용</th>
				<td class="t_left"><textarea name="help_content" title="세부내용" class="form-control required" style="width:100%;height:470px;"><%=obox.get("help_content")%></textarea></td>
			</tr>
			<tr>
				<th>그 밖의 참고사항</th>
				<td class="t_left"><textarea name="etc_remark" title="그 밖의 참고사항" class="form-control" style="width:100%;height:50;"><%=obox.get("etc_remark")%></textarea></td>
			</tr>	
	</table>
	
	<div class="table-bottom-control">
		<div class="form-inline f-right">
			<button type="button" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
			<button type="button" class="btn dark" onclick="self.close();"><img src="/com/img/ico_btn_cancel.png">취소</button>
		</div>
	</div>
</form>
