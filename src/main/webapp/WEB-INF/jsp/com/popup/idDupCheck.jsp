<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 아이디 중복확인 -->
<script language="javascript">	
	function goCheck()	{
		if(document.idForm.user_id.value.length < 4) {
			alert("아이디는 4자리 이상이어야 합니다.");
			document.idForm.user_id.focus();
			return;
		}else if(isKoreanAll(document.idForm.user_id.value)) {
		    alert("아이디는 영문자와 숫자만 가능합니다.");
		    document.idForm.user_id.focus();
		    return;
        }
		document.idForm.action = "/popup/fd/idDupCheck.do";
		document.idForm.target = '_self';
		document.idForm.submit();
    }
	
	function goSelect(user_id){
		opener.document.saveForm.user_id.value = user_id;
		opener.document.saveForm.dup_check_yn.value = 'Y';
		
		var openURL = getMethodFromUrl(opener.location.href).substring(0,8);
		if(openURL == 'ins01003') {
			$("#btnDupCheck",opener.document).hide();
			$("#btnModifyId",opener.document).show();
		}
		parent.window.close();
	}
	
	$(function() {
		$(".page-logo-text").html("아이디 중복확인");
		document.idForm.user_id.focus();
	});
</script>

<form id="idForm" name="idForm" method="post" class="fType" action="">
<input type="hidden" id="empl_no"	name="empl_no" value="<%=box.get("empl_no")%>">
	<div class="table-scrollable">	
		<table class="table table-view">
			<colgroup>
				<col style="width:100%;">
			</colgroup>
			<tbody>
				<tr> 
					<td>
						<% if(obox.getInt("cnt") == 0) { %>
							<font color=red><b><%=obox.get("user_id")%></b></font> 는(은) 사용 가능한 아이디 입니다. 사용하시겠습니까? 
							<button type="button" class="btn btn-primary btn-table" onClick="goSelect('<%=obox.get("user_id")%>');">YES</button>
						<% }else { %>
							<font color=red><b><%=obox.get("user_id")%></b></font> 는(은) 이미 사용 중인 아이디입니다.
						<% } %><br><br><br>
						<% if(obox.getInt("cnt") == 0) { %>
							다른 아이디를 사용하시려면 아래에 새로운 아이디를 입력하시기 바랍니다.
						<% }else { %>
							다른 아이디를 입력해 보시기 바랍니다.
						<% } %><br>
						<input type="text" name="user_id" value="<%=box.get("user_id")%>" class="form-control" style="width:150px;">
						<button type="button" class="btn btn-primary btn-table" onClick="goCheck();">중복확인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>