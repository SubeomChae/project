<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 모성보호 신청서 조회 -->
<script language="javascript">
	function goEdit() {
		ajaxReplaceForm("wel01003_edit.do", "#viewForm", "#divFrame");
	}
	
	function goUpdate() {
		if (formValidate("#viewForm")) {
			removeMask("#viewForm");
			document.viewForm.etc_remark.value = document.viewForm.proof_confirm.value+"|"+document.viewForm.etc_note.value;
			ajaxSubmitForm("wel02002_update.do?action_type=UPDATE_AMT","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('저장되었습니다.');
					goSearch(document.saveForm.apply_no.value);
				}else {
					alert(rtn.errMsg);
				}
			});
		}		
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("wel01002_delete.do","#viewForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function signRequestPost() {
		goSearch(<%=box.get("apply_no")%>);
	}
	
	$(function() {
		<% if(box.get("popup_yn").equals("Y")) { %>
			$(".page-logo-text").html("모성보호 신청서 조회");	
		<% } %>
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<input type="hidden" name="msg_popup" 	value="<%=box.get("msg_popup")%>">
<input type="hidden" name="etc_remark" 		value="">

	<table class="table table-view table-bordered table-cover marB5">
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
			<th width="17%">주민번호</th>
			<td width="35%"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
			<th width="17%">직위</th>
			<td width="35%"><%=obox.get("position_nm")%></td>
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
			<th>신청일자</th>
			<td><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
			<th>출산예정일</th>
			<td><%=obox.get("due_date",Box.DEF_DATE_FMT)%></td>
		</tr>
		<tr>
			<th width="17%">임산부 건강상태</th>
			<td width="35%"><%=obox.get("mother_status")%></td>
			<th width="17%">태아 건강상태</th>
			<td width="35%"><%=obox.get("fetus_status")%></td>					
		</tr>
		<tr>
			<th>계좌번호</th>
			<td colspan="3"><%=obox.get("bank_nm")%> <%=obox.get("account_no")%> (예금주 : <%=obox.get("account_owner")%>)</td>
		</tr>
  		<tr>
			<th>전표번호</th>
			<td>
				<%if(!obox.get("slip_no").equals("")) { %>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
				<% } %>
				<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
			</td>
			<th>문서번호</th>
			<td>
				<%if(!obox.get("msg_no").equals("")) { %>
					<a href="javascript:goDocuViewer('<%=obox.get("msg_no")%>');"><b><%=FormatUtil.msgNo(obox.get("msg_no"))%></b></a>
				<% } %>
			</td>
  		</tr>
  		<tr>
			<th>결재상태</th>
			<td colspan="3"><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
			<% if(obox.get("sign_status").equals("1")) { %>
				<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
			<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
				<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button
			<% } %>
			</td>
  		</tr>
	</table>
	
<% if((obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) || obox.get("sign_status").equals("3")) {
	   String before_apply_cnt = StringUtil.arrayCol(obox.get("etc_remark"),1); 
	   String proof_confirm = StringUtil.arrayCol(obox.get("etc_remark"),2);
	   String etc_note = StringUtil.arrayCol(obox.get("etc_remark"),3); %>
	<table class="table table-view table-bordered table-cover marB5">
		<tr>					
			<th colspan="4">담당자 기재란</th>
		</tr>
  		<tr>
  			<th>지원금액</th>
  			<td colspan="3">
  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
  				<input type="text" name=apply_amt value="<%=obox.get("apply_amt")%>" size="13" maxlength="10" title="신청금액" class="form-control tMONEY" style="width:70px;"> 원
  			<% }else if(obox.get("sign_status").equals("3")) { %>
  				<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%> 원
  			<% } %>
  			</td>
  		</tr>
  		<tr>
  		<% %>
  			<th width="17%">이전지원횟수</th>
  			<td width="35%">
  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
  				<input type="text" name="before_apply_cnt" value="<%=before_apply_cnt%>" size="13" maxlength="10" title="이전지원횟수" class="form-control" style="width:70px;">회
  			<% }else if(obox.get("sign_status").equals("3")) { %>
  				<%=before_apply_cnt%> 회
  			<% } %>
  			 </td>
  			<th width="17%">증빙확인</th>
  			<td width="35%">
  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
  				<input type="text" name="proof_confirm" value="<%=proof_confirm%>" title="증빙확인" class="form-control" style="width:70px;">
  			<% }else if(obox.get("sign_status").equals("3")) { %>
  				<%=proof_confirm%>
  			<% } %>
  			 </td>
  		</tr>
		<tr>
			<th>비고</th>
			<td colspan="3">
  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
  				<input type="text" name="etc_note" value="<%=etc_note%>" maxlength="120" title="비고" class="form-control" style="width:90%">
  			<% }else if(obox.get("sign_status").equals("3")) { %>
  				<%=etc_note%>
  			<% } %>
  			 </td>
		</tr>
	</table>
<% } %>

	<div class="table-bottom-control">
		<span class="f-right">
		<% if(isEditable) { %>
			<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
			<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
		<% } %>
			<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/welfare/<%=box.get("dbo")%>/report/s022.jrf', 'P_PARAM01!SLP002,<%=box.get("apply_no")%>!P_PARAM02!ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>,<%=obox.get("bugt_cd")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>			
		</span>
	</div>
</table>
</form>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="모성보호 신청(<%=obox.get("empl_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP002">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>">
<input type="hidden" name="etc_remark" 		value="<%=obox.get("etc_remark")%>">
<input type="hidden" name="apply_ymd" 		value="<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="apply_amt" 		value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>