<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="sbox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = box.get("slip_no");
	excel_file_nm = StringUtil.get8859_1(excel_file_nm); // 서버에서는 주석처리
	response.reset();
	if(lm_sAgentType.indexOf("MSIE 5.5") > -1 || lm_sAgentType.indexOf("MSIE 6.0") > -1) {
	    response.setHeader("Content-Type",        "doesn/matter;");
	    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls");
	}else {
	    response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls");
	}
	response.setHeader("Content-Transfer-Encoding", "binary;");
	response.setHeader("Pragma", "no-cache;");
	response.setHeader("Expires", "-1;");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<title>전표출력</title>
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
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl25
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.xl26
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;}
.xl27
	{mso-style-parent:style0;
	font-size:24.0pt;
	font-weight:700;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl30
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl37
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl39
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl42
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;}
.xl43
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl44
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;}
.xl50
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl53
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl54
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl55
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl56
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl57
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl58
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;}
.xl59
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;}
.xl60
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>
<body link=blue vlink=purple>
<table border="0" cellpadding=0 cellspacing=0 width=735 style='border-collapse: collapse;table-layout:fixed;width:553pt'>
 <col class=xl25 width=73 style='mso-width-source:userset;mso-width-alt:2076; width:55pt'>
 <col class=xl25 width=94 style='mso-width-source:userset;mso-width-alt:2673; width:71pt'>
 <col class=xl25 width=103 span=2 style='mso-width-source:userset;mso-width-alt: 2929;width:77pt'>
 <col class=xl25 width=62 span=2 style='mso-width-source:userset;mso-width-alt: 1763;width:47pt'>
 <col class=xl25 width=64 style='mso-width-source:userset;mso-width-alt:1820; width:48pt'>
 <col class=xl25 width=46 style='mso-width-source:userset;mso-width-alt:1308; width:35pt'>
 <col class=xl25 width=64 span=2 style='mso-width-source:userset;mso-width-alt: 1820;width:48pt'>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=10 height=13 class=xl24 width=735 style='height:9.75pt;  width:553pt'></td>
 </tr>
<% if(uSesEnt.dbo.equals("SABOK26")) { %>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=3 rowspan=2 height=82 class=xl26 style='border-right:.5pt solid black;  height:61.5pt'>분개전표</td>
  <td class=xl55 width=103 style='width:77pt'>접수</td>
  <td colspan=2 class=xl56 width=124 style='border-right:.5pt solid black;  border-left:none;width:94pt'>팀장</td>
  <td colspan=2 class=xl58 width=110 style='border-right:.5pt solid black;  border-left:none;width:83pt'>임원</td>
  <td colspan=2 class=xl59 style='border-right:.5pt solid black;border-left:  none'>대표이사</td>
 </tr>
 <tr height=63 style='mso-height-source:userset;height:47.25pt'>
  <td height=63 class=xl30 style='height:47.25pt'><%=sbox.get("real_empl_nm30")%><%if(!sbox.get("sign_ymd30").equals("")){%><br> <%=sbox.get("sign_status30").equals("4") ? "반려" : sbox.get("sign_ymd30")%><%}%></td>
  <td colspan=2 class=xl31 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm32")%><%if(!sbox.get("sign_ymd32").equals("")){%><br><%=sbox.get("sign_status32").equals("4") ? "반려" : sbox.get("sign_ymd32")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm33")%><%if(!sbox.get("sign_ymd33").equals("")){%><br><%=sbox.get("sign_status33").equals("4") ? "반려" : sbox.get("sign_ymd33")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=FormatUtil.nvl2(sbox.get("real_empl_nm34"),sbox.get("real_empl_nm33"))%><%if(!FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("real_empl_nm33")).equals("")){%><br><%=FormatUtil.nvl2(sbox.get("sign_status34"),sbox.get("sign_status33")).equals("4") ? "반려" : FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("sign_ymd33"))%><%}%></td>
 </tr>
