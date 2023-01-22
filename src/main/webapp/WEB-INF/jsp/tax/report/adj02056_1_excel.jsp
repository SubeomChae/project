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
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.55in .51in .55in .79in;
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
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;}
.font7
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:14.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:HY견고딕, serif;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양견고딕, monospace;
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
	border:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl75
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
.xl76
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
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl79
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
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl83
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
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #787878;
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
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
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
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl119
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
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl122
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
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
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
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl131
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
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
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

<table border=0 cellpadding=0 cellspacing=0 width=623 style='border-collapse:
 collapse;table-layout:fixed;width:474pt'>
 <col width=29 span=4 style='mso-width-source:userset;mso-width-alt:928;
 width:22pt'>
 <col width=38 style='mso-width-source:userset;mso-width-alt:1216;width:29pt'>
 <col width=29 span=8 style='mso-width-source:userset;mso-width-alt:928;
 width:22pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=14 span=2 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col width=29 span=5 style='mso-width-source:userset;mso-width-alt:928;
 width:22pt'>
 <col width=38 style='mso-width-source:userset;mso-width-alt:1216;width:29pt'>
 <tr height=42 style='mso-height-source:userset;height:31.5pt'>
  <td colspan=20 height=42 class=xl66 width=556 style='height:31.5pt;
  width:423pt'>■ 법인세법 시행규칙 [별지 제56호서식 부표] <font class="font7">&lt;신설
  2013.2.23&gt;</font></td>
  <td colspan=2 class=xl68 width=67 style='width:51pt'>(앞쪽)</td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td colspan=2 rowspan=2 height=90 class=xl79 width=58 style='height:67.5pt;
  width:44pt'>사 업<br>
    연 도</td>
  <td colspan=3 rowspan=2 class=xl125 width=96 style='width:73pt'><%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????.??.??")%><br>
  ~<br>
  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????.??.??")%></td>
  <td colspan=10 rowspan=2 class=xl69 width=272 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:207pt'><font class="font8">가 산 세 액 계 산 서</font><font
  class="font5"><br>
    </font><font class="font9">(이자소득만 있는 비영리법인 신고용)</font></td>
  <td colspan=4 class=xl75 width=101 style='border-right:.5pt solid black;
  width:77pt'>법인명</td>
  <td colspan=3 class=xl118 width=96 style='border-left:none;width:73pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td colspan=4 height=45 class=xl77 width=101 style='border-right:.5pt solid black;
  height:33.75pt;border-left:none;width:77pt'>사업자등록번호</td>
  <td colspan=3 class=xl118 width=96 style='border-left:none;width:73pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=22 height=40 class=xl83 width=623 style='height:30.0pt;
  width:474pt'>1. 가산세액의 계산</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 rowspan=2 height=60 class=xl75 width=183 style='border-right:
  .5pt solid #787878;border-bottom:.5pt solid #787878;height:45.0pt;width:139pt'>①
  구 분</td>
  <td colspan=16 class=xl87 width=440 style='border-left:none;width:335pt'>각
  사업연도 소득에 대한 법인세분</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=3 height=30 class=xl80 width=87 style='border-right:.5pt solid #787878;
  height:22.5pt;border-left:none;width:66pt'>②계산기준</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>③기준금액</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>④가산세율</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>⑤코드</td>
  <td colspan=3 class=xl80 width=96 style='border-left:none;width:73pt'>⑥가산세액</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 rowspan=2 height=70 class=xl93 width=116 style='border-right:
  .5pt solid #787878;border-bottom:.5pt solid #787878;height:52.5pt;width:88pt'>과소신고</td>
  <td colspan=2 class=xl91 width=67 style='border-right:.5pt solid #787878;
  border-left:none;width:51pt'>일반</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>산출세액</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>10/100</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>3</td>
  <td colspan=3 class=xl89 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=2 height=35 class=xl91 width=67 style='border-right:.5pt solid #787878;
  height:26.25pt;border-left:none;width:51pt'>부당</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>산출세액</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>40/100</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>22</td>
  <td colspan=3 class=xl89 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 rowspan=2 height=70 class=xl93 width=116 style='border-right:
  .5pt solid #787878;border-bottom:.5pt solid #787878;height:52.5pt;width:88pt'>초과환급신고</td>
  <td colspan=2 class=xl91 width=67 style='border-right:.5pt solid #787878;
  border-left:none;width:51pt'>일반</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>초과환급세액</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>10/100</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>33</td>
  <td colspan=3 class=xl89 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=2 height=35 class=xl91 width=67 style='border-right:.5pt solid #787878;
  height:26.25pt;border-left:none;width:51pt'>부당</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>초과환급세액</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>40/100</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>34</td>
  <td colspan=3 class=xl89 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 rowspan=2 height=70 class=xl93 width=116 style='border-right:
  .5pt solid #787878;height:52.5pt;width:88pt'>납부(환급)불성실</td>
  <td colspan=2 class=xl97 width=67 style='border-right:.5pt solid #787878;
  border-left:none;width:51pt'>납부</td>
  <td colspan=3 class=xl98 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>(일수)<br>
    미납세액</td>
  <td colspan=3 class=xl103 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>)</td>
  <td colspan=4 class=xl80 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>3/10,000</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>4</td>
  <td colspan=3 class=xl101 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=2 height=35 class=xl97 width=67 style='border-right:.5pt solid #787878;
  height:26.25pt;border-left:none;width:51pt'>환급</td>
  <td colspan=3 class=xl98 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>(일수)<br>
    초과환급세액</td>
  <td colspan=3 class=xl127 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>)</td>
  <td colspan=4 class=xl98 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>3/10,000</td>
  <td colspan=3 class=xl98 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>35</td>
  <td colspan=3 class=xl101 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 height=30 class=xl114 width=183 style='border-right:.5pt solid #787878;
  height:22.5pt;width:139pt'>기타</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=3 class=xl89 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl89 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl80 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>63</td>
  <td colspan=3 class=xl116 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 height=30 class=xl132 width=183 style='border-right:.5pt solid #787878;
  height:22.5pt;width:139pt'>합<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계</td>
  <td colspan=3 class=xl134 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=3 class=xl106 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl106 width=83 style='border-right:.5pt solid #787878;
  border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl109 width=87 style='border-right:.5pt solid #787878;
  border-left:none;width:66pt'>21</td>
  <td colspan=3 class=xl112 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
  <td colspan=22 rowspan=6 height=258 class=xl130 width=623 style='border-bottom:
  .5pt solid black;height:193.5pt;width:474pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>자진납부기한<br>
    <span style='mso-spacerun:yes'>&nbsp;</span>(환급받은 날)<br>
    <span style='mso-spacerun:yes'>&nbsp;</span>( . . )<br>
    <br>
    <span style='mso-spacerun:yes'>&nbsp;</span>고지일 또는 납부일<br>
    <span style='mso-spacerun:yes'>&nbsp;</span>( . . )</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.25pt'>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=22 height=40 class=xl121 width=623 style='height:30.0pt;
  width:474pt'>2. 과소신고 산출세액 및 초과환급 신고세액 계산</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=3 rowspan=2 height=68 class=xl119 width=87 style='height:51.0pt;
  width:66pt'>⑦ 구분</td>
  <td colspan=6 class=xl65 width=183 style='border-left:none;width:139pt'>과소신고
  과세표준</td>
  <td colspan=2 rowspan=2 class=xl65 width=58 style='width:44pt'>⑪산출세액<br>
    (초과환급<br>
    신고세액)</td>
  <td colspan=2 rowspan=2 class=xl65 width=58 style='width:44pt'>⑫과세표준<br>
    금 액</td>
  <td colspan=9 class=xl65 width=237 style='border-left:none;width:181pt'>산출세액(초과환급신고세액)</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=2 height=28 class=xl120 width=67 style='height:21.0pt;border-left:
  none;width:51pt'>⑧ 계</td>
  <td colspan=2 class=xl120 width=58 style='border-left:none;width:44pt'>⑨ 일반</td>
  <td colspan=2 class=xl120 width=58 style='border-left:none;width:44pt'>⑩ 부당</td>
  <td colspan=3 class=xl120 width=54 style='border-left:none;width:42pt'>⑬계</td>
  <td colspan=3 class=xl120 width=87 style='border-left:none;width:66pt'>⑭일반(⑪×(⑨/⑫))</td>
  <td colspan=3 class=xl120 width=96 style='border-left:none;width:73pt'>⑮부당(⑪×(⑩/⑫))</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=2 rowspan=2 height=70 class=xl119 width=58 style='height:52.5pt;
  width:44pt'>각 사업<br>
    연도소득</td>
  <td class=xl65 width=29 style='border-top:none;border-left:none;width:22pt'>과소<br>
    신고</td>
  <td colspan=2 class=xl118 width=67 style='border-left:none;width:51pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=3 class=xl118 width=54 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl118 width=87 style='border-left:none;width:66pt'>　</td>
  <td colspan=3 class=xl118 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl65 width=29 style='height:26.25pt;border-top:none;
  border-left:none;width:22pt'>초과<br>
    환급</td>
  <td colspan=2 class=xl118 width=67 style='border-left:none;width:51pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=2 class=xl118 width=58 style='border-left:none;width:44pt'>　</td>
  <td colspan=3 class=xl118 width=54 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl118 width=87 style='border-left:none;width:66pt'>　</td>
  <td colspan=3 class=xl118 width=96 style='border-left:none;width:73pt'>　</td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
  <td colspan=22 height=37 class=xl123 width=623 style='height:27.95pt;
  width:474pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>

</body>

</html>
