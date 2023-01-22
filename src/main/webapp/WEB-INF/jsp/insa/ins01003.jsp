<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "position_cd@"+uSesEnt.dbo+"|grade_cd@"+uSesEnt.dbo+"|bojik_cd|empl_status|tel_no|hp_no|empl_class@"+uSesEnt.dbo+"|bank_cd@@@@A|use_auth|","","","",""); %>
<!-- 기본인적사항 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript">
	function goSave() {
		if (formValidate('#saveForm')) {
			if(!chkLocFrnJuminNo(document.saveForm.reside_no1.value, document.saveForm.reside_no2.value)) {
				alert('주민등록번호가 잘못되었습니다.');
				document.saveForm.reside_no1.select();
				return;
			/*}else if(document.saveForm.empl_no.value.length < 4 || !document.saveForm.empl_no.value.isNum()) {
			    alert("사번은 숫자 4자리 이상으로 입력하시기 바랍니다.");
			    document.saveForm.empl_no.focus();
			    return;*/
			}else if(document.saveForm.dup_check_yn.value == 'N') {
				alert('아이디 중복확인을 하지 않으셨습니다.');
				document.saveForm.user_id.focus();
				return;
			}
			
			if(confirm('저장하시겠습니까?')) {
				removeMask('#saveForm');
				ajaxSubmitForm("ins01003_update.do","#saveForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						parent.goSearch('<%=box.get("empl_no")%>');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}
	
	function goChangeUserid() {
		if(document.saveForm.user_id.value.length < 4) {
		    alert("사용자ID는 4자리 이상으로 입력하시기 바랍니다.");
		    document.saveForm.user_id.focus();
		    return;
		}else if(!isAlphaNum(document.saveForm.user_id)) {
		    alert("사용자ID는 영문자와 숫자만 입력이 가능합니다.");
		    document.saveForm.user_id.focus();
		    return;
		}else if(document.saveForm.dup_check_yn.value == 'N') {
			alert('아이디 중복확인을 하지 않으셨습니다.');
			document.saveForm.user_id.focus();
			return;
		}else if(document.saveForm.user_id.value == document.saveForm.old_user_id.value) {
			alert("현재 사용하고 있는 아이디와 동일합니다.");
			document.saveForm.user_id.focus();
			return;
		}
	
		if(confirm('아이디를 변경하시겠습니까?')) {
			ajaxSubmitForm("ins01003_change_userid.do","#saveForm", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					toastPop1('변경되었습니다.');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function idDupCheck()	{
		if(document.saveForm.user_id.value.length < 4) {
			alert("아이디는 4자리 이상이어야 합니다.");
			document.saveForm.user_id.focus();
			return;
		}else if(isKoreanAll(document.saveForm.user_id.value)) {
		    alert("아이디는 영문자와 숫자만 가능합니다.");
		    document.saveForm.user_id.focus();
		    return;
        }
		theURL = "/popup/fd/idDupCheck.do?empl_no="+document.saveForm.empl_no.value+"&user_id="+document.saveForm.user_id.value;
		window.open(theURL,'idDupCheck','width=500,height=200,left=300,top=150');
    }
    
    function setBirthYmd() {
    	if(isEmpty(document.saveForm.birth_ymd) && !isEmpty(document.saveForm.reside_no1) && !isEmpty(document.saveForm.reside_no2)) {
    		document.saveForm.birth_ymd.value = (document.saveForm.reside_no2.value.charAt(0) <= '2' ? '19' : '20')+document.saveForm.reside_no1.value;
    		formatMaskElm(document.saveForm.birth_ymd);
    	}
    }
	
	function goUpload(upload_type) {
    	var file_nm = document.all[upload_type+'_file'].value;
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'gif' && file_type != 'jpg' && file_type != 'jpeg' && file_type != 'bmp' && file_type != 'png') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[gif, jpg, jpeg, bmp, png 형식만 업로드 가능)');
    		return;
    	}
    	
    	if(confirm('등록하시겠습니까?')) {
    		ajaxSubmitForm("ins01003_upload.do?upload_type="+upload_type,"#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('등록되었습니다.');
					parent.goSearch('<%=box.get("empl_no")%>');
				}else {
					alert(rtn.errMsg);
				}
			});
    	
    	}
    }
	
	function goCancel() {
		document.saveForm.action = 'ins01002_select.do';
		document.saveForm.target = '_self';
		document.saveForm.submit();
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" enctype="multipart/form-data">
<input type="hidden" name="action_type"		value="<%=box.get("empl_no").equals("")?"INSERT":"UPDATE"%>">
<input type="hidden" name="popup_yn" 		value="<%=box.get("popup_yn")%>">
<input type="hidden" name="dup_check_yn" 	value="Y">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<td rowspan="6" width="20%" class="t-center">
					<img src="/upload_data/photo/<%=StringUtil.urlEncode(obox.get("photo_file"))%>" width="120" height="130" border="0" align="absmiddle" alt="<%=obox.get("empl_nm")%> <%=obox.get("position_nm")%>" onerror="this.src='/com/img/no_photo.gif'">
					<div class="form-inline">
						<div class="form-group">
							<div class="fileinput fileinput-exists" data-provides="fileinput">
								<span class="btn dark btn-file">
									<span class="fileinput-new"> 파일선택 </span>
									<span class="fileinput-exists"> 파일교체 </span>
									<input type="hidden" name="old_photo_file" value="<%=obox.get("photo_file")%>"><input type="file" name="photo_file" <%if(obox.get("empl_no").equals("")){%>onClick="alert('기본인적사항을 먼저 저장한 후, 업로드할 수 있습니다.'); return false;"<%}%> onchange="goUpload('photo');">
								</span>
							</div>
						</div>
					</div>
				</td>
				<td width="15%" class="td-head">사번</td>
				<td width="25%">
				<% if(box.get("empl_no").equals("")) { %>
					<input type="text" name="empl_no" value="<%=obox.get("empl_no")%>" size="10"  maxlength="10" title="사번" class="form-control required" >
				<% }else { %>
					<b><%=obox.get("empl_no")%></b><input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
				<% } %>
				</td>
				<td width="15%" class="td-head">성명</td>
				<td width="25%" class="form-inline" >
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" maxlength="20" title="성명" class="form-control required" style="width:90px;">
				<% }else { %>
					<%=obox.get("empl_nm")%><input type="hidden" name="empl_nm" value="<%=obox.get("empl_nm")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<td class="td-head">주민등록번호</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<input type="text" name="reside_no1" value="<%=StringUtil.substr(obox.get("reside_no"),0,6)%>" maxlength="6" title="주민등록번호" class="form-control required autoTab" style="width:70px" > -
					<input type="text" name="reside_no2" value="<%=StringUtil.substr(obox.get("reside_no"),6)%>"  maxlength="7" title="주민등록번호" class=" form-control required autoTab" onBlur="setBirthYmd()"  style="width:80px">
				<% }else { %>
					<%=FormatUtil.juminNo(obox.get("reside_no"),"x")%>
					<input type="hidden" name="reside_no1" value="<%=StringUtil.substr(obox.get("reside_no"),0,6)%>">
					<input type="hidden" name="reside_no2" value="<%=StringUtil.substr(obox.get("reside_no"),6)%>">
				<% } %>
				</td>
				<td class="td-head">생년월일</td>
				<td class="form-inline" >
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("birth_ymd)",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="birth_ymd" name="birth_ymd" value="<%=obox.get("birth_ymd")%>"  maxlength="8" title="경조기간(부터)" class="form-control tYMD" style="width:80px">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					<select name="solar_lunar" class="bs-select form-control" style="width:60px">
						<option value="S" <%=obox.get("solar_lunar").equals("S")?"selected":""%>>양력</option>
						<option value="L" <%=obox.get("solar_lunar").equals("L")?"selected":""%>>음력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td-head">부서</td>
				<td colspan="3" class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="dept_cd" class="bs-select form-control required" style="width:150px" title="부서">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",obox.get("dept_cd"), "", "", "", "", "", uSesEnt.dbo)%>
					</select>
				<% }else { %>
					<%=obox.get("dept_nm")%><input type="hidden" name="dept_cd" value="<%=obox.get("dept_cd")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<td class="td-head">직위</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="position_cd" title="직위" class="bs-select form-control required" style="width:120px">
						<option value=''>선택</option>
			        	<%=CodeUtil.optList(codeWp, "position_cd", obox.get("position_cd"))%>
					</select>
				<% }else { %>
					<%=obox.get("position_nm")%><input type="hidden" name="position_cd" value="<%=obox.get("position_cd")%>">
				<% } %>
				</td>
				<td class="td-head">직급</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="grade_cd"  class="bs-select form-control" style="width:120px">
						<option value=''>선택</option>
			        	<%=CodeUtil.optList(codeWp, "grade_cd", obox.get("grade_cd"))%>
					</select>
				<% }else { %>
					<%=obox.get("grade_nm")%><input type="hidden" name="grade_cd" value="<%=obox.get("grade_cd")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<td class="td-head">보직</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="bojik_cd"  class="bs-select form-control" style="width:120px">
			            <%=CodeUtil.optList(codeWp, "bojik_cd", obox.get("bojik_cd"))%>
					</select>
				<% }else { %>
					<%=obox.get("bojik_nm")%><input type="hidden" name="bojik_cd" value="<%=obox.get("bojik_cd")%>">
				<% } %>
				</td>
				<td class="td-head">재직상태</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="empl_status"  class="bs-select form-control"  style="width:120px" onChange="if(this.value!='S') changeObjectProperty(document.saveForm.hyutoi_ymd,'required'); else changeObjectProperty(document.saveForm.hyutoi_ymd,'readonly');">
						<%=CodeUtil.optList(codeWp, "empl_status", obox.get("empl_status"))%>
					</select>
				<% }else { %>
					<%=obox.get("empl_status_nm")%><input type="hidden" name="empl_status" value="<%=obox.get("empl_status")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<td class="td-head">입사일자</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="entry_ymd" name="entry_ymd" value="<%=obox.get("entry_ymd")%>" maxlength="8" title="입사일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				<% }else { %>
					<%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%><input type="hidden" name="entry_ymd" value="<%=obox.get("entry_ymd")%>">
				<% } %>
				</td>
				<td class="td-head">휴(퇴)직일자</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("hyutoi_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="hyutoi_ymd" name="hyutoi_ymd" value="<%=obox.get("hyutoi_ymd")%>" maxlength="8" title="휴퇴직일자" class="form-control tYMD" <%if(!obox.get("use_flag").equals("X")){%>readOnly<%}%>>
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>	
				<% }else { %>
					<%=obox.get("hyutoi_ymd",Box.DEF_DATE_FMT)%><input type="hidden" name="hyutoi_ymd" value="<%=obox.get("hyutoi_ymd")%>">
				<% } %>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr height="50">
				<td class="td-head">주소</td>
				<td colspan="3">
					<div class="form-inline">
						<div class="input-group f-left" style="width:154px;">
							<input type="text" name="zip_no" value="<%=obox.get("zip_no")%>" title="우편번호" class="form-control" readOnly>
							<span class="input-group-btn">
								<button class="btn dark" type="button" onclick="findZipNo('');">우편번호검색</button>
							</span>
						</div>
						<input type="text" name="addr" value="<%=obox.get("addr")%>" maxlength="120" title="주소" class="form-control" style="width:628px;ime-mode:active;">
					</div>
				</td>
			</tr>
			<tr height="28">
				<td width="17%" class="td-head">전화번호</td>
				<td width="33%" class="form-inline">
					<select name="tel_no1" class="bs-select form-control" style="width:60px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("tel_no"),1,"-"))%>
					</select> 
					 - <input type="text" name="tel_no2" value="<%=StringUtil.arrayCol(obox.get("tel_no"),2,"-")%>" size="4" maxlength="4" title="전화번호" class="autoTab form-control" style="width:60px">
					 - <input type="text" name="tel_no3" value="<%=StringUtil.arrayCol(obox.get("tel_no"),3,"-")%>" size="4" maxlength="4" title="전화번호" class="autoTab form-control" style="width:60px">
				</td>
				<td width="17%" class="td-head">휴대폰번호</td>
				<td width="33%" class="form-inline">
					<select name="hp_no1" class="bs-select form-control" style="width:60px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "hp_no", StringUtil.arrayCol(obox.get("hp_no"),1,"-"))%>
					</select> 
					 - <input type="text" name="hp_no2" value="<%=StringUtil.arrayCol(obox.get("hp_no"),2,"-")%>"  maxlength="4" title="휴대폰번호"  class="autoTab form-control" style="width:60px"> 
					 - <input type="text" name="hp_no3" value="<%=StringUtil.arrayCol(obox.get("hp_no"),3,"-")%>"  maxlength="4" title="휴대폰번호"  class="autoTab form-control" style="width:60px">
				</td>
			</tr>
			<tr height="28">
				<td class="td-head">이메일</td>
				<td colspan="3" class="form-inline"><input type="text" name="email_id" value="<%=obox.get("email_id")%>" maxlength="50" title="이메일" class="form-control" style="width:223px;"></td>
			</tr>
			<tr height="28">
				<td class="td-head">계좌번호</td>
				<td colspan="3" nowrap class="form-inline">
					<select name="bank_cd" title="금융기관" class="bs-select form-control"  style="width:180px">
						<option value=''>:: 금융기관 선택 ::</option>
						<%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
					</select>
					<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="15" maxlength="30" title="계좌번호" class="form-control" style="width:150px">
					&nbsp;예금주 : <input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="12" maxlength="15" title="예금주" class="form-control" style="width:150px">
				</td>
			</tr>
			<tr height="28">
				<td class="td-head">사원구분</td>
				<td style="padding-left:5px">
				<% if(uSesEnt.use_auth.startsWith("S")) { %>
					<select name="empl_class" title="사원구분" class="bs-select form-control required" style="width:180px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "empl_class", obox.get("empl_class"))%>
					</select>
				<% }else { %>
					<%=obox.get("empl_class_nm")%><input type="hidden" name="empl_class" value="<%=obox.get("empl_class")%>">
				<% } %>
				</td>
				<td class="td-head">노조가입</td>
				<td class="form-inline">
					<select name="nojo_yn" class="bs-select form-control" style="width:120px">
			            <option value='N' <%=obox.get("nojo_yn").equals("N")?"selected":""%>>아니오</option>
			            <option value='Y' <%=obox.get("nojo_yn").equals("Y")?"selected":""%>>예</option>
					</select>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head">서명파일</td>
				<td colspan="3">
					<% if(!obox.get("esign_file").equals("")) { %>
						<a onClick="popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=<%=obox.get("esign_file")%>','imgPopup', 200, 200);">
						<%=obox.get("esign_file").substring(obox.get("esign_file").indexOf("_")+1)%></a>
					<% } %>
					<div class="form-inline">
						<div class="form-group">
							<div class="fileinput fileinput-new input-group" data-provides="fileinput">
								<div class="form-control input-fixed" data-trigger="fileinput" style="width:300px;">
									<i class="fa fa-file fileinput-exists"></i>&nbsp;<span class="fileinput-filename"></span>
								</div>
								<span class="input-group-addon btn dark btn-file">
									<span class="fileinput-new">서명파일 등록</span><span class="fileinput-exists">서명파일 교체</span>
									<input type="hidden" name="old_photo_file" value="<%=obox.get("esign_file")%>"><input type="file" name="esign_file" <%if(obox.get("empl_no").equals("")){%>onClick="alert('기본인적사항을 먼저 저장한 후, 업로드할 수 있습니다.'); return false;"<%}%> onchange="goUpload('esign');">
								</span>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr height="28">		
				<td class="td-head">사용자 ID</td>
				<td>
				<%if(!box.get("empl_no").equals("")) { %>
					<input type="text" name="user_id" value="<%=obox.get("user_id")%>" maxlength="10" title="사용자 ID" class="form-control required" style="width:90px" onKeyUp="document.saveForm.dup_check_yn.value='N'; document.getElementById('btnDupCheck').style.display=''; document.getElementById('btnModifyId').style.display='none';">
					<button id="btnDupCheck" type="button" class="btn btn-primary btn-table" onClick="idDupCheck();" style="display:none">중복확인</button>
					<button id="btnModifyId" type="button" class="btn btn-primary btn-table" onClick="goChangeUserid();">아이디변경</button>
					<input type="hidden" name="old_user_id" value="<%=obox.get("user_id")%>">
				<% }else { %>
					자동부여
				<% } %>
				</td>
				<td class="td-head">사용권한</td>
				<td class="form-inline">
				<% if(uSesEnt.use_auth.equals("SA")) { %>
					<select name="use_auth" class="bs-select form-control" style="width:120px" >
			            <%=CodeUtil.optList(codeWp, "use_auth", obox.get("use_auth"))%>
					</select>
				<% }else { %>
					<%=FormatUtil.nvl2(obox.get("use_auth_nm"),"일반사용자")%><input type="hidden" name="use_auth" value="<%=FormatUtil.nvl2(obox.get("use_auth"),"G")%>">
				<% } %>
				</td>
			</tr>
		</table>
	</div>
		
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
					<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_edit.png">저장</button>
				<%if(!box.get("empl_no").equals("")) { %>
					<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_cancel.png">취소</button>
				<% } %>
			</span>
		</span>
	</div>
</form>

