<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
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
<html xmlns:o="urn:schemas-microsoft-com:office:office"xmlns:x="urn:schemas-microsoft-com:office:excel"xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제3호의3서식2] 표준손익계산서(금융·보험·증권업 법인용)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.40in .7in .20in .7in;
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
.style16
	{mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	mso-style-name:"쉼표 \[0\]";
	mso-style-id:6;}
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
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font10
	{color:black;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font11
	{color:black;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font12
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font14
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font15
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font17
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font18
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font19
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font20
	{color:blue;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font21
	{color:blue;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font23
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font24
	{color:black;
	font-size:9.0pt;
	font-weight:700;
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
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:2.0pt double black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl79
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border:.5pt solid black;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl93
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl102
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:2.0pt double black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:1.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl131
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
	border-top:2.0pt double black;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #939393;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl142
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:right;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:right;
	border-top:.5pt solid black;
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
<table border=0 cellpadding=0 cellspacing=0 width=638 style='border-collapse:
 collapse;table-layout:fixed;width:479pt'>
 <col width=158 style='mso-width-source:userset;mso-width-alt:5056;width:119pt'>
 <col width=3 style='mso-width-source:userset;mso-width-alt:96;width:2pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
 <col width=122 style='mso-width-source:userset;mso-width-alt:3904;width:92pt'>
 <col width=79 span=2 style='mso-width-source:userset;mso-width-alt:2528;
 width:59pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:672'>
 <col width=117 style='mso-width-source:userset;mso-width-alt:3744;width:88pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=5 rowspan=2 height=45 class=xl136 width=402 style='border-bottom:
  1.5pt solid black;height:33.75pt;width:302pt'>■ 법인세법 시행규칙 <font class="font19">[</font><font
  class="font5">별지 제</font><font class="font19">3</font><font class="font5">호의</font><font
  class="font19">3</font><font class="font5">서식</font><font class="font19">(2)]
  </font><font class="font20">&lt;</font><font class="font21">개정 </font><font
  class="font20">2015.3.13.&gt;<span style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=4 class=xl86 width=236 style='width:177pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=4 height=23 class=xl115 width=236 style='height:17.25pt;
  width:177pt'>(3<font class="font9">쪽 중 제</font><font class="font8">1</font><font
  class="font9">쪽</font><font class="font8">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=2 height=27 class=xl137 width=161 style='border-right:.5pt solid black;
  height:20.25pt;width:121pt'><%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터</td>
  <td colspan=3 class=xl103 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>표준손익계산서</td>
  <td colspan=3 class=xl109 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>법인명</td>
  <td class=xl139 width=117 style='border-top:none;border-left:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl138 width=161 style='border-right:.5pt solid black;
  height:19.5pt;width:121pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 까지</td>
  <td colspan=3 class=xl106 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>(<font class="font10">금융ㆍ보험ㆍ증권업 법인용</font><font
  class="font11">)</font></td>
  <td colspan=3 class=xl112 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>사업자등록번호</td>
  <td class=xl77 width=117 style='border-top:none;border-left:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl96 width=638 style='height:16.5pt;width:479pt'>(<font
  class="font5">단위 </font><font class="font12">: </font><font class="font5">원</font><font
  class="font12">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl75 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td colspan=2 class=xl97 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>코드</td>
  <td class=xl65 width=122 style='border-top:none;border-left:none;width:92pt'>금
  액</td>
  <td colspan=2 class=xl97 width=158 style='border-right:.5pt solid black;
  border-left:none;width:118pt'>계 정 과 목</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>코드</td>
  <td colspan=2 class=xl98 width=117 style='border-left:none;width:88pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl140 style='height:12.75pt;border-top:none'>Ⅰ<font
  class="font15">.</font><font class="font14">영업수익</font></td>
  <td colspan=2 class=xl99 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>1</td>
  <td class=xl78 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code61_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl120 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>바<font
  class="font12">.</font><font class="font5">해외유가증권처분이익</font></td>
  <td class=xl67 width=40 style='border-top:none;border-left:none;width:30pt'>69</td>
  <td colspan=2 class=xl102 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font14">이자수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>2</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>사<font
  class="font12">.</font><font class="font5">신종증권처분</font><font class="font12">(</font><font
  class="font5">상환</font><font class="font12">)</font><font class="font5">이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>70</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font14">예적금</font><font
  class="font15">(</font><font class="font14">예치금</font><font class="font15">)</font><font
  class="font14">이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>3</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>아<font
  class="font12">.</font><font class="font5">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>71</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">대출채권이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>4</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font14">매도가능증권처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>81</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font14">매입어음이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>5</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font12">.</font><font class="font5">주식처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>82</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font14">유가증권이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>6</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font12">.</font><font class="font5">출자금처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>83</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font12">.</font><font
  class="font5">단기매매증권</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>7</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font12">.</font><font class="font5">채권처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>84</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font12">.</font><font
  class="font5">매도가능증권</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>8</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font
  class="font12">.</font><font class="font5">수익증권처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>85</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font12">.</font><font
  class="font5">만기보유증권</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>9</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>마<font
  class="font12">.</font><font class="font5">해외유가증권처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>86</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font14">채권이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>10</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>바<font
  class="font12">.</font><font class="font5">신종증권처분</font><font class="font12">(</font><font
  class="font5">상환</font><font class="font12">)</font><font class="font5">이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>87</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font14">콜론이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>11</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>사<font
  class="font12">.</font><font class="font5">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>88</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font5">할부금융이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>12</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(10)<font class="font14">유가증권평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>98</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font5">금융리스이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>13</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">주식평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>99</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font5">기업융통어음이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>14</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100201_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">채권평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>100</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font5">증권금융예치금이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>15</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100101_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">신주인수권증서평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>101</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font5">양도성정기예금증서이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>16</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">수익증권평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>102</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font5">환매조건부채권매수이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>17</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">기업융통어음평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>103</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font5">신용거래융자이자</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>18</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font5">신종증권평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>104</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><font
  class="font23"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font12">14.</font><font class="font5">주주ㆍ임원ㆍ종업원 대</font><span
  style='display:none'><font class="font5">여금 이자</font></span></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>19</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font5">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>105</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>15.<font class="font14">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>20</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'>(11)<font class="font5">매도가능증권손상차손환입</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>115</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font14">수수료수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>30</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'>(12)<font class="font5">만기보유증권손상차손환입</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>116</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">수입수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>31</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(13)<font class="font14">신탁업무운용수익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>117</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">수입보증료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>32</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(14)<font class="font14">외환거래이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>118</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">신용카드수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>33</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">외환차익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>119</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">중도해지수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>34</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">외화환산이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>120</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">수탁수수료</font><font
  class="font12">(</font><font class="font5">증권업</font><font class="font12">)</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>35</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(15)<font class="font5">파생상품거래이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>121</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font5">수익증권취급수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>36</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">선물거래이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>122</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font5">인수및주선수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>37</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">옵션거래이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>123</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font5">자산관리수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>38</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">장외파생상품거래이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>124</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font5">자문수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>39</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(16)<font class="font5">파생상품평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>125</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font5">신종증권판매수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>40</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">선물평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>126</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font5">신탁보수</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>41</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">옵션평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>127</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font5">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>42</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">장외파생상품평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>128</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font14">보험료수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>52</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(17)<font class="font5">투자부동산처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>129</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">개인보험료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>53</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(18)<font class="font5">투자부동산평가이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>130</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">단체보험료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>54</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(19)<font class="font5">충당부채 및 준비금 환입액</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>131</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">재보험수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>55</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">지급보증충당부채환입액</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>132</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">구상이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>56</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">책임준비금환입액</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>133</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font5">대출채권평가및처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>57</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">비상위험준비금환입액</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>134</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">대손충당금환입액</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>58</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>135</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">대출채권처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>59</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl122 style='border-right:.5pt solid #939393;border-left:
  none'>(20)<font class="font5">수입임대료</font><font class="font12">(</font><font
  class="font5">보험업</font><font class="font12">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>145</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font5">리스및렌탈관련수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>60</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl124 style='border-right:.5pt solid #939393;border-left:
  none'>(21)<font class="font14">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>146</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font14">배당금수익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>61</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100301_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl126 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅱ<font class="font15">.</font><font class="font14">영업비용</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>156</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font14">유가증권처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>62</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font14">이자비용</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>157</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font14">단기매매증권처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>63</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font14">예수금이자</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>158</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font12">.</font><font
  class="font5">주식처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>64</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font14">차입금이자</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>159</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font12">.</font><font
  class="font5">채권처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>65</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font14">사채이자</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>160</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font class="font12">.</font><font
  class="font5">신주인수권증서처분이</font><span style='display:none'><font class="font5">익</font></span></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>66</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font14">콜머니이자</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>161</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font class="font12">.</font><font
  class="font5">수익증권처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>67</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">환매조건부채권매도이자</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>162</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl141 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>마<font class="font12">.</font><font
  class="font5">기업융통어음처분이익</font></td>
  <td colspan=2 class=xl127 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>68</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl129 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font14">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>163</td>
  <td colspan=2 class=xl131 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl85 width=638 style='height:17.25pt;
  width:479pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl146 width=638 style='height:16.5pt;
  width:479pt'>210mm×297mm[<font class="font9">백상지 </font><font class="font7">80g/</font><font
  class="font9">㎡ 또는 중질지 </font><font class="font7">80g/</font><font
  class="font9">㎡</font><font class="font7">]</font></td>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=9 height=22 class=xl86 width=638 style='height:16.5pt;width:479pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl115 width=638 style='height:17.25pt;
  width:479pt'>(3<font class="font9">쪽 중 제</font><font class="font8">2</font><font
  class="font9">쪽</font><font class="font8">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=2 height=27 class=xl137 width=161 style='border-right:.5pt solid black;
  height:20.25pt;width:121pt'><%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터</td>
  <td colspan=3 class=xl103 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>표준손익계산서</td>
  <td colspan=3 class=xl109 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>법인명</td>
  <td class=xl139 width=117 style='border-top:none;border-left:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl138 width=161 style='border-right:.5pt solid black;
  height:19.5pt;width:121pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 까지</td>
  <td colspan=3 class=xl106 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>(<font class="font10">금융ㆍ보험ㆍ증권업 법인용</font><font
  class="font11">)</font></td>
  <td colspan=3 class=xl112 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>사업자등록번호</td>
  <td class=xl77 width=117 style='border-top:none;border-left:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl96 width=638 style='height:16.5pt;width:479pt'>(<font
  class="font5">단위 </font><font class="font12">: </font><font class="font5">원</font><font
  class="font12">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl75 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td colspan=2 class=xl97 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>코드</td>
  <td class=xl65 width=122 style='border-top:none;border-left:none;width:92pt'>금
  액</td>
  <td colspan=2 class=xl97 width=158 style='border-right:.5pt solid black;
  border-left:none;width:118pt'>계 정 과 목</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>코드</td>
  <td colspan=2 class=xl98 width=117 style='border-left:none;width:88pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font14">수수료비용</font></td>
  <td colspan=2 class=xl99 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>173</td>
  <td class=xl78 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl101 style='border-right:.5pt solid #939393;border-left:
  none'>(16)<font class="font14">외환거래손실</font></td>
  <td class=xl67 width=40 style='border-top:none;border-left:none;width:30pt'>259</td>
  <td colspan=2 class=xl102 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">지급수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>174</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">외환차손</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>260</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">신용카드관련수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>175</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">외화환산손실</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>261</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">투자상담사수수료</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>176</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(17)<font class="font14">대손상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>262</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>177</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(18)<font class="font14">판매비와 관리비</font><font class="font15">(</font><font
  class="font14">사업비</font><font class="font15">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>263</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font14">유가증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>187</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">신계약비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>264</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font14">단기매매증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>188</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">신계약상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>265</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font12">.</font><font
  class="font5">주식처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>189</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font14">급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>266</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font12">.</font><font
  class="font5">채권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>190</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font12">.</font><font class="font5">임원급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>267</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font class="font12">.</font><font
  class="font5">신주인수권증서처분손</font><span style='display:none'><font class="font5">실</font></span></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>191</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font12">.</font><font class="font5">직원급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>268</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font class="font12">.</font><font
  class="font5">수익증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>192</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font12">.</font><font class="font5">임원상여금</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>269</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>마<font class="font12">.</font><font
  class="font5">기업융통어음처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>193</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font
  class="font12">.</font><font class="font5">직원상여금</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>270</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>바<font class="font12">.</font><font
  class="font5">신종증권처분</font><font class="font12">(</font><font class="font5">상환</font><font
  class="font12">)</font><font class="font5">손</font><span style='display:none'><font
  class="font5">실</font></span></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>194</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>마<font
  class="font12">.</font><font class="font5">잡급</font><font class="font12">(</font><font
  class="font5">일용급여</font><font class="font12">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>271</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>사<font class="font12">.</font><font
  class="font5">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>195</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font14">퇴직급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>272</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font14">매도가능증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>205</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font12">.</font><font class="font5">임원퇴직급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>273</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font12">.</font><font
  class="font5">주식처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>206</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font12">.</font><font class="font5">직원퇴직급여</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>274</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font12">.</font><font
  class="font5">출자금처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>207</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font12">.</font><font class="font5">퇴직급여충당부채전입액</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>275</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다.채권처분손실</td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>208</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font14">보험료</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>276</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font class="font12">.</font><font
  class="font5">수익증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>209</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font14">복리후생비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>277</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>마<font class="font12">.</font><font
  class="font5">기업융통어음매매손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>210</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font14">여비교통비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>278</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>바<font class="font12">.</font><font
  class="font5">해외유가증권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>211</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font14">임차료</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>279</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>사.신종증권처분<font
  class="font12">(</font><font class="font5">상환</font><font class="font12">)</font><font
  class="font5">손</font><span style='display:none'><font class="font5">실</font></span></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>212</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font12">.</font><font class="font5">부동산임차료</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>280</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>아<font class="font12">.</font><font
  class="font5">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>213</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font12">.</font><font class="font5">차량임차료</font><font class="font12">(</font><font
  class="font5">리스료 포함</font><font class="font12">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>281</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font14">유가증권평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>223</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl119 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font12">.</font><font class="font5">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>282</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">주식평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>224</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font14">차량유지비</font><font
  class="font15">(</font><font class="font14">유류비 포함</font><font class="font15">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>287</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2<font class="font17"><s>.</s></font><font
  class="font5">채권평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>225</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font14">접대비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>288</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">수익증권평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>226</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font14">유형자산감가상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>289</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">신주인수권증서평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>227</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font14">무형자산상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>290</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">기업융통어음평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>228</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl132 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font12">.</font><font class="font5">영업권상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>291</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font5">신종증권평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>229</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl132 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font12">.</font><font class="font5">기타 무형자산상각비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>292</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font5">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>230</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font14">세금과공과</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>293</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">매도가능증권손상차손</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>240</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>14.<font class="font14">광고선전비</font><font
  class="font15">(</font><font class="font14">판매촉진비포함</font><font class="font15">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>294</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font5">만기보유증권손상차손</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>241</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>15.<font class="font14">연구비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>295</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font5">파생상품거래손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>242</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>16.<font class="font14">경상개발비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>296</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">선물거래손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>243</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>17.<font class="font5">소모품비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>297</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">옵션거래손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>244</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>18.<font class="font5">통신비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>298</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">장외파생상품거래손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>245</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>19.<font class="font5">운반및보관료</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>299</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font5">파생상품평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>246</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>20.<font class="font5">건물ㆍ시설관리비</font><font
  class="font12">(</font><font class="font5">수선비 제외</font><font class="font12">)</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>300</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">선물평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>247</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>21.<font class="font5">수선비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>301</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">옵션평가래손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>248</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>22.<font class="font5">수도광열비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>302</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">장외파생상품평가손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>249</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>23.<font class="font5">인쇄비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>303</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font5">대출채권처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>250</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>24.<font class="font5">교육훈련비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>304</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'>(10)<font
  class="font14">신탁업무운용손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>251</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>25.<font class="font5">전산운영비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>305</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'>(11)<font
  class="font5">리스및렌탈관련비용</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>252</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><font class="font24"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font15">26.</font><font class="font14">기타 판매비와 관리비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>306</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'>(12)<font
  class="font14">책임준비금등전입액</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>253</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl124 style='border-right:.5pt solid #939393;border-left:
  none'>(19)<font class="font14">기타영업비용</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>316</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font5">책임준비금전입액</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>254</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl126 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅲ<font class="font15">.</font><font class="font14">영업손익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>326</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">비상위험준비금전입액</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>255</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl126 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅳ<font class="font15">.</font><font class="font14">영업외수익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>327</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'>(13)<font
  class="font14">보험</font><font class="font15">.</font><font class="font14">배당</font><font
  class="font15">.</font><font class="font14">환급금 비용</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>256</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font14">유형자산처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>328</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'>(14)<font
  class="font5">재보험비용</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>257</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">유형자산손상차손환입</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>329</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 style='height:12.75pt;border-top:none'>(15)<font
  class="font5">재보험료비용</font></td>
  <td colspan=2 class=xl127 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>258</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl134 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">비업무용자산처분이익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>330</td>
  <td colspan=2 class=xl131 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 rowspan=2 height=45 class=xl85 width=638 style='height:33.75pt;
  width:479pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=9 height=22 class=xl147 width=638 style='height:16.5pt;
  width:479pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl115 width=638 style='height:17.25pt;
  width:479pt'>(3<font class="font9">쪽 중 제</font><font class="font8">3</font><font
  class="font9">쪽</font><font class="font8">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=2 height=27 class=xl137 width=161 style='border-right:.5pt solid black;
  height:20.25pt;width:121pt'><%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터</td>
  <td colspan=3 class=xl103 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>표준손익계산서</td>
  <td colspan=3 class=xl109 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>법인명</td>
  <td class=xl139 width=117 style='border-top:none;border-left:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl138 width=161 style='border-right:.5pt solid black;
  height:19.5pt;width:121pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 까지</td>
  <td colspan=3 class=xl106 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>(<font class="font10">금융ㆍ보험ㆍ증권업 법인용</font><font
  class="font11">)</font></td>
  <td colspan=3 class=xl112 width=119 style='border-right:.5pt solid black;
  border-left:none;width:89pt'>사업자등록번호</td>
  <td class=xl77 width=117 style='border-top:none;border-left:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl96 width=638 style='height:16.5pt;width:479pt'>(<font
  class="font5">단위 </font><font class="font12">: </font><font class="font5">원</font><font
  class="font12">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl75 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td colspan=2 class=xl97 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>코드</td>
  <td class=xl65 width=122 style='border-top:none;border-left:none;width:92pt'>금
  액</td>
  <td colspan=2 class=xl97 width=158 style='border-right:.5pt solid black;
  border-left:none;width:118pt'>계 정 과 목</td>
  <td class=xl66 width=40 style='border-top:none;border-left:none;width:30pt'>코드</td>
  <td colspan=2 class=xl98 width=117 style='border-left:none;width:88pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font14">지분법이익</font></td>
  <td colspan=2 class=xl99 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>331</td>
  <td class=xl78 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl101 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font14">지분법손실</font></td>
  <td class=xl67 width=40 style='border-top:none;border-left:none;width:30pt'>351</td>
  <td colspan=2 class=xl102 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font14">전기오류수정이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>332</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">지분법주식처분손실</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>352</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font14">자산수증이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>333</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><font class="font24"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font15">(6)</font><font class="font14">「조세특례제한법」 상 준비금</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>353</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font14">채무면제</font><font
  class="font15">(</font><font class="font14">조정</font><font class="font15">)</font><font
  class="font14">이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>334</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font14">기부금</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>354</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font14">보험차익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>335</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font14">전기오류수정손실</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>355</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font5">지분법주식처분이익</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>336</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font14">재해손실</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>356</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'>(10)<font
  class="font14">수입임대료</font><font class="font15">(</font><font class="font14">보험업
  외</font><font class="font15">)</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>337</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl95 style='border-right:.5pt solid #939393;border-left:
  none'>(10)<font class="font5">유입물건관리비</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>357</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'>(11)<font
  class="font14">기타</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>338</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl94 style='border-right:.5pt solid #939393;border-left:
  none'>(11)<font class="font14">기타</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>358</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'>Ⅴ<font
  class="font15">.</font><font class="font14">영업외비용</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>347</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl91 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅵ<font class="font15">.</font><font class="font14">법인세비용차감전손익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>368</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'><%=rbox.get("code6164_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font14">유형자산처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>348</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl91 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅶ<font class="font15">.</font><font class="font14">법인세비용</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>369</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'><%=rbox.get("code7500101_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">유형자산손상차손</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>349</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl91 style='border-right:.5pt solid #939393;border-left:
  none'>Ⅷ<font class="font15">.</font><font class="font14">당기순손익</font></td>
  <td class=xl68 width=40 style='border-top:none;border-left:none;width:30pt'>370</td>
  <td colspan=2 class=xl93 width=117 style='border-left:none;width:88pt'><%=rbox.get("code616475_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl72 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">비업무용자산처분손실</font></td>
  <td colspan=2 class=xl80 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>350</td>
  <td class=xl79 width=122 style='border-top:none;border-left:none;width:92pt'></td>
  <td colspan=2 class=xl77 width=158 style='border-right:.5pt solid #939393;
  border-left:none;width:118pt'>　</td>
  <td class=xl69 width=40 style='border-top:none;border-left:none;width:30pt'>　</td>
  <td colspan=2 class=xl83 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl84 width=638 style='height:17.25pt;
  width:479pt'>　</td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=9 rowspan=12 height=432 class=xl85 width=638 style='border-bottom:
  1.5pt solid black;height:324.0pt;width:479pt'>　</td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl88 width=638 style='height:17.25pt;
  width:479pt'>작성방법</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=9 height=30 class=xl89 width=638 style='height:22.5pt;width:479pt'>※
  이 표준손익계산서는 기업회계기준<font class="font8">(K-IFRS, </font><font class="font9">중소기업회계기준
  등</font><font class="font8">)</font><font class="font9">을 준용하여 작성한 손익계산서를
  기준으로 다음과 같이</font><font class="font8"> </font><font class="font9">작성하여야 합니다</font><font
  class="font8">.</font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=9 height=30 class=xl90 width=638 style='height:22.5pt;width:479pt'>1.
  <font class="font9">해당 법인이 기업회계기준을 준용하여 작성한 대차대조표를 기준으로 하여 </font><font
  class="font18">음영 표시된 항목란</font><font class="font9">에만 기재하여 작성할 수 있습니다</font><font
  class="font8">.</font></td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:33.75pt'>
  <td colspan=9 height=45 class=xl90 width=638 style='height:33.75pt;
  width:479pt'>2. <font class="font9">이 표준손익계산서는 표준대차대조표</font><font
  class="font8">[</font><font class="font9">금융ㆍ보험ㆍ증권업 법인용</font><font
  class="font8">(</font><font class="font9">금융관련서비스업 중 기타금융서비스업과 보험 및 연금관련
  서비스업을 제외합니다</font><font class="font8">)] [</font><font class="font9">별지 제</font><font
  class="font8">3</font><font class="font9">호의</font><font class="font8">2</font><font
  class="font9">서식</font><font class="font8">(3)]</font><font class="font9">의
  작성대상 법인이 작성하며 기업회계기준에 따른 계속사업과 중단사업에서 발생하는 손익을 포함합니다</font><font class="font8">.<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl90 width=638 style='height:16.5pt;width:479pt'>3.
  <font class="font9">손익계산서의 계정과목과 동일한 계정과목이 없는 경우에는 기타란에 회사에서 사용하는 계정과목과 금액을
  적습니다</font><font class="font8">.</font></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl135 width=638 style='height:16.5pt;
  width:479pt'>　</td>
 </tr>
</table>
</body>
</html>
