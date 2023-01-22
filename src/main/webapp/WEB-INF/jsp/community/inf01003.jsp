<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 공지사항  등록/수정 -->
<script language="javascript">
	var fileCnt = <%=fileWp.getLength()%>;
	function goSave() {
		if (formValidate("#main")) {
			Editor.save();
			if(document.main.due_ymd.value.replace(/-/g,"") < '<%=DateUtil.toString("yyyyMMdd")%>') {
				alert('공지기한은 오늘 날짜 이후이어야 합니다.');
				document.main.due_ymd.focus();
				return;
			}
			
			if(confirm('저장하시겠습니까?')) {				
				document.main.input_cnt.value = fileCnt;
				ajaxSubmitForm("inf01003_update.do","#main", function(rtn) {
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
			ajaxSubmitForm("inf01003_delete_file.do","#main", function(rtn) {
				if(rtn.isOk == "Y") {
					returnFormSubmit(document.main, 'inf01003_edit.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goCancel() {
		document.main.action = 'inf01001_list.do';
		document.main.target = '_self';
		document.main.submit();	
	}
	
	$(function() {
		goAddFile();
	});	
</script>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data">
<input type="hidden" name="inform_no" 	value="<%=obox.get("inform_no")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="input_cnt" 	value="">

	<h1 class="page-title">공지사항</h1>
	
	<div class="scrollOptionY" style="height:calc(100vh - 60px)">
		<table class="table table-view table-bordered table-cover mar0">
			<colgroup>
				<col style="width:15%;">
				<col style="width:35%;">
				<col style="width:15%;">
				<col style="width:35%;">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="inform_head" value="<%=obox.get("inform_head")%>" title="제목" class="bs-select form-control required" style=";width:500px;"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="inform_body" id="inform_body" style="display:none"></textarea>
						<%	request.setAttribute("initContents", obox.get("inform_body").replace("<photo","<img"));
							request.setAttribute("contents_fld_nm", "inform_body");
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
					<th>작성자</th>
					<td><%=box.get("inform_no").equals("")? uSesEnt.empl_nm : obox.get("sys_reg_nm")%></td>
					<th>작성일</th>
					<td><%=box.get("inform_no").equals("")? DateUtil.defFmtDateTimeAPM(DateUtil.toString("yyyyMMddHHmmss")) : obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%></td>			 
				</tr>
				<tr> 
					<th>공지기한</th>
					<td>
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("due_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="due_ymd" name="due_ymd" value="<%=obox.get("due_ymd")%>" maxlength="8" title="공지기한" class="bs-select form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</td>			 
					<th>자동알림</th>
					<td>
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="popup_yn" value="Y" <%=obox.get("popup_yn").equals("Y") ? "checked" :""%>>로그인 시 팝업<span/>
						</label>
					</td>
				</tr>
			<% if(uSesEnt.use_auth.equals("SA")) { %>	
				<tr> 
					<th>공지대상</th>
					<td colspan="3">
						<select name="corp_cd" title="공지대상" class="bs-select form-control" style="width:200px">
							<option value=''>전체</option>
	                		<%=CodeUtil.optList("PR_COMTB_CORP01_LIST","LISTCODE",obox.get("corp_cd"),"","","","","")%>
	                	</select> 
					</td>
				</tr>
			<% }else { %>	
				<input type="hidden" name="corp_cd" value="<%=uSesEnt.dbo%>">
			<% } %>	
			</tbody>					
		</table>

		<div class="table-bottom-control">
			<span style="width:100%;">
				<span style="float:right;">
					<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
					<button type="button" class="btn dark" onclick="goCancel();"><img src="/com/img/ico_btn_cancel.png">취소</button>
				</span>
			</span>
		</div>	
	</div>
</form>	