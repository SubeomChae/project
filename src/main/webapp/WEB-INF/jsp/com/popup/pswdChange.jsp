<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 비밀번호 변경 -->
<script language="javascript">
	function goPswdChange() {
		if (formValidate("#pForm")) {
			if(document.pForm.new_pswd.value.length < 4) {
				alert("비밀번호는 4자리 이상이어야 합니다.");
				document.main.new_pswd.focus();
				return;
			}else if(document.pForm.new_pswd.value != document.pForm.re_new_pswd.value) {
			    alert("비밀번호 확인이 틀렸습니다.");
			    document.pForm.re_new_pswd.focus();
			    return;
			}else if(document.pForm.old_pswd.value == document.pForm.new_pswd.value) {
			    alert("변경전 비밀번호와 변경후 비밀번호가 동일합니다.");
			    document.pForm.new_pswd.focus();
			    return;
	        }
			
			if(confirm('변경하시겠습니까?')) {
				ajaxSubmitForm("/popup/fd/pswdChange_update.do","#pForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('변경되었습니다.');
						self.close();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goPswdInit() {
		if(confirm('비밀번호를 초기화하시겠습니까?')) {
			ajaxSubmitForm("/insa/fd/ins01002_pswd_init.do","#pForm", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('초기화되었습니다.');
					self.close();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}	
	
	$(function() {
		$(".page-logo-text").html("비밀번호 변경");
	});
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="empl_no" value="<%=box.get("empl_no")%>">
<input type="hidden" name="nextUrl" value="<%=box.get("nextUrl")%>">
	<div class="table-scrollable">	
		<table class="table table-view table-bordered">
			<colgroup>
				<col style="width:22%;">
				<col style="width:28%;">
				<col style="width:22%;">
				<col style="width:28%;">
			</colgroup>
			<tbody>
				<tr> 
					<td class="td-head">사용자 ID</td>
					<td><%=obox.get("user_id")%></td>
					<td class="td-head">성명</td>
					<td><%=obox.get("empl_nm")%></td>
				</tr>
				<tr> 
					<td class="td-head">변경전 비밀번호</td>
					<td colspan="3"><input type="password" name="old_pswd" maxlength="20" class="form-control required" title="변경전 비밀번호" style="width:100px"></td>
				</tr>
				<tr> 
					<td class="td-head">변경후 비밀번호</td>
					<td><input type="password" name="new_pswd" maxlength="20" class="form-control required" title="변경후 비밀번호" style="width:100px"></td>
					<td class="td-head">비밀번호 확인</td>
					<td><input type="password" name="re_new_pswd" maxlength="20" class="form-control required" title="변경후 비밀번호 확인" style="width:100px"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goPswdChange()"><img src="/com/img/ico_btn_edit.png">비밀번호 변경</button>
		<% if(uSesEnt.use_auth.startsWith("S")) { %>
			<button type="button" class="btn dark" onClick="goPswdInit()"><img src="/com/img/ico_btn_edit.png">비밀번호 초기화</button>
		<% } %>
		</span>
	</div>
</form>