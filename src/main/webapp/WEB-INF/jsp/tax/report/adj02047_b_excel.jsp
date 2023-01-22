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
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제47호 서식] 주요계정명세서(을)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.59in .75in .59in .75in;
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
	{color:blue;
	font-size:8.0pt;
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
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	vertical-align:bottom;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	background:white;
	mso-pattern:black none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	background:#ABABAB;
	mso-pattern:black none;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:black none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #595959;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #595959;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #595959;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #595959;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #595959;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #595959;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #595959;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #595959;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #595959;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #595959;
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
<table border=0 cellpadding=0 cellspacing=0 width=624 style='border-collapse:
 collapse;table-layout:fixed;width:473pt'>
 <col width=43 style='mso-width-source:userset;mso-width-alt:1376;width:32pt'>
 <col width=18 style='mso-width-source:userset;mso-width-alt:576;width:14pt'>
 <col width=17 style='mso-width-source:userset;mso-width-alt:544;width:13pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:864;width:20pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1536;width:36pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=18 style='mso-width-source:userset;mso-width-alt:576;width:14pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=18 span=3 style='mso-width-source:userset;mso-width-alt:576;
 width:14pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=48 style='mso-width-source:userset;mso-width-alt:1536;width:36pt'>
 <col width=37 span=2 style='mso-width-source:userset;mso-width-alt:1184;
 width:28pt'>
 <col width=22 span=2 style='mso-width-source:userset;mso-width-alt:704;
 width:17pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1440;width:34pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=21 height=31 class=xl190 width=579 style='height:23.25pt;
  width:439pt'>■ 법인세법 시행규칙 [별지 제47호서식(갑)] <font class="font5">&lt;개정
  2014.3.14&gt;</font></td>
  <td class=xl74 width=45 style='width:34pt'>(앞쪽)</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 rowspan=4 height=67 class=xl182 width=78 style='border-bottom:
  .5pt solid black;height:50.25pt;width:59pt'>사 업<br>
    연 도</td>
  <td colspan=3 rowspan=4 class=xl205 width=83 style='border-right:.5pt solid #595959;
  border-bottom:.5pt solid black;width:62pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=10 rowspan=4 class=xl191 width=263 style='border-right:.5pt solid #5D5D5D;
  border-bottom:.5pt solid black;width:200pt'>주요계정명세서(을)</td>
  <td colspan=3 rowspan=2 class=xl195 width=96 style='width:73pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=3 rowspan=2 class=xl195 width=104 style='width:79pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td colspan=3 rowspan=2 height=34 class=xl130 width=96 style='border-bottom:
  .5pt solid black;height:25.5pt;width:73pt'>사업자등록번호</td>
  <td colspan=3 rowspan=2 class=xl130 width=104 style='border-bottom:.5pt solid black;
  width:79pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=22 height=6 class=xl189 width=624 style='height:5.1pt;width:473pt'></td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=22 height=44 class=xl186 width=624 style='height:33.0pt;
  width:473pt'>1. 재고자산ㆍ유가증권 평가</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=5 rowspan=2 height=60 class=xl69 width=124 style='border-right:
  .5pt solid black;border-bottom:2.0pt double black;height:45.0pt;width:93pt'>①
  자 산 별</td>
  <td colspan=2 rowspan=2 class=xl177 width=85 style='border-right:.5pt solid black;
  border-bottom:2.0pt double black;width:64pt'>② 신고방법</td>
  <td colspan=4 rowspan=2 class=xl177 width=81 style='border-right:.5pt solid black;
  border-bottom:2.0pt double black;width:62pt'>③ 평가방법</td>
  <td colspan=4 rowspan=2 class=xl155 width=86 style='width:66pt'>④ 회사계산<br>
    금<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>액</td>
  <td colspan=5 class=xl155 width=166 style='border-left:none;width:126pt'>조정계산금액</td>
  <td colspan=2 rowspan=2 class=xl155 width=82 style='width:62pt'>⑦ 조 정 액
  <br>
    (⑤ 또는<br>
    ⑤와⑥ 중 큰 <br>
    금액-④)</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=2 height=34 class=xl156 width=85 style='height:25.5pt;border-left:
  none;width:64pt'>⑤ 신고방법</td>
  <td colspan=3 class=xl156 width=81 style='border-left:none;width:62pt'>⑥
  선입선출법</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl187 width=124 style='border-right:.5pt solid black;
  height:26.1pt;width:93pt'>(101)제품및상품</td>
  <td colspan=2 class=xl173 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl173 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl162 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl162 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl162 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl162 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl184 width=124 style='border-right:.5pt solid black;
  height:26.1pt;width:93pt'>(102)반제품 및 재공품</td>
  <td colspan=2 class=xl149 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl149 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl142 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl184 width=124 style='border-right:.5pt solid black;
  height:26.1pt;width:93pt'>(103)원 재 료</td>
  <td colspan=2 class=xl149 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl149 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl142 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl184 width=124 style='border-right:.5pt solid black;
  height:26.1pt;width:93pt'>(104)저 장 품</td>
  <td colspan=2 class=xl149 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl149 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl142 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=2 rowspan=2 height=68 class=xl69 width=61 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:52.2pt;width:46pt'>유가증권</td>
  <td colspan=3 class=xl176 width=63 style='border-right:.5pt solid black;
  border-left:none;width:47pt'>(105)채 권</td>
  <td colspan=2 class=xl149 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl149 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl142 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=3 height=34 class=xl176 width=63 style='border-right:.5pt solid black;
  height:26.1pt;border-left:none;width:47pt'>(106)기 타</td>
  <td colspan=2 class=xl149 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl149 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl142 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl160 width=124 style='border-right:.5pt solid black;
  height:26.1pt;width:93pt'>(107)합 계</td>
  <td colspan=2 class=xl152 width=85 style='border-right:.5pt solid black;
  border-left:none;width:64pt'>　</td>
  <td colspan=4 class=xl152 width=81 style='border-right:.5pt solid black;
  border-left:none;width:62pt'>　</td>
  <td colspan=4 class=xl143 width=86 style='border-left:none;width:66pt'>　</td>
  <td colspan=2 class=xl142 width=85 style='border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl142 width=81 style='border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl142 width=82 style='border-left:none;width:62pt'>　</td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=22 height=44 class=xl170 width=624 style='height:33.0pt;
  width:473pt'>2. 국고보조금 등ㆍ공사부담금ㆍ보험차익 손금산입 조정</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=4 rowspan=2 height=44 class=xl69 width=105 style='border-right:
  .5pt solid black;height:33.0pt;width:79pt'>⑧ 구 분</td>
  <td colspan=4 rowspan=2 class=xl155 width=114 style='width:86pt'>⑨ 금 액</td>
  <td colspan=5 rowspan=2 class=xl155 width=107 style='width:82pt'>⑩ 취득고정자산가액</td>
  <td colspan=3 rowspan=2 class=xl155 width=98 style='width:74pt'>⑪ 회사손금계상액</td>
  <td colspan=3 rowspan=2 class=xl155 width=96 style='width:73pt'>⑫ 한도초과액<br>
    (⑪-⑩)</td>
  <td colspan=3 rowspan=2 class=xl155 width=104 style='width:79pt'>⑬ 미사용분<br>
    익금산입액</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=4 height=34 class=xl158 width=105 style='border-right:.5pt solid black;
  height:26.1pt;width:79pt'>(108)국고보조금등</td>
  <td colspan=4 class=xl162 width=114 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl162 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl162 width=98 style='border-left:none;width:74pt'>　</td>
  <td colspan=3 class=xl162 width=96 style='border-left:none;width:73pt'>　</td>
  <td colspan=3 class=xl162 width=104 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=4 height=34 class=xl160 width=105 style='border-right:.5pt solid black;
  height:26.1pt;width:79pt'>(109)공사부담금</td>
  <td colspan=4 class=xl142 width=114 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl142 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl142 width=98 style='border-left:none;width:74pt'>　</td>
  <td colspan=3 class=xl142 width=96 style='border-left:none;width:73pt'>　</td>
  <td colspan=3 class=xl142 width=104 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=4 height=34 class=xl160 width=105 style='border-right:.5pt solid black;
  height:26.1pt;width:79pt'>(110)보 험 차 익</td>
  <td colspan=4 class=xl142 width=114 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl142 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl142 width=98 style='border-left:none;width:74pt'>　</td>
  <td colspan=3 class=xl142 width=96 style='border-left:none;width:73pt'>　</td>
  <td colspan=3 class=xl142 width=104 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=22 height=44 class=xl170 width=624 style='height:33.0pt;
  width:473pt'>3. 가지급금 등 인정이자 조정</td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=13 height=31 class=xl161 width=326 style='height:23.25pt;
  width:247pt'>적 수</td>
  <td colspan=3 rowspan=2 class=xl155 width=98 style='width:74pt'>&#9328; 인정이자</td>
  <td colspan=3 rowspan=2 class=xl155 width=96 style='width:73pt'>&#9329; 회사계상액</td>
  <td colspan=3 rowspan=2 class=xl155 width=104 style='width:79pt'>&#9330; 조정액</td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=4 height=23 class=xl144 width=105 style='height:17.25pt;
  width:79pt'>⑭ 가지급금</td>
  <td colspan=4 class=xl156 width=114 style='border-left:none;width:86pt'>⑮ 가수금</td>
  <td colspan=5 class=xl156 width=107 style='border-left:none;width:82pt'>&#9327; 차
  감(⑭-⑮)</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=4 height=33 class=xl175 width=105 style='height:24.75pt;
  width:79pt'>　</td>
  <td colspan=4 class=xl162 width=114 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl162 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl162 width=98 style='border-left:none;width:74pt'>　</td>
  <td colspan=3 class=xl162 width=96 style='border-left:none;width:73pt'>　</td>
  <td colspan=3 class=xl162 width=104 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=22 height=44 class=xl170 width=624 style='height:33.0pt;
  width:473pt'>4. 건설자금이자 조정</td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
  <td colspan=5 height=37 class=xl163 width=124 style='height:27.95pt;
  width:93pt'>&#9331; 구 분</td>
  <td colspan=4 class=xl164 width=113 style='border-left:none;width:86pt'>(21)건설자금이자</td>
  <td colspan=5 class=xl164 width=107 style='border-left:none;width:82pt'>(22)회사계상액</td>
  <td colspan=3 class=xl164 width=117 style='border-left:none;width:88pt'>(23)상각대상자산분</td>
  <td colspan=5 class=xl164 width=163 style='border-left:none;width:124pt'>(24)차감조정액<br>
    ((21)-(22)-(23))</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl165 width=124 style='height:26.1pt;
  width:93pt'>(111)건설 완료 자산분</td>
  <td colspan=4 class=xl171 width=113 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl162 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl162 width=117 style='border-left:none;width:88pt'>　</td>
  <td colspan=5 class=xl162 width=163 style='border-left:none;width:124pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl167 width=124 style='height:26.1pt;
  width:93pt'>(112)건설 중인 자산분</td>
  <td colspan=4 class=xl155 width=113 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl142 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl172 width=117 style='border-left:none;width:88pt'>　</td>
  <td colspan=5 class=xl143 width=163 style='border-left:none;width:124pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:26.1pt'>
  <td colspan=5 height=34 class=xl161 width=124 style='height:26.1pt;
  width:93pt'>합 계((111)+(112))</td>
  <td colspan=4 class=xl155 width=113 style='border-left:none;width:86pt'>　</td>
  <td colspan=5 class=xl142 width=107 style='border-left:none;width:82pt'>　</td>
  <td colspan=3 class=xl142 width=117 style='border-left:none;width:88pt'>　</td>
  <td colspan=5 class=xl142 width=163 style='border-left:none;width:124pt'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=22 height=33 class=xl157 width=624 style='height:24.75pt;
  width:473pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>
</body>
</html>