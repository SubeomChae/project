<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	boolean isEditable = false;
if(uSesEnt.use_auth.equals("SA")) { isEditable = true; }
%>
<!-- 재무제표배열 등록 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(!document.saveForm.new_seq.value.isNum()) {
				alert('보고서 순서는 숫자로만 입력하셔야 합니다.');
				document.saveForm.new_seq.focus();
				return;
			}else if(isEmpty(document.saveForm.plus_arr) && isEmpty(document.saveForm.minus_arr)) {
				alert('(+)증가수식 또는 (-)감소수식 중의 하나는 반드시 입력해야 합니다.');
				document.saveForm.plus_arr.focus();
				return;
			}else if(!isEmpty(document.saveForm.plus_arr) && !document.saveForm.plus_arr.value.isNumCol()) {
				alert('(+)증가수식은 계정과목코드와 구분자(;)만 입력이 가능합니다.');
				document.saveForm.plus_arr.select();
				return;
			}else if(!isEmpty(document.saveForm.minus_arr) && !document.saveForm.minus_arr.value.isNumCol()) {
				alert('(-)감소수식은 계정과목코드와 구분자(;)만 입력이 가능합니다.');
				document.saveForm.minus_arr.select();
				return;
			}
			if(confirm("저장하시겠습니까?")) {
				document.saveForm.actionType.value = isEmpty(document.saveForm.report_seq) ? 'INSERT' : 'UPDATE';
				removeMask("#saveForm");
				ajaxSubmitForm("acc03003_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						$('#dialog-form').modal('hide');
						returnFormSubmit(document.saveForm, 'acc03001_list.do');
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
			ajaxSubmitForm("acc03003_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					$('#dialog-form').modal('hide');
					returnFormSubmit(document.saveForm, 'acc03001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
</script>

<div class="modal-dialog">
	<div class="modal-content" style="width:650px">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">재무제표 배열</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType">
			<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
			<input type="hidden" name="report_seq" 	value="<%=box.get("report_seq")%>">
			<input type="hidden" name="actionType">
			<table class="table table-view table-bordered table-cover">
				<tbody>
					<tr>
						<th>보고서순서</th>
						<td><input type="text" name="new_seq" value="<%=obox.get("report_seq")%>" maxlength="4" title="보고서순서" class="form-control required tNUM" style="width:50px"></td>
						<th>표시헤더명</th>
						<td><input type="text" name="mark_hdr_nm" value="<%=obox.get("mark_hdr_nm")%>" maxlength="50" title="표시헤더명" class="form-control required" style="width:95%;"></td>
					</tr>
					<tr>
						<th>(+) 증가수식</th>
						<td><input type="text" name="plus_arr" value="<%=obox.get("plus_arr")%>" maxlength="255" title="(+) 증가수식" class="form-control" style="width:95%;"></td>
						<th>(-) 감소수식</th>
						<td style="padding-left:5px"><input type="text" name="minus_arr" value="<%=obox.get("minus_arr")%>" maxlength="255" title="(-) 감소수식" class="form-control" style="width:95%;"></td>
					</tr>
					<tr>
						<th>표시위치</th>
						<td>
							<select name="mark_position" value="<%=obox.get("mark_position")%>" title="표시위치" class="bs-select form-control" style="width:100px">
								<option value="L" <%=obox.get("mark_position").equals("L")?"selected":""%>>좌</option>
								<option value="R" <%=obox.get("mark_position").equals("R")?"selected":""%>>우</option>
							</select>
						</td>
						<th>강조표시</th>
						<td>
							<select name="row_level" title="강조표시" class="bs-select form-control" style="width:100px">
								<option value="">없음</option>
								<option value="1" <%=obox.get("row_level").equals("1")?"selected":""%>>1단계</option>
								<option value="2" <%=obox.get("row_level").equals("2")?"selected":""%>>2단계</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>법정코드</th>
						<td colspan="3">
							<input type="text" name="outer_cd" value="" maxlength="100" title="법정코드" class="form-control" style="width:200px">
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="table-bottom-control">
				<span style="width:100%;">
					<span style="float:right;">
						<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
					<% if(box.get("actionType").equals("view")) { %>
						<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
					<% } %>
						<button type="button" class="btn dark" onClick="$('button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
					</span>
				</span>
			</div>
		</div>
	</div>
</div>