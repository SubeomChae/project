<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "tel_no|bank_cd@@@@A|","","","","",uSesEnt.dbo);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 체력단련비 신청서 작성 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.data01.value = document.saveForm.course_nm.value;
				document.saveForm.data02.value = document.saveForm.edu_org_nm.value;
				document.saveForm.data03.value = document.saveForm.edu_org_tel1.value+'-'+document.saveForm.edu_org_tel2.value+'-'+document.saveForm.edu_org_tel3.value;
				document.saveForm.data04.value = document.saveForm.edu_org_addr.value;
				document.saveForm.data05.value = document.saveForm.start_ymd.value;
				document.saveForm.data06.value = document.saveForm.end_ymd.value;
				document.saveForm.data07.value = document.saveForm.edu_ilsu.value;
				document.saveForm.data08.value = document.saveForm.use_amt.value;
				
				ajaxSubmitForm("wel01003_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.apply_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}
		
	function goCancel() {
		ajaxReplaceForm("wel01002_select.do", "#saveForm", "#divFrame");
	}
	
	function calendarSettingPost(target) {
		var edu_ilsu = 0;
		if(target.substring(0,9) == 'start_ymd') {
			if(!isEmpty(document.saveForm.end_ymd)) {
				edu_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}else if(target.substring(0,7) == 'end_ymd') {
			if(!isEmpty(document.saveForm.start_ymd)) {
				edu_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}
		document.saveForm.edu_ilsu.value = edu_ilsu;
		formatMaskElm(document.saveForm.edu_ilsu);
	}
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		removeMask("#saveForm");
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
<%@ include file="/WEB-INF/jsp/welfare/payGuide.jsp" %>
	<table class="table table-view table-bordered table-cover marB5">
	<% if(uSesEnt.use_auth.startsWith("S")) { %>
		<tr>
			<th>사원선택</td>
			<td colspan="3">
				<div class="input-group input-medium">
					<input type="text" name="empl_nm" value="<%=obox.get("empl_nm",Box.SPECIAL_CHAR)%>" class="form-control" style="width:90px" readOnly>
					<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button></span>
				</div>
			</td>
		</tr>
	<% } %>
		<tr>
			<th>사번/성명</th>
			<td><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
				<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><b><%=obox.get("empl_nm")%></b></a>
				<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
			</td>
			<th>부서</th>
			<td><%=obox.get("dept_nm")%></td>
		</tr>
		<tr>
			<th width="15%">주민번호</th>
			<td width="35%"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
			<th width="15%">직위</th>
			<td width="35%"><%=obox.get("position_nm")%></td>
		</tr>
		<tr>
			<th>입사일자</td>
			<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
			<th>사원구분</td>
			<td><%=obox.get("empl_class_nm")%></td>
		</tr>
	</table>
	
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>교육명</th>
			<td>
				<input type="text" name="course_nm" value="<%=obox.get("course_nm")%>" size="30" maxlength="50" title="교육명" class="form-control required" style="width:180px">
			</td>
			<th>교육비</th>
			<td>
				<input type="text" name="use_amt" value="<%=obox.get("use_amt")%>" size="13" maxlength="10" title="교육비" class="form-control required tMONEY" style="width:90px"> 원
			</td>
		</tr>
		<tr>
			<th>교육일자</th>
			<td colspan="3">
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="start_ymd" name="start_ymd" value="<%=obox.get("start_ymd")%>" maxlength="8" title="교육일자(부터)" class="form-control required tYMD" onChange="calendarSettingPost('start_ymd')">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<span> ~ </span>
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="end_ymd" name="end_ymd" value="<%=obox.get("end_ymd")%>" maxlength="8" title="교육일자(까지)" class="form-control required tYMD" onChange="calendarSettingPost('end_ymd')">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>&nbsp;까지&nbsp;
					(교육일수 : <input type="text" name="edu_ilsu" value="<%=obox.get("edu_ilsu")%>" maxlength="3" title="교육일수" class="form-control required tMONEY" style="width:35px" readonly>&nbsp;일)
				</div>
			</td>
		</tr>
		<tr>
			<th width="15%">교육기관</th>
			<td width="35%">
				<input type="text" name="edu_org_nm" value="<%=obox.get("edu_org_nm")%>" size="30" maxlength="50" title="교육기관" class="form-control required" style="width:180px">
			</td>
			<th width="15%">기관연락처</th>
			<td width="35%">
				<select name="edu_org_tel1" class="bs-select form-control" title="전화번호" style="width:65px">
					<option value=''>선택</option>
					<%=CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("edu_org_tel"),1,"-"))%>
				</select> - 
				<input type="text" name="edu_org_tel2" value="<%=StringUtil.arrayCol(obox.get("edu_org_tel"),2,"-")%>" size="4" maxlength="4" title="전화번호" class="form-control autoTab" style="width:45px"> - 
				<input type="text" name="edu_org_tel3" value="<%=StringUtil.arrayCol(obox.get("edu_org_tel"),3,"-")%>" size="4" maxlength="4" title="전화번호" class="form-control autoTab" style="width:45px">
			</td>
		</tr>
		<tr> 
			<th>기관주소</th>
			<td colspan="3">
				<input type="text" name="edu_org_addr" value="<%=obox.get("edu_org_addr")%>" size="50" maxlength="50" title="기관주소" class="form-control required" style="width:240px">
			</td>
		</tr>
		<tr>
			<th>신청일자</th>
			<td>
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th>신청금액</th>
			<td>
				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="13" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:90px;" > 원
			</td>
		</tr>
		<tr>
			<th>계좌번호</td>
			<td colspan="3">
				<select name="bank_cd" title="금융기관" class="bs-select form-control required" style="width:120px">
					<option value=''>:: 금융기관 선택 ::</option>
		            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
				</select>
				<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="18" maxlength="30" title="계좌번호" class="form-control required" style="width:100px">&nbsp;예금주 : 
				<input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="10" maxlength="15" title="예금주" class="form-control required" style="width:60px">
			</td>
		</tr>
		<tr>
			<th>비고</td>
			<td colspan="3"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="width:90%;"></td>
		</tr>
	<% if(!box.get("apply_no").equals("")) { %>
  		<tr>
			<th>전표번호</td>
			<td>
				<%if(!obox.get("slip_no").equals("")) { %>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				<% } %>
				<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
				<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
			</td>
			<th>결재상태</td>
			<td><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
  		</tr>
	<% } %>
	</table>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		<%if(!box.get("apply_no").equals("")){%>
			<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
		<% } %>
		</span>
	</div>
</form>