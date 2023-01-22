<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>
<!-- 사내동호인회지원 -->

<script language="javascript">
	function goEdit() {
		ajaxReplaceForm("wel01003_edit.do", "#viewForm", "#divFrame");
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
			$(".page-logo-text").html("사내동호인회지원 신청서 조회");	
		<% } %>
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">

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
				<th>동호인회</th>
				<td colspan="3"><%=obox.get("sub_nm")%></td>
			</tr>
			<tr>
				<th>행사일자</th>
				<td colspan="3"><%=obox.get("start_ymd",Box.DEF_DATE_FMT)%><%if(!obox.get("end_ymd").equals(obox.get("start_ymd"))){%> ~ <%=obox.get("end_ymd",Box.DEF_DATE_FMT)%><%}%></td>
			</tr>
			<tr>
				<th>장소</th>
				<td colspan="3"><%=obox.get("event_place")%></td>
			</tr>
			<tr height="50">
				<th>행사내용</th>
				<td colspan="3" style="padding:5 5 5 5"><%=obox.get("event_content",Box.MULTILINE_TEXT)%></td>
			</tr>
			<tr>
				<th width="15%">신청일자</th>
				<td width="35%"><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
				<th width="15%">신청금액</th>
				<td width="35%"><%=obox.get("apply_amt",Box.THOUSAND_COMMA)%> 원</td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="3"><%=obox.get("etc_remark")%></td>
			</tr>
	  		<tr>
				<th>전표번호</th>
				<td nowrap>
					<%if(!obox.get("slip_no").equals("")){%>
						<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
					<%}%>
					<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
				</td>
				<th>문서번호</th>
				<td>
					<%if(!obox.get("msg_no").equals("")){%>
						<a href="javascript:goDocuViewer('<%=obox.get("msg_no")%>');"><%=FormatUtil.msgNo(obox.get("msg_no"))%></a>
					<%}%>
				</td>
	  		</tr>
	  		<tr>
				<th>결재상태</th>
				<td colspan="3"><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").equals("1")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
				<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
				<% } %>
				</td>
	  		</tr>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
		<% if(isEditable) { %>
			<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
			<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
		<% } %>
			<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/welfare/<%=box.get("dbo")%>/report/s006.jrf', 'P_PARAM01!SLP002,<%=box.get("apply_no")%>!P_PARAM02!ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>,<%=obox.get("bugt_cd")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>			
		</span>
	</div>
</form>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="<%=obox.get("sub_nm")%>(<%=obox.get("empl_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP002">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("apply_no")%>|<%=obox.get("bugt_cd")%>">
<input type="hidden" name="etc_remark" 		value="<%=obox.get("etc_remark")%>">
<input type="hidden" name="apply_ymd" 		value="<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="apply_amt" 		value="<%=obox.get("apply_amt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="nextUrl" 		value="">
</form>