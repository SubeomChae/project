<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="calcWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	String pro_status = ("1,4".indexOf(obox.get("sign_status")) >= 0 ? "1" : obox.get("sign_status")) + FormatUtil.nvl2(obox.get("finish_flag"),"0"); 
	boolean isEditable = false;
	if(uSesEnt.use_auth.startsWith("S") || pro_status.equals("10")) { isEditable = true; }
%>
<!-- 대부금 신청서 조회  -->
<script language="javascript">
	function goEdit() {
		ajaxReplaceForm("lon01003_edit.do", "#viewForm", "#divFrame");
	}

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("lon01002_delete.do","#viewForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goTabpage(tab_index) {
		document.viewForm.tab_index.value = tab_index;
		try { document.getElementById('goEdit').style.display = (tab_index == '1' ? '' : 'none'); } catch(e) {}
		
		$("#loanTabMenu li").removeClass('active');
		$("#loanTabMenu #tabMenu"+tab_index).addClass('active');
		if(tab_index == 1) {
			$('#divArea1').show();
			$('#divArea2').hide();
			$('#divArea3').hide();
			$('#btnEdit').show();
		}else if(tab_index == 2){
			$('#divArea1').hide();
			$('#divArea2').show();
			$('#divArea3').hide();
			$('#btnEdit').hide();
			fixTableHeader("MyTable2");
		}else {
			$('#divArea1').hide();
			$('#divArea2').hide();
			$('#divArea3').show();
			$('#btnEdit').hide();
			fixTableHeader("MyTable3");
		}
	}
	
	function signRequestPost() {
		goSearch(<%=box.get("loan_no")%>);
	}
	
	$(function() {
		goTabpage('1');
		<% if(box.get("popup_yn").equals("Y")) { %>
			$(".page-logo-text").html("대부금 신청서 조회");	
		<% } %>
	});
	
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType">
<input type="hidden" name="loan_no" 	value="<%=box.get("loan_no")%>">
<input type="hidden" name="tab_index"	value="<%=FormatUtil.nvl2(box.get("tab_index"),"1")%>">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">

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
	
	<% if(obox.get("sign_status").equals("3")) { %>
		<ul id="loanTabMenu" class="nav nav-tabs">
			<li class="active">
				<li id="tabMenu1" onClick="goTabpage('1')"><a data-toggle="tab">대부금신청서</a></li>
				<li id="tabMenu2" onClick="goTabpage('2')"><a data-toggle="tab">상환내역</a></li>
			<% if(!obox.get("finish_flag").equals("2") && !uSesEnt.dbo.equals("SABOK57")) { %>
				<li id="tabMenu3" onClick="goTabpage('3')"><a data-toggle="tab">상환예정</a></li>
			<% } %>
			</li>
		</ul>
	<% } %>
	
	<div id="divArea1" class="table-scrollable">
		<table id="MyTable1" class="table table-view table-bordered">
			<tr>
				<th>대부종류</th>
				<td colspan="3"><%=obox.get("bugt_nm")%></td>
			</tr>
			<tr>
				<th width="15%">신청일자</th>
				<td width="35%"><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
				<th width="15%">대부일자</th>
				<td width="35%"><%=obox.get("loan_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>
			<tr>
				<th>대부금액</th>
				<td colspan="3"><%if(!obox.get("loan_amt").equals("")){%><%=obox.get("loan_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
			</tr>
			<tr>
				<th>대부용도</th>
				<td colspan="3"><%=obox.get("loan_usage")%></td>
			</tr>
			<tr>
				<th>상환방법</th>
				<td colspan="3" nowrap>
					<%=FormatUtil.nvl2(obox.get("defer_year"),"__")%> 년 거치 &nbsp;<%=FormatUtil.nvl2(obox.get("refund_year"),"__")%> 년 상환(상환횟수 : <%=FormatUtil.nvl2(obox.get("refund_cnt"),"__")%> 회)
				</td>
			</tr>
			<tr>
				<th>거치만료일</th>
				<td><%=obox.get("defer_end_ymd",Box.DEF_DATE_FMT)%></td>
				<th>1회상환금액</th>
				<td><%if(!obox.get("unit_amt").equals("")){%><%=obox.get("unit_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
			</tr>
			<tr>
				<th>이자율</th>
				<td colspan="3"><%if(!obox.get("intr_rate").equals("")){%><%=obox.get("intr_rate")%> %<%}%></td>
			</tr>
		<% if(obox.get("sign_status").equals("3")) { %>
			<tr>
				<th>대부잔액</th>
				<td><%if(!obox.get("remain_amt").equals("")){%><%=obox.get("remain_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
				<th>최종상환일</th>
				<td><%=obox.get("last_refund_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>
		<% } %>
			<tr>
				<th>계좌번호</th>
				<td colspan="3"><%=obox.get("bank_nm")%> <%=obox.get("account_no")%> (예금주 : <%=obox.get("account_owner")%>)</td>
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
				<td colspan="3"><b><font color=red><%=obox.get("pro_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").equals("1")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
				<% }else if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
				<% } %>
				</td>
	  		</tr>
		</table>
	</div>
	
	<div id="divArea2" class="table-scrollable scrollOptionY" style="height:calc(100vh - 300px);display:none">
		<table id="MyTable2" class="table table-striped table-bordered order-column">
			<colgroup>
				<col style="width:5%;">
				<col style="width:8%;">
				<col style="width:15%">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:15%">
				<col style="width:15%;">
				<col style="width:15%;">
			</colgroup>
			<thead>	
				<tr>
					<th>No</th>
					<th>구분</th>
					<th>상환일자</th>
					<th>원금상환</th>
					<th>이자상환</th>
					<th>이자기산일</th>
					<th>대부잔액</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody> 
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="8" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("refund_flag_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("refund_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("refund_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("intr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(obox.getLong("loan_amt")-rsWp.getLong("refund_sum",i)))%></td>
					<td><%=rsWp.get("etc_remark",i)%></td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
		</table>
	</div>
	
	<div id="divArea3" class="table-scrollable scrollOptionY" style="height:calc(100vh - 300px);display:none">
		<table id="MyTable3" class="table table-striped table-bordered order-column">
			<colgroup>
				<col style="width:5%;">
				<col style="width:8%;">
				<col style="width:18%">
				<col style="width:18%;">
				<col style="width:15%;">
				<col style="width:15%">
				<col style="width:18%;">
			</colgroup>
			<thead>	
				<tr>
					<th>No</th>
					<th>구분</th>
					<th>상환예정일</th>					
					<th>상환금액</th>
					<th>원금상환</th>
					<th>이자상환</th>
					<th>대부잔액</th>
				</tr> 
			</thead>
			<tbody>
			<% if(calcWp.getLength() == 0) { %>
				<tr><td colspan="7" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   	   for(int i=0; i < calcWp.getLength(); i++) { %>
				<tr onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center">정기</td>
					<td class="t-center"><%=calcWp.get("refund_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=calcWp.get("refund_tot",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=calcWp.get("refund_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=calcWp.get("intr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=calcWp.get("remain_amt",i,Box.THOUSAND_COMMA)%></td>
				</tr>				
				<% } %>
			<% } %>		
			</tbody>
		</table>
	</div>
	
<% if(!box.get("popup_yn").equals("Y")) { %>	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span class="marR5" style="float:right;">
				<% if(isEditable) { %>
					<button id="btnEdit" type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
				<% } %>
				<% if(pro_status.equals("10")) { %>
					<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
				<% } %>
					<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/loan/report/lon01002.jrf','P_PARAM01!SLP006,<%=obox.get("loan_no")%>!P_PARAM02!ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("loan_no")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
					<%-- <button type="button" class="btn dark" onClick="goRptViewer('loan/report/lon01002PDF','<%=box.get("loan_no")%>');"><img src="/com/img/ico_btn_print.png">인쇄</button> --%>
			</span>
		</span>
	</div>
<% } %>
</form>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="<%=obox.get("bugt_nm")%> 신청(<%=obox.get("empl_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP006">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("loan_no")%>">
<input type="hidden" name="etc_remark" 		value="<%=obox.get("etc_remark")%>">
<input type="hidden" name="sign_arr" 		value="<%=obox.get("bugt_nm")%>|<%=obox.get("empl_nm")%>|<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>|<%=obox.get("loan_amt",Box.THOUSAND_COMMA)%>|<%=obox.get("loan_usage")%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
