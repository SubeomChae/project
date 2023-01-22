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
<!-- 장애자녀지원 신청서 작성 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if(document.main.apply_ymd.value.replace(/-/g,"") > '<%=DateUtil.toString("yyyyMMdd")%>') { 
				alert('신청일이  오늘 날짜 이후로 입력되었습니다.\n다시 확인 후 입력해주세요.');
				document.main.apply_ymd.focus();
				return;
			}	
								
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.action = 'wel01003_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}		
	}
			
	function goCancel() {
		removeMask("#main");
		document.main.action = 'wel01002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}

	function changeData12(data12) { 
		if(data12 == '양육보조금') {
			document.main.apply_amt.value = '2000000';
		}else if(data12 == '장학금') {
			document.main.apply_amt.value = '2000000';
		}else {
			document.main.apply_amt.value = '';
		}
		formatMaskElm(document.main.apply_amt);
	}
	
	function find_employee_no_post(empl_no, empl_nm) {
		removeMask("#main");
		document.main.apply_no.value = '';
		document.main.empl_no.value = empl_no;
		document.main.empl_nm.value = empl_nm;
		document.main.action = "wel01003_edit.do";
		document.main.target = "_self";
		document.main.submit();
	}

	function __Calendar_Setting_Post(target) {
		if(target.substring(0,9) == 'start_ymd') {
			inx = target.substring(9);
			if(!isEmpty(document.all['end_ymd'+inx])) {
				document.all['inner_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000') + 1;
			}		
		}else if(target.substring(0,7) == 'end_ymd') {
			inx = target.substring(7);		
			if(!isEmpty(document.all['start_ymd'+inx])) {
				document.all['inner_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000') + 1;
			}		
		} 
		formatMaskElm(document.all['inner_ilsu'+inx]);
	}

	function page_init() {
		changeData12('<%=obox.get("data12")%>');
	}
</script>

<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">

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
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th width="15%">신청구분</th>
			<td width="35%">
				<select name="data12" style="width:40%" class="bs-select form-control required" onChange="changeData12(this.value)">
					<option value=''>:: 선택 ::</option>
					<option value='양육보조금' <%=box.get("data12").equals("양육보조금")?"selected":""%>>양육보조금</option>
					<option value='장학금' <%=box.get("data12").equals("장학금")?"selected":""%>>장학금</option>
					<option value='의료비' <%=box.get("data12").equals("의료비")?"selected":""%>>의료비</option>
				</select>
			</td>
			<th width="15%">자녀명</th>
			<td width="35%">
				<input type="text" name="data13" value="<%=obox.get("data13")%>" size="10" maxlength="15" title="자녀명" class="form-control required" style="width:45px">
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
				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt").equals("")?"3000000":obox.get("apply_amt")%>" maxlength="10" title="신청금액" class="form-control required tMONEY" style="width:100px"> 원
			</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td colspan="3">
				<select name="bank_cd" title="금융기관" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="bs-select form-control required"<%}%> style="width:120px">
					<option value=''>:: 금융기관 선택 ::</option>
		            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
				</select>
				<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="18" maxlength="30" title="계좌번호" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="required"<%}%> style="border:1 solid gray">
				&nbsp;예금주 : <input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="10" maxlength="15" title="예금주" <%if(!uSesEnt.corp_cd.equals("SABOK27")){%>class="required"<%}%> style="border:1 solid gray">
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
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		<%if(!box.get("apply_no").equals("")){%>
			<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
		<% } %>
		</span>
	</div>
</form>