<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "family_rel_cd|bank_cd@@@@A|","","","","","");
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 장애자녀 신청서 작성 -->
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
				document.saveForm.data04.value = document.saveForm.handicap_level.value;

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
	
	function changeFamilyId(family_id) {
		if(family_id == '') { return; }
		var family_value = document.saveForm.family_id.options[document.saveForm.family_id.options.selectedIndex].title;
		var arr = family_value.split('|');
		document.saveForm.family_rel_cd.value = arr[0];
		document.saveForm.family_nm.value = arr[1];
		document.saveForm.family_reside_no.value = arr[2];
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
	<table class="table table-view table-bordered table-cover marB5">
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
			<th>사번/성명</th>
			<td><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
				<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><b><%=obox.get("empl_nm")%></b></a>
				<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
			</td>
			<th>부서</th>
			<td><%=obox.get("dept_nm")%></td>
		</tr>
		<tr>
			<th width="20%">주민번호</th>
			<td width="30%"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
			<th width="20%">직위</th>
			<td width="30%"><%=obox.get("position_nm")%></td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
			<th>사원구분</th>
			<td><%=obox.get("empl_class_nm")%></td>
		</tr>
	</table>
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>대상자</th>
			<td>
				<select name="family_id" class="bs-select form-control required" title="대상자 선택" style="width:117px" onChange="changeFamilyId(this.value)">
					<option value=''>:: 선택 ::</option>
					<%	RsWrapper familyWp = CodeUtil.getRsWrapper("PR_INSTB_EMPL12_LIST","LISTCODE", "", obox.get("empl_no"),"00","","","",uSesEnt.dbo);
					for(int i=0; i < familyWp.getLength(); i++) { %>
					<option value='<%=familyWp.get("code",i)%>' <%=StringUtil.arrayCol(familyWp.get("optkey",i),2,"|").equals(obox.get("family_nm"))?"selected":""%> title='<%=familyWp.get("optkey",i)%>'><%=familyWp.get("data",i)%></option>
				<% } %>
				</select>
				<input type="hidden" name="family_rel_cd" 		value="<%=obox.get("family_rel_cd")%>">
				<input type="hidden" name="family_nm" 			value="<%=obox.get("family_nm")%>">
				<input type="hidden" name="family_reside_no"	value="<%=obox.get("family_reside_no")%>">
			</td>
			<th>장애정도</th>
			<td>
				<select name="handicap_level" title="장애정도" class="bs-select form-control" style="width:117px">
					<option value='1' <%=obox.get("handicap_level").equals("1")?"selected":""%>>중증</option>
					<option value='2' <%=obox.get("handicap_level").equals("2")?"selected":""%>>경증</option>
		        </select>
			</td>
		</tr>
		<tr>
			<th width="20%">신청일자</th>
			<td width="30%">
				<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
					<input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD" <%=isEditable?"":"readonly"%>>
					<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
				</div>
			</td>
			<th width="20%">신청금액</th>
			<td width="30%">
				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="8" maxlength="10" class="form-control required tMONEY" title="신청금액" style="width:70px;">&nbsp;원
			</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td colspan="3">
				<select name="bank_cd" title="금융기관" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="bs-select form-control required"<%}%> style="width:120px">
					<option value=''>:: 금융기관 선택 ::</option>
		            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
				</select>
				<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="18" maxlength="30" title="계좌번호" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="form-control required"<%}%> style="width:100px">
				&nbsp;예금주 : <input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="10" maxlength="15" title="예금주" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="form-control required"<%}%> style="width:100px">
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
				<%if(!obox.get("slip_no").equals("")){%>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				<% } %>
				<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
				<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
			</td>
			<th>결재상태</th>
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