<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 전표조회  -->

<script language="javascript">	
	function goMouseEvent(event_nm, slip_seq) {
		$('#tr_'+slip_seq).css("background-color", event_nm == 'over' ? '#b2e1f1' : '#ffffff');
	}
	
	function goDetail(rel_no_type, rel_no, bank_nm, issue_ymd, finish_ymd, rel_amt, intr_rate, tax_rate, vat_amt, proof_ymd, vat_nm, slip_seq) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(slip_seq != '') { $("tr[slip_seq='"+slip_seq+"']").addClass("bg-yellow"); }
		if(rel_no_type == '11') { $("#rel_no_type").html("계좌번호"); }
		else if(rel_no_type == '12') { $("#rel_no_type").html("카드번호"); }
		else if(rel_no_type == '13') { $("#rel_no_type").html("어음번호"); }
		else if(rel_no_type == '14') { $("#rel_no_type").html("유가증권번호"); }
		else if(rel_no_type == '15') { $("#rel_no_type").html("사업자번호"); }
		else if(rel_no_type == '16') { $("#rel_no_type").html("주민등록번호"); }
		else if(rel_no_type == '17') { $("#rel_no_type").html("자산번호"); }
		else { $("#rel_no_type").html("관련번호"); }

		$("#rel_no").html(bank_nm + ' ' + rel_no);
		$("#issue_ymd").html(issue_ymd.fmtYmd());
		$("#finish_ymd").html(finish_ymd.fmtYmd());
		$("#rel_amt").html((rel_amt == '' ? '' : insertComma(rel_amt) + ' 원'));
		$("#intr_rate").html((intr_rate == '' ? '' : intr_rate + '%'));
		$("#tax_rate").html((tax_rate == '' ? '' : tax_rate + '%'));
		$("#vat_amt").html((vat_amt == '' ? '' : insertComma(vat_amt) + ' 원'));
		$("#proof_ymd").html(proof_ymd.fmtYmd());
		$("#vat_nm").html(vat_nm);
	}
	
	$(function() {
		$(".page-logo-text").html("전표조회");	
	<% if(rsWp.getLength() > 0) {
        out.println("goDetail('"+rsWp.get("rel_no_type",0)+"','"+rsWp.get("rel_no",0)+"','"+rsWp.get("bank_nm",0)+"','"+rsWp.get("issue_ymd",0)+"','"+rsWp.get("finish_ymd",0)+"','"+rsWp.get("rel_amt",0)+"','"+rsWp.get("intr_rate",0)+"','"+rsWp.get("tax_rate",0)+"','"+rsWp.get("vat_amt",0)+"','"+rsWp.get("proof_ymd",0)+"','"+rsWp.get("vat_nm",0)+"','"+rsWp.get("slip_seq",0)+"');");
	} %>
	}); 
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="slip_no" 	value="<%=box.get("slip_no")%>">
<input type="hidden" name="selectedRow" value="">
	<div>
		<% if(!obox.get("slip_no").equals("")) { %>
			<h2 class="page-title-2depths">[ <%=obox.get("slip_no",Box.SLIP_NO)%> ] <%=obox.get("biz_type_nm")%></h2>
		<% }else { %>
			삭제된 전표입니다.
		<% } %>
		<span class="f-right marB5">
		<%if(!obox.get("msg_no").equals("") && !box.get("msg_popup").equals("Y")){%>
			<button type="button" class="btn dark" onClick="goDocuViewer('<%=obox.get("msg_no")%>')"><img src="/com/img/ico_btn_search.png">기안문 보기</button>
		<%}%>  
		<% if(!obox.get("slip_no").equals("")) { %>
			<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slipDetailView.jrf','P_PARAM01!<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
			<button type="button" class="btn btn-primary" onClick="goSlipPrint('<%=obox.get("slip_no")%>')"><img src="/com/img/ico_btn_excel.png" alt="icon">엑셀다운로드</button>
	   <%-- <a href="javascript:go_ubi_viewer('account/report/slipDetailView.jrf','P_PARAM01!<%=obox.get("slip_no")%>!');"><img id="btnSlipPrint" src="/com/img/btn_print02.gif" border="0" align="absmiddle"></a>
			<a href="javascript:go_ubi_viewer('account/report/slp01001.jrf','P_PARAM01!SLP001,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!');"><img id="btnSlipPrint" src="/com/img/btn_print02.gif" border="0" align="absmiddle"></a>
			<a href="javascript:go_slip_print('<%=obox.get("slip_no")%>');"><img id="btnSlipPrint" src="/com/img/btn_print03.gif" border="0" align="absmiddle"></a> --%>
		<% } %>
		</span>
	</div>
    <% if(!obox.get("slip_no").equals("")) { %>
	<div>
		<b>&middot; 제목 :</b> <font color=gray><%=FormatUtil.nvl2(obox.get("etc_remark"),obox.get("subject"))%></font>&nbsp;&nbsp;&nbsp;&nbsp;
		<b>&middot; 작성자 :</b> <font color=gray><%=obox.get("dept_nm")%> <%=obox.get("empl_nm")%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		[<b><font color=red><%=obox.get("sign_status_nm")%></font></b><%if(!obox.get("sign_no").equals("")){%>, <%=obox.get("sign_ymd")%>-<%=obox.get("acc_unit")%>-<%=obox.get("sign_no")%><%}%>]
	</div>
    <% } %>
