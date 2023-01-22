<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper chaWp = new RsWrapper();
	RsWrapper daeWp = new RsWrapper();
	Box daeBox = null;
	for(int i=0; i < rsWp.getLength(); i++) {
		if(rsWp.get("acct_cd",i).startsWith("11101") || rsWp.get("acct_cd",i).startsWith("11103") || rsWp.get("acct_cd",i).startsWith("11105")) { // 예금
			if(daeBox != null) { 
				daeWp.appendRs(daeBox); 
				daeBox = null;
			}
			
			if(rsWp.get("cd_flag",i).equals("1")) {
				chaWp.appendRs(rsWp.getRsBoxAt(i));
			}else if(rsWp.get("cd_flag",i).equals("2")) {
				daeBox = rsWp.getRsBoxAt(i);
			}
		}else if(rsWp.get("acct_cd",i).startsWith("61")) { // 이자수익
			daeBox.put("intr_amt", rsWp.get("slip_amt",i));
		}else if(rsWp.get("acct_cd",i).startsWith("1110901")) { // 선급법인세(법인세)
			daeBox.put("ltax_amt", rsWp.get("slip_amt",i));
			daeBox.put("tax_rate", rsWp.get("tax_rate",i));
		}else if(rsWp.get("acct_cd",i).startsWith("1110902")) { // 선급법인세(지방세)
			daeBox.put("ljum_amt", rsWp.get("slip_amt",i));
		}
	}
	if(daeBox != null) { daeWp.appendRs(daeBox); }
%>
<!-- 예적금이체 -->

<script language="javascript">
</script>

<form id="viewForm" name="viewForm" method="post" class="fType" action="" style="margin:0px">
<input type="hidden" name="slip_no"		value="<%=obox.get("slip_no")%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
	  		<tr>
				<th colspan="4">예적금이체</th>
	  		</tr>
	  		<tr>
				<th width="17%">적요</th>
				<td width="41%"><%=obox.get("subject")%><input type="hidden" name="subject_no" value="<%=obox.get("subject")%>"></td>
				<th width="17%">이체일자</th>
				<td width="25%"><%=obox.get("proof_ymd",Box.DEF_DATE_FMT)%></td>
	  		</tr>
	  		<tr>
				<th>결재상태</th>
				<td nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('','SLP011','ACCTB_SLIP01|<%=obox.get("slip_no")%>');">결재라인</button>
				<% } %>
				</td>
				<th>전표번호</th>
				<td nowrap>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				</td>
	  		</tr>
		</table>	
	</div>
	
	<h2 class="page-title-2depth form-inline">출금내역
		<span id="dae_summary" class="marL10">
		[<input type="text" name="dae_cnt" value="<%=daeWp.getLength()%>" class="form-control acc-border tNUM" style="width:24px;height:16px" readOnly> 건],&nbsp;&nbsp;
		[<input type="text" name="dae_amt" value="<%=obox.getLong("dae_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
		</span>
	</h2>		

	<div class="table-scrollable scrollOptionY" style="height:calc(200px)">
		<table id="daeTable" class="table table-view table-bordered">
			<tr>
				<th width="18%">예적금유형</th>
				<th width="25%">계좌번호</th>
				<th width="13%">출금액</th>
				<th width="13%">이자수익</th>
				<th width="5%">세율<br>(%)</th>
				<th width="13%">선급법인세<br>(법인세)</th>
				<th width="13%">선급법인세<br>(지방세)</th>
         	</tr> 
         	<% for(int i=0; i < daeWp.getLength(); i++) { %>
			<tr>
				<td><%=daeWp.get("acct_nm",i)%></td>
				<td><%=daeWp.get("bank_nm",i)%> <%=daeWp.get("rel_no",i)%></td>
				<td class="t-right"><%=daeWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=daeWp.get("intr_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=daeWp.get("tax_rate",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=daeWp.get("ltax_amt",i,Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=daeWp.get("ljum_amt",i,Box.THOUSAND_COMMA)%></td>
         	</tr> 
        	<% } %>
		</table>
	</div>
						
	<h2 class="page-title-2depth form-inline">입금내역
		<span id="cha_summary" class="marL10">
		[<input type="text" name="cha_cnt" value="<%=chaWp.getLength()%>" class="form-control acc-border tNUM" style="width:24px;height:16px" readOnly> 건],&nbsp;&nbsp;
		[<input type="text" name="cha_amt" value="<%=obox.getLong("cha_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
		</span>
	</h2>	

	<div class="table-scrollable scrollOptionY" style="height:calc(200px)">
		<table id="chaTable" class="table table-view table-bordered">
			<tr>
				<th width="18%">예적금유형</th>
				<th width="25%">계좌번호</th>
				<th width="13%">입금액</th>
				<th width="13%"></th>
				<th width="5%"></th>
				<th width="13%"></th>
				<th width="13%"></th>
         	</tr> 
         	<% for(int i=0; i < chaWp.getLength(); i++) { %>
			<tr>
				<td><%=chaWp.get("acct_nm",i)%></td>
				<td><%=chaWp.get("bank_nm",i)%> <%=chaWp.get("rel_no",i)%></td>
				<td class="t-right"><%=chaWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
         	</tr> 
         	<% } %>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span class="f-right">
				<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!SLP011,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
			</span>
		</span>
	</div>
</form>