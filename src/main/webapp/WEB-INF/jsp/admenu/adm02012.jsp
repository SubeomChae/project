<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"    class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 공통코드 세부 등록 -->
<script language="javascript">
	function goSave() {
		if(formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("adm02012_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						$('#dialog-form').modal('hide');
						returnFormSubmit(document.saveForm, 'adm02011_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}	
		
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("adm02012_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					$('#dialog-form').modal('hide');
					returnFormSubmit(document.saveForm, 'adm02011_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
</script>

<div class="modal-dialog">
	<div class="modal-content" style="width:785px">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">공통코드 세부정보</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="code_group" 	value="<%=box.get("code_group")%>">
			<input type="hidden" name="corp_cd" 	value="<%=box.get("corp_cd")%>">
			<input type="hidden" name="action_type" value="<%=box.get("code1").equals("")?"INSERT":"UPDATE"%>">

				<table class="table table-bordered">
					<tbody>
						<tr>	
							<th style="width:8%">코드1</th>
							<td class="t-center">
								<input type="text" name="code1" value="<%=obox.get("code1")%>" title="코드1" class="form-control required" style="width:95%;background-color:<%=box.get("code1").equals("")?"ffffff":"f6f6f6"%>" <%=box.get("code1").equals("")?"":"readOnly"%>>
							</td>
							<th style="width:8%">코드2</th>
							<td class="t-center"><input type="text" name="code2" value="<%=obox.get("code2")%>" title="코드2" class="form-control" style="width:95%;background-color:<%=box.get("code1").equals("")?"ffffff":"f6f6f6"%>" <%=box.get("code1").equals("")?"":"readOnly"%>></td>
							<th style="width:8%">코드3</th>
							<td class="t-center"><input type="text" name="code3" value="<%=obox.get("code3")%>" title="코드3" class="form-control" style="width:95%;background-color:<%=box.get("code1").equals("")?"ffffff":"f6f6f6"%>" <%=box.get("code1").equals("")?"":"readOnly"%>></td>
							<th style="width:8%">순서</th>
							<td class="t-center"><input type="text" name="sort_order" maxlength="3" value="<%=obox.get("sort_order")%>" class="form-control tNUM" style="width:95%;"></td>
							<th style="width:9%">사용여부</th>
							<td class="t-center">
								<select name="use_yn" class="bs-select form-control" style="width:95%;">
									<option value="Y" <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
									<option value="N" <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
								</select>
							</td>
						</tr>
						<tr>		
							<th>데이터1</th>
							<td class="t-center"><input type="text" name="data1" value="<%=obox.get("data1")%>" title="데이터1" class="form-control required"" style="width:95%"></td>
							<th>데이터2</th>
							<td class="t-center"><input type="text" name="data2" value="<%=obox.get("data2")%>" title="데이터2" class="form-control" style="width:95%;"></td>
							<th>데이터3</th>
							<td class="t-center"><input type="text" name="data3" value="<%=obox.get("data3")%>" title="데이터3" class="form-control" style="width:95%;"></td>
							<th>데이터4</th>
							<td class="t-center"><input type="text" name="data4" value="<%=obox.get("data4")%>" title="데이터4" class="form-control" style="width:95%;"></td>
							<th>데이터5</th>
							<td class="t-center"><input type="text" name="data5" value="<%=obox.get("data5")%>" title="데이터5" class="form-control" style="width:95%;"></td>
						</tr>
					</tbody>
				</table>
			</form>
	
			<% if(uSesEnt.use_auth.equals("SA")) { %>
			<div class="table-bottom-control">
				<span style="width:100%;">
					<span style="float:right;">
			  	  		<button type="button" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
					<% if(box.get("action_type").equals("view")) { %>
						<button type="button" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
					<% } %>
						<button type="button" class="btn dark" onClick="$('button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
					</span>
				</span>
			</div>
			<% } %>
		</div>
	</div>
</div>