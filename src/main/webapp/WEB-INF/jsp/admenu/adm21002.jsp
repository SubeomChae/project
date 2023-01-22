<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 월간주요일정 등록 -->
<script language='javascript'>
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("adm21002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch();
						$('#dialog-form').modal('hide');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
</script>

<div class="modal-dialog">
	<div class="modal-content" style="width:650px">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">월간 주요일정 등록</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="sys_ymd" value="<%=box.get("sys_ymd")%>">
			<table class="search-panel table table-bordered table-cover mar0">
				<tbody>
					<tr>
						<td class="td-head">기준일자</td>
						<td colspan="3" style="padding-left:5px"><%=box.get("sys_ymd", Box.DEF_DATE_FMT)%></td>
				     </tr>
				     <tr>
						<td class="td-head">선택</td>
						<td colspan="3">
						<% if(box.get("day_of_week").equals("0")) { %>
							<font color=red>일요일</font>
							<input type="hidden" name="holiday_yn" value="Y">
						<% }else { %>
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="holiday_yn" value="N" <%=obox.get("holiday_yn").equals("Y")?"":"checked"%> style="border:none;"> 근무일&nbsp;&nbsp;<span/>
						</label>
						<label class="mt-radio mt-radio-outline">
							<input type="radio" name="holiday_yn" value="Y" <%=obox.get("holiday_yn").equals("Y")?"checked":""%> style="border:none;"> 공휴일<span/>
						</label>
						<% } %>
						</td>
			    	</tr>
			     	<tr>
						<td class="td-head">일정</td>
						<td colspan="3"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="40" title="일정" class="form-control" style="width:98%;ime-mode:active;"></td>
			     	</tr>
				</tbody>
			</table>
			</form>	
			<div class="table-bottom-control">
				<span style="width:100%;">
					<span style="float:right;">
				  		<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
				  		<button type="button" class="btn dark marR5" onclick="$('button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
				  	</span>
				</span>
			</div>
		</div>				
	</div>
</div>