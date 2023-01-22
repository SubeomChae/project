<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	String bank_cd;
 	if(uSesEnt.dbo.equals("SABOK10")) {
		bank_cd="|bank_cd@@@@A||bank_cd@@@@C|";
	}else {
		bank_cd="|bank_cd@@@@A|";
	}
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "cong_class@"+uSesEnt.dbo+bank_cd,"","","","");
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 경조금 신청서 작성  -->
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
				document.saveForm.data04.value = document.saveForm.cong_class.value;
				document.saveForm.data05.value = document.saveForm.start_ymd.value;
				document.saveForm.data06.value = document.saveForm.end_ymd.value;
				document.saveForm.data07.value = document.saveForm.cong_place.value;

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
	
  	var congWp = new Array();
<%	RsWrapper congWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LIST001", "", "cong_class@"+uSesEnt.dbo,"","","","");
	for(int i=0; i < congWp.getLength(); i++) { %>
		congWp[<%=i%>] = '<%=congWp.get("code1",i)%>|<%=congWp.get("code2",i)%>|<%=congWp.get("data5",i)%>';
<%	} %>
	
	function changeFamilyId(family_id) {
		if(family_id == '') { return; }
		var family_value = document.saveForm.family_id.options[document.saveForm.family_id.options.selectedIndex].title;
		var arr = family_value.split('|');
		document.saveForm.family_rel_cd.value = arr[0];
		document.saveForm.family_nm.value = arr[1];
		document.saveForm.family_reside_no.value = arr[2];
		autoCongAmt();
	}
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
	}
	
	function autoCongAmt() {
		document.saveForm.apply_amt.value = '';
		for(var i=0; i < congWp.length; i++) {
			var arr = congWp[i].split('|');
			if(arr[0] == document.saveForm.cong_class.value && arr[1] == document.saveForm.family_rel_cd.value) {
				document.saveForm.apply_amt.value = arr[2];
				formatMaskElm(document.saveForm.apply_amt);
				break;
			}
		}
	}
	
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType">
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
				<th width="15%">경조구분</th>
				<td width="35%">
					<select name="cong_class" title="경조구분" class="bs-select form-control required" style="width:117px" onChange="autoCongAmt()">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "cong_class", obox.get("cong_class"))%>
					</select>
				</td>
				<th width="15%">대상자</th>
				<td width="35%">
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
			</tr>
			<tr>
				<th>경조일자</th>
				<td colspan="3">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="start_ymd" value="<%=obox.get("start_ymd")%>" maxlength="8" title="경조기간(부터)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="end_ymd" value="<%=obox.get("end_ymd")%>" maxlength="8" title="경조기간(까지)" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
			</tr>
			<tr> 
				<th>경조장소</th>
				<td colspan="3">
					<input type="text" name="cong_place" value="<%=obox.get("cong_place",Box.SPECIAL_CHAR)%>" title="경조장소" class="form-control required" style="width:96%">
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
					<input type="text" name="apply_amt" value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>" title="신청금액" class="form-control required tMONEY" style="width:90%">&nbsp;원
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td colspan="3">
					<select name="bank_cd" class="bs-select form-control required" title="금융기관" style="width:150px">
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
					<input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="width:96%">
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