<div class="table-scrollable" style="height:400px">
	<table class="table table-view table-hover table-bordered">
  		<tr>
			<th width="20%">계정과목</th>
		  	<th width="8%">차변</th>
		  	<th width="8%">대변</th>
		  	<th width="20%">적요</th>
		  	<th width="16%">거래처</th>
		  	<th width="28%">비용귀속</th>
		</tr>
 		<% int cha_amt_tot = 0; 
		   int dae_amt_tot = 0; 
		   for(int i=0; i < rsWp.getLength(); i++) { 
			cha_amt_tot += (rsWp.get("cd_flag",i).equals("1") ? rsWp.getInt("slip_amt",i) : 0);
			dae_amt_tot += (rsWp.get("cd_flag",i).equals("2") ? rsWp.getInt("slip_amt",i) : 0);
		%>
        <tr id="tr_<%=i%>" slip_seq="<%=rsWp.get("slip_seq",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("rel_no_type",i)%>','<%=rsWp.get("rel_no",i)%>','<%=rsWp.get("bank_nm",i)%>','<%=rsWp.get("issue_ymd",i)%>','<%=rsWp.get("finish_ymd",i)%>','<%=rsWp.get("rel_amt",i)%>','<%=rsWp.get("intr_rate",i)%>','<%=rsWp.get("tax_rate",i)%>','<%=rsWp.get("vat_amt",i)%>','<%=rsWp.get("proof_ymd",i)%>','<%=rsWp.get("vat_nm",i)%>','<%=rsWp.get("slip_seq",i)%>')">
			<td><%=rsWp.get("acct_nm",i)%></td>
		  	<td class="t-right"><%=rsWp.get("cd_flag",i).equals("1") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : ""%></td>
		  	<td class="t-right"><%=rsWp.get("cd_flag",i).equals("2") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : ""%></td>
		  	<td><%=rsWp.get("etc_remark",i)%></td>
		  	<td>
		  	<% if(!rsWp.get("cust_nm",i).equals("")) { %>
		  		<%if(!rsWp.get("cust_cd",i).equals("")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%></a>
		  	<% }else if(!rsWp.get("empl_nm",i).equals("")) { %>
		  		<%if(!rsWp.get("empl_no",i).equals("")){%><a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%}%><%=rsWp.get("empl_nm",i)%></a>
		  	<% }else if(!rsWp.get("bank_nm",i).equals("")) { %>
		  		<%=rsWp.get("bank_nm",i)%>
		  	<% } %>
		  	</td>
		  	<td><%=rsWp.get("cost_dept_nm",i)%></td>
		</tr>
 		<% } %> 
	<% if(rsWp.getLength() > 0) { %>
		<tr class="tr-summary">
			<td style="text-align:center"><b>합계</b></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cha_amt_tot))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(dae_amt_tot))%></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	<% } %>
	</table>
</div>
<!-- 항목별 세부내용 조회 -->
<div class="table-scrollable">
	<table class="table table-view table-bordered">
  		<tr>
			<th colspan="6"><b>항목별 세부내용</b></th>
		</tr>
		<tr>
			<th><div id="rel_no_type">관련번호</div></th>
			<td><div id="rel_no"></div></td>
			<th>발생일자</th>
			<td><div id="issue_ymd"></div></td>
			<th>만기일자</th>
			<td><div id="finish_ymd"></div></td>
		</tr>
		<tr>
			<th>관련금액</th>
			<td><div id="rel_amt"></div></td>
			<th>이자율</th>
			<td><div id="intr_rate"></div></td>
			<th>세율</th>
			<td><div id="tax_rate"></div></td>
		</tr>
		<tr>
			<th width="12%">부가세</th>
			<td width="21%"><div id="vat_amt"></div></td>
			<th width="12%">증빙일자</th>
			<td width="21%"><div id="proof_ymd"></div></td>
			<th width="12%">증빙유형</th>
			<td width="21%"><div id="vat_nm"></div></td>
		</tr>
	</table>
</div>
</form>