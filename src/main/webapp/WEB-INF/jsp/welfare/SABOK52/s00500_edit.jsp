<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "condo_cd|","","","","",uSesEnt.dbo);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 휴양시설이용  -->

<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(document.saveForm.apply_ymd.value.replace(/-/g,"") > '<%=DateUtil.toString("yyyyMMdd")%>') { 
				alert('신청일이  오늘 날짜 이후로 입력되었습니다.\n다시 확인 후 입력해주세요.');
				document.saveForm.apply_ymd.focus();
				return;
			}	
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.data01.value = document.saveForm.condo_nm.value;
				document.saveForm.data04.value = document.saveForm.member_cnt.value;
				document.saveForm.data05.value = document.saveForm.start_ymd.value;
				document.saveForm.data06.value = document.saveForm.end_ymd.value;
				document.saveForm.data07.value = document.saveForm.use_ilsu.value;
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
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
	
	function calendarSettingPost(target) {
		var use_ilsu = 0;
		if(target.substring(0,9) == 'start_ymd') {
			if(!isEmpty(document.saveForm.end_ymd)) {
				use_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}else if(target.substring(0,7) == 'end_ymd') {
			if(!isEmpty(document.saveForm.start_ymd)) {
				use_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,"")+'000', document.saveForm.end_ymd.value.replace(/-/g,"")+'000') + 1;
			}
		}
		document.saveForm.use_ilsu.value = use_ilsu;
		formatMaskElm(document.saveForm.use_ilsu);
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
<%@ include file="/WEB-INF/jsp/welfare/payGuide.jsp" %>
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
		<% if(uSesEnt.use_auth.startsWith("S")) { %>
			<tr>
				<th>사원선택</th>
				<td colspan="3">
					<div class="input-group input-medium">
						<input type="text" name="empl_nm" value="<%=obox.get("empl_nm",Box.SPECIAL_CHAR)%>" class="form-control" style="width:90px" readOnly>
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button></span>
					</div>
				</td>
			</tr>
		<% } %>
			<tr>
				<th width="15%">사번/성명</th>
				<td width="35%"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
					<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%=obox.get("empl_nm")%></a>
					<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
				</td>
				<th width="15%">부서</th>
				<td width="35%"><%=obox.get("dept_nm")%></td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
				<th>직위</th>
				<td><%=obox.get("position_nm")%></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
				<th>사원구분</th>
				<td><%=obox.get("empl_class_nm")%></td>
			</tr>
		</table>
	</div>
	
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>휴양시설명</th>
				<td colspan="3">
					<input type="text" name="condo_nm" value="<%=obox.get("condo_nm")%>" size="20" maxlength="40" title="휴양시설명" class="form-control required" style="width:150px">
				</td>
			</tr>
			<tr>
				<th>이용일자</th>
				<td colspan="3">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=obox.get("start_ymd")%>" maxlength="8" title="이용일자(부터)" class="form-control required tYMD" onChange="calendarSettingPost('start_ymd')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=obox.get("end_ymd")%>" maxlength="8" title="이용일자(까지)" class="form-control required tYMD" onChange="calendarSettingPost('end_ymd')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>&nbsp;까지&nbsp;
						(숙박일수 : <input type="text" name="use_ilsu" value="<%=obox.get("use_ilsu")%>" maxlength="3" title="이용일수" class="form-control required tNUM" style="width:35px" readonly> 일)
					</div>	
				</td>
			</tr>
			<tr>
				<th>사용인원</th>
				<td colspan="3">
					<input type="text" name="member_cnt" value="<%=obox.get("member_cnt")%>"maxlength="40" title="사용인원" class="form-control" style="width:55px"> 명
				</td>
			</tr>
			<tr>
				<th>이용금액</th>
				<td colspan="3">
					<input type="text" name="use_amt" value="<%=obox.get("use_amt")%>" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:100px"> 원
				</td>
			</tr>
			<tr>
				<th width="15%">신청일자</th>
				<td width="35%">
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
				<th width="15%">신청금액</th>
				<td width="35%">
					<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" maxlength="10" title="신청금액" class="bs-select form-control required tMONEY" style="width:100px"> 원
				</td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="3">
					<input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="width:90%">
				</td>
			</tr>
		<% if(!box.get("apply_no").equals("")) { %>
	  		<tr>
				<th>전표번호</th>
				<td nowrap>
					<%if(!obox.get("slip_no").equals("")){%>&nbsp;
						<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
					<%}%>
					<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
					<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
				</td>
				<th>결재상태</th>
				<td nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
	  		</tr>
		<% } %>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		<%if(!box.get("apply_no").equals("")){%>
			<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
		<% } %>
		</span>
	</div>
</form>