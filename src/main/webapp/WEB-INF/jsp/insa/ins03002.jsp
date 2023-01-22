<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "work_cd|school_career_cd|","","","",""); %>
<!-- 가족사항 세부정보 등록  -->
<script type="text/javascript">
	function goSave() {
		if(formValidate("#saveForm")) { 
			if(!chkLocFrnJuminNo(document.saveForm.reside_no1.value, document.saveForm.reside_no2.value)) {
				alert('주민등록번호가 잘못되었습니다.');
				document.saveForm.reside_no1.select();
				return;
			}			
			
			if(confirm("저장하시겠습니까?")) {
				document.saveForm.actionType.value = isEmpty(document.saveForm.family_id) ? 'INSERT' : 'UPDATE';
				removeMask("#saveForm");
				ajaxSubmitForm("ins03002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						$('#dialog-form').modal('hide');
						returnFormSubmit(document.saveForm, 'ins03001_list.do');
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
			ajaxSubmitForm("ins03002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					$('#dialog-form').modal('hide');
					returnFormSubmit(document.saveForm, 'ins03001_list.do');
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
			<h4 class="modal-title">가족사항 세부정보</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="empl_no"		value="<%=box.get("empl_no")%>">
			<input type="hidden" name="family_id"	value="<%=box.get("family_id")%>">
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
						<th>성명</th>
						<td class="t-left">
							<input type="text" name="family_nm" value="<%=obox.get("family_nm")%>" maxlength="10" title="성명" class="form-control required" style="width:80px">
							<select name="family_rel_cd" title="가족관계" class="bs-select form-control required" onChange="if(this.value=='00'){alert('본인은 선택할 수 없습니다.');this.value='';}" style="width:100px;">
								<option value=''>선택</option>
								<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("family_rel_cd"),"family_rel_cd","","","","")%>
							</select>
						</td>
						<th>주민번호</th>
						<td class="t-left">
							<input type="text" name="reside_no1" value="<%=StringUtil.substr(obox.get("reside_no"),0,6)%>" maxlength="6" title="주민번호" class="form-control required autoTab" style=" width:80px; border:1 solid gray"> -
							<input type="text" name="reside_no2" value="<%=StringUtil.substr(obox.get("reside_no"),6)%>" maxlength="7" title="주민번호" class="form-control required autoTab" style=" width:90px; border:1 solid gray">
						</td>
					</tr>
					<tr>
						<th>직업</th>
						<td class="t-left">
							<select name="work_cd" title="직업" class="bs-select form-control" style="width:80px" >
								<option value=''>선택</option>
								<%=CodeUtil.optList(codeWp, "work_cd",obox.get("work_cd"))%>
							</select>
						</td>
						<th>최종학력</th>
						<td class="t-left">
							<select name="school_career_cd" title="최종학력" class="bs-select form-control" style="width:130px">
								<option value=''>선택</option>
								<%=CodeUtil.optList(codeWp, "school_career_cd",obox.get("school_career_cd"))%>
							</select>
						</td>
					</tr>
					<tr>
						<th>근무처</th>
						<td class="t-left"><input type="text" name="work_place" value="<%=obox.get("work_place")%>" maxlength="20" title="근무처" class='form-control' style="width:150px"></td>
						<th>부양가족여부</th>
						<td class="t-left">
							<select name="buyang_yn" title="부양가족여부" class="bs-select form-control" style="width:80px">
								<option value='Y' <%=obox.get("buyang_yn").equals("Y")?"selected":""%>>Yes</option>
								<option value='N' <%=obox.get("buyang_yn").equals("N")?"selected":""%>>No</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td class="t-left"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="50" title="비고" class='form-control' style="width:95%"></td>
						<th>동거여부</th>
						<td class="t-left">
							<select name="living_yn" title="동거여부" class="bs-select form-control" style="width:80px">
								<option value='Y' <%=obox.get("living_yn").equals("Y")?"selected":""%>>Yes</option>
								<option value='N' <%=obox.get("living_yn").equals("N")?"selected":""%>>No</option>
							</select>
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