<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	if(box.get("excel_yn").equals("Y")) {
		String lm_sAgentType = request.getHeader("User-Agent"); 
		String excel_file_nm = StringUtil.get8859_1("보조부");
	    if( lm_sAgentType.indexOf("MSIE 5.5") != -1 ) {
		    response.setHeader("Content-Type",        "doesn/matter;");
		    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls;");
	    } else {
		    response.setHeader("Content-Type",        "application/octet-stream;");
	    	response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls;");
		}
	}	
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>보조부</title>
<% if(!box.get("excel_yn").equals("Y")) { %>
<link rel="styleSheet" href="/com/include/css/print.css" />
<% } %>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<% if(!box.get("excel_yn").equals("Y")) { %>
<script type="text/javascript">
<!--
	function printContract(){
		window.print();
		window.close();
	}
 
	/*선택영역 프린트*/
	var initBody;
	function beforePrint() {
		boxes = document.body.innerHTML;
		document.body.innerHTML = mainContents.innerHTML;
	}
	
	function afterPrint() { 
		document.body.innerHTML = boxes;
	}
	
	function printArea() {
		alert('인쇄 대화상자에서 인쇄용지를  A4규격 [가로]방향으로 설정하신 후, 인쇄하시기 바랍니다.');
		document.getElementById("print").style.display = "none";
		window.print();
		window.close();
	}
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
//-->
</script>
<% } %>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.61in .61in .63in .74in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:표준;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.xl25
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.xl26
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Short Date";
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>
<body link=blue vlink=purple>
<% if(!box.get("excel_yn").equals("Y")) { %>
	<div class="printline" id="print">인쇄 버튼을 클릭하면 아래 내용이 인쇄됩니다 내용을 확인해주세요. <a href="javascript:printArea();" class="butn03 blackB">인쇄</a></div>
<% } %>
<table x:str border="0" cellpadding=0 cellspacing=0 width=1014 style='border-collapse: collapse;table-layout:fixed;width:762pt'>
 <col class=xl24 width=77 style='mso-width-source:userset;mso-width-alt:2190; width:58pt'>
 <col class=xl24 width=232 style='mso-width-source:userset;mso-width-alt:6599; width:174pt'>
 <col class=xl24 width=93 span=3 style='mso-width-source:userset;mso-width-alt: 2645;width:70pt'>
 <col class=xl24 width=130 style='mso-width-source:userset;mso-width-alt:3697; width:98pt'>
 <col class=xl24 width=65 style='mso-width-source:userset;mso-width-alt:1848; width:49pt'>
 <col class=xl24 width=107 style='mso-width-source:userset;mso-width-alt:3043; width:80pt'>
 <col class=xl24 width=124 style='mso-width-source:userset;mso-width-alt:3527; width:93pt'>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=9 height=30 class=xl32 width=1014 style='height:22.5pt;width:762pt'>보조부</td>
 </tr>
<% 	String acct_cd = "";
	long remain_amt = 0;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(!rsWp.get("acct_cd",i).equals(acct_cd)) { 
			acct_cd = rsWp.get("acct_cd",i); 
			remain_amt = rsWp.get("sign_ymd",i).equals("0") ? rsWp.getLong("remain_amt",i) : 0;  %>
		<%	if(i > 0) { %>
			<tr height=16 style='page-break-before:always;mso-height-source:userset;height:12.0pt'>
			  	<td height=16 class=xl31 style='height:12.0pt'>　</td>
			  	<td colspan=8 class=xl24 style='mso-ignore:colspan'></td>
			</tr>
		<%	} %>
			<tr height=26 style='mso-height-source:userset;height:19.5pt'>
			  	<td colspan=9 height=26 class=xl33 width=1014 style='height:19.5pt;width:762pt'>계정과목 : <%=rsWp.get("acct_cd",i)%><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span><%=rsWp.get("acct_nm",i)%></td>
			</tr>
			<tr class=xl25 height=28 style='mso-height-source:userset;height:21.0pt'>
				<td height=28 class=xl36 width=77 style='height:21.0pt;width:58pt'>결산반영일</td>
				<td class=xl37 width=232 style='width:174pt'>적요</td>
				<td class=xl37 width=93 style='width:70pt'>차변금액</td>
				<td class=xl37 width=93 style='width:70pt'>대변금액</td>
				<td class=xl37 width=93 style='width:70pt'>잔액</td>
				<td class=xl37 width=130 style='width:98pt'>거래처</td>
				<td class=xl37 width=65 style='width:49pt'>사원명</td>
				<td class=xl37 width=107 style='width:80pt'>관련번호</td>
				<td class=xl37 width=124 style='width:93pt'>전표번호</td>
			</tr>
	<%	}else {
			remain_amt += rsWp.get("sign_ymd",i).equals("z") ? rsWp.getLong("remain_amt",i) : 0;
		} %>
		<tr class=xl25 height=25 style='mso-height-source:userset;height:18.75pt'>
		 	<td height=25 class=xl27 width=77 style='height:18.75pt;width:58pt'><%if(rsWp.get("sign_ymd",i).length() == 8){%><%=rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT)%><%}%></td>
		 	<td class=xl28 width=232 style='width:174pt'><%=rsWp.get("etc_remark",i)%></td>
		 	<td class=xl29 width=93 style='width:70pt'><%=rsWp.get("cha_amt",i,Box.THOUSAND_COMMA)%></td>
		 	<td class=xl30 width=93 style='width:70pt'><%=rsWp.get("dae_amt",i,Box.THOUSAND_COMMA)%></td>
		 	<td class=xl30 width=93 style='width:70pt'><%if(rsWp.get("sign_ymd",i).length() < 8){%><%=FormatUtil.insertComma(String.valueOf(remain_amt))%><%}%></td>
		 	<td class=xl43 width=130 style='width:98pt'><%=rsWp.get("cust_nm",i)%></td>
		 	<td class=xl26 width=65 style='width:49pt'><%=rsWp.get("empl_nm",i)%></td>
		 	<td class=xl28 width=107 style='width:80pt' style='mso-number-format:\@;'><%=rsWp.get("rel_no",i)%></td>
		 	<td class=xl26 width=124 style='width:93pt'><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></td>
		</tr>
<% 	} %>
</table>
</body>
</html>
