<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp1"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="rsWp2"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="rsWp3"		class="egovframework.cbiz.RsWrapper"    scope="request" />
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
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
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
	font-size:7.8pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:HY신명조, serif;
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
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl66
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
.xl67
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
.xl68
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
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
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
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl79
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
.xl80
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
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
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
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:15.5pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:"한양신명조\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:"한양신명조\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
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
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl97
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
.xl98
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
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl112
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
.xl113
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
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl119
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
.xl120
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
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
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
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;}
.xl132
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;}

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

<table border=0 cellpadding=0 cellspacing=0 width=660 style='border-collapse:
 collapse;table-layout:fixed;width:497pt'>
 <col width=65 span=3 style='mso-width-source:userset;mso-width-alt:2080;
 width:49pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2080;width:49pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
 <col width=65 span=2 style='mso-width-source:userset;mso-width-alt:2080;
 width:49pt'>
 <col width=35 span=2 style='mso-width-source:userset;mso-width-alt:1120;
 width:26pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2080;width:49pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=11 height=22 class=xl65 width=595 style='height:16.5pt;
  width:448pt'>■ 법인세법 시행규칙 [별지 제27호서식(을)] <font class="font6">&lt;개정
  2013.2.23&gt;</font></td>
  <td class=xl66 width=65 style='width:49pt'>(앞 쪽)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td rowspan=4 height=88 class=xl67 width=65 style='border-bottom:.5pt solid black;
  height:66.0pt;border-top:none;width:49pt'>사 업<br>
    연 도</td>
  <td colspan=2 rowspan=4 class=xl68 width=130 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid black;width:98pt'><%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????.??.??")%><br>
  ~<br>
  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????.??.??")%>
  <td colspan=5 rowspan=4 class=xl69 width=265 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid black;width:200pt'>고유목적사업준비금<br>
    조정명세서(을)</td>
  <td colspan=2 rowspan=2 class=xl68 width=100 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:75pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=2 rowspan=2 class=xl72 width=100 style='border-bottom:.5pt solid #7F7F7F;
  width:75pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan=2 height=44 class=xl83 width=100 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid black;height:33.0pt;width:75pt'>사업자등록번호</td>
  <td colspan=2 rowspan=2 class=xl85 width=100 style='border-bottom:.5pt solid black;
  width:75pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl94 width=395 style='height:16.5pt;width:298pt'>　</td>
  <td colspan=5 class=xl95 width=265 style='width:199pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=8 height=22 class=xl96 width=460 style='border-right:.5pt solid #7F7F7F;height:16.5pt;width:347pt'>지출내역</td>
  <td colspan=2 rowspan=4 class=xl68 width=100 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;width:75pt'>④금액</td>
  <td colspan=2 rowspan=4 class=xl68 width=100 style='border-bottom:.5pt solid #4C4C4C;width:75pt'>⑤비고</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan=3 height=66 class=xl99 width=130 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;height:49.5pt;width:98pt'>①구분</td>
  <td colspan=2 rowspan=3 class=xl83 width=100 style='border-right:.5pt solid #7F7F7F;width:75pt'>②적요</td>
  <td colspan=4 class=xl83 width=230 style='border-right:.5pt solid #7F7F7F;border-left:none;width:174pt'>③지출처</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan=2 height=44 class=xl101 width=115 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:33.0pt;width:87pt'>상호(성명)</td>
  <td colspan=2 rowspan=2 class=xl101 width=115 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;width:87pt'>사업자등록번호<br>(주민등록번호)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan="<%=rsWp1.getLength() > 5 ? rsWp1.getLength() : 5%>" height=110 class=xl110 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;height:82.5pt;width:98pt'>Ⅰ.&nbsp;<br>
    지정기부금</td>
			<% long slip_amt_sum1 = 0;
			   Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
			   slip_amt_sum1 = rbox.getLong("cur_acum"); // 이자수익+대부이자수익 %>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
 </tr>
<% for(int i=0; i < 5-rsWp1.getLength(); i++) { %>
 <tr height=22 style='height:16.5pt'>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
 </tr>
<% } %>
<% int row_cnt2=0;
   String span_cnt = "";
   for(int i=0; i < rsWp3.getLength(); i++) { 
		slip_amt_sum1 -= rsWp3.getLong("slip_amt",i);
		if(slip_amt_sum1 <= 0) { slip_amt_sum1=0; row_cnt2=i+1; break;}
		if(i==rsWp3.getLength()-1) { row_cnt2=i+1; break;}
   } 
   if(rsWp2.getLength() == 0) {
	   span_cnt = "5";
   }else if(rsWp2.getLength() > 10) {
	   int row_cnt1 = 0;
	   long slip_amt_sum1_tmp = slip_amt_sum1;
	   for(int j=0; j < rsWp2.getLength(); j++) { 
		   slip_amt_sum1_tmp -= rsWp2.getLong("slip_amt",j);
			if(slip_amt_sum1_tmp <= 0) { row_cnt1=j+1; break;}
	   } 
	   if(row_cnt1 > 5) { span_cnt = String.valueOf(row_cnt1+1); }else { span_cnt = "6"; }
   }else {
	   span_cnt = "6";  
   } %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan="<%=span_cnt%>" height=110 class=xl110 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;height:82.5pt;width:98pt'>Ⅱ.&nbsp;고유목적사업비</td>
