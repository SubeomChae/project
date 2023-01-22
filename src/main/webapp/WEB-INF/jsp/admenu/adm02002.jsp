<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	boolean isEditable = false; 
 	if(box.get("code_group").equals("")) { isEditable = true; }
 	if(uSesEnt.use_auth.equals("SA") && !obox.get("edit_flag").equals("N")) { isEditable = true; }
%>
<!-- 공통코드  -->
<script language="javascript">
	function goSave() {
		if(formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("adm02002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('저장되었습니다.');
						if(document.saveForm.action_type.value == 'INSERT') {
							goSearch(document.saveForm.code_group.value);
						}
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("adm02002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function goDetail(code_group) {
		removeMask("#saveForm");
		document.main.action = 'adm02011_list.do?code_group='+code_group;
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id" 	value="<%=box.get("menu_id")%>">
<input type="hidden" name="action_type" value="<%=box.get("code_group").equals("")?"INSERT":"UPDATE"%>">

	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<th>코드그룹</th>
			<td colspan="3">
			<% if(box.get("code_group").equals("")) { %>
				<input type="text" name="code_group" value="<%=obox.get("code_group")%>" title="코드그룹" class="form-control required" style="width:150px">
			<% }else { %>
				<b><%=obox.get("code_group")%></b>
				<input type="hidden" name="code_group" 	value="<%=obox.get("code_group")%>">
			<% } %>
			</td>
		</tr>
		<tr>
			<th>코드명칭</th>
			<td colspan="3">
			<% if(isEditable) { %>
				<input type="text" name="group_nm" value="<%=obox.get("group_nm")%>" title="코드명칭" class="form-control required" style="width:300px">
			<% }else { %>
				<%=obox.get("group_nm")%><input type="hidden" name="group_nm" value="<%=obox.get("group_nm")%>">
			<% } %>
			</td>
		</tr>
		<tr height="80">
			<th>설명</th>
			<td colspan="3">
			<% if(isEditable) { %>
				<textarea name="code_desc" class="form-control" style="width:100%; height:70px;"><%=obox.get("code_desc")%></textarea>
			<% }else { %>
				<%=obox.get("code_desc",Box.MULTILINE_TEXT)%><input type="hidden" name="code_desc" value="<%=obox.get("code_desc")%>">
				<% } %>
			</td>
		</tr>
		<tr>
			<th>사용여부</th>
			<td colspan="3">
			<% if(isEditable) { %>
				<select name="use_yn" class="bs-select form-control" style="width:80px">
					<option value="Y" <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
					<option value="N" <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
				</select>		
			<% }else { %>
				<%=obox.get("use_yn").equals("N")?"아니오":"예"%><input type="hidden" name="use_yn" value="<%=obox.get("use_yn")%>">
			<% } %>
			</td>
		</tr>
	<% if(!box.get("code_group").equals("")) { %>
		<tr height="30">
			<th>세부코드</th>
			<td colspan="3"><%=obox.get("dtl_cnt")%> 건&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn-table" onClick="goDetail('<%=obox.get("code_group")%>');">상세보기</button>
			</td>
		</tr>
	<% } %>
		<tr>
			<th width="20%">최초등록일시</th>
			<td width="30%"><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%></td>
			<th width="20%">최종수정일시</th>
			<td width="30%"><%=obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%></td>
		</tr>
	</table>
	
<% if(isEditable) { %>
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
	  	  		<button type="button" id="btnSave" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
			<% if(!box.get("code_group").equals("") && obox.getInt("dtl_cnt") == 0) { %>
		  		<button type="button" id="btnDelete" class="btn dark" <%if(box.get("code_group").equals("") || obox.getInt("dtl_cnt") > 0){%>style="display:none"<%}%> onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% } %>
			</span>
		</span>
	</div>
<% } %>
</form>
