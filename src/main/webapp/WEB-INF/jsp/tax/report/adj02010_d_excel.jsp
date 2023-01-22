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
<title>[별지 제43호의5서식(을)] 법인지방소득세 특별징수세액명세서(을)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
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
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font6
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:blue;
	font-size:9.0pt;
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
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:함초롬바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	vertical-align:bottom;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl92
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
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
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
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:2.9pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl121
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
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
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
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:8.6pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
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

<table border=0 cellpadding=0 cellspacing=0 width=618 style='border-collapse:
 collapse;table-layout:fixed;width:469pt'>
 <col width=21 span=3 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=18 style='mso-width-source:userset;mso-width-alt:576;width:14pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=21 span=4 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=21 span=3 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=33 style='mso-width-source:userset;mso-width-alt:1056;width:25pt'>
 <col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
 <col width=21 span=2 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=25 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
 <col width=18 style='mso-width-source:userset;mso-width-alt:576;width:14pt'>
 <col width=25 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
 <col width=21 span=2 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <tr height=25 style='mso-height-source:userset;height:19.35pt'>
  <td colspan=30 height=25 class=xl97 width=618 style='height:19.35pt;
  width:469pt'>■ 지방세법 시행규칙 <font class="font6">[별지 제43호의5서식(을)]</font><font
  class="font5"> </font><font class="font7">&lt;개정 2015.6.1.&gt;</font></td>
 </tr>
 <tr height=57 style='mso-height-source:userset;height:43.35pt'>
  <td colspan=30 height=57 class=xl119 width=618 style='height:43.35pt;
  width:469pt'>법인지방소득세 특별징수세액명세서(을)</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:16.35pt'>
  <td colspan=23 height=21 class=xl100 width=471 style='height:16.35pt;
  width:357pt'>※뒤쪽의 작성방법을 읽고 작성하여 주시기 바랍니다.<font class="font6"><span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=7 class=xl101 width=147 style='width:112pt'>(앞쪽)</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.2pt'>
  <td colspan=3 rowspan=2 height=32 class=xl129 width=63 style='border-bottom:
  .5pt solid black;height:24.4pt;width:48pt'>법인명</td>
  <td colspan=7 rowspan=2 class=xl131 width=140 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:106pt'><%=obox.get("corp_nm")%></td>
  <td colspan=5 rowspan=2 class=xl135 width=103 style='border-bottom:.5pt solid black;
  width:78pt'>사업자등록번호</td>
  <td colspan=5 rowspan=2 class=xl131 width=103 style='border-bottom:.5pt solid black;
  width:78pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=3 rowspan=2 class=xl137 width=62 style='border-bottom:.5pt solid black;
  width:47pt'>사업연도</td>
  <td colspan=7 rowspan=2 class=xl131 width=147 style='border-bottom:.5pt solid black;
  width:112pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.2pt'>
 </tr>
 <tr class=xl77 height=16 style='mso-height-source:userset;height:12.6pt'>
  <td colspan=30 rowspan=2 height=32 class=xl117 width=618 style='border-bottom:
  .5pt solid black;height:25.2pt;width:469pt'>원천징수 및 특별징수 세액명세</td>
 </tr>
 <tr class=xl77 height=16 style='mso-height-source:userset;height:12.6pt'>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:28.35pt'>
  <td colspan=5 height=37 class=xl92 width=104 style='border-right:.5pt solid black;
  height:28.35pt;width:79pt'>①채권등의명칭<br>
    <font class="font6">(액면금액)</font></td>
  <td colspan=5 class=xl115 width=99 style='border-right:.5pt solid black;
  border-left:none;width:75pt'>②유가증권<br>
    표준코드</td>
  <td colspan=5 class=xl115 width=103 style='border-right:.5pt solid black;
  border-left:none;width:78pt'>③채권이자<br>
    구분</td>
  <td colspan=5 class=xl115 width=103 style='border-right:.5pt solid black;
  border-left:none;width:78pt'>④취득일</td>
  <td colspan=5 class=xl115 width=103 style='border-right:.5pt solid black;
  border-left:none;width:78pt'>⑤매도일</td>
  <td colspan=5 class=xl115 width=106 style='border-left:none;width:81pt'>⑥보유기간<br>
    <font class="font6">(이자계산일수)</font></td>
 </tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="9" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						   long int_sum = 0;
						   long tax_sum = 0;
					   	   for(int i=0; i < rsWp.getLength(); i++) {	
					   	   		/*if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }*/
					   	   		int_sum += rsWp.getLong("rel_amt",i);
					   	   		tax_sum += rsWp.getLong("slip_amt",i); %>
								 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
								  <td colspan=5 height=26 class=xl113 width=104 style='height:19.7pt;width:79pt'></td>
								  <td colspan=5 class=xl111 width=99 style='border-left:none;width:75pt'></td>
								  <td colspan=5 class=xl111 width=103 style='border-left:none;width:78pt'>　</td>
								  <td colspan=5 class=xl111 width=103 style='border-left:none;width:78pt'>　</td>
								  <td colspan=5 class=xl111 width=103 style='border-left:none;width:78pt'>　</td>
								  <td colspan=5 class=xl111 width=106 style='border-left:none;width:81pt'>　</td>
								 </tr>
						<% } %>
					<% } %>

 <tr height=7 style='mso-height-source:userset;height:5.85pt'>
  <td colspan=3 rowspan=4 height=65 class=xl123 width=63 style='height:51.15pt;
  width:48pt'>⑦이자율</td>
  <td colspan=4 rowspan=4 class=xl114 width=83 style='width:63pt'>⑧=①×⑥×⑦<br>
    보유기간<br>
    이자상당액</td>
  <td colspan=5 rowspan=4 class=xl124 width=99 style='width:75pt'>⑨원천(특별)<br>
    징수의무자<br>
    (사업자등록번호)</td>
  <td colspan=2 rowspan=4 class=xl114 width=54 style='width:41pt'>⑩세율</td>
  <td colspan=7 rowspan=2 class=xl114 width=125 style='width:94pt'>법인세</td>
  <td colspan=9 rowspan=2 class=xl114 width=194 style='width:148pt'>법인지방소득세</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=3 rowspan=2 height=40 class=xl114 width=60 style='height:31.2pt;
  width:45pt'>⑪세액</td>
  <td colspan=4 rowspan=2 class=xl114 width=65 style='width:49pt'>⑫납부일<br>
    (징수일)</td>
  <td colspan=3 rowspan=2 class=xl114 width=63 style='width:48pt'>⑬세액</td>
  <td colspan=3 rowspan=2 class=xl114 width=64 style='width:49pt'>⑭납부일<br>
    (징수일)</td>
  <td colspan=3 rowspan=2 class=xl114 width=67 style='width:51pt'>⑮납세지</td>
 </tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="9" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						   long int_sum = 0;
						   long tax_sum = 0;
					   	   for(int i=0; i < rsWp.getLength(); i++) {	
					   	   		/*if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }*/
					   	   		int_sum += rsWp.getLong("rel_amt",i);
					   	   		tax_sum += rsWp.getLong("slip_amt",i); %>
								 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
								  <td colspan=3 height=26 class=xl113 width=63 style='height:19.7pt;width:48pt'>　</td>
								  <td colspan=4 class=xl111 width=83 style='border-left:none;width:63pt'>　</td>
								  <td colspan=5 class=xl111 width=99 style='border-left:none;width:75pt'>　</td>
								  <td colspan=2 class=xl111 width=54 style='border-left:none;width:41pt'>　</td>
								  <td colspan=3 class=xl111 width=60 style='border-left:none;width:45pt'>　</td>
								  <td colspan=4 class=xl111 width=65 style='border-left:none;width:49pt'>　</td>
								  <td colspan=3 class=xl111 width=63 style='border-left:none;width:48pt'>　</td>
								  <td colspan=3 class=xl111 width=64 style='border-left:none;width:49pt'>　</td>
								  <td colspan=3 class=xl111 width=67 style='border-left:none;width:51pt'>　</td>
								 </tr>
						<% } %>
								 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
								  <td colspan=3 height=26 class=xl125 width=63 style='height:19.7pt;width:48pt'>합
								  계</td>
								  <td colspan=4 class=xl111 width=83 style='border-left:none;width:63pt'>　</td>
								  <td colspan=5 class=xl127 width=99 style='border-left:none;width:75pt'>　</td>
								  <td colspan=2 class=xl127 width=54 style='border-left:none;width:41pt'>　</td>
								  <td colspan=3 class=xl111 width=60 style='border-left:none;width:45pt'>　</td>
								  <td colspan=4 class=xl111 width=65 style='border-left:none;width:49pt'>　</td>
								  <td colspan=3 class=xl127 width=63 style='border-left:none;width:48pt'>　</td>
								  <td colspan=3 class=xl111 width=64 style='border-left:none;width:49pt'>　</td>
								  <td colspan=3 class=xl127 width=67 style='border-left:none;width:51pt'>　</td>
								 </tr>
					<% } %>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=30 height=22 class=xl79 width=618 style='height:16.5pt;
  width:469pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>
</body>
</html>
