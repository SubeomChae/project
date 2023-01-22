<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	int cha_cnt = 0;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(rsWp.get("cd_flag",i).equals("1")) { cha_cnt++; } 
	}
	obox.put("cha_cnt", String.valueOf(cha_cnt));
%>

<!-- 지출결의서 -->

<script language="javascript">
</script>

<form  id="viewForm" name="main" method="post" class="fType" action="">
<input type="hidden" name="slip_no"	value="<%=obox.get("slip_no")%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
	  		<tr>
				<th colspan="4">지출결의서</th>
	  		</tr>
	  		<tr>
				<th>사용목적</th>
				<td colspan="3"><%=StringUtil.getReplaceSpecialCharacters(obox.get("subject"))%></td>
	  		</tr>
	  		<tr>
				<th width="17%">결재상태</th>
				<td width="35%" nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', 'SLP009', 'ACCTB_SLIP01|<%=obox.get("slip_no")%>');">결재라인</button>
				<% } %>
				</td>
				<th width="17%">전표번호</th>
				<td width="31%" nowrap>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				</td>
	  		</tr>
		</table>	
	</div>
	
	<h2 class="page-title-2depth form-inline">
		지출내용
		<span id="cha_summary" class="marB5">
			[<input type="text" name="cha_cnt" value="<%=obox.get("cha_cnt")%>" class="form-control acc-border tNUM" style="width:30px;height:16px;" readOnly> 건],&nbsp;&nbsp;
			[<input type="text" name="cha_amt" value="<%=obox.get("cha_amt")%>" class="form-control acc-border tMONEY" style="width:120px;height:16px;" readOnly> 원]
		</span>
	</h2>
	
	<div class="table-scrollable scrollOptionY" style="height:calc(225px)">
		<table id="chaTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:20%;">
				<col style="width:12%;">
				<col style="width:10%;">
				<col style="width:16%;">
				<col style="width:27%;">
				<col style="width:15%;">
			</colgroup>
			<thead>	
				<tr>
					<th>계정과목</th>
					<th>공급가액</th>
					<th>부가세</th>
					<th>증빙구분</th>
					<th>거래처</th>
					<th>증빙일자</th>
          		</tr>
          	</thead>
          	<tbody>
    		<% for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("1")) { continue; }  %>
				<tr id="tr_<%=i%>">
					<td><%=rsWp.get("acct_nm",i)%></td>
					<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("vat_nm",i)%></td>
					<td nowrap><%if(!rsWp.get("cust_cd",i).equals("")){%><a href="javascript:goCustInfo('&cust_cd=<%=rsWp.get("cust_cd",i)%>')"><%}%><%=rsWp.get("cust_nm",i)%></a>
					</td>
					<td class="t-center"><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
          		</tr> 
          	<% } %>
          	</tbody> 
		</table>
	</div>
	
	<h2 class="page-title-2depth form-inline">
		결제방법
		<span id="dae_summary" class="marB5">
			[<input type="text" name="dae_cnt" value="<%=obox.get("dae_cnt")%>" class="form-control acc-border tNUM" style="width:30px;height:16px;" readOnly> 건],&nbsp;&nbsp;
			[<input type="text" name="dae_amt" value="<%=obox.get("dae_amt")%>" class="form-control acc-border tMONEY" style="width:120px;height:16px;" readOnly> 원]
		</span>
	</h2>
	
	<div class="table-scrollable scrollOptionY" style="height:calc(225px)">
		<table id="daeTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:40%;">
				<col style="width:40%;">
				<col style="width:20%;">
			</colgroup>
			<thead>
				<tr>
					<th>계정과목</th>
					<th>계좌번호</th>
					<th>결제금액</th>
          		</tr> 
			</thead>
			<tbody>
	          	<% for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("2")) { continue; } %>
					<tr id="tr_<%=i%>">
						<td><%=rsWp.get("acct_nm",i)%></td>
						<td><%=rsWp.get("bank_nm",i)%> <%=rsWp.get("rel_no",i)%></td>
						<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
	          		</tr> 
	          	<% } %>
			</tbody>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span>
			<span class="f-right">
				<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!SLP009,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
			</span>
		</span>
	</div>
</form>
			    	
<form name="report" method="post" action="/com/redirect.do?reqUrl=report/report" style="display:none">
<input type="hidden" name="report_head"	value="">
<input type="hidden" name="report_id"	value="slp01001R">
<input type="hidden" name="param01"		value="">
</form>
