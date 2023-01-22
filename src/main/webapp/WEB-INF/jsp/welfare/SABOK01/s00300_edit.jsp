<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	String bank_cd;
	if(uSesEnt.dbo.equals("SABOK10")) {
		bank_cd="|bank_cd@@@@A||bank_cd@@@@C|";
	}else {
		bank_cd="|bank_cd@@@@A|";
	}
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "school_flag"+bank_cd+"family_rel_cd|","","","","",uSesEnt.dbo);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 학자금 신청서 작성 -->

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
				document.saveForm.data01.value = document.saveForm.family_rel_cd.value;
				document.saveForm.data02.value = document.saveForm.family_nm.value;
				document.saveForm.data03.value = document.saveForm.family_reside_no.value;
				document.saveForm.data04.value = document.saveForm.school_nm.value;
				document.saveForm.data05.value = document.saveForm.school_flag.value;
				document.saveForm.data06.value = document.saveForm.major_nm.value;
				document.saveForm.data07.value = document.saveForm.school_year.value;
				document.saveForm.data08.value = document.saveForm.school_term.value;
			<% if(uSesEnt.dbo.equals("SABOK26")) { %>
				document.saveForm.data09.value = document.saveForm.grade_score.value;
				document.saveForm.data10.value = document.saveForm.pay_amt.value;
			<% } %>

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
	
	function changeFamilyId(family_id) {
		if(family_id == '') { return; }
		var family_value = document.saveForm.family_id.options[document.saveForm.family_id.options.selectedIndex].title;
		var arr = family_value.split('|');
		document.saveForm.family_rel_cd.value = arr[0];
		document.saveForm.family_nm.value = arr[1];
		document.saveForm.family_reside_no.value = arr[2];
	}
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
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
				<th>학교명</th>
				<td colspan="3">
					<input type="text" name="school_nm" value="<%=obox.get("school_nm")%>" maxlength="30" title="학교명" class="form-control required" style="width:70px">
				<% if(uSesEnt.dbo.equals("SABOK26")) { %>
					대학교<input type="hidden" name="school_flag" value="5">
				<% }else { %>
					<select name="school_flag" title="학교" class="bs-select form-control required" style="width:100px">
						<option value=''>:: 학교선택 ::</option>
			            <%=CodeUtil.optList(codeWp, "school_flag", obox.get("school_flag"))%>
					</select>
			    <% } %>
					&nbsp;<input type="text" name="school_year" value="<%=obox.get("school_year")%>" maxlength="1" title="학년" class="form-control required" style="width:25px"> 학년					
					&nbsp;&nbsp;<input type="text" name="school_term" value="<%=obox.get("school_term")%>" maxlength="1" title="학기" class="form-control" style="width:25px"> 학기													
				</td>
			</tr>	
			<tr>	
				<th width="15%">학과</th>
				<td width="35%">
					<input type="text" name="major_nm" value="<%=obox.get("major_nm")%>" maxlength="20" title="학과" class="form-control" style="width:140px">
				</td>
				<th width="15%">대상자</th>
				<td width="35%">
				<% if(uSesEnt.dbo.equals("SABOK26")) { %>
					<select name="family_rel_cd" class="bs-select form-control required" title="가족관계" style="width:70px;">
						<option value='40' <%=obox.get("family_rel_cd").equals("40")?"selected":""%>>자녀</option>
			        </select>&nbsp;
			        <input type="text" name="family_nm" value="<%=obox.get("family_nm")%>" class="required" style="width:120px">
					<input type="hidden" name="family_reside_no" value="<%=obox.get("family_reside_no")%>">
				<% }else { %>
					<select name="family_id" title="대상자 선택" class="bs-select form-control required" style="width:117px" onChange="changeFamilyId(this.value)">
						<option value=''>:: 선택 ::</option>
 					<%	RsWrapper familyWp = CodeUtil.getRsWrapper("PR_INSTB_EMPL12_LIST","LISTCODE", "", obox.get("empl_no"),"00","","","",uSesEnt.dbo);
						for(int i=0; i < familyWp.getLength(); i++) { %>
						<option value='<%=familyWp.get("code",i)%>' <%=StringUtil.arrayCol(familyWp.get("optkey",i),2,"|").equals(obox.get("family_nm"))?"selected":""%> title='<%=familyWp.get("optkey",i)%>'><%=familyWp.get("data",i)%></option>
				<% } %>	
					</select>
					<input type="hidden" name="family_rel_cd" 	value="<%=obox.get("family_rel_cd")%>">
					<input type="hidden" name="family_nm" 		value="<%=obox.get("family_nm")%>">
					<input type="hidden" name="family_reside_no" value="<%=obox.get("family_reside_no")%>">
				<% } %>
				</td>
			</tr>
		<% if(uSesEnt.dbo.equals("SABOK26")) { %>
			<tr>
				<th>학점</th>
				<td>
					<input type="text" name="grade_score" value="<%=obox.get("grade_score")%>" maxlength="10" title="학점" class="form-control required" style="width:90px" >
				</td>
				<th>납부금액</th>
				<td>
					<input type="text" name="pay_amt" value="<%=obox.get("pay_amt")%>" maxlength="10" class="form-control required tMONEY" title="납부금액" style="width:90px" > 원
				</td>
			</tr>
		<% } %>
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
					<input type="text" name="apply_amt" value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>" title="신청금액" class="form-control required tMONEY" style="width:90%">&nbsp;원
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td colspan="3">
					<select name="bank_cd" title="금융기관" class="bs-select form-control required" style="width:150px">
						<option value=''>:: 금융기관 선택 ::</option>
			            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
					</select>
					<input type="text" name="account_no" value="<%=obox.get("account_no")%>" title="계좌번호" class="form-control required" style="width:120px">&nbsp;예금주&nbsp;:&nbsp;
					<input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" maxlength="15" title="예금주" class="form-control required" style="width:90px">
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
				<td>
					<%if(!obox.get("slip_no").equals("")){%>&nbsp;
						<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
					<%}%>
					<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
					<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
				</td>
				<th>결재상태</th>
				<td><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
	  		</tr>
		<% } %>
		<% if(uSesEnt.dbo.equals("SABOK26")) { %>
			<tr>
				<td colspan="4">
					* 학자금 : 입학금, 수업료, 학생회비<br>
					* 첨부서류 : 가족관계증명서(최초1회만 제출), 해당학기 성적표 사본, 공납금고지서 사본
				</td>
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