<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
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
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.47in .75in .75in .79in;
	mso-header-margin:.31in;
	mso-footer-margin:.31in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
ruby
	{ruby-align:left;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:표준;
	mso-style-id:0;}
.font5
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;}
.font12
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
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
.xl65
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl66
	{mso-style-parent:style0;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
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
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>

<body link=blue vlink=purple>

<table border=0 cellpadding=0 cellspacing=0 width=1350 style='border-collapse:
 collapse;table-layout:fixed;width:1020pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=12 style='mso-width-source:userset;mso-width-alt:384;width:9pt'>
 <col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=16 span=2 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <col width=29 style='mso-width-source:userset;mso-width-alt:928;width:22pt'>
 <col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=25 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
 <col width=20 span=2 style='mso-width-source:userset;mso-width-alt:640;
 width:15pt'>
 <col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
 <col width=33 style='mso-width-source:userset;mso-width-alt:1056;width:25pt'>
 <col width=24 style='mso-width-source:userset;mso-width-alt:768;width:18pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=10 span=3 style='mso-width-source:userset;mso-width-alt:320;
 width:8pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=72 span=10 style='width:54pt'>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=37 height=33 class=xl104 width=569 style='height:24.75pt;
  width:434pt'>■ 법인세법 시행규칙 [별지 제16호의2서식] &lt;개정 2013.2.23&gt;</td>
  <td colspan=2 class=xl103 width=61 style='width:46pt'>(앞 쪽)</td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
 </tr>
 <tr height=49 style='mso-height-source:userset;height:36.75pt'>
  <td colspan=39 height=49 class=xl90 width=630 style='height:36.75pt;
  width:480pt'>수입배당금액명세서</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=5 rowspan=3 height=31 class=xl84 width=78 style='border-bottom:
  1.0pt solid black;height:23.25pt;width:60pt'>사업연도</td>
  <td colspan=8 rowspan=3 class=xl85 width=122 style='border-bottom:1.0pt solid black;
  width:92pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=4 rowspan=3 class=xl85 width=70 style='border-bottom:1.0pt solid black;
  width:53pt'>법인명</td>
  <td colspan=9 rowspan=3 class=xl85 width=152 style='border-bottom:1.0pt solid black;
  width:115pt'><%=obox.get("corp_nm")%></td>
  <td colspan=7 rowspan=3 class=xl85 width=104 style='border-bottom:1.0pt solid black;
  width:80pt'>사업자등록번호</td>
  <td colspan=6 rowspan=3 class=xl85 width=104 style='border-bottom:1.0pt solid black; border-right:none;
  width:80pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td height=11 colspan=10 style='height:8.25pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 colspan=10 style='height:6.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=39 height=6 class=xl75 width=630 style='height:5.1pt;width:480pt'></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=39 rowspan=2 height=36 class=xl94 width=630 style='border-bottom:
  1.0pt solid black;height:28.2pt;width:480pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>1. 지주회사 또는 출지법인 현황</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 colspan=10 style='height:14.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=5 height=39 class=xl96 width=78 style='height:29.25pt;width:60pt'><font
  class="font12">①</font><font class="font5">법인명</font></td>
  <td colspan=6 class=xl82 width=82 style='border-left:none;width:62pt'><font
  class="font12">②</font><font class="font5">구분</font></td>
  <td colspan=6 class=xl82 width=110 style='border-left:none;width:83pt'>③사업자등록번호</td>
  <td colspan=10 class=xl82 width=166 style='border-left:none;width:126pt'>④소재지</td>
  <td colspan=7 class=xl82 width=103 style='border-left:none;width:79pt'>⑤대표자
  성명</td>
  <td colspan=5 class=xl82 width=91 style='border-right:none;width:70pt'>⑥업태종목</td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=5 rowspan=2 height=42 class=xl83 width=78 style='height:31.9pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=10 rowspan=2 class=xl78 width=166 style='width:126pt'>　</td>
  <td colspan=7 rowspan=2 class=xl78 width=103 style='width:79pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td height=21 colspan=10 style='height:15.95pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=39 rowspan=2 height=36 class=xl94 width=630 style='border-bottom:
  1.0pt solid black;height:28.2pt;width:480pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>2. 자회사 또는 배당금 지급법인 현황</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 colspan=10 style='height:14.1pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=39 style='mso-height-source:userset;height:29.25pt'>
  <td colspan=5 height=39 class=xl96 width=78 style='height:29.25pt;width:60pt'><font
  class="font12">⑦</font><font class="font5">법인명</font></td>
  <td colspan=6 class=xl82 width=82 style='border-left:none;width:62pt'><font
  class="font12">⑧</font><font class="font5">구분</font></td>
  <td colspan=6 class=xl82 width=110 style='border-left:none;width:83pt'>⑨사업자등록번호</td>
  <td colspan=8 class=xl82 width=128 style='border-left:none;width:97pt'>⑩소재지</td>
  <td colspan=4 class=xl82 width=70 style='border-left:none;width:54pt'>⑪대표자</td>
  <td colspan=5 class=xl82 width=71 style='border-left:none;width:54pt'>⑫발행<br>
    주식총수</td>
  <td colspan=5 class=xl82 width=91 style='border-right:none;width:70pt'>⑬지분율(%)</td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl83 width=78 style='height:24.0pt;
  width:60pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=82 style='width:62pt'>　</td>
  <td colspan=6 rowspan=2 class=xl78 width=110 style='width:83pt'>　</td>
  <td colspan=8 rowspan=2 class=xl78 width=128 style='width:97pt'>　</td>
  <td colspan=4 rowspan=2 class=xl78 width=70 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl81 width=71 style='width:54pt'>　</td>
  <td colspan=5 rowspan=2 class=xl78 width=91 style='border-right:none;width:70pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=5 style='height:12.0pt;mso-ignore:colspan'></td>
  <td class=xl66></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=39 rowspan=2 height=36 class=xl94 width=630 style='border-bottom:
  1.0pt solid black;height:28.2pt;width:480pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>3. 수입배당금 및 익금불산입 금액 명세</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 colspan=5 style='height:14.1pt;mso-ignore:colspan'></td>
  <td class=xl67></td>
  <td colspan=4 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 rowspan=5 height=88 class=xl98 width=123 style='border-bottom:
  .5pt solid black;height:67.8pt;width:94pt'>⑭자회사 또는<br>
    배당금<br>
    지급법인명</td>
  <td colspan=7 rowspan=5 class=xl99 width=102 style='border-bottom:.5pt solid black;
  width:77pt'>⑮배당금액</td>
  <td colspan=6 rowspan=5 class=xl99 width=98 style='border-bottom:.5pt solid black;
  width:74pt'><font class="font9">&#9327;</font><font class="font5">익금불산입<br>
    비율(%)</font></td>
  <td colspan=5 rowspan=5 class=xl99 width=99 style='border-bottom:.5pt solid black;
  width:75pt'><font class="font9">&#9328;</font><font class="font5">익금불산입<br>
    대상금액<br>
    (⑮×</font><font class="font9">&#9327;</font><font class="font5">)</font></td>
  <td colspan=7 rowspan=5 class=xl99 width=104 style='border-bottom:.5pt solid black;
  width:80pt'><font class="font9">&#9329;</font><font class="font5">지급이자 관련<br>
    익금불산입<br>
    배제금액</font></td>
  <td colspan=6 rowspan=5 class=xl99 width=104 style='border-bottom:.5pt solid black;border-right:none;
  width:80pt'><font class="font9">&#9330;</font><font class="font5">익금불산입액<br>
    </font><font class="font9">(&#9328;-&#9329;)</font></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td class=xl67></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 style='height:18.0pt'></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 style='height:14.1pt'></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 style='height:14.1pt'></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td height=10 style='height:7.5pt'></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=4 style='mso-ignore:colspan'></td>
  <td class=xl65></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl68 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:94pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='width:80pt'>　</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 colspan=10 style='height:12.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=8 rowspan=2 height=32 class=xl76 width=123 style='border-bottom:
  .5pt solid gray;height:24.0pt;width:94pt'>계</td>
  <td colspan=7 rowspan=2 class=xl72 width=102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:77pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:74pt'>　</td>
  <td colspan=5 rowspan=2 class=xl72 width=99 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:75pt'>　</td>
  <td colspan=7 rowspan=2 class=xl72 width=104 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td colspan=6 rowspan=2 class=xl72 width=104 style='border-bottom:.5pt solid black;
  width:80pt'>　</td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td height=16 style='height:12.0pt'></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=39 height=36 class=xl101 width=630 style='height:27.0pt;
  width:480pt'>210mm×297mm[일반용지 70g/㎡(재활용품)]</td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
</table>

</body>

</html>
