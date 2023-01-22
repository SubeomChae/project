<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템문의사항 답변 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if (document.main.ans_body.value.length < 20) {
				alert('답변내용은 20자 이상으로 입력하셔야 합니다.');
				document.main.ans_body.select();
				return;
			}
			
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("boa01004_update.do","#main", function(rtn) {
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
		document.main.action = 'boa01001_list.do';
		document.main.target = '_self';
		document.main.submit();	
	}
	
	function goCheckAll() {
		for(var i=0; i < document.main.group_arr.length; i++) {
			document.main.group_arr[i].checked = document.main.check_all.checked;
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id" 	value="<%=box.get("menu_id")%>">
<input type="hidden" name="board_no" 	value="<%=obox.get("board_no")%>">
<input type="hidden" name="ans_empl_no"	value="<%=obox.get("ans_ymd").equals("") ? uSesEnt.empl_no : obox.get("ans_empl_no")%>">
<input type="hidden" name="ans_empl_nm"	value="<%=obox.get("ans_ymd").equals("") ? uSesEnt.empl_nm : obox.get("ans_empl_nm")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">

	<h1 class="page-title">시스템문의사항</h1>
	
	<table class="table table-view table-bordered table-cover mar0">
		<colgroup>
			<col style="width:15%;">
			<col style="width:50%;">
			<col style="width:15%;">
			<col style="width:25%;">
		</colgroup>
		<tbody>
			<tr> 
				<th>질문제목</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("req_head"))%></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("req_body", Box.MULTILINE_TEXT))%></td>
			</tr>
		<% if(fileWp.getLength() > 0) { %>	
			<tr height="28">
				<th>첨부파일</th>
				<td colspan="3">
				<% for(int i=0; i < fileWp.getLength(); i++) { %>
					<a href="javascript:file_download(document.main,'<%=fileWp.get("file_path",i)%>','<%=fileWp.get("file_nm",i)%>')">
					&nbsp;<img src="/com/img/icn_disk.gif" align="absmiddle" border="0"> <%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a><br>
				<% } %>
				</td>
			</tr>
		<% } %>
			<tr>
				<th width="15%">질문자</th>
				<td><b><a href="javascript:goEmployeePop('<%=obox.get("req_empl_no")%>')"><%=obox.get("req_empl_nm")%><%if(!obox.get("req_email_id").equals("")){ %>(<%=obox.get("req_email_id")%>)<%}%></b></a></td>
				<th width="15%">질문일</th>
				<td width="35%" class="v-top"><%=obox.get("req_ymd", Box.DEF_DATE_FMT)%></td>
			</tr>
			<tr> 
				<th>답변제목</th>
				<td colspan="3"><input type="text" name="ans_head" value="<%=obox.get("ans_ymd").equals("") ? obox.get("req_head") : obox.get("ans_head")%>" size="70" maxlength="100" title="답변제목"  class="form-control required" style="border:1 solid gray;ime-mode:active;"></td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td colspan="3">
					<textarea name="ans_body" title="내용" class="form-control" style="width:100%;height:190px;ime-mode:active;"><%=obox.get("ans_body")%></textarea>
				</td>													
			</tr>
			<tr height="28">
				<th width="15%">답변자</th>
				<td width="35%"><%=obox.get("ans_ymd").equals("") ? uSesEnt.empl_nm : obox.get("ans_empl_nm")%></td>
				<th width="15%">답변일</th>
				<td width="35%"><%=obox.get("ans_ymd").equals("") ? DateUtil.toString("yyyy-MM-dd") : obox.get("ans_ymd", Box.DEF_DATE_FMT)%></td>
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
</form>