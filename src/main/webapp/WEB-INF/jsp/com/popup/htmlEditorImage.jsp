<%@page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<script src="/com/plugins/daumeditor/js/popup.js" type="text/javascript" charset="utf-8"></script>
<script language="javascript">	
	function goUpload() {
    	var file_nm = document.fileForm.attach_doc.value
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'gif' && file_type != 'jpg' && file_type != 'jpeg' && file_type != 'bmp' && file_type != 'png') {
	   		alert('파일형식이 옳바르지 않습니다.\n\n[gif, jpg, jpeg, bmp, png 파일만 업로드 가능]');
	   		document.fileForm.attach_doc.value = '';
	   		return;
	   	}
    	
		ajaxSubmitForm("/popup/htmlEditorImage_update.do","#fileForm", function(rtn) {
			if(rtn.isOk == "Y") {
				goUploadPost(rtn.file_path);
			}else {
				alert(rtn.errMsg);
			}
		});
	}
	
	function goUploadPost(file_path, file_nm) {
		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		
		var _mockdata = {
			'imageurl': '/upload_data/editor/'+file_path,
			'filename': file_path,
			'filesize': 640,
			'imagealign': 'L',
			'originalurl': '/upload_data/editor/'+file_path,
			'thumburl': '/upload_data/editor/'+file_path
		};
		execAttach(_mockdata);
		closeWindow();
	}

	$(function() {
		$(".page-logo-text").html("공지사항");
		var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	    	
	});
</script>
	<div class="modal-body">
		<form name="fileForm" id="fileForm" method="post" action="" class="fType" enctype="multipart/form-data">
		<input type="hidden" name="pathKey"   id="pathKey"   value="<%=box.get("pathKey")%>">
		
		<div class="contentWrapper" style="padding:0px;">
			<div class="contentsRow table-scrollable">
				<table id="MyTable" class="table table-bordered">
					<thead>
						<tr>
							<th width="60%">파일명</th>
						</tr>
					</thead>
					<tbody>
						<tr id="tr" class="odd gradeX">
							<td align="center"><input type='file' name='attach_doc' style='width:410px; height:30px;'></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="table-bottom-control">
				<div class="form-inline f-right">
					<button type="button" class="btn dark" onClick="goUpload();"><img src="/com/img/ico_btn_save.png" alt="icon">업로드</button>
				</div>
			</div>
		</div>	
		</form>	
	</div>	
</div>