<% }else if(uSesEnt.dbo.equals("SABOK29")) { %>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=3 rowspan=2 height=82 class=xl26 style='border-right:.5pt solid black;  height:61.5pt'>분개전표</td>
  <td class=xl55 width=103 style='width:77pt'>접수</td>
  <td colspan=2 class=xl56 width=124 style='border-right:.5pt solid black;  border-left:none;width:94pt'>책임</td>
  <td colspan=2 class=xl58 width=110 style='border-right:.5pt solid black;  border-left:none;width:83pt'>팀장</td>
  <td colspan=2 class=xl59 style='border-right:.5pt solid black;border-left:  none'>부분장</td>
 </tr>
 <tr height=63 style='mso-height-source:userset;height:47.25pt'>
  <td height=63 class=xl30 style='height:47.25pt'><%=sbox.get("real_empl_nm30")%><%if(!sbox.get("sign_ymd30").equals("")){%><br> <%=sbox.get("sign_status30").equals("4") ? "반려" : sbox.get("sign_ymd30")%><%}%></td>
  <td colspan=2 class=xl31 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm31")%><%if(!sbox.get("sign_ymd31").equals("")){%><br><%=sbox.get("sign_status31").equals("4") ? "반려" : sbox.get("sign_ymd31")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm32")%><%if(!sbox.get("sign_ymd32").equals("")){%><br><%=sbox.get("sign_status32").equals("4") ? "반려" : sbox.get("sign_ymd32")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=FormatUtil.nvl2(sbox.get("real_empl_nm34"),sbox.get("real_empl_nm33"))%><%if(!FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("real_empl_nm33")).equals("")){%><br><%=FormatUtil.nvl2(sbox.get("sign_status34"),sbox.get("sign_status33")).equals("4") ? "반려" : FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("sign_ymd33"))%><%}%></td>
 </tr>
