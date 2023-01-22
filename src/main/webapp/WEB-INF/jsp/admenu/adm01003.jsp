<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		 class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="obox"		 class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="uSesEnt" 	 class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 회사정보 등록 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(!chkLocFrnJuminNo(document.saveForm.rep_reside_no1.value, document.saveForm.rep_reside_no2.value)) {
				alert('대표자 주민등록번호가 잘못되었습니다.');
				document.saveForm.rep_reside_no1.select();
				return;
			}
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("adm01003_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('저장되었습니다.');
						returnFormSubmit(document.main, 'adm01001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goCancel() {
		removeMask("#saveForm");
		ajaxReplaceForm("adm01002_select.do", "#saveForm", "#divFrame");
	}
		
	function goUpload() {
    	var file_nm = document.saveForm.logo_file.value
    	var file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();
    	if(file_type != 'gif' && file_type != 'jpg' && file_type != 'jpeg' && file_type != 'bmp' && file_type != 'png') {
    		alert('파일형식이 옳바르지 않습니다.\n\n[gif, jpg, jpeg, bmp, png 형식만 업로드 가능)');
    		return;
    	}
    	
    	if(confirm('등록하시겠습니까?')) {
    		removeMask("#saveForm");
			ajaxSubmitForm("adm01003_upload.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('등록되었습니다.');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	$(function() {
		changeObjectProperty(document.saveForm.corp_cd, 'readonly');
		document.saveForm.corp_cd.value = '<%=box.get("corp_cd")%>';
	<% if(!uSesEnt.use_auth.equals("SA")) { %>
		changeObjectProperty(document.saveForm.saupja_no1, 'readonly');
		changeObjectProperty(document.saveForm.saupja_no2, 'readonly');
		changeObjectProperty(document.saveForm.saupja_no3, 'readonly');
		changeObjectProperty(document.saveForm.license_no, 'readonly');

		document.saveForm.saupja_no1.value = '<%=StringUtil.substr(obox.get("saupja_no"),0,3)%>';
		document.saveForm.saupja_no2.value = '<%=StringUtil.substr(obox.get("saupja_no"),3,5)%>';
		document.saveForm.saupja_no3.value = '<%=StringUtil.substr(obox.get("saupja_no"),5)%>';
		document.saveForm.license_no.value = '<%=obox.get("license_no")%>';
	<% } %>
	});	
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="corp_cd" 	value="<%=obox.get("corp_cd")%>">
<input type="hidden" name="action_type" value="<%=box.get("corp_cd").equals("")?"INSERT":"UPDATE"%>">

	
	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<th>회사코드</th>
			<td>
			<% if(box.get("corp_cd").equals("")) { %>
				자동부여
			<% }else { %>
				<b><%=obox.get("corp_cd")%></b>
			<% } %>
			</td>
			<th>회사명</th>
			<td><input type="text" name="corp_nm" value="<%=obox.get("corp_nm")%>" size="35" maxlength="50" title="회사명" class="form-control required" style="width:85%"></td>
		</tr>
		<tr>
			<th width="17%">사업자등록번호</th>
			<td width="33%">
				<input type="text" name="saupja_no1" value="<%=StringUtil.substr(obox.get("saupja_no"),0,3)%>" size="3" maxlength="3" title="사업자등록번호" class="form-control required autoTab" style="width:15%"> -
				<input type="text" name="saupja_no2" value="<%=StringUtil.substr(obox.get("saupja_no"),3,5)%>" size="2" maxlength="2" title="사업자등록번호" class="form-control required autoTab" style="width:12%"> -
				<input type="text" name="saupja_no3" value="<%=StringUtil.substr(obox.get("saupja_no"),5)%>" size="5" maxlength="5" title="사업자등록번호" class="form-control required autoTab"  style="width:25%">
			</td>
			<th width="17%">법인등록번호</th>
			<td width="33%">
				<input type="text" name="corp_reg_no1" value="<%=StringUtil.substr(obox.get("corp_reg_no"),0,6)%>" size="6" maxlength="6" title="법인등록번호" class="form-control autoTab" style="width:25%"> -
				<input type="text" name="corp_reg_no2" value="<%=StringUtil.substr(obox.get("corp_reg_no"),6)%>" size="7" maxlength="7" title="법인등록번호" class="form-control autoTab" style="width:25%">
			</td>
		</tr>
		<tr>
			<th>인가번호</th>
			<td><input type="text" name="license_no" value="<%=obox.get("license_no")%>" size="20" maxlength="20" title="인가번호" class="form-control required" style="width:50%"></td>
			<th>기금등기일</th>
			<td>
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("reg_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="reg_ymd" name="reg_ymd" value="<%=obox.get("reg_ymd")%>" maxlength="8" title="기금등기일" class="form-control required tYMD">
						<span class="input-group-btn">
							<button type="button" class="btn dark"><i class="fa fa-calendar"></i></button>
						</span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>업태</th>
			<td><input type="text" name="uptae" value="<%=obox.get("uptae")%>" size="20" maxlength="20" title="업태" class="form-control" style="width:50%"></td>
			<th>종목</th>
			<td><input type="text" name="upjong" value="<%=obox.get("upjong")%>" size="20" maxlength="20" title="종목" class="form-control" style="width:50%"></td>
		</tr>
		<tr>
			<th>대표자 성명</th>
			<td><input type="text" name="rep_person_nm" value="<%=obox.get("rep_person_nm")%>" size="20" maxlength="20" title="대표자성명" class="form-control required" style="width:50%"></td>
			<th>대표자 주민번호</th>
			<td>
				<input type="text" name="rep_reside_no1" value="<%=StringUtil.substr(obox.get("rep_reside_no"),0,6)%>" size="6" maxlength="6" title="대표자주민번호" class="form-control required autoTab" style="width:25%"> -
				<input type="text" name="rep_reside_no2" value="<%=StringUtil.substr(obox.get("rep_reside_no"),6)%>" size="7" maxlength="7" title="대표자주민번호" class="form-control required" style="width:30%">
			</td>
		</tr>
	</table>
	<% if(!box.get("corp_cd").equals("")) { %>
    <table class="table table-view table-bordered mar0">
		<tr>
			<th width="17%">회사로고이미지</th>
			<td> 
				<% if(!obox.get("file_nm").equals("")) { %>
					<a onClick="popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=<%=obox.get("logo_file")%>','imgPopup', 200, 200);">
				<% } %>
						<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><%=FormatUtil.nvl2(obox.get("file_nm"),"미등록")%>
					</a>
					<input type="hidden" name="old_logo_file" value="<%=obox.get("logo_file")%>">
					<div class="form-inline">
						<div class="form-group">
							<div class="fileinput fileinput-new input-group" data-provides="fileinput">
								<div class="form-control input-fixed" data-trigger="fileinput" style="width:300px;">
									<i class="fa fa-file fileinput-exists"></i>&nbsp;<span class="fileinput-filename"></span>
								</div>
								<span class="input-group-addon btn dark btn-file">
									<span class="fileinput-new">파일찾기</span><span class="fileinput-exists">파일교체</span>
									<input type="file" id="logo_file" name="logo_file" onChange="goUpload()">
								</span>	
							</div>
						</div>
					</div>
       		</td>
		<% }else { %>
			<td></td>
		<% } %>
         	</tr>
   	</table>
   
	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<th>사업장소재지</th>
			<td colspan="3">
				<div class="input-group f-left" style="width:95%;">
					<input type="text" name="zip_no" value="<%=obox.get("zip_no")%>" size="5" maxlength="5" title="우편번호" class="form-control" style="width:100%" readonly>
					<span class="input-group-btn"><button type="button" id="btnZipFind1" class="btn dark" onClick="findZipNo('')"><i class="fa fa-search"></i></button></span>
					<input type="text" name="addr" value="<%=obox.get("addr")%>" size="60" maxlength="120" title="사업장소재지" class="form-control" style="width:70%">
				</div>
			</td>
		</tr>
		<tr>
			<th width="17%">사업장전화번호</th>
			<td width="33%"><input type="text" name="tel_no" value="<%=obox.get("tel_no")%>" size="20" maxlength="20" title="사업장전화번호" class="form-control" style="width:50%"></td>
			<th width="17%">전자우편주소</th>
			<td width="33%"><input type="text" name="email_id"  value="<%=obox.get("email_id")%>" size="25" maxlength="40" title="전자우편주소" class="form-control" style="width:55%"></td>
		</tr>
		<tr>
			<th>사업체 대표자</th>
			<td><input type="text" name="mo_rep_person" value="<%=obox.get("mo_rep_person")%>" size="20" maxlength="20" title="사업체 대표자" class="form-control" style="width:50%"></td>
			<th>사업체 업종</th>
			<td><input type="text" name="mo_upjong" value="<%=obox.get("mo_upjong")%>" size="20" maxlength="20" title="사업체 업종" class="form-control" style="width:50%"></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan=3"><input type="text" name="site_addr" value="<%=obox.get("site_addr")%>" size="20" maxlength="100" title="홈페이지" class="form-control" style="width:19%"></td>
		</tr>
		<tr>
			<th>근로자수</th>
			<td><input type="text" name="empl_cnt" value="<%=obox.get("empl_cnt")%>" size="10" maxlength="10" title="근로자수" class="form-control tMONEY" style="width:30%"> 명</td>
			<th>노동조합원수</th>
			<td><input type="text" name="nojo_entry_cnt" value="<%=obox.get("nojo_entry_cnt")%>" size="10" maxlength="10" title="노동조합원수" class="form-control tMONEY" style="width:30%"> 명</td>
		</tr>
		<tr>
			<th>납입자본금</th>
			<td><input type="text" name="capital_amt" value="<%=obox.get("capital_amt")%>" size="15" maxlength="13" title="납입자본금" class="form-control tMONEY" style="width:40%"> 원</td>
			<th>관할세무서</th>
			<td><input type="text" name="tax_office" value="<%=obox.get("tax_office")%>" size="10" maxlength="20" title="관할세무서" class="form-control" style="width:30%"> 세무서</td>
		</tr>
		<tr>
			<th>국세환급금계좌신고</th>
			<td colspan="3" nowrap>
				예입처 : <input type="text" name="bank_nm" value="<%=obox.get("bank_nm")%>" size="15" maxlength="30" title="예입처" class="form-control" style="width:20%">&nbsp;&nbsp;
				예금종류 : <input type="text" name="account_type" value="<%=obox.get("account_type")%>" size="15" maxlength="20" title="예금종류" class="form-control" style="width:20%">&nbsp;&nbsp;
				계좌번호 : <input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="15" maxlength="30" title="계좌번호" class="form-control tMONEY" style="width:20%">
			</td>
		</tr>
		<tr>
			<th>결산기</th>
			<td>
				<select name="account_closing" class="bs-select form-control" style="width:100px">
					<option value="12" <%=obox.get("account_closing").equals("12")?"selected":""%>>12월결산</option> 
					<option value="03" <%=obox.get("account_closing").equals("03")?"selected":""%>>3월결산</option> 
					<option value="06" <%=obox.get("account_closing").equals("06")?"selected":""%>>6월결산</option> 
					<option value="09" <%=obox.get("account_closing").equals("09")?"selected":""%>>9월결산</option> 
				</select>
			</td>
			<th>회사규모</th>
			<td>
				<select name="corp_scale" class="bs-select form-control" style="width:150px">
		            <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("corp_scale"),"corp_scale","","","","")%>
				</select>
			</td>
		</tr>
		<tr>
			<th>대변결제계정</th>
			<td>
				<select name="debit_acct" class="bs-select form-control" style="width:100px">
					<option value="1" <%=obox.get("debit_acct").equals("1")?"selected":""%>>보통예금</option> 
					<option value="2" <%=obox.get("debit_acct").equals("2")?"selected":""%>>미지급금</option> 
				</select>
			</td>
			<th>수입대체주기</th>
			<td>
				<select name="repl_cycle" class="bs-select form-control" style="width:100px">
		            <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("repl_cycle"),"repl_cycle","","","","")%>
				</select>
			</td>
		</tr>
		<tr>
			<th>결산반영방식</th>
			<td colspan="3">
				<div class="mt-radio-inline">
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="accounting_flag" value="1" <%=obox.get("accounting_flag").equals("2")?"":"checked"%>>회계전표승인<span></span>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="accounting_flag" value="2" <%=obox.get("accounting_flag").equals("2")?"checked":""%>>최종결재자승인<span></span>
					</label>
				</div>
			</td>
		</tr>
	<% if(uSesEnt.use_auth.equals("SA")) { %>
		<tr>
			<th>가동일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="<%=obox.get("open_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" id="open_ymd" name="open_ymd" value="<%=obox.get("open_ymd")%>" maxlength="8" title="가동일자" class="form-control tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			<th rowspan="3" width="15%">접속허용IP</th>
			<td><input type="text" name="permit_ip1" value="<%=StringUtil.arrayCol(obox.get("permit_ip"),1,";")%>" maxlength="15" title="접속허용IP" class="form-control" style="width:125px"></td>
		</tr>
		<tr>
			<th>폐쇄일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="<%=obox.get("close_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" id="close_ymd" name="close_ymd" value="<%=obox.get("close_ymd")%>" maxlength="8" title="폐쇄일자" class="bs-select form-control tYMD">
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>	
			</td>
			<td><input type="text" name="permit_ip2" value="<%=StringUtil.arrayCol(obox.get("permit_ip"),2,";")%>" maxlength="15" title="접속허용IP" class="form-control" style="width:125px"></td>
		</tr>
		<tr>
			<th>설치서버</th>
			<td nowrap>
				<select name="server_ip1" title="설치서버" class="bs-select form-control" style="width:25%" onChange="changeObjectProperty(document.saveForm.server_ip2, this.value == '1' ? 'required' : 'readonly')">
					<option value='1' <%=obox.get("server_ip").startsWith("1")?"selected":""%>>자체</option>
					<option value='2' <%=obox.get("server_ip").startsWith("2")?"selected":""%>>임대</option>
				</select>&nbsp;&nbsp;
				IP주소 : <input type="text" name="server_ip2" value="<%=StringUtil.arrayCol(obox.get("server_ip"),2,"|")%>" size="15" maxlength="15" title="설치서버IP" <%if(obox.get("server_ip").startsWith("1")){%>class="form-control"<%}%> class="form-control" style="width:125px">
			</td>
			<td><input type="text" name="permit_ip3" value="<%=StringUtil.arrayCol(obox.get("permit_ip"),3,";")%>" maxlength="15" title="접속허용IP" class="form-control" style="width:125px"></td>
		</tr>
	<% } %>				
	</table>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
		  	<% if(!box.get("corp_cd").equals("")) { %>
	  			<button type="button" class="btn dark" onclick="goCancel();"><img src="/com/img/ico_btn_cancel.png">취소</button>
		  	<% } %>
	  		</span>
	  	</span>
 	</div>
 	
 	<div id="divFrame">
			
	</div>
</form>