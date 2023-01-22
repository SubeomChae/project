<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>시스템도입현황 - 거래내역</title>
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script language="javascript">
	function goEdit() {
		document.main.action = 'adm96003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'adm96002_delete.do';
			document.main.target = '_parent';
			document.main.submit();
		}
	}	
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="corp_cd" value="<%=obox.get("corp_cd")%>">
<input type="hidden" name="prof_cd" value="<%=obox.get("prof_cd") %>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100%" valign="top">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
				<tr height="28">
					<td width="15%" class="table01_title">구분</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("amt_class")%></td>
					<td width="15%" class="table01_title">상태</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("sign_status")%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">계산서일자</td>
					<td style="padding-left:5px"><%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%></td>
					<td class="table01_title">입금일자</td>
					<td style="padding-left:5px"><%=obox.get("acct_ymd",Box.DEF_DATE_FMT)%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">청구내역</td>
					<td colspan="3" style="padding:5 5 5 5">								
					<% if(obox.get("amt_class").equals("유지보수비")){ %>							
						<%=obox.get("regular_pay_cycle")%> <%=obox.get("regular_pay_amt", Box.THOUSAND_COMMA)%>원		
					<% } else { 
							String amt_detail = "";
							if(!obox.get("corp_class_amt").equals("")) { amt_detail += "구축비("+obox.get("corp_class_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("loan_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "대부사업("+obox.get("loan_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("server_type_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "프로그램 설치비("+obox.get("server_type_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("distant_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "출장비("+obox.get("distant_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("lnk_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "기간시스템연계("+obox.get("lnk_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("slip_year_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "전표이관("+obox.get("slip_year_amt", Box.THOUSAND_COMMA)+"원)"; }
							if(!obox.get("cust_content_amt").equals("")) { amt_detail += (amt_detail.equals("")?"":" + ") + "커스터마이징("+obox.get("cust_content_amt", Box.THOUSAND_COMMA)+"원)"; }
							amt_detail += " = <b>" + obox.get("total_amt", Box.THOUSAND_COMMA) + "원</b>"; %>
							<%=amt_detail%>
					<% } %>						
					</td>
				</tr>
				<tr height="28">
					<td class="table01_title">특이사항</td>
					<td colspan="3" style="padding:5 5 5 5"><%=obox.get("etc_remark")%></td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="right" style="padding-top:5px">
	  		<a href="javascript:goEdit();"><img id="btnModify" src="/com/img/bn_modify.gif" border="0" align="absmiddle"></a>
	  	<% if(uSesEnt.use_auth.equals("SA")) { %>
	  		<a href="javascript:goDelete();"><img id="btnDelete" src="/com/img/bn_delete.gif" border="0" align="absmiddle"></a>
	  	<% } %>
    	</td>
  	</tr>
</table>
</form>
