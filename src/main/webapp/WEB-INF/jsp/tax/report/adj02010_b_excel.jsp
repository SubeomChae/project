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
	{margin:.84in .52in .67in .55in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
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
.font6
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font7
	{color:purple;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font12
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font14
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font15
	{color:windowtext;
	font-size:9.0pt;
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
.xl65
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border:.5pt solid windowtext;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	text-align:left;}
.xl68
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl72
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;}
.xl74
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	text-align:left;}
.xl75
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl76
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl77
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl90
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl91
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl92
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl93
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl94
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl95
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl96
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl97
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;}
.xl98
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl99
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl100
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl103
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl104
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl105
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl106
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl107
	{mso-style-parent:style0;
	color:#595959;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl108
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl109
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl110
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl111
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl113
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#BFBFBF;
	mso-pattern:black none;}
.xl114
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl115
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl116
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl117
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl118
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl119
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl120
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl121
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl123
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl129
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
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
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>
<body link=blue vlink=purple class=xl65>
<table border=0 cellpadding=0 cellspacing=0 width=696 style='border-collapse:
 collapse;table-layout:fixed;width:523pt'>
 <col class=xl65 width=55 style='mso-width-source:userset;mso-width-alt:1564;
 width:41pt'>
 <col class=xl65 width=25 style='mso-width-source:userset;mso-width-alt:711;
 width:19pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:455;
 width:12pt'>
 <col class=xl65 width=31 style='mso-width-source:userset;mso-width-alt:881;
 width:23pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:341;
 width:9pt'>
 <col class=xl65 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:85'>
 <col class=xl65 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:113'>
 <col class=xl65 width=74 style='mso-width-source:userset;mso-width-alt:2104;
 width:56pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:455;
 width:12pt'>
 <col class=xl65 width=43 style='mso-width-source:userset;mso-width-alt:1223;
 width:32pt'>
 <col class=xl65 width=33 style='mso-width-source:userset;mso-width-alt:938;
 width:25pt'>
 <col class=xl65 width=89 style='mso-width-source:userset;mso-width-alt:2531;
 width:67pt'>
 <col class=xl65 width=100 style='mso-width-source:userset;mso-width-alt:2844;
 width:75pt'>
 <col class=xl65 width=98 style='mso-width-source:userset;mso-width-alt:2787;
 width:74pt'>
 <col class=xl65 width=104 style='mso-width-source:userset;mso-width-alt:2958;
 width:78pt'>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl73 colspan=12 width=394 style='height:13.5pt;
  mso-ignore:colspan;width:296pt'>■ 법인세법 시행규칙 [별지 제10호서식(을)] &lt;개정
  2013.2.23&gt;</td>
  <td class=xl65 width=100 style='width:75pt'></td>
  <td class=xl65 width=98 style='width:74pt'></td>
  <td class=xl65 width=104 style='width:78pt'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td rowspan=3 height=59 class=xl79 width=55 style='border-bottom:.5pt solid black;
  height:44.25pt;width:41pt'>사<span style='mso-spacerun:yes'>&nbsp;
  </span>업<br>
    <br>
    연<span style='mso-spacerun:yes'>&nbsp; </span>도</td>
  <td colspan=3 rowspan=3 class=xl82 width=72 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:54pt'><%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????-??-??")%><br>
  ~<br>
  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????-??-??")%>
    </td>
  <td colspan=9 rowspan=3 class=xl116 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>원천납부세액 명세서(을)<ruby><font class="font7"><rt
  class=font7></rt></font></ruby></td>
  <td rowspan=2 class=xl75 style='border-bottom:.5pt solid black'>법 인 명</td>
  <td rowspan=2 class=xl82 width=104 style='border-bottom:.5pt solid black;
  width:78pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl66 style='height:22.5pt;border-top:none;'>사업자등록번호</td>
  <td class=xl69 width=104 style='border-top:none;border-left:none;width:78pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl65 style='height:12.75pt'></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl67 colspan=4 style='height:12.75pt;mso-ignore:colspan'><span
  style='mso-spacerun:yes'>&nbsp;</span>원천징수 세액명세</td>
  <td class=xl68></td>
  <td class=xl68></td>
  <td class=xl68></td>
  <td class=xl68></td>
  <td class=xl68></td>
  <td class=xl68></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
 </tr>
 <tr height=7 style='mso-height-source:userset;height:5.25pt'>
  <td height=7 class=xl65 style='height:5.25pt'></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=3 rowspan=2 height=50 class=xl126 style='border-bottom:.5pt solid black;
  height:37.5pt'><font class="font15">①</font><font class="font9">채권등의명칭<br>(액면금액)</font></td>
  <td colspan=6 rowspan=2 class=xl126 width=133 style='border-bottom:.5pt solid black;
  width:100pt'><font class="font15">②</font><font class="font9">유가증권 <br>
    표준코드</font></td>
  <td colspan=3 rowspan=2 class=xl126 width=165 style='border-bottom:.5pt solid black;
  width:124pt'>③채권이자구분</td>
  <td rowspan=2 class=xl119 style='border-bottom:.5pt solid black'>④취득일</td>
  <td rowspan=2 class=xl119 style='border-bottom:.5pt solid black'>⑤매도일</td>
  <td rowspan=2 class=xl121 width=104 style='border-bottom:.5pt solid black;
  width:78pt'>⑥보유기간<br>
    (이자계산일수)</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 height=17 class=xl95 style='height:12.75pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 rowspan=2 height=41 class=xl108 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:30.75pt'>⑦이자율</td>
  <td colspan=6 rowspan=2 class=xl77 width=133 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>⑧=①×⑥×⑦<br>
    보유기간이자 상당액</td>
  <td colspan=3 rowspan=2 class=xl77 width=165 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:124pt'><font class="font15">⑨</font><font
  class="font12">원천징수의무자<br>
    (사업자등록번호)</font></td>
  <td rowspan=2 class=xl75 style='border-bottom:.5pt solid black;border-top:
  none'><font class="font15">⑩</font><font class="font12">세율</font></td>
  <td rowspan=2 class=xl75 style='border-bottom:.5pt solid black;border-top:
  none'><font class="font15">⑪</font><font class="font12">법인세</font></td>
  <td rowspan=2 class=xl77 width=104 style='border-bottom:.5pt solid black;
  border-top:none;width:78pt'><font class="font15">⑫</font><font class="font12">납부일<br>
    (징수일)</font></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl95 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl70 style='border-top:none;border-left:none'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 height=18 class=xl72 style='height:14.1pt'>　</td>
  <td colspan=6 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td colspan=3 class=xl70 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl72 style='border-top:none;border-left:none'>　</td>
  <td class=xl71 style='border-top:none'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=3 rowspan=2 height=34 class=xl96 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:25.5pt'><font class="font8">합</font><font
  class="font6"> </font><font class="font8">계</font></td>
  <td colspan=6 rowspan=2 class=xl96 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>　</td>
  <td colspan=3 rowspan=2 class=xl102 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>　</td>
  <td rowspan=2 class=xl112 style='border-bottom:.5pt solid black'>　</td>
  <td rowspan=2 class=xl114 style='border-bottom:.5pt solid black'>　</td>
  <td rowspan=2 class=xl112 style='border-bottom:.5pt solid black'>　</td>
 </tr>
 <tr height=17 style='height:12.75pt'>
 </tr>
</table>

</body>

</html>