<% long slip_amt_sum2 = 0;
   long slip_amt_tmp = 0;
   int row_cnt = 0;
   for(int i=0; i < rsWp2.getLength(); i++) {	
		if(slip_amt_sum1 == 0) { break; }
		slip_amt_sum1 -= slip_amt_tmp; 
		slip_amt_tmp = rsWp2.getLong("slip_amt",i); 
		if(slip_amt_sum1 <= slip_amt_tmp) { slip_amt_tmp=slip_amt_sum1; slip_amt_sum1=0;} 
		slip_amt_sum2 += slip_amt_tmp; 
		row_cnt = i; %>
	 <%if(i>0){%><tr height=22 style='height:16.5pt'><%}%>
	 <% if(i < rsWp2.getLength()) { %>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'><%=rsWp2.get("etc_remark",i)%></td>
		<% if(rsWp2.get("cust_cd",i).equals("")) { %>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=rsWp2.get("empl_nm",i)%></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=FormatUtil.juminNo(rsWp2.get("cust_reg_no",i),"x")%>&nbsp;</td>
		<% }else { %>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=rsWp2.get("cust_nm",i)%></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=FormatUtil.bizRegiNoFormat(rsWp2.get("cust_reg_no",i))%>&nbsp;</td>
		<% } %>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'><%=FormatUtil.insertComma(String.valueOf(slip_amt_tmp))%></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 <% }else { %>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 <% } %>
	 </tr>
<% } %>	
<% for(int i=0; i < 5-row_cnt; i++) { %>
		<tr height=22 style='height:16.5pt'>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
		 </tr>
<% } %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan="<%=row_cnt2 > 5 ? row_cnt2 : 5%>" height=110 class=xl110 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;height:82.5pt;width:98pt'>Ⅲ.
  고유목적<br>
    사업관련 운영경비</td>
			<% long slip_amt_sum3 = 0;
			   long slip_amt_tmp3 = 0;
			   long cur_acum = rbox.getLong("cur_acum"); 
			   for(int i=0; i < row_cnt2; i++) {	
					slip_amt_tmp3 = rsWp3.getLong("slip_amt",i);
					if(cur_acum == 0) { break; }
					if(cur_acum <= slip_amt_tmp3) { slip_amt_tmp3=cur_acum; cur_acum=0;} 
					slip_amt_sum3 += slip_amt_tmp3; %>
	 <%if(i>0){%><tr height=22 style='height:16.5pt'><%}%>
	 <% if(i < rsWp3.getLength()) { %>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'><%=rsWp3.get("etc_remark",i)%></td>
		<% if(rsWp3.get("cust_cd",i).equals("")) { %>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=rsWp3.get("empl_nm",i)%></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=FormatUtil.juminNo(rsWp3.get("cust_reg_no",i),"x")%>&nbsp;</td>
		<% }else { %>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=rsWp3.get("cust_nm",i)%></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'><%=FormatUtil.bizRegiNoFormat(rsWp3.get("cust_reg_no",i))%>&nbsp;</td>
		<% } %>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'><%=slip_amt_tmp3%></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 <% }else { %>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 <% } %>
	 </tr>
<% } %>
<% for(int i=0; i < 5-row_cnt2; i++) { %>
 <tr height=22 style='height:16.5pt'>
		  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
		  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 </tr>
<% } %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=2 rowspan=5 height=110 class=xl110 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #4C4C4C;height:82.5pt;width:98pt'>Ⅳ.<br>
    기 타</td>
<% for(int i=0; i < 5; i++) { %>
	 <%if(i>0){%><tr height=22 style='height:16.5pt'><%}%>
	  <td colspan=2 class=xl112 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
	  <td colspan=2 class=xl112 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
	  <td colspan=2 class=xl114 width=115 style='border-right:.5pt solid #7F7F7F; border-left:none;width:87pt'></td>
	  <td colspan=2 class=xl116 width=100 style='border-right:.5pt solid #7F7F7F; border-left:none;width:75pt'></td>
	  <td colspan=2 class=xl116 width=100 style='border-left:none;width:75pt'>　</td>
	 </tr>
<% } %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=8 height=22 class=xl127 width=460 style='border-right:.5pt solid #7F7F7F;
  height:16.5pt;width:347pt'>⑥계</td>
  <td colspan=2 class=xl130 width=100 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:75pt'><%=FormatUtil.insertComma(String.valueOf(slip_amt_sum1+slip_amt_sum2+slip_amt_sum3))%></td>
  <td colspan=2 class=xl130 width=100 style='border-left:none;width:75pt'>　</td>
 </tr>
 <tr height=88 style='height:66.0pt;mso-xlrowspan:4'>
  <td height=88 colspan=12 style='height:66.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 colspan=11 style='height:16.5pt;mso-ignore:colspan'></td>
  <td class=xl131></td>
 </tr>
 <tr height=176 style='height:132.0pt;mso-xlrowspan:8'>
  <td height=176 colspan=12 style='height:132.0pt;mso-ignore:colspan'></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=12 height=22 class=xl132 style='height:16.5pt'>210mm×297mm[백상지
  80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>

</body>

</html>
