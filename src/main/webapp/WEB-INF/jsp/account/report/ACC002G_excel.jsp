<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = StringUtil.get8859_1(box.get("excel_file_nm"));
    if( lm_sAgentType.indexOf("MSIE 5.5") != -1 ) {
	    response.setHeader("Content-Type",        "doesn/matter;");
	    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls;");
    } else {
	    response.setHeader("Content-Type",        "application/octet-stream;");
    	response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls;");
	}
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.98in .38in .63in .42in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;}
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
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	text-align:center;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:14.0pt;}
.xl28
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid black;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
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
.xl33
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:white;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:auto none;
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
<body link=blue vlink=purple class=xl24>
<table border="0" cellpadding=0 cellspacing=0 width=497 style='border-collapse: collapse;table-layout:fixed;width:376pt'>
 <col width=101 style='mso-width-source:userset;mso-width-alt:4309;width:76pt'>
 <col width=66 span=6 style='mso-width-source:userset;mso-width-alt:2816; width:50pt'>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=7 height=30 class=xl26 width=497 style='height:22.5pt;width:376pt'>(구분)손익계산서</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=7 height=16 class=xl24 width=497 style='height:12.0pt;width:376pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td colspan=5 height=4 class=xl25 width=365 style='height:3.0pt;width:276pt'>　</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td rowspan=2 height=50 class=xl29 width=101 style='border-bottom:.5pt solid black;  height:37.5pt;border-top:none;width:76pt'>계정과목</td>
  <td colspan=2 class=xl30 width=132 style='border-right:.5pt solid black;  border-left:none;width:100pt'>목적사업</td>
  <td colspan=2 class=xl30 width=132 style='border-right:.5pt solid black;  border-left:none;width:100pt'>기금관리</td>
  <td colspan=2 class=xl30 width=132 style='border-right:.5pt solid black;  border-left:none;width:100pt'>합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 height=22 class=xl30 width=132 style='border-right:.5pt solid black;  height:16.5pt;border-left:none;width:100pt'>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</td>
  <td colspan=2 class=xl30 width=132 style='border-right:.5pt solid black;  border-left:none;width:100pt'>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</td>
  <td colspan=2 class=xl30 width=132 style='border-right:.5pt solid black;  border-left:none;width:100pt'>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</td>
 </tr>
<% for(int i=0; i < rsWp.getLength(); i++) { %>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl28 width=101 style='height:18.75pt;border-top:none;  width:76pt'><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></td>
  <td class=xl34 width=66 style='border-top:none;border-left:none;width:50pt'><%=rsWp.get("cur_yy_tot00l",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl33 width=66 style='border-top:none;width:50pt'><%=rsWp.get("cur_yy_tot00r",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl34 width=66 style='border-top:none;border-left:none;width:50pt'><%=rsWp.get("cur_yy_tot20l",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl33 width=66 style='border-top:none;width:50pt'><%=rsWp.get("cur_yy_tot20r",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl34 width=66 style='border-top:none;border-left:none;width:50pt'><%=rsWp.get("cur_yy_totxxl",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl33 width=66 style='border-top:none;width:50pt'><%=rsWp.get("cur_yy_totxxr",i,Box.THOUSAND_COMMA)%></td>
 </tr>
<% } %>
</table>
</body>
</html>

