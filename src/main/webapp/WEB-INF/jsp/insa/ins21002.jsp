<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<script language="javascript">
	function goEdit() {
		removeMask("#viewForm");
		document.viewForm.action = 'ins21003_edit.do';
		document.viewForm.target = '_self';
		document.viewForm.submit();
	}
	
	function goDelete() {
		if (formValidate("#viewForm")) {
			if(confirm('삭제하시겠습니까?')) {
				removeMask('#viewForm');
				ajaxSubmitForm("ins21002_delete.do","#viewForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						alert('삭제되었습니다.');
						parent.goSearch('');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden"	name="dept_cd"	value="<%=obox.get("dept_cd")%>">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>부서코드</th>
				<td colspan="3"><b><%=obox.get("dept_cd")%></b></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td colspan="3"><%=obox.get("dept_nm")%></td>
			</tr>
			<tr>
				<th>약칭</th>
				<td colspan="3"><%=obox.get("abbr_nm")%></td>
			</tr>
			<tr height="50">
				<th>부서설명</th>
				<td colspan="3" style="padding:5 5 5 5"><%=obox.get("dept_desc",Box.MULTILINE_TEXT)%></td>
			</tr>
			<tr>
				<th>소재지</th>
				<td colspan="3" style="padding:5 5 5 5"><%=obox.get("region_nm")%></td>
			</tr>
			<tr>
				<th width="18%">전화번호</th>
				<td width="32%"><%=obox.get("tel_no")%></td>
				<th width="18%">팩스번호</th>
				<td width="32%"><%=obox.get("fax_no")%></td>
			</tr>
			<tr>
				<th>개설일자</th>
				<td><%=obox.get("open_ymd",Box.DEF_DATE_FMT)%></td>
				<th>폐지일자</th>
				<td><%=obox.get("close_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>
			<tr>
				<th>상위부서</th>
				<td><%=obox.get("upper_nm")%></td>
				<th>부서레벨</th>
				<td><%=obox.get("dept_lvl").equals("")?"":obox.get("dept_lvl")+"레벨"%></td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td><%=obox.get("use_yn").equals("Y")?"예":"아니오"%></td>
				<th>정렬순서</th>
				<td><%=obox.get("sort_order")%></td>
			</tr>
		</table>
	</div>
      
	<div class="table-bottom-control">
	<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
			    <button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
			</span>
		</span>
		<% } %> 
	</div>

</form>