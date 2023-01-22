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
<title>법령안(일부개정_법률)</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.79in .79in .39in .79in;
	mso-header-margin:0in;
	mso-footer-margin:0in;}
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
	font-size:8.7pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font6
	{color:blue;
	font-size:7.8pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:blue;
	font-size:8.7pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:12.6pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
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
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:바탕체, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:13.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.5pt solid windowtext;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:바탕체, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:바탕체, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	font-size:10.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	font-size:10.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	font-size:10.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	font-size:1.9pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
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

<table border=0 cellpadding=0 cellspacing=0 width=627 style='border-collapse:
 collapse;table-layout:fixed;width:471pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2144;width:50pt'>
 <col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:1888;width:44pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=40 span=7 style='mso-width-source:userset;mso-width-alt:1280;
 width:30pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:864;width:20pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:864;width:20pt'>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=20 height=26 class=xl70 width=627 style='height:19.5pt;
  width:471pt'>■ 근로복지기본법 시행규칙<font class="font5"> [별지 제15호서식]</font><font
  class="font6"> </font><font class="font7">&lt;개정 2016.1.19.&gt;</font></td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=7 height=32 class=xl71 width=268 style='height:24.0pt;width:200pt'>[&nbsp;
  ] 사내근로복지기금법인</td>
  <td colspan=13 rowspan=2 class=xl72 width=359 style='width:271pt'>운영상황
  보고서(<%=box.get("std_yy")%>년도분)</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=7 height=32 class=xl71 width=268 style='height:24.0pt;width:200pt'>[&nbsp;
  ] 공동근로복지기금법인</td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=3 height=19 class=xl65 width=133 style='height:14.25pt;
  width:99pt'></td>
  <td colspan=2 class=xl65 width=55 style='width:41pt'></td>
  <td class=xl65 width=40 style='width:30pt'></td>
  <td colspan=2 class=xl65 width=80 style='width:60pt'></td>
  <td class=xl65 width=40 style='width:30pt'></td>
  <td colspan=2 class=xl65 width=80 style='width:60pt'></td>
  <td class=xl65 width=26 style='width:20pt'></td>
  <td class=xl65 width=14 style='width:11pt'></td>
  <td class=xl65 width=40 style='width:30pt'></td>
  <td class=xl65 width=13 style='width:10pt'></td>
  <td class=xl65 width=27 style='width:20pt'></td>
  <td class=xl65 width=13 style='width:10pt'></td>
  <td colspan=3 class=xl65 width=66 style='width:50pt'>(1쪽)</td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=20 height=19 class=xl73 width=627 style='height:14.25pt;
  width:471pt'>(금액단위 : 천원)</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=7 height=146 class=xl81 width=74 style='height:113.1pt;
  width:55pt'>기금법인</td>
  <td colspan=8 class=xl74 width=314 style='border-left:none;width:235pt'>①
  기금법인명</td>
  <td colspan=10 class=xl74 width=239 style='border-right:none;width:181pt'>②
  인가번호</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl118 width=314 style='border-right:.5pt solid #5D5D5D;
  height:14.1pt;border-left:none;width:235pt'><%=obox.get("corp_nm")%></td>
  <td colspan=10 class=xl118 width=239 style='border-left:none;width:181pt'><%=obox.get("license_no")%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl76 width=314 style='height:14.1pt;border-left:
  none;width:235pt'>③ 기금법인 설립등기일</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>전화번호</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl118 width=314 style='border-right:.5pt solid #5D5D5D;
  height:14.1pt;border-left:none;width:235pt'><%=StringUtil.getFormatedText(obox.get("reg_ymd"),"????년??월??일")%></td>
  <td colspan=10 class=xl118 width=239 style='border-left:none;width:181pt'><%=obox.get("tel_no")%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>④ 소재지</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl118 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=obox.get("addr")%></td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=2 height=38 class=xl78 width=74 style='height:28.5pt;border-left:
  none;width:55pt'>⑤ 회계연도</td>
  <td colspan=16 class=xl121 width=479 style='border-left:none;width:361pt'>
  	<%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????년??월??일")%> ~  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????년??월??일")%>
  </td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=20 height=8 class=xl85 width=627 style='border-right:none;height:6.0pt;width:471pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=6 height=108 class=xl83 width=74 style='height:84.6pt;
  width:55pt'>사업체</td>
  <td colspan=8 class=xl76 width=314 style='border-left:none;width:235pt'>⑥ 대표자</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>⑦ 업종</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl118 width=314 style='border-right:.5pt solid #5D5D5D;
  height:14.1pt;border-left:none;width:235pt'><%=obox.get("mo_rep_person")%></td>
  <td colspan=10 class=xl118 width=239 style='border-left:none;width:181pt'><%=obox.get("mo_upjong")%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl76 width=314 style='height:14.1pt;border-left:
  none;width:235pt'>⑧ 근로자 수</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>⑨
  노동조합원 수</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 height=18 class=xl118 width=314 style='border-right:.5pt solid #5D5D5D;
  height:14.1pt;border-left:none;width:235pt'><%=obox.get("empl_cnt")%> 명</td>
  <td colspan=10 class=xl118 width=239 style='border-left:none;width:181pt'><%=obox.get("nojo_entry_cnt")%>
  명</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>⑩ 납입자본금(천원)</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=String.valueOf(Math.round(obox.getLong("capital_amt") / 1000.0))%></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=20 height=8 class=xl85 width=627 style='border-right:none;height:6.0pt;width:471pt'>　</td>
 </tr>
	<%  
	Box rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3","","", request); // 기금총액
	Long amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
	Long amt_3_cur_acum = rbox.getLong("cur_acum"); 
	
	rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3100103","","", request); // 기금(기본재산)
	Long amt_3100103_dae_amt = rbox.getLong("dae_amt"); 
	Long amt_3100103_cha_amt = rbox.getLong("cha_amt"); 
	%>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=10 height=180 class=xl83 width=74 style='height:141.0pt;
  width:55pt'>기금 현황</td>
  <td colspan=18 class=xl76 width=553 style='border-right:none;width:416pt'>⑪ 전기
  말 기금원금 총액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol
  / 1000.0)))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=6 height=108 class=xl69 width=74 style='height:84.6pt;
  width:55pt'>당기<br>
    변동금액</td>
  <td colspan=6 class=xl76 width=240 style='border-left:none;width:180pt'>⑫ 사업주
  출연</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>⑬
  수익금 전입</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl125 width=240 style='border-right:.5pt solid #5D5D5D;
  height:14.1pt;border-left:none;width:180pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt
  / 1000.0)))%></td>
  <td colspan=10 class=xl125 width=239 style='border-left:none;width:181pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl76 width=240 style='height:14.1pt;border-left:
  none;width:180pt'>⑭ 제3자 출연 등<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>⑮ 원금
  사용 등 변동액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl128 width=240 style='height:14.1pt;
  border-left:none;width:180pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt
  / 1000.0)))%></td>
  <td colspan=10 class=xl128 width=239 style='border-right:none;width:181pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=16 height=18 class=xl76 width=479 style='height:14.1pt;
  border-right:none;width:361pt'>&#9327; 소계</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=16 height=18 class=xl125 width=479 style='height:14.1pt;
  border-left:none;width:361pt'><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt)
  / 1000.0)))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#9328; 당기 말 기금원금 총액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum
  / 1000.0)))%></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=20 height=8 class=xl85 width=627 style='border-right:none;height:6.0pt;width:471pt'>　</td>
 </tr>
	<% 	
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11101","","", request); // 단기금융상품
		Long amt_11101_cur_acum = rbox.getLong("cur_acum"); 
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110005","","", request); // 기업자유예금
		amt_11101_cur_acum += rbox.getLong("cur_acum");
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11103","","", request); // 유가증권
		Long amt_11103_cur_acum = 0L;//rbox.getLong("cur_acum"); 
		 
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","12103","","", request); // 장기대여금
		Long amt_12103_cur_acum;
		if(rbox.getLong("cur_acum")>=amt_3_cur_acum) {
			amt_12103_cur_acum = amt_3_cur_acum;
			amt_11101_cur_acum = rbox.getLong("0");
		}else {
			amt_12103_cur_acum = rbox.getLong("cur_acum");			
			amt_11101_cur_acum = amt_3_cur_acum - amt_12103_cur_acum;
		}
		
		Long amt_tot1 = amt_11101_cur_acum + amt_11103_cur_acum + amt_12103_cur_acum;
	%>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=8 height=144 class=xl83 width=74 style='height:112.8pt;
  width:55pt'>기금 관리</td>
  <td colspan=2 rowspan=4 class=xl69 width=74 style='width:55pt'>운용방법</td>
  <td colspan=6 class=xl76 width=240 style='border-left:none;width:180pt'>&#9329;
  금융회사 예입·예탁</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>&#9330;
  투자신탁 수익증권 매입</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl128 width=240 style='height:14.1pt;
  border-left:none;width:180pt'>
	<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
		0
	<% }else { %>
		<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
	<% } %>
  </td>
  <td colspan=10 class=xl128 width=239 style='border-right:none;width:181pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl76 width=240 style='height:14.1pt;border-left:
  none;width:180pt'>&#9331; 유가증권 매입</td>
  <td colspan=10 class=xl76 width=239 style='border-right:none;width:181pt'>&#12881; 기타</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl128 width=240 style='height:14.1pt;
  border-left:none;width:180pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum
  / 1000.0)))%></td>
  <td colspan=10 class=xl128 width=239 style='border-right:none;width:181pt'>
  	<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
		<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
	<% } %>
  </td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12882; 근로자 대부</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum
  / 1000.0)))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12883; 합계</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))%></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=20 height=8 class=xl85 width=627 style='border-right:none;height:6.0pt;width:471pt'>　</td>
 </tr>
	<%  
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", request); // 이자수입
		Long amt_61_cur_amt = rbox.getLong("cur_amt"); 
		
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", request); // 고유목적사업준비금1
		Long amt_2200801_dae_amt = rbox.getLong("dae_amt"); 
		Long amt_2200801_cha_amt = rbox.getLong("cha_amt"); 
		Long amt_2200801_pre_iwol = rbox.getLong("pre_iwol"); 
		 
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", request); // 고유목적사업준비금2
		Long amt_2200802_dae_amt = rbox.getLong("dae_amt"); 
		Long amt_2200802_cha_amt = rbox.getLong("cha_amt"); 
		Long amt_2200802_pre_iwol = rbox.getLong("pre_iwol"); 
		Long amt_tot2 = amt_61_cur_amt + amt_3100103_cha_amt + amt_2200801_pre_iwol + amt_2200802_pre_iwol;
	%>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 rowspan=10 height=180 class=xl83 width=74 style='border-bottom:
  .5pt solid black;height:141.0pt;width:55pt'>용도사업<br>
    재원</td>
  <td colspan=18 class=xl76 width=553 style='border-right:none;width:416pt'>&#12884; 당기
  기금운용 수익금</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt
  / 1000.0)))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12885; 해당 회계연도 출연금액의 50퍼센트 또는 80퍼센트 범위<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'>
	<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
		
	<% }else { %>
		<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
	<% } %>
  </td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12886; 자본금 50퍼센트 초과액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'>
  	<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
		<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
	<% } %>
  </td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12887; 이월금&nbsp; 등<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol)
  / 1000.0)))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl76 width=553 style='height:14.1pt;
  border-right:none;width:416pt'>&#12888; 합계</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=18 height=18 class=xl125 width=553 style='height:14.1pt;
  border-left:none;width:416pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 /
  1000.0)))%></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=20 height=20 class=xl86 width=627 style='height:15.0pt;
  width:471pt'>　</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=20 height=27 class=xl87 width=627 style='height:20.25pt;
  width:471pt'>210mm×297mm[백상지(80g/㎡) 또는 중질지(80g/㎡)]</td>
 </tr>
 <tr height=38 style='page-break-before:always;mso-height-source:userset;
  height:28.5pt'>
  <td colspan=20 height=38 class=xl117 width=627 style='height:28.5pt;
  width:471pt'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=20 height=18 class=xl101 width=627 style='height:13.5pt;
  width:471pt'>(2쪽)</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
  <td rowspan=15 height=432 class=xl114 width=67 style='border-bottom:.5pt solid black;
  height:328.8pt;width:50pt'>사업 실적</td>
  <td colspan=6 rowspan=2 class=xl68 width=201 style='width:150pt'>구분</td>
  <td colspan=2 class=xl68 width=80 style='border-left:none;width:60pt'>계</td>
  <td colspan=2 class=xl68 width=80 style='border-left:none;width:60pt'>보조사업</td>
  <td colspan=3 class=xl90 width=80 style='border-left:none;width:61pt'>대부사업</td>
  <td colspan=6 class=xl68 width=119 style='border-right:none;width:90pt'>&#12983;
  부동산현황</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
  <td height=26 class=xl66 width=40 style='height:19.7pt;border-top:none;
  border-left:none;width:30pt'>금액</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>수혜자수</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>금액</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>수혜자수</td>
  <td colspan=2 class=xl66 width=40 style='border-left:none;width:31pt'>금액</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>수혜자수</td>
  <td colspan=2 class=xl66 width=40 style='border-left:none;width:30pt'>명칭</td>
  <td colspan=2 class=xl66 width=39 style='border-left:none;width:30pt'>금액</td>
  <td colspan=2 class=xl66 width=40 style='border-right:none;width:30pt'>취득일</td>
 </tr>
	<%  Long use_amt_tot = 0L;
		Long use_cnt_tot = 0L;
		Long loan_amt_tot = 0L;
		Long loan_cnt_tot = 0L;
		Long amt_use_loan_tot = 0L;
		int simbol = 12888;
		for(int i=0; i < rsWp.getLength(); i++) { 
			simbol++;
			if(i == 7) { simbol = 12977; }
			if(i < rsWp.getLength() - 1) {
				use_amt_tot += rsWp.getLong("use_amt",i);
				use_cnt_tot += rsWp.getLong("use_cnt",i);
				loan_amt_tot += rsWp.getLong("loan_amt",i);
				loan_cnt_tot += rsWp.getLong("loan_cnt",i);
			}
	%>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
 <% if(i == 0) { %>
  <td colspan=2 rowspan=10 height=305 align=center class=xl69 width=66 style='height:233.15pt;
  width:49pt'>복지<br>
    사업비</td>
 <% } %>
  <td colspan=4 class=xl67 width=135 style='border-left:none;width:101pt'>&#<%=simbol%>;<br><%=rsWp.get("bugt_nm",i).substring(4)%></td>
  <td class=xl130 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i)))%></td>
  <td class=xl130 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_cnt",i)+rsWp.getLong("loan_cnt",i)))%></td>
  <td class=xl130 width=40 style='border-top:none;border-left:none;width:30pt'><%=rsWp.get("use_amt",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl130 width=40 style='border-top:none;border-left:none;width:30pt'><%=rsWp.get("use_cnt",i,Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl130 width=40 style='border-left:none;width:31pt'><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl130 width=40 style='border-top:none;border-left:none;width:30pt'><%=rsWp.get("loan_cnt",i,Box.THOUSAND_COMMA)%></td>
 <% if(i == 0) { %>
  <td colspan=2 rowspan=13 class=xl129 width=40 style='border-bottom:.5pt solid black;
  width:30pt'>　</td>
  <td colspan=2 rowspan=13 class=xl129 width=39 style='border-bottom:.5pt solid black;
  width:30pt'>　</td>
  <td colspan=2 rowspan=13 class=xl129 width=40 style='border-bottom:.5pt solid black;border-right:none;
  width:30pt'>　</td>
 <% } %>
 </tr>
	<% if(i == 9) { 
	amt_use_loan_tot = rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i);
	   } %>
<%  } %>
	<% 	
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","72","","", request); // 일반관리비
		Long amt_72_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
		
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", request); // 고유목적사업준비금1
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", request); // 고유목적사업준비금2
		Long amt_22008_cur_acum = Math.round(amt_tot1 / 1000.0) + Math.round(amt_tot2 / 1000.0) + Math.round(amt_12103_cur_acum / 1000.0) - amt_use_loan_tot - amt_72_cur_amt;
	%>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl93 width=201 style='height:18.75pt;
  border-left:none;width:150pt'>&#12980; 기금 운영비</td>
  <td colspan=7 class=xl129 width=240 style='border-left:none;width:181pt'><%=FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))%></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl93 width=201 style='height:18.75pt;
  border-left:none;width:150pt'>&#12981; 잔액</td>
  <td colspan=7 class=xl129 width=240 style='border-left:none;width:181pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))%></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl94 width=201 style='height:18.75pt;
  border-left:none;width:150pt'>&#12982; 합계</td>
  <td colspan=7 class=xl132 width=240 style='border-left:none;width:181pt'><%=FormatUtil.insertComma(String.valueOf(/*Math.round(amt_tot1 / 1000.0)*/+Math.round(amt_tot2 / 1000.0)+Math.round(amt_12103_cur_acum / 1000.0)))%></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td colspan=20 height=5 class=xl105 width=627 style='height:3.75pt;
  width:471pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td rowspan=9 height=309 class=xl97 width=67 style='border-bottom:.5pt solid black;
  height:232.35pt;border-top:none;width:50pt'>선택적<br>
    복지제도<br>
    실적&nbsp;</td>
  <td colspan=2 rowspan=9 class=xl95 width=66 style='border-bottom:.5pt solid black;
  width:49pt'>사업 내용</td>
  <td colspan=4 class=xl100 width=135 style='border-left:none;width:101pt'>&#12984;<br>
    주택구입자금 지원</td>
  <td class=xl135 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl135 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl135 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl135 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl135 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl135 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl135 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl135 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl135 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12985;<br>
    우리사주주식 구입</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12986;<br>
    생활안정자금</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12987;<br>
    장학금</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12988;<br>
    재난구호금</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12989;<br>
    체육·문화활동 지원</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.85pt'>
  <td colspan=4 height=43 class=xl67 width=135 style='height:32.85pt;
  border-left:none;width:101pt'>&#12990;<br>
    근로자의 날<br>
    행사비 지원</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
	<% 	
		rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7110900","","", request); // 복지카드
		Long amt_7110900_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
		Long amt_tot = amt_7110900_cur_amt;
	%>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=4 height=34 class=xl67 width=135 style='height:25.5pt;border-left:
  none;width:101pt'>&#12991;<br>
    그 밖의 복지비</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl129 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl129 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=4 height=28 class=xl102 width=135 style='height:21.0pt;
  border-left:none;width:101pt'>(51)&nbsp;소계</td>
  <td class=xl132 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(amt_tot))%></td>
  <td class=xl132 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td class=xl132 width=40 style='border-top:none;border-left:none;width:30pt'><%=FormatUtil.insertComma(String.valueOf(amt_tot))%></td>
  <td class=xl132 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl132 width=40 style='border-left:none;width:31pt'>　</td>
  <td class=xl132 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl132 width=40 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl132 width=39 style='border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl132 width=40 style='border-right:none;width:30pt'>　</td>
 </tr>
 <tr height=1 style='mso-height-source:userset;height:.75pt'>
  <td colspan=20 height=1 class=xl107 width=627 style='height:.75pt;width:471pt'>　</td>
 </tr>
 <tr height=54 style='mso-height-source:userset;height:40.5pt'>
  <td colspan=20 height=54 class=xl103 width=627 style='height:40.5pt;
  width:471pt'>&nbsp;「근로복지기본법 시행령」 제55조의4 또는 제63조제1항과 같은 법 시행규칙 제30조에 따라 위와 같이
  기금법인의 운영상황을 보고합니다.</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=20 height=25 class=xl104 width=627 style='height:18.75pt;
  width:471pt'><%=box.getInt("std_yy")+1%>년&nbsp;3월&nbsp;31일</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=6 height=25 class=xl109 width=228 style='height:18.75pt;
  width:170pt'>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td colspan=4 class=xl110 align=right width=160 style='width:120pt'>기금법인 대표자</td>
  <td colspan=6 class=xl140 width=160 style='width:121pt'><%=obox.get("rep_person_nm")%></td>
  <td colspan=4 class=xl111 width=79 style='width:60pt'>(서명 또는 인)</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=20 height=28 class=xl112 width=627 style='height:21.0pt;
  width:471pt'>&nbsp; <font class="font9">○○지방고용노동청(○○○○지청)장</font><font
  class="font8"> 귀하</font></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=20 height=23 class=xl113 width=627 style='height:17.25pt;
  width:471pt'>　</td>
 </tr>
</table>
</body>
</html>