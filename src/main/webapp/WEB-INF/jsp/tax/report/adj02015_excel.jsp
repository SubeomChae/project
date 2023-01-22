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
<title>[별지 제15호 서식] 소득금액조정합계표</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.63in .75in .59in .67in;
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
.font6
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:HY신명조, serif;
	mso-font-charset:129;}
.font16
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
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	background:#828282;
	mso-pattern:black none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#828282;
	mso-pattern:black none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#828282;
	mso-pattern:black none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:"한양중고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
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
	border-right:none;
	border-bottom:.5pt solid #939393;
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
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
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
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
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
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
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
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl91
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
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
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
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl94
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
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
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
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
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
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl108
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
.xl109
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
.xl110
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
.xl111
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
.xl112
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
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl114
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
.xl115
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
.xl116
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
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl119
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
.xl120
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
.xl121
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
.xl122
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
.xl123
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
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl125
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
.xl126
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
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
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
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl140
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
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl151
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
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl153
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
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid gray;
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
<body link=blue vlink=purple>
<table border=0 cellpadding=0 cellspacing=0 width=643 style='border-collapse:collapse;table-layout:fixed;width:485pt'>
<col width=49 style='mso-width-source:userset;mso-width-alt:1568;width:37pt'>
<col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
<col width=29 style='mso-width-source:userset;mso-width-alt:928;width:22pt'>
<col width=35 span=2 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
<col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
<col width=28 span=2 style='mso-width-source:userset;mso-width-alt:896;width:21pt'>
<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
<col width=42 style='mso-width-source:userset;mso-width-alt:1344;width:32pt'>
<col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
<col width=25 span=2 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
<col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
<col width=24 style='mso-width-source:userset;mso-width-alt:768;width:18pt'>
<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
<col width=38 style='mso-width-source:userset;mso-width-alt:1216;width:29pt'>
<col width=28 style='mso-width-source:userset;mso-width-alt:896;width:21pt'>
<col width=47 style='mso-width-source:userset;mso-width-alt:1504;width:35pt'>
	<tr height=37 style='mso-height-source:userset;height:27.75pt'>
		<td colspan=11 height=37 class=xl88 width=363 style='height:27.75pt;width:274pt'>■ 법인세법 시행규칙 [별지 제15호서식] <font class="font6">&lt;개정 2013.2.23&gt;</font></td>
		<td colspan=9 class=xl89 width=280 style='width:211pt'>(앞쪽)</td>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.0pt'>
		<td rowspan=4 height=80 class=xl92 width=49 style='border-bottom:.5pt solid black;height:60.0pt;border-top:none;width:37pt'>사 업 <br>연 도</td>
		<td colspan=4 rowspan=4 class=xl90 width=120 style='border-right:.5pt solid #5D5D5D;border-bottom:.5pt solid black;width:90pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
		<td colspan=9 rowspan=4 class=xl99 width=265 style='border-right:.5pt solid #5D5D5D;border-bottom:.5pt solid black;width:201pt'>소득금액조정합계표</td>
		<td colspan=3 rowspan=2 class=xl90 width=96 style='border-right:.5pt solid #5D5D5D;border-bottom:.5pt solid black;width:72pt'>
			법<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>명
		</td>
		<td colspan=3 rowspan=2 class=xl90 width=113 style='border-bottom:.5pt solid black;width:85pt'><%=obox.get("corp_nm")%></td>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.0pt'>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.0pt'>
		<td colspan=3 rowspan=2 height=40 class=xl90 width=96 style='border-right:.5pt solid #5D5D5D;border-bottom:.5pt solid black;height:30.0pt;width:72pt'>사업자등록번호</td>
		<td colspan=3 rowspan=2 class=xl90 width=113 style='border-bottom:.5pt solid black;width:85pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.0pt'>
	</tr>
	<tr height=10 style='mso-height-source:userset;height:8.1pt'>
		<td colspan=20 height=10 class=xl75 width=643 style='height:8.1pt;width:485pt'>　</td>
	</tr>
	<tr height=30 style='mso-height-source:userset;height:23.1pt'>
		<td colspan=10 height=30 class=xl76 width=321 style='border-right:.5pt solid #939393;height:23.1pt;width:242pt'>익금산입 및 손금불산입</td>
		<td colspan=10 class=xl78 width=322 style='border-left:none;width:243pt'>손금산입 및 익금불산입</td>
	</tr>
	<tr height=24 style='mso-height-source:userset;height:18.0pt'>
		<td colspan=2 rowspan=2 height=48 class=xl79 width=70 style='border-right:.5pt solid #939393;border-bottom:.5pt solid #939393;height:36.0pt;width:53pt'>①과 목</td>
		<td colspan=4 rowspan=2 class=xl83 width=121 style='border-bottom:.5pt solid #939393;width:91pt'>②금<span style='mso-spacerun:yes'>&nbsp; </span>액</td>
		<td colspan=4 class=xl83 width=130 style='border-right:.5pt solid #939393;width:98pt'>③소득처분</td>
		<td colspan=2 rowspan=2 class=xl83 width=63 style='border-right:.5pt solid #939393;border-bottom:.5pt solid #939393;width:48pt'>④과 목</td>
		<td colspan=4 rowspan=2 class=xl83 width=109 style='border-right:.5pt solid #939393;border-bottom:.5pt solid #939393;width:82pt'>⑤금<span style='mso-spacerun:yes'>&nbsp; </span>액</td>
		<td colspan=4 class=xl68 width=150 style='border-left:none;width:113pt'>⑥소득처분</td>
	</tr>
	<tr height=24 style='mso-height-source:userset;height:18.0pt'>
		<td colspan=2 height=24 class=xl68 width=65 style='border-right:.5pt solid #939393;height:18.0pt;width:49pt'>처분</td>
		<td colspan=2 class=xl85 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'>코드</td>
		<td colspan=2 class=xl85 width=75 style='border-right:.5pt solid #939393;border-left:none;width:57pt'>처분</td>
		<td colspan=2 class=xl87 width=75 style='width:56pt'>코드</td>
	</tr>
