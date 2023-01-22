<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "hakwi_cd|complete_flag|","","","",""); %>
<!-- 학력사항 세부정보 등록  -->
<script type="text/javascript">
	function goSave() {
		if(formValidate("#saveForm")) { 
			if(confirm("저장하시겠습니까?")) {
				document.saveForm.actionType.value = isEmpty(document.saveForm.school_seq) ? 'INSERT' : 'UPDATE';
				removeMask("#saveForm");
				ajaxSubmitForm("ins02002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						$('#dialog-form').modal('hide');
						returnFormSubmit(document.saveForm, 'ins02001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			document.saveForm.actionType.value = 'DELETE';
			ajaxSubmitForm("ins02002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					$('#dialog-form').modal('hide');
					returnFormSubmit(document.saveForm, 'ins02001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function changeCompleteFlag(complete_flag) {
		changeObjectProperty(document.saveForm.graduate_ymd, (complete_flag == '5') ? 'enabled' : 'required');
	}
</script>

<div class="modal-dialog">
	<div class="modal-content" style="width:650px">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">학력사항 세부정보</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="empl_no"		value="<%=box.get("empl_no")%>">
			<input type="hidden" name="school_seq"	value="<%=box.get("school_seq")%>">			
			<input type="hidden" name="actionType" 	value="">
			<table class="table table-bordered">
				<colgroup>
					<col style="width:15%;"/>
					<col style="width:35%;"/>
					<col style="width:15%;"/>
					<col style="width:35%;"/>
				</colgroup>
				<tbody>
					<tr>
						<th>학교명</th>
						<td class="t-left">
							<input type="text" name="school_nm" value="<%=obox.get("school_nm")%>" maxlength="10" title="학교명" class="form-control required" style="width:80px">
						</td>
						<th>학위</th>
						<td class="t-left">
							<select name="hakwi_cd" title="학위" class="bs-select form-control" style="width:90px;">
								<option value=''>선택</option>
								<%=CodeUtil.optList(codeWp, "hakwi_cd",obox.get("hakwi_cd"))%>
							</select>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td colspan="3" class="t-left">
							<div class="form-inline">
								<div class="input-group input-medium date date-picker" data-date="<%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="entry_ymd" name="entry_ymd" value="<%=obox.get("entry_ymd")%>" maxlength="8" title="입학년도" class="form-control required tYMD">
									<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
								</div>
								<span> ~ </span>
								<div class="input-group input-medium date date-picker" data-date="<%=obox.get("graduate_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="graduate_ymd" name="graduate_ymd" value="<%=obox.get("graduate_ymd")%>" maxlength="8" title="졸업년도" class="form-control tYMD" <%if(!obox.get("complete_flag").equals("5")){%>required<%}%>>
									<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
								</div>
								<select name="complete_flag" title="졸업구분" class="bs-select form-control" style="width:70px" onChange="changeObjectProperty(document.saveForm.graduate_ymd, this.value=='5'?'enabled':'required');">
									<%=CodeUtil.optList(codeWp, "complete_flag",obox.get("complete_flag"))%>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>전공</th>
						<td colspan="3" class="t-left">
							<input type="text" name="major_nm" value="<%=obox.get("major_nm")%>" maxlength="20" title="전공" class='form-control' style="width:120px">
						</td>
					</tr>
					<tr>
						<th>소재지</th>
						<td colspan="3" class="t-left">
							<input type="text" name="school_loc" value="<%=obox.get("school_loc")%>" maxlength="50" title="소재지" class='form-control' style="width:100%">
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			
			<div class="table-bottom-control">
				<div class="form-inline f-right">
					<div class="form-group">
						<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
					<% if(box.get("actionType").equals("view")) { %>
						<button type="button" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
					<% } %>
						<button type="button" class="btn dark" onClick="$('button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>