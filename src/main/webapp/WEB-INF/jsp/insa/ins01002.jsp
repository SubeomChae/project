<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 기본인적사항 -->
<script language="javascript">
	function goEdit() {
		if (formValidate("#main")) {
			document.main.action = 'ins01003_edit.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goDelete() {
		if (formValidate("#main")) {
			if(confirm('삭제하시겠습니까?')) {
				removeMask('#main');
				ajaxSubmitForm("ins01002_delete.do","#main", function(rtn) {
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
	
	function goChangePswd()	{
		theURL = "/popup/fd/pswdChange.do?empl_no="+document.main.empl_no.value;
		window.open(theURL,'pswdChange','width=600,height=220,left=300,top=150');
 	}
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="empl_no" value="<%=box.get("empl_no")%>">
<input type="hidden" name="popup_yn" value="<%=box.get("popup_yn")%>">
<input type="hidden" name="dup_check_yn" value="N">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<td rowspan="7" width="20%" class="t-center">
					<img src="/upload_data/photo/<%=StringUtil.urlEncode(obox.get("photo_file"))%>" width="120" height="130" border="0" align="absmiddle" alt="<%=obox.get("empl_nm")%> <%=obox.get("position_nm")%>" onerror="this.src='/com/img/no_photo.gif'">
				</td>
				<th width="15%">사번</th>
				<td width="25%"><b><%=obox.get("empl_no")%></b></td>
				<th width="15%">성명</th>
				<td width="25%"><%=obox.get("empl_nm")%></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
				<th>생년월일</th>
				<td><%=obox.get("birth_ymd",Box.DEF_DATE_FMT)%><%if(!obox.get("solar_lunar").equals("")){%> (<%=obox.get("solar_lunar").equals("S")?"양력":"음력"%>)<%}%></td>
			</tr>
			<tr>
				<th>부서</th>
				<td colspan="3"><%=obox.get("dept_nm")%></td>
			</tr>
			<tr>
				<th>직위</th>
				<td><%=obox.get("position_nm")%></td>
				<th>직급</th>
				<td><%=obox.get("grade_nm")%></td>
			</tr>
			<tr>
				<th>보직</th>
				<td><%=obox.get("bojik_nm")%></td>
				<th>재직상태</th>
				<td><%=obox.get("empl_status_nm")%></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
				<th>휴(퇴)직일자</th>
				<td><%=obox.get("hyutoi_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>
		</table>
	</div>
	
	<div class="table-scrollable">	
		<table class="table table-view table-bordered">
			<tr>
				<th>주소</th>
				<td colspan="3"><%if(!box.get("zip_no").equals("")){%>[<%=obox.get("zip_no",Box.ZIP_CODE)%>]<%}%> <%=obox.get("addr")%></td>
			</tr>
			<tr>
				<th width="17%">전화번호</th>
				<td width="33%"><%=obox.get("tel_no")%></td>
				<th width="17%">휴대폰번호</th>
				<td width="33%"><%=obox.get("hp_no")%></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3"><%=obox.get("email_id")%></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td colspan="3"><%=obox.get("bank_nm")%> <%=obox.get("account_no")%>
				<%if(!obox.get("account_owner").equals("")){%>&nbsp;(예금주 : <%=obox.get("account_owner")%>)<%}%>
				</td>
			</tr>
			<tr>
				<th>사원구분</th>
				<td><%=obox.get("empl_class_nm")%></td>
				<th>노조가입</th>
				<td><%=obox.get("nojo_yn").equals("Y")?"예":"아니오"%></td>
			</tr>
			<tr>
				<th>서명파일</th>
				<td colspan="3">
					<% if(obox.get("esign_file").equals("")) { %>미등록
					<% }else { %>
						<a href="#" title="이미지뷰어로 열기" onClick="popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=<%=obox.get("esign_file")%>','imgPopup', 200, 200);">
						<%=obox.get("esign_file").substring(obox.get("esign_file").indexOf("_")+1)%></a>
					<% } %>
				</td>
			</tr>
			<tr>
				<th>사용자 ID</th>
				<td><%=obox.get("user_id")%></td>
				<th>사용권한</th>
				<td><%=FormatUtil.nvl2(obox.get("use_auth_nm"),"일반사용자")%></td>
			</tr>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
		<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
			<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
		<% } %>	
		<% if(uSesEnt.user_id.equals(obox.get("user_id")) || uSesEnt.use_auth.equals("SA"))  { %>	
			<button type="button" class="btn dark" onClick="goChangePswd()"><img src="/com/img/ico_btn_edit.png">비밀번호 변경</button>
		<% } %>
		<% if(uSesEnt.user_id.equals(box.get("user_id")) || uSesEnt.use_auth.equals("SA"))  { %>
			<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
		<% } %>	
		</span>
	</div>
</form>