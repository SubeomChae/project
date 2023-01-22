<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "family_rel_cd|bank_cd@@@@A|","","","","",uSesEnt.dbo);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 의료비 신청서 작성 -->

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
				document.saveForm.data04.value = document.saveForm.medi_org_nm.value;
			<% if(!uSesEnt.dbo.equals("SABOK26")) { %>
				document.saveForm.data05.value = document.saveForm.medi_org_addr.value;
				document.saveForm.data07.value = document.saveForm.medi_ymd.value;
			<% } %>
				document.saveForm.data06.value = document.saveForm.disease_nm.value;
				document.saveForm.data08.value = document.saveForm.start_ymd.value;
				document.saveForm.data09.value = document.saveForm.end_ymd.value;
				document.saveForm.data10.value = document.saveForm.inner_ilsu.value;
				document.saveForm.data11.value = document.saveForm.use_amt.value;

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
		document.saveForm.apply_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("wel01003_edit.do", "#saveForm", "#divFrame");
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
				<th width="15%">대상자</th>
				<td width="35%">
				<% if(uSesEnt.dbo.equals("SABOK26")) { %>
					<select name="family_rel_cd" title="가족관계" class="bs-select form-control required" style="width:117px">
						<option value=''>:: 선택 ::</option>
						<option value='00' <%=obox.get("family_rel_cd").equals("00")?"selected":""%>>본인</option>
						<option value='30' <%=obox.get("family_rel_cd").equals("30")?"selected":""%>>배우자</option>
						<option value='40' <%=obox.get("family_rel_cd").equals("40")?"selected":""%>>자녀</option>
			        </select>&nbsp;
			        <input type="text" name="family_nm" value="<%=obox.get("family_nm")%>" class="form-control required" style="width:120px">
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
				<th width="15%">질환명</th>
				<td width="35%">
					<input type="text" name="disease_nm" value="<%=obox.get("disease_nm")%>" maxlength="50" title="질환명" class="form-control" style="width:90%">
				</td>
			</tr>
			<tr>
				<th>의료기관</th>
				<td>
					<input type="text" name="medi_org_nm" value="<%=obox.get("medi_org_nm")%>" maxlength="50" title="의료기관명" class="form-control" style="width:90%;">
				</td>
			<% if(!uSesEnt.dbo.equals("SABOK26")) { %>
				<th>소재지</th>
				<td>
					<input type="text" name="medi_org_addr" value="<%=obox.get("medi_org_addr")%>" maxlength="50" title="의료기관 소재지" class="form-control" style="width:90%;">
				</td>
			</tr>
			<tr>
				<th>진료일자</th>
				<td>
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="medi_ymd" value="<%=obox.get("medi_ymd")%>" maxlength="8" title="신청일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
			<% } %>
				<th>사용금액</th>
				<td>
					<input type="text" name="use_amt" value="<%=obox.get("use_amt")%>" maxlength="10" title="사용금액" class="form-control tMONEY" style="width:70px">&nbsp;원
				</td>
			</tr>
			<tr>
			<% if(uSesEnt.corp_cd.equals("SABOK10")) { %>
				<th>진료기간</td>
			<% }else  {%>
				<th>입원기간</th>
			<% } %>
				<td colspan="3">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("inner_start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="start_ymd" value="<%=obox.get("inner_start_ymd")%>" maxlength="8" title="입원기간(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span>&nbsp;부터&nbsp;~&nbsp;</span>
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("inner_end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="end_ymd" value="<%=obox.get("inner_end_ymd")%>" maxlength="8" title="입원기간(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>&nbsp;까지&nbsp;
						(총&nbsp;<input type="text" name="inner_ilsu" value="<%=obox.get("inner_ilsu")%>" maxlength="3" title="입원일수" class="form-control tMONEY" style="width:25px" readOnly>&nbsp;일)
					</div>	
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
					<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:70px">&nbsp;원
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
					<input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="width:90%">
				</td>
			</tr>
		<% if(!box.get("apply_no").equals("")) { %>
	  		<tr>
				<th>전표번호</th>
				<td nowrap>
					<%if(!obox.get("slip_no").equals("")){%>
						<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
					<%}%>
					<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
					<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
				</td>
				<th>결재상태</th>
				<td nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
	  		</tr>
		<% } %>
		<% if(uSesEnt.dbo.equals("SABOK26")) { %>
			<tr>
				<td colspan="4">
					* 2차병원 이상에서 3일이상 입원 치료한 경우 본인 70%, 배우자 및 자녀 50%<br>
					* 제증명 발급비용 제외 및 1원단위 절사<br>
					* 첨부서류 : 진단서, 입퇴원확인서, 의료비 지출 영수증(계산서)
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