<% }else if(uSesEnt.dbo.equals("SABOK42")||uSesEnt.dbo.equals("SABOK43")||uSesEnt.dbo.equals("SABOK44")) { %>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=4 rowspan=2 height=82 class=xl26 style='border-right:.5pt solid black;  height:61.5pt'>분개전표</td>
  <td colspan=2 class=xl56 width=124 style='border-right:.5pt solid black;  border-left:none;width:94pt'>담당</td>
  <td colspan=2 class=xl58 width=110 style='border-right:.5pt solid black;  border-left:none;width:83pt'>팀장</td>
  <td colspan=2 class=xl59 style='border-right:.5pt solid black;border-left:  none'>임원</td>
 </tr>
 <tr height=63 style='mso-height-source:userset;height:47.25pt'>
  <td colspan=2 height=63 class=xl30 style='height:47.25pt'><%=sbox.get("real_empl_nm30")%><%if(!sbox.get("sign_ymd30").equals("")){%><br> <%=sbox.get("sign_status30").equals("4") ? "반려" : sbox.get("sign_ymd30")%><%}%></td>
  <td colspan=2 class=xl31 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm31")%><%if(!sbox.get("sign_ymd31").equals("")){%><br><%=sbox.get("sign_status31").equals("4") ? "반려" : sbox.get("sign_ymd31")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm32")%><%if(!sbox.get("sign_ymd32").equals("")){%><br><%=sbox.get("sign_status32").equals("4") ? "반려" : sbox.get("sign_ymd32")%><%}%></td>
 </tr>
 <% }else { %>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=3 rowspan=2 height=82 class=xl26 style='border-right:.5pt solid black;  height:61.5pt'>분개전표</td>
  <td class=xl55 width=103 style='width:77pt'>접수</td>
  <td colspan=2 class=xl56 width=124 style='border-right:.5pt solid black;  border-left:none;width:94pt'>선임</td>
  <td colspan=2 class=xl58 width=110 style='border-right:.5pt solid black;  border-left:none;width:83pt'>팀장</td>
  <td colspan=2 class=xl59 style='border-right:.5pt solid black;border-left:  none'>임원</td>
 </tr>
 <tr height=63 style='mso-height-source:userset;height:47.25pt'>
  <td height=63 class=xl30 style='height:47.25pt'><%=sbox.get("real_empl_nm30")%><%if(!sbox.get("sign_ymd30").equals("")){%><br> <%=sbox.get("sign_status30").equals("4") ? "반려" : sbox.get("sign_ymd30")%><%}%></td>
  <td colspan=2 class=xl31 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm31")%><%if(!sbox.get("sign_ymd31").equals("")){%><br><%=sbox.get("sign_status31").equals("4") ? "반려" : sbox.get("sign_ymd31")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=sbox.get("real_empl_nm32")%><%if(!sbox.get("sign_ymd32").equals("")){%><br><%=sbox.get("sign_status32").equals("4") ? "반려" : sbox.get("sign_ymd32")%><%}%></td>
  <td colspan=2 class=xl28 style='border-right:.5pt solid black;border-left:  none'><%=FormatUtil.nvl2(sbox.get("real_empl_nm34"),sbox.get("real_empl_nm33"))%><%if(!FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("real_empl_nm33")).equals("")){%><br><%=FormatUtil.nvl2(sbox.get("sign_status34"),sbox.get("sign_status33")).equals("4") ? "반려" : FormatUtil.nvl2(sbox.get("sign_ymd34"),sbox.get("sign_ymd33"))%><%}%></td>
 </tr>
 <% } %>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 height=16 class=xl32 width=717 style='height:12.0pt;width:538pt'><%=uSesEnt.corp_nm%></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=2 height=27 class=xl33 style='border-right:.5pt solid black;  height:20.25pt'>전표번호</td>
  <td colspan=2 class=xl35 style='border-right:.5pt solid black;border-left:  none'><%=obox.get("slip_no",Box.SLIP_NO)%></td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black;border-left:  none'>작성자</td>
  <td colspan=4 class=xl38 style='border-right:.5pt solid black;border-left:  none'><%=obox.get("empl_nm")%></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=2 height=27 class=xl33 style='border-right:.5pt solid black;  height:20.25pt'>회계전표번호</td>
  <td colspan=2 class=xl35 style='border-right:.5pt solid black;border-left:  none'><%if(!obox.get("sign_no").equals("")){%><%=obox.get("sign_ymd")%>-<%=obox.get("acc_unit")%>-<%=obox.get("sign_no")%><%}%></td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black;border-left:  none'>작성일시</td>
  <td colspan=4 class=xl38 style='border-right:.5pt solid black;border-left:  none'>&nbsp;<%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%>&nbsp;</td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=10 height=13 class=xl40 style='height:9.75pt'>　</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 height=24 class=xl33 style='border-right:.5pt solid black;  height:18.0pt'>계정과목</td>
  <td class=xl41>차변</td>
  <td class=xl41>대변</td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black;border-left:  none'>거래처</td>
  <td colspan=4 class=xl42 style='border-right:.5pt solid black;border-left:  none'>적요</td>
 </tr>
 <% for(int i=0; i < rsWp.getLength(); i++) { %>
 <tr height=53 style='mso-height-source:userset;height:39.75pt'>
  <td colspan=2 height=53 class=xl44 width=167 style='border-right:.5pt solid black;  height:39.75pt;width:126pt'><%=rsWp.get("acct_nm",i)%></td>
  <td class=xl46 align=right><%=rsWp.get("cd_flag",i).equals("1") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : ""%></td>
  <td class=xl46 align=right><%=rsWp.get("cd_flag",i).equals("2") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : ""%></td>
  <td colspan=2 class=xl47 width=124 style='border-right:.5pt solid black;  border-left:none;width:94pt'>
  	<%if(!rsWp.get("cust_nm",i).equals("")){%><%=rsWp.get("cust_nm",i)%><br><%}%>
  	<%if(!rsWp.get("empl_nm",i).equals("")){%><%=rsWp.get("empl_nm",i)%><br><%}%>
  	<%if(rsWp.get("rel_no_type",i).equals("001") && !rsWp.get("rel_no",i).equals("")){%><%=rsWp.get("rel_no",i)%><%}%>
  </td>
  <td colspan=4 class=xl49 width=238 style='border-right:.5pt solid black;  border-left:none;width:179pt'><%=rsWp.get("etc_remark",i)%></td>
 </tr>
 <% } %>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl33 style='border-right:.5pt solid black;  height:19.5pt'>합계</td>
  <td class=xl52 align=right><%=obox.get("cha_amt",Box.THOUSAND_COMMA)%></td>
  <td class=xl52 align=right><%=obox.get("dae_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl53 style='border-right:.5pt solid black;border-left:  none'>　</td>
  <td colspan=4 class=xl42 style='border-right:.5pt solid black;border-left:  none'>　</td>
 </tr>
</table>
</body>
</html>
