<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
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
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제3호의3 서식(4)] 이익잉여금처분(결손금처리)계산서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.89in .5in .78in .51in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
.font7
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:purple;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font12
	{color:windowtext;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
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
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";}
.xl27
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:9.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl32
	{mso-style-parent:style0;
	font-size:9.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl33
	{mso-style-parent:style0;
	font-size:9.0pt;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl34
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl35
	{mso-style-parent:style0;
	font-size:9.0pt;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl39
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;}
.xl43
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;}
.xl44
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid windowtext;}
.xl45
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	font-size:10.0pt;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl47
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl48
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl51
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl54
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl55
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl56
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl57
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border:.5pt solid windowtext;}
.xl58
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl61
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl62
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl63
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl64
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl65
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl66
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl68
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl71
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl74
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;}
.xl77
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl78
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
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
<table x:str border=0 cellpadding=0 cellspacing=0 width=719 style='border-collapse: collapse;table-layout:fixed;width:542pt'>
 <col class=xl24 width=21 style='mso-width-source:userset;mso-width-alt:597; width:16pt'>
 <col class=xl24 width=168 style='mso-width-source:userset;mso-width-alt:4778; width:126pt'>
 <col class=xl24 width=30 style='mso-width-source:userset;mso-width-alt:853; width:23pt'>
 <col class=xl24 width=134 style='mso-width-source:userset;mso-width-alt:3811; width:101pt'>
 <col class=xl24 width=22 style='mso-width-source:userset;mso-width-alt:625; width:17pt'>
 <col class=xl24 width=173 style='mso-width-source:userset;mso-width-alt:4920; width:130pt'>
 <col class=xl24 width=20 style='mso-width-source:userset;mso-width-alt:568; width:15pt'>
 <col class=xl24 width=14 style='mso-width-source:userset;mso-width-alt:398; width:11pt'>
 <col class=xl24 width=126 style='mso-width-source:userset;mso-width-alt:3584; width:95pt'>
 <col class=xl24 width=11 style='mso-width-source:userset;mso-width-alt:312; width:8pt'>
 <col class=xl24 width=25 span=246 style='mso-width-source:userset;mso-width-alt:711;width:19pt'>
 <tr height=18 style='height:13.5pt'>
  <td colspan=10 height=18 class=xl71 width=719 style='height:13.5pt;
  width:542pt'>[<font class="font7">별지 제3호의3 서식(4)] (2007.07.31 개정)</font><ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
 </tr>
 <tr height=52 style='mso-height-source:userset;height:39.0pt'>
  <td colspan=10 height=52 class=xl38 style='border-right:1.0pt solid black;
  height:39.0pt'>이익잉여금처분(결손금처리)계산서</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=10 height=18 class=xl68 style='border-right:1.0pt solid black;
  height:13.5pt'>(단위 : 원)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl41 style='height:19.5pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>명<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl43 style='border-left:none'><%=obox.get("corp_nm")%></td>
  <td colspan=2 class=xl44 style='border-left:none'>사업자등록번호<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=4 class=xl46 style='border-right:1.0pt solid black;border-left:
  none'><%=obox.get("saupja_no")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl41 style='height:19.5pt'>사<span
  style='mso-spacerun:yes'>&nbsp; </span>업<span style='mso-spacerun:yes'>&nbsp;
  </span>연<span style='mso-spacerun:yes'>&nbsp; </span>도<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl43 style='border-left:none'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=2 class=xl44 style='border-left:none'>처분(처리)확정일<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=4 class=xl25 style='border-right:1.0pt solid black;border-left:
  none'>년<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>월<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>일<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=10 height=12 class=xl65 style='border-right:1.0pt solid black;
  height:9.0pt'>　</td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=4 height=31 class=xl50 style='height:23.25pt'>1. <font
  class="font7">이익잉여금처분계산서</font><ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=6 class=xl51 style='border-right:1.0pt solid black;border-left:
  none'>2. <font class="font7">결손금처리계산서</font><ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=2 height=31 class=xl41 style='height:23.25pt'>과<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>목<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl25 style='border-top:none;border-left:none'>코드<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl25 style='border-top:none;border-left:none'>금<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl44 style='border-left:none'>과<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>목<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl25 style='border-left:none'>코드<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl25 style='border-right:1.0pt solid black;border-left:
  none'>금<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>액<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl54 style='height:24.75pt'>I. 미처분이익잉여금<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'01">01<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td colspan=2 class=xl56>I. <font class="font12">미처리결손금</font><ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>30</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 width=21 style='height:24.75pt;border-top:none;
  width:16pt' x:str="'1.">1.<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl30 width=168 style='border-top:none;width:126pt'>전기이월미처분이익잉여금(또는
  전기월 미처리결손금)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'02">02</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'1.">1.<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl30 width=173 style='border-top:none;width:130pt'>전기이월미처리결손금 (또는
  전기이월미처분이익잉여금)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>31</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 width=21 style='height:24.75pt;border-top:none;
  width:16pt' x:str="'2.">2.</td>
  <td class=xl32 style='border-top:none'>회계정책변경의 누적효과<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'03">03</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'2.">2.</td>
  <td class=xl32 style='border-top:none'>회계정책변경의 누적효과<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>32</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 width=21 style='height:24.75pt;border-top:none;
  width:16pt' x:str="'3.">3.</td>
  <td class=xl30 width=168 style='border-top:none;width:126pt'>전기오류수정이익<br>
    (또는 전기오류수정손실)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'04">04</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'3.">3.</td>
  <td class=xl30 width=173 style='border-top:none;width:130pt'>전기오류수정손실<br>
    (또는 전기오류수정이익)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>33</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 width=21 style='height:24.75pt;border-top:none;
  width:16pt' x:str="'4.">4.</td>
  <td class=xl32 style='border-top:none'>중간배당액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'05">05</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'4.">4.</td>
  <td class=xl32 style='border-top:none'>중간배당액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>34</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 width=21 style='height:24.75pt;border-top:none;
  width:16pt' x:str="'5.">5.</td>
  <td class=xl30 width=168 style='border-top:none;width:126pt'>당기순이익<br>
    (또는 당기순손실)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'06">06</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'5.">5.</td>
  <td class=xl30 width=173 style='border-top:none;width:130pt'>당기순손실<br>
    (또는 당기순이익)<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>35</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl54 style='height:24.75pt'>II. 임의적립금 등의 이입액<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:str="'08">08<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td colspan=2 class=xl60>II. 결손금 처리액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>40</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl61 style='border-right:.5pt solid black;
  height:24.75pt'>합<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계<ruby><font class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>10</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'1.">1.<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl33 style='border-top:none'>임의적립금이입액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>41</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl54 style='height:24.75pt'>III. 이익잉여금 처분액<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>11</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'2.">2.</td>
  <td class=xl33 style='border-top:none'>그 밖의 법정적립금이입액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>42</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'1.">1.<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl32 style='border-top:none'>이익준비금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>12</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'3.">3.</td>
  <td class=xl33 style='border-top:none'>이익준비금이입액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>43</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'2.">2.</td>
  <td class=xl32 style='border-top:none'>기타법정적립금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>13</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td class=xl31 style='border-top:none' x:str="'4.">4.</td>
  <td class=xl33 style='border-top:none'>자본잉여금이입액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>44</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'3.">3.</td>
  <td class=xl32 style='border-top:none'>주식할인발행차금상각액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>14</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td colspan=2 class=xl60>III. 차기이월미처리결손금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td colspan=2 class=xl27 style='border-left:none' x:num>50</td>
  <td colspan=2 class=xl58 style='border-right:1.0pt solid black;border-left:
  none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'4.">4.</td>
  <td class=xl32 style='border-top:none'>배당금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>15</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
  <td colspan=6 rowspan=10 class=xl72 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl35 style='height:24.75pt;border-top:none'>　</td>
  <td class=xl32 style='border-top:none'>가. 현금배당<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>16</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl35 style='height:24.75pt;border-top:none'>　</td>
  <td class=xl32 style='border-top:none'>나. 주식배당<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>17</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'5.">5.<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl32 style='border-top:none'>이익처분에 의한 상여금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>26</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'6.">6.</td>
  <td class=xl32 style='border-top:none'>사업확장적립금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>18</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'7.">7.</td>
  <td class=xl32 style='border-top:none'>감채적립금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>19</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'8.">8.</td>
  <td class=xl32 style='border-top:none'>그 밖의 적립금<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>20</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'9.">9.</td>
  <td class=xl30 width=168 style='border-top:none;width:126pt'>「조세특례제한법」상<br>
    <span style='mso-spacerun:yes'>&nbsp;</span>준비금 등 적립액<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>27</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl34 style='height:24.75pt;border-top:none' x:str="'10.">10.</td>
  <td class=xl32 style='border-top:none'>그 밖의 잉여금처분액<ruby><font class="font8"><rt
  class=font8></rt></font></ruby></td>
  <td class=xl27 style='border-top:none;border-left:none' x:num>28</td>
  <td class=xl28 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=2 height=33 class=xl63 style='height:24.75pt'>IV. 차기이월미처분이익잉여금<ruby><font
  class="font8"><rt class=font8></rt></font></ruby></td>
  <td class=xl36 style='border-top:none;border-left:none' x:num>25</td>
  <td class=xl37 style='border-top:none;border-left:none'>　</td>
 </tr>
</table>
</body>
</html>
