<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템문의사항 등록/수정  -->
<script language="javascript">
	var fileCnt = <%=fileWp.getLength()%>;
	function goSave() {
		if (formValidate("#main")) {
			Editor.save();
			if(document.main.req_body.value.length < 20) {
				alert('내용은 20자 이상으로 입력하셔야 합니다.');
				document.main.req_body.focus();
				return
		}
			if(confirm('저장하시겠습니까?')) {
				document.main.input_cnt.value = fileCnt;
				ajaxSubmitForm("boa01003_update.do","#main", function(rtn) {
					if(rtn.isOk == "Y") {
						alert("저장되었습니다.");
						goCancel();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goCancel() {
		document.main.action = '<%=box.get("board_no").equals("")?"boa01001_list.do":"boa01002_select.do"%>';
		document.main.target = '_self';
		document.main.submit();	
	}
	
	function goAddFile() {
		var cHtml = "<tr id='attachDocRow"+fileCnt+"'>"
				  + "	<td>"
				  + "		<div class='form-inline'>"
				  + "			<div class='form-group'>"
				  + "				<div class='fileinput fileinput-new input-group' data-provides='fileinput'>"
				  + "					<div class='bs-select form-control input-fixed' data-trigger='fileinput' style='width:400px;'>"
				  + "						<i class='fa fa-file fileinput-exists'></i>&nbsp;<span class='fileinput-filename'></span>"
				  + "					</div>"
				  + "					<span class='input-group-addon btn dark btn-file'>"
				  + "						<span class='fileinput-new'>파일찾기</span><span class='fileinput-exists'>파일교체</span>"
				  + "						<input type='file' id='attach_doc"+fileCnt+"' name='attach_doc"+fileCnt+"'>"
				  + "					</span>"
				  + "				</div>"
				  + "			</div>"
				  + "			<button type='button' class='btn btn-primary btn-table marL10 marR0' onClick=\"goAddFile()\">추가</button>"
				  + "			<button type='button' class='btn btn-primary btn-table marR0' onClick=\"goDelFile('attachDocRow"+fileCnt+"')\">삭제</button>"
				  + "		</div>"
				  + "	</td>"
				  + "</tr>";
		$("#attachDocTable").append(cHtml);
		appendHtmlAfterWork("#attachDocRow"+fileCnt);
		fileCnt++;
	}
	
	function goDelFile(id) {
		if($("input:file[name^='attach_doc']").length > 1) {
			$("#"+id).remove();
		}else { 
			alert('더 이상 삭제할 수 없습니다.');
		}
	}
	
	function goDeleteFile(file_no, file_path) {
		if(confirm('첨부파일을 삭제하시겠습니까?')) {
			document.main.file_no.value = file_no;
			document.main.file_path.value = file_path;
			ajaxSubmitForm("boa01003_delete_file.do","#main", function(rtn) {
				if(rtn.isOk == "Y") {
					returnFormSubmit(document.main, 'boa01003_edit.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	$(function () {
		goAddFile();
	});	
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="board_no" 	value="<%=obox.get("board_no")%>">
<input type="hidden" name="req_empl_no"	value="<%=obox.get("req_empl_no")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="input_cnt" 	value="">
	
	<h1 class="page-title">시스템문의사항</h1>

	<div class="scrollOptionY" style="height:calc(100vh - 60px)">
		<table class="table table-view table-bordered table-cover mar0">
			<colgroup>
				<col style="width:15%;">
				<col style="width:40%;">
				<col style="width:15%;">
				<col style="width:25%;">
			</colgroup>
			<tbody>
				<tr> 
					<th>질문제목</th>
					<td colspan="3"><input type="text" name="req_head" value="<%=obox.get("req_head")%>" title="제목" class="bs-select form-control required" style="width:500px"></td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td colspan="3">
						<textarea name="req_body" id="req_body" style="display:none"></textarea>
						<%	request.setAttribute("initContents", obox.get("req_body").replace("<photo","<img"));
							request.setAttribute("contents_fld_nm", "req_body");
							request.setAttribute("form_name", "main");
							request.setAttribute("editor_height", "470"); %>
						<%@ include file="/WEB-INF/jsp/com/daumeditor/incDaumEditor.jsp" %>
					</td>												
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
					<% for(int i=0; i < fileWp.getLength(); i++) { %>
						<a href="javascript:fileDownload(document.main,'<%=fileWp.get("file_path",i)%>','<%=fileWp.get("file_nm",i)%>')">
						<img src="/com/img/ico_disk.png"> <%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a>
						<a href="javascript:goDeleteFile('<%=fileWp.get("file_no",i)%>','<%=fileWp.get("file_path",i)%>');"><img src="/com/img/ico_btn_delete.png"></a><br>
					<% } %>
						<table id="attachDocTable">
							<colgroup>
								<col style="width:100%;"/>
							</colgroup>
						</table>
					</td>	
				</tr>
				<tr>
					<th>질문자</th>
					<td><%=obox.get("req_empl_nm")%></td>
					<th>질문일</th>
					<td><%=box.get("board_no").equals("")? DateUtil.defFmtDateTimeAPM(DateUtil.toString("yyyyMMddHHmmss")) : obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%></td>
				</tr>			
			</tbody>
		</table>
	
		<div class="table-bottom-control">
			<span style="width:100%;">
				<span style="float:right;">
					<button type="button" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
					<button type="button" class="btn dark" onClick="goCancel();"><img src="/com/img/ico_btn_cancel.png">취소</button>
				</span>
			</span>
		</div>
	</div>
</form>