<%  long slip_sum1 = 0;
    long slip_sum2 = 0;
	for(int i=0; i < rsWp.getLength() && i < 25; i++) {
	   	slip_sum1 += rsWp.getLong("slip_wamt1",i);
	   	slip_sum2 += rsWp.getLong("slip_wamt2",i); %>
	<tr height=30 style='mso-height-source:userset;height:23.1pt'>
		<td colspan=2 height=30 class=xl66 width=70 style='border-right:.5pt solid #939393;height:23.1pt;width:53pt'><%=rsWp.get("acct_nm1",i)%></td>
		<td colspan=4 class=xl68 width=121 style='border-right:.5pt solid #939393;border-left:none;width:91pt'><%=rsWp.get("slip_wamt1",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=2 class=xl68 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'><%=rsWp.get("dispose_nm1",i)%></td>
		<td colspan=2 class=xl68 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'><%=rsWp.get("dispose_cd1",i)%></td>
		<td colspan=2 class=xl68 width=63 style='border-right:.5pt solid #939393;border-left:none;width:48pt'><%=rsWp.get("acct_nm2",i)%></td>
		<td colspan=4 class=xl68 width=109 style='border-right:.5pt solid #939393;border-left:none;width:82pt'><%=rsWp.get("slip_wamt2",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=2 class=xl68 width=75 style='border-right:.5pt solid #939393;border-left:none;width:57pt'><%=rsWp.get("dispose_nm2",i)%></td>
		<td colspan=2 class=xl68 width=75 style='border-left:none;width:56pt'><%=rsWp.get("dispose_cd2",i)%></td>
	</tr>
<% } %>
<% for(int i=rsWp.getLength(); i < 23; i++) { %>
	<tr height=30 style='mso-height-source:userset;height:23.1pt'>
		<td colspan=2 height=30 class=xl66 width=70 style='border-right:.5pt solid #939393;height:23.1pt;width:53pt'>　</td>
		<td colspan=4 class=xl68 width=121 style='border-right:.5pt solid #939393;border-left:none;width:91pt'>　</td>
		<td colspan=2 class=xl68 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'>　</td>
		<td colspan=2 class=xl68 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'>　</td>
		<td colspan=2 class=xl68 width=63 style='border-right:.5pt solid #939393;border-left:none;width:48pt'>　</td>
		<td colspan=4 class=xl68 width=109 style='border-right:.5pt solid #939393;border-left:none;width:82pt'>　</td>
		<td colspan=2 class=xl68 width=75 style='border-right:.5pt solid #939393;border-left:none;width:57pt'>　</td>
		<td colspan=2 class=xl68 width=75 style='border-left:none;width:56pt'>　</td>
	</tr>
<% } %>
	<tr height=30 style='mso-height-source:userset;height:23.1pt'>
		<td colspan=2 height=30 class=xl69 width=70 style='border-right:.5pt solid #939393;height:23.1pt;width:53pt'>합<span style='mso-spacerun:yes'>&nbsp; </span>계</td>
		<td colspan=4 class=xl71 width=121 style='border-right:.5pt solid #939393;border-left:none;width:91pt'>　</td>
		<td colspan=2 class=xl72 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'>　</td>
		<td colspan=2 class=xl72 width=65 style='border-right:.5pt solid #939393;border-left:none;width:49pt'>　</td>
		<td colspan=2 class=xl71 width=63 style='border-right:.5pt solid #939393;border-left:none;width:48pt'>합<span style='mso-spacerun:yes'>&nbsp; </span>계</td>
		<td colspan=4 class=xl71 width=109 style='border-right:.5pt solid #939393;border-left:none;width:82pt'>　</td>
		<td colspan=2 class=xl72 width=75 style='border-right:.5pt solid #939393;border-left:none;width:57pt'>　</td>
		<td colspan=2 class=xl72 width=75 style='border-left:none;width:56pt'>　</td>
	</tr>
	<tr height=35 style='mso-height-source:userset;height:26.25pt'>
		<td colspan=20 height=35 class=xl65 width=643 style='height:26.25pt;width:485pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
	</tr>
</table>
</body>
</html>