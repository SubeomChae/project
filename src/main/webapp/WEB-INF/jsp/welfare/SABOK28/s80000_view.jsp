<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 직원 복지연금 신청서 조회 -->

<script language="javascript">
	function goEdit() {
		ajaxReplaceForm("wel02003_edit.do", "#viewForm", "#divFrame");
	}
	
	function changeFinishYm() {
		if (formValidate("#viewForm")) {
			removeMask("#viewForm");
			ajaxSubmitForm("wel02002_update.do?action_type=UPDATE_FINISH","#viewForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('저장되었습니다.');
					goSearch(document.viewForm.apply_no.value);
				}else {
					alert(rtn.errMsg);
				}
			});
		}		
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
			ajaxSubmitForm("wel02002_delete.do","#viewForm", function(rtn) {
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
			$(".page-logo-text").html("직원 복지연금 신청서 조회");	
		<% } %>
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<input type="hidden" name="msg_popup" 	value="<%=box.get("msg_popup")%>">
<input type="hidden" name="etc_remark" 	value="<%=obox.get("etc_remark")%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
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
				<th width="15%">지원항목</th>
				<td width="35%"><%=obox.get("support_item_nm")%></td>
				<th width="15%">본인부담금</th>
				<td width="35%"><%=obox.get("self_pay_amt",Box.THOUSAND_COMMA)%> 원</td>
			</tr>
			<tr>
				<th>신청일자</th>
				<td><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
				<th>신청금액</th>
				<td><%=obox.get("apply_amt",Box.THOUSAND_COMMA)%> 원<%if(!obox.get("apply_amt").equals(obox.get("support_amt"))){%>(실수령금액 : <%=obox.get("support_amt",Box.THOUSAND_COMMA)%> 원)<%}%></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td colspan="3"><%=obox.get("bank_nm")%> <%=obox.get("account_no")%> (예금주 : <%=obox.get("account_owner")%>)</td>
			</tr>
		<% if(uSesEnt.use_auth.startsWith("S") && obox.get("sign_status").equals("3")){ %>
			<tr>
				<th>지급종료월</th>
				<td colspan="3">
					<select name="finish_yy" title="지급종료년도" class="bs-select form-control" style="width:90px">
            			<%=DateUtil.getYearOptionTag(obox.get("finish_yy").equals("") ? "2029" : obox.get("finish_yy"), "2010", "2099", "desc", "년")%>
					</select>&nbsp;
					<select name="finish_mm" title="지급종료월" class="bs-select form-control" style="width:70px">
            			<%=DateUtil.getMonthOptionTag(obox.get("finish_mm"),"월")%>
					</select>
					<input type="hidden" name="finish_ym" value="">
					<button type="button" class="btn btn-primary btn-table" onClick="changeFinishYm();">수정</button>
				</td>
			</tr>
		<% } %>
	  		<tr>
				<th>결재상태</th>
				<td><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").equals("1")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
				<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
				<% } %>
				</td>
				<th>문서번호</th>
				<td>
				<%if(!obox.get("msg_no").equals("")){%>
					<a href="javascript:goDocuViewer('<%=obox.get("msg_no")%>');"><%=FormatUtil.msgNo(obox.get("msg_no"))%></a>
				<%}%>
				</td>
	  		</tr>
		</table>
	</div>
	
<% if((obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) || obox.get("sign_status").equals("3")) {
   	   String proof_confirm = StringUtil.arrayCol(obox.get("etc_remark"),1);
   	   String etc_note = StringUtil.arrayCol(obox.get("etc_remark"),2); %>
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>					
				<th colspan="4">담당자 기재란</th>
			</tr>
	  		<tr>
	  			<th width="15%">지원금액</th>
	  			<td width="35%">
	  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
	  				<input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="13" maxlength="10" title="신청금액" class="tMONEY" style="width:70px;border:1 solid gray" > 원
	  			<% }else if(obox.get("sign_status").equals("3")) { %>
	  				<%=obox.get("support_amt",Box.THOUSAND_COMMA)%> 원
	  			<% } %>
	  			</td>
	  			<th width="15%">증빙확인</th>
	  			<td width="35%">
	  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
	  				<input type="text" name="proof_confirm" value="<%=proof_confirm%>" size="13" maxlength="10" title="증빙확인" style="width:70px;border:1 solid gray" >
	  			<% }else if(obox.get("sign_status").equals("3")) { %>
	  				<%=proof_confirm%>
	  			<% } %>
	  			 </td>
	  		</tr>
			<tr>
				<th>비고</th>
				<td colspan="3">
	  			<% if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { %>
	  				<input type="text" name="etc_note" value="<%=etc_note%>" maxlength="120" title="비고" style="width:90%;border:1 solid gray">
	  			<% }else if(obox.get("sign_status").equals("3")) { %>
	  				<%=etc_note%>
	  			<% } %>
	  			 </td>
			</tr>
		</table>
	</div>
<% } %>
	
	<div class="table-bottom-control">
		<span class="f-right">
		<% if(isEditable) { %>
			<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
			<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
		<% } else if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) {%>
			<button type="button" class="btn dark" onClick="goUpdate()"><img src="/com/img/ico_btn_save.png">저장</button>
		<% } %>
			<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/welfare/<%=box.get("dbo")%>/report/s800.jrf', 'P_PARAM01!BOK001,<%=obox.get("apply_no")%>!P_PARAM02!<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>|<%=obox.get("support_item")%>|<%=obox.get("empl_no")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
			<%-- <button type="button" class="btn dark" onClick="goRptViewer('welfare/<%=uSesEnt.dbo%>/report/s001PDF', '<%=box.get("apply_no")%>');"><img src="/com/img/ico_btn_print.png">인쇄</button> --%>
		</span>
	</div>
</form>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="직원복지연금 신청(<%=obox.get("empl_nm")%>)">
<input type="hidden" name="msg_type" 		value="BOK001">
<input type="hidden" name="search_key" 		value="<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>|<%=obox.get("support_item")%>|<%=obox.get("empl_no")%>">
<input type="hidden" name="etc_remark" 		value="<%=obox.get("etc_remark")%>">
<input type="hidden" name="apply_ymd" 		value="<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="apply_amt" 		value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>