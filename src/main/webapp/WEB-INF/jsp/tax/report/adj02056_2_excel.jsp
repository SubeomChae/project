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
<title>[별지 제43호의6서식] 법인지방소득세 과세표준(조정계산)및 세액신고서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
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
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font6
	{color:blue;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:13.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:8.7pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font11
	{color:black;
	font-size:8.7pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;}
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
	font-family:한양신명조, monospace;
	mso-font-charset:129;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:#787878;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:bottom;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl868
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl888
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl100
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
.xl101
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
.xl102
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
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl107
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
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
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
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt dotted black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt dotted black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #939393;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
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
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:2.9pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted black;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt dotted #7F7F7F;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt dotted #7F7F7F;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt dotted black;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:.5pt dotted #7F7F7F;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #7F7F7F;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #7F7F7F;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #5D5D5D;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #666666;
	border-left:none;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #666666;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.5pt solid #666666;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:#787878;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #939393;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl209
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl210
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl211
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl212
	{mso-style-parent:style0;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl213
	{mso-style-parent:style0;
	color:black;
	font-size:6pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl214
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl216
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl217
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl218
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl219
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl221
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl222
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl223
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl224
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl225
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl226
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl227
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl228
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl229
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	background:#999999;
	mso-pattern:black none;
	white-space:normal;}
.xl230
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#999999;
	mso-pattern:black none;
	white-space:normal;}
.xl231
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl232
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl233
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl234
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl235
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl236
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl237
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl238
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl239
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl240
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl241
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl242
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl243
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	vertical-align:top;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl244
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
.xl245
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl246
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl247
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
.xl248
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl249
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl250
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl251
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl252
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl253
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl254
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl255
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
<table border=0 cellpadding=0 cellspacing=0 width=627 style='border-collapse:
 collapse;table-layout:fixed;width:474pt'>
 <col width=57 style='mso-width-source:userset;mso-width-alt:1824;width:43pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1152;width:27pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=39 style='mso-width-source:userset;mso-width-alt:1248;width:29pt'>
 <col width=16 span=2 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col width=37 span=2 style='mso-width-source:userset;mso-width-alt:1184;
 width:28pt'>
 <col width=13 span=4 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
 <col width=22 span=3 style='mso-width-source:userset;mso-width-alt:704;
 width:17pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=23 span=2 style='mso-width-source:userset;mso-width-alt:736;
 width:17pt'>
 <col width=22 span=2 style='mso-width-source:userset;mso-width-alt:704;
 width:17pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:2688;width:63pt'>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=24 height=22 class=xl234 width=627 style='height:16.5pt;
  width:474pt'>■ 지방세법 시행규칙[별지 제43호의6서식]<font class="font5"> </font><font
  class="font6">&lt;개정 2016. 12. 30.&gt;</font></td>
 </tr>
 <tr class=xl65 height=59 style='mso-height-source:userset;height:44.85pt'>
  <td colspan=24 height=59 class=xl235 width=627 style='height:44.85pt;
  width:474pt'>법인지방소득세 과세표준(조정계산) 및 세액신고서<br>
    <font class="font7">(이자소득만 있는 비영리법인 신고용)</font></td>
 </tr>
 <tr class=xl65 height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=22 height=19 class=xl236 width=521 style='height:14.25pt;
  width:394pt'>※ 뒤쪽의 작성방법을 참고하시기 바라며, 색상이 어두운 란은 신청인이 적지 않습니다.</td>
  <td colspan=2 class=xl238 width=106 style='width:80pt'>(앞쪽)</td>
 </tr>
 <tr class=xl65 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=2 height=30 class=xl99 width=93 style='height:22.5pt;width:70pt'>접수번호</td>
  <td colspan=5 class=xl94 width=117 style='border-right:.5pt solid black;
  width:88pt'>　</td>
  <td colspan=4 class=xl96 width=100 style='width:76pt'>접수일자</td>
  <td colspan=7 class=xl97 width=128 style='border-right:.5pt solid black;
  width:98pt'>　</td>
  <td colspan=4 class=xl99 width=83 style='width:62pt'>관리번호</td>
  <td colspan=2 class=xl90 width=106 style='width:80pt'>　</td>
 </tr>
 <tr class=xl65 height=4 style='mso-height-source:userset;height:3.0pt'>
  <td colspan=11 height=4 class=xl91 width=310 style='height:3.0pt;width:234pt'>　</td>
  <td colspan=13 class=xl93 width=317 style='width:240pt'>　</td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 height=22 class=xl80 width=119 style='height:16.5pt;width:90pt'>①소
  재 지</td>
  <td colspan=13 class=xl868 width=275 style='border-right:.5pt solid #5D5D5D;
  width:208pt'><%=obox.get("addr")%></td>
  <td colspan=5 class=xl82 width=105 style='border-left:none;width:79pt'>②전자우편주소</td>
  <td colspan=3 class=xl86 width=128 style='width:97pt'><%=obox.get("email_id")%></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 height=22 class=xl81 width=119 style='height:16.5pt;width:90pt'>③법
  인 명</td>
  <td colspan=6 class=xl78 width=165 style='border-right:.5pt solid #5D5D5D;
  width:124pt'><%=obox.get("corp_nm")%></td>
  <td colspan=6 class=xl83 width=88 style='border-left:none;width:67pt'>④대표자성명</td>
  <td colspan=9 class=xl78 width=255 style='width:193pt'><%=obox.get("rep_person_nm")%></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 height=22 class=xl85 width=119 style='height:16.5pt;width:90pt'>⑤사업자등록번호</td>
  <td colspan=6 class=xl88 width=165 style='border-right:.5pt solid #5D5D5D;
  width:124pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=6 class=xl84 width=88 style='border-left:none;width:67pt'>⑥사업연도</td>
  <td colspan=4 class=xl888 width=81 style='border-right:.5pt solid gray;
  width:62pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=4 class=xl72 width=90 style='width:68pt'>⑦전화번호</td>
  <td class=xl72 width=84 style='border-top:none;width:63pt'><%=obox.get("tel_no")%></td>
 </tr>
 <tr class=xl65 height=1 style='mso-height-source:userset;height:1.35pt'>
  <td colspan=24 height=1 class=xl244 width=627 style='height:1.35pt;
  width:474pt'>　</td>
 </tr>
 <tr class=xl65 height=20 style='mso-height-source:userset;height:15.2pt'>
  <td colspan=9 height=20 class=xl245 width=284 style='border-right:.5pt solid #5D5D5D;
  height:15.2pt;width:214pt'>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  분</td>
  <td colspan=15 class=xl247 width=343 style='border-left:none;width:260pt'>법 인
  지 방 소 득 세</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td rowspan=7 height=147 class=xl103 width=57 style='border-bottom:.5pt solid black;
  height:110.25pt;border-top:none;width:43pt'>과세표준<br>
    <br>
    계산</td>
  <td colspan=8 class=xl170 width=227 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:171pt'>⑧이 자 소 득 금 액 계</td>
  <td colspan=15 class=xl229 width=343 style='border-left:none;width:260pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl170 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑨준 비 금 손 금 산 입 액</td>
  <td colspan=15 class=xl229 width=343 style='border-left:none;width:260pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl170 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑩기 부 금 손 금 산 입 액</td>
  <td colspan=15 class=xl229 width=343 style='border-left:none;width:260pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl170 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑪기부금한도초과 이월액손금산입</td>
  <td colspan=15 class=xl229 width=343 style='border-left:none;width:260pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl231 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑫각 사 업 연 도 소 득 금 액(⑧－⑨-⑩-⑪)</td>
  <td colspan=15 class=xl248 width=343 style='border-left:none;width:260pt'>0</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl170 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑬비 과 세 소 득</td>
  <td colspan=15 class=xl248 width=343 style='border-left:none;width:260pt'>0</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=8 height=21 class=xl175 width=227 style='border-right:.5pt solid #5D5D5D;
  height:15.75pt;border-left:none;width:171pt'>⑭과 세 표 준(⑫－⑬)</td>
  <td colspan=15 class=xl250 width=343 style='border-left:none;width:260pt'>0</td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td rowspan=8 height=176 class=xl100 width=57 style='border-bottom:.5pt solid black;
  height:132.0pt;border-top:none;width:43pt'>법인별<br>
    <br>
    세액의<br>
    <br>
    계산</td>
  <td colspan=8 class=xl165 width=227 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:171pt'>⑮세 율</td>
  <td colspan=15 class=xl252 width=343 style='border-left:none;width:260pt'>1&nbsp;%</td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=8 height=22 class=xl226 width=227 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:171pt'>&#9327;표 준 산 출 세 액</td>
  <td colspan=15 class=xl250 width=343 style='border-left:none;width:260pt'>0</td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=8 height=22 class=xl223 width=227 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:171pt'>(17)가 산 세 액</td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'>　</td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=8 height=22 class=xl210 width=227 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:171pt'>&#9329;가 감 계(&#9327;+&#9328;)</td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'>0</td>
 </tr> 
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","", uSesEnt.dbo); 
	Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급법인지방소득세) %>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 rowspan=3 height=66 class=xl122 width=62 style='border-right:
  .5pt solid #5D5D5D;border-bottom:.5pt solid black;height:49.5pt;width:47pt'>기
  납부<br>
    <br>
    세액</td>
  <td colspan=6 class=xl210 width=165 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:124pt'>&#9330;특별징수납부 세 액</td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=6 height=22 class=xl210 width=165 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:124pt'><font class="font11">&#9331;</font><font
  class="font8">(&nbsp;&nbsp;원천납부&nbsp;&nbsp;
  )세 액</font></td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=6 height=22 class=xl210 width=165 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:124pt'>(21)계(<font class="font11">&#9330;</font><font
  class="font8">＋</font><font class="font11">&#9331;</font><font class="font8">)</font></td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=8 height=22 class=xl210 width=227 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:171pt'>(22)차 감 납 부 할 세 액(<font
  class="font11">&#9329;</font><font class="font8">－(21))</font></td>
  <td colspan=15 class=xl254 width=343 style='border-left:none;width:260pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
 </tr>
 <tr class=xl65 height=20 style='mso-height-source:userset;height:15.6pt'>
  <td rowspan=15 height=281 class=xl104 width=57 style='border-bottom:.5pt solid black;
  height:212.55pt;border-top:none;width:43pt'>납세지별<br>
    <br>
    세액의<br>
    <br>
    계산</td>
  <td colspan=3 class=xl213 width=82 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>(23)본점/지점여부</td>
  <td colspan=12 class=xl220 width=255 style='border-right:.5pt solid black;
  border-left:none;width:193pt'><b><u>1.단일사업장</u><b>&nbsp; 2.지점 있는 법인의 본점&nbsp; 3.지점<span
  style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=7 class=xl159 width=149 style='border-right:.5pt solid #5D5D5D;
  width:113pt'>(24)특ㆍ광역시 주사업장 여부</td>
  <td class=xl66 width=84 style='border-top:none;border-left:none;width:63pt'>1.여&nbsp;
  <b><u>2.부</u></b></td>
 </tr>
 <tr class=xl65 height=20 style='mso-height-source:userset;height:15.6pt'>
  <td colspan=3 height=20 class=xl214 width=82 style='border-right:.5pt solid #5D5D5D;
  height:15.6pt;border-left:none;width:62pt'>(25)해당사업장</td>
  <td class=xl67 width=39 style='border-top:none;border-left:none;width:29pt'>명칭</td>
  <td colspan=4 class=xl217 width=106 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:80pt'><%=obox.get("corp_nm")%></td>
  <td colspan=4 class=xl217 width=52 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:40pt'>소재지</td>
  <td colspan=8 class=xl217 width=163 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:123pt'><%=obox.get("addr")%></td>
  <td colspan=2 class=xl217 width=44 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:34pt'>연락처</td>
  <td class=xl68 width=84 style='border-top:none;border-left:none;width:63pt'><%=obox.get("tel_no")%></td>
 </tr>
 <tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=23 height=22 class=xl217 width=570 style='height:16.5pt;
  border-left:none;width:431pt'>(26)안분율</td>
 </tr>
 <tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 rowspan=2 height=34 class=xl205 width=82 style='border-right:
  .5pt solid #939393;border-bottom:.5pt solid #939393;height:25.5pt;width:62pt'>구분</td>
  <td colspan=3 rowspan=2 class=xl116 width=71 style='border-right:.5pt solid #939393;
  border-bottom:.5pt solid #939393;width:53pt'>종업원 수<br>
    (명)</td>
  <td colspan=16 class=xl207 width=333 style='border-right:.5pt solid #939393;
  border-left:none;width:253pt'>건축물 연면적(㎡)</td>
  <td rowspan=2 class=xl116 width=84 style='border-bottom:.5pt solid #939393;
  border-top:none;width:63pt'>안분율(%)<br>
    (소수점6자리)</td>
 </tr>
 <tr class=xl65 height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=2 height=18 class=xl69 width=74 style='border-right:.5pt solid #939393;
  height:13.5pt;border-left:none;width:56pt'>계</td>
  <td colspan=6 class=xl69 width=88 style='border-right:.5pt solid #939393;
  border-left:none;width:67pt'>건물</td>
  <td colspan=4 class=xl69 width=81 style='border-right:.5pt solid #939393;
  border-left:none;width:62pt'>기계장치</td>
  <td colspan=4 class=xl69 width=90 style='border-right:.5pt solid #939393;
  border-left:none;width:68pt'>시설물</td>
 </tr>
 <tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 height=16 class=xl202 width=82 style='border-right:.5pt solid #939393;
  height:12.0pt;border-left:none;width:62pt'>법인전체</td>
  <td colspan=3 class=xl69 width=71 style='border-right:.5pt solid #939393;
  border-left:none;width:53pt'><%=obox.get("empl_cnt")%></td>
  <td colspan=2 class=xl69 width=74 style='border-right:.5pt solid #939393;
  border-left:none;width:56pt'>0</td>
  <td colspan=6 class=xl69 width=88 style='border-right:.5pt solid #939393;
  border-left:none;width:67pt'>0</td>
  <td colspan=4 class=xl69 width=81 style='border-right:.5pt solid #939393;
  border-left:none;width:62pt'>0</td>
  <td colspan=4 class=xl69 width=90 style='border-right:.5pt solid #939393;
  border-left:none;width:68pt'>0</td>
  <td class=xl69 width=84 style='border-top:none;border-left:none;width:63pt'>100</td>
 </tr>
 <tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 height=16 class=xl202 width=82 style='border-right:.5pt solid #939393;
  height:12.0pt;border-left:none;width:62pt'>시군구내</td>
  <td colspan=3 class=xl69 width=71 style='border-right:.5pt solid #939393;
  border-left:none;width:53pt'><%=obox.get("empl_cnt")%></td>
  <td colspan=2 class=xl69 width=74 style='border-right:.5pt solid #939393;
  border-left:none;width:56pt'>0</td>
  <td colspan=6 class=xl69 width=88 style='border-right:.5pt solid #939393;
  border-left:none;width:67pt'>0</td>
  <td colspan=4 class=xl69 width=81 style='border-right:.5pt solid #939393;
  border-left:none;width:62pt'>0</td>
  <td colspan=4 class=xl69 width=90 style='border-right:.5pt solid #939393;
  border-left:none;width:68pt'>0</td>
  <td class=xl69 width=84 style='border-top:none;border-left:none;width:63pt'>100</td>
 </tr>
 <tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 height=16 class=xl199 width=82 style='border-right:.5pt solid #939393;
  height:12.0pt;border-left:none;width:62pt'>비율(%)</td>
  <td colspan=3 class=xl70 width=71 style='border-right:.5pt solid #939393;
  border-left:none;width:53pt'>100</td>
  <td colspan=2 class=xl70 width=74 style='border-right:.5pt solid #939393;
  border-left:none;width:56pt'>100</td>
  <td colspan=6 class=xl70 width=88 style='border-right:.5pt solid #939393;
  border-left:none;width:67pt'>100</td>
  <td colspan=4 class=xl70 width=81 style='border-right:.5pt solid #939393;
  border-left:none;width:62pt'>100</td>
  <td colspan=4 class=xl70 width=90 style='border-right:.5pt solid #939393;
  border-left:none;width:68pt'>100</td>
  <td class=xl70 width=84 style='border-top:none;border-left:none;width:63pt'>100</td>
 </tr>
 <tr class=xl65 height=4 style='mso-height-source:userset;height:3.0pt'>
  <td colspan=23 height=4 class=xl179 width=570 style='height:3.0pt;border-left:
  none;width:431pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=6 height=21 class=xl181 width=153 style='border-right:.5pt solid #7F7F7F;
  height:15.75pt;border-left:none;width:115pt'>(27)납세지별 산출세액</td>
  <td colspan=7 class=xl184 width=141 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:107pt'>　</td>
  <td colspan=9 class=xl187 width=192 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:146pt'>(28)납세지별 세액공제ㆍ감면액</td>
  <td class=xl75 width=84 style='border-top:none;border-left:none;width:63pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=6 height=21 class=xl190 width=153 style='border-right:.5pt solid #7F7F7F;
  height:15.75pt;border-left:none;width:115pt'>(29)납세지별 가산세액</td>
  <td colspan=7 class=xl193 width=141 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:107pt'>　</td>
  <td colspan=9 class=xl196 width=192 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:146pt'>(30)납세지별 감면분 추가납부세액</td>
  <td class=xl76 width=84 style='border-top:none;border-left:none;width:63pt'>　</td>
 </tr>
 <tr class=xl65 height=24 style='mso-height-source:userset;height:18.6pt'>
  <td colspan=2 height=24 class=xl148 width=62 style='border-right:.5pt dotted #7F7F7F;
  height:18.6pt;border-left:none;width:47pt'>합계</td>
  <td colspan=4 class=xl150 width=91 style='border-right:.5pt dotted #7F7F7F;
  border-left:none;width:68pt'>과소(초과환급)<br>
    신고</td>
  <td colspan=2 class=xl153 width=74 style='border-right:.5pt dotted #5D5D5D;
  border-left:none;width:56pt'>납부(환급)<br>
    불성실</td>
  <td colspan=5 class=xl155 width=67 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:51pt'>기타</td>
  <td colspan=4 rowspan=2 class=xl110 width=87 style='border-right:.5pt dotted black;
  border-bottom:.5pt solid #5D5D5D;width:67pt'>(31)납세지별 <br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>기납부세액</td>
  <td colspan=5 class=xl134 width=105 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:79pt'>특별징수납부세액</td>
  <td class=xl74 width=84 style='border-top:none;border-left:none;width:63pt'>　</td>
 </tr>
 <tr class=xl65 height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=2 height=25 class=xl137 width=62 style='border-right:.5pt dotted #7F7F7F;
  height:18.75pt;border-left:none;width:47pt'>　</td>
  <td colspan=4 class=xl139 width=91 style='border-right:.5pt dotted #7F7F7F;
  border-left:none;width:68pt'>　</td>
  <td colspan=2 class=xl139 width=74 style='border-right:.5pt dotted #7F7F7F;
  border-left:none;width:56pt'>　</td>
  <td colspan=5 class=xl142 width=67 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl145 width=105 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:79pt'>수시부과세액</td>
  <td class=xl73 width=84 style='border-left:none;width:63pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=7 height=21 class=xl239 width=190 style='height:15.75pt;
  border-left:none;width:143pt'>(32)경정ㆍ수정신고 등 가감액</td>
  <td colspan=6 class=xl241 width=104 style='border-right:.5pt solid #7F7F7F;
  width:79pt'>　</td>
  <td colspan=9 class=xl71 width=192 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:146pt'>(33)탄력세율적용 조정세액</td>
  <td class=xl71 width=84 style='border-top:none;border-left:none;width:63pt'>　</td>
 </tr>
 <tr class=xl65 height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=7 height=21 class=xl239 width=190 style='height:15.75pt;
  border-left:none;width:143pt'>(34)해당 납세지에 납부할 세액</td>
  <td colspan=6 class=xl241 width=104 style='border-right:.5pt solid #5D5D5D;
  width:79pt'>　</td>
  <td colspan=10 class=xl131 width=276 style='border-left:none;width:209pt'>　</td>
 </tr>
 <tr class=xl65 height=3 style='mso-height-source:userset;height:2.85pt'>
  <td colspan=24 height=3 class=xl133 width=627 style='height:2.85pt;
  width:474pt'>　</td>
 </tr>
 <tr class=xl65 height=19 style='mso-height-source:userset;height:14.85pt'>
  <td colspan=2 rowspan=3 height=58 class=xl107 width=93 style='border-right:
  .5pt solid #5D5D5D;border-bottom:.5pt solid black;height:44.7pt;width:70pt'>환
  급 금<br>
    <br>
    계<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>좌</td>
  <td colspan=5 class=xl165 width=117 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:88pt'>(35)금융기관명</td>
  <td colspan=17 class=xl168 width=417 style='border-left:none;width:316pt'><%=obox.get("bank_nm")%></td>
 </tr>
 <tr class=xl65 height=19 style='mso-height-source:userset;height:14.85pt'>
  <td colspan=5 height=19 class=xl170 width=117 style='border-right:.5pt solid #5D5D5D;
  height:14.85pt;border-left:none;width:88pt'>(36)예 금 주</td>
  <td colspan=17 class=xl173 width=417 style='border-left:none;width:316pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr class=xl65 height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=5 height=20 class=xl175 width=117 style='border-right:.5pt solid #5D5D5D;
  height:15.0pt;border-left:none;width:88pt'>(37)계 좌 번 호</td>
  <td colspan=17 class=xl173 width=417 style='border-left:none;width:316pt'><%=obox.get("account_no")%></td>
 </tr>
 <tr class=xl65 height=42 style='mso-height-source:userset;height:31.5pt'>
  <td colspan=24 height=42 class=xl128 width=627 style='height:31.5pt;
  width:474pt'>&nbsp; 신고인은 「지방세법」 제103조의23 및 제103조의24에 따라 위의 내용을 신고하며, <font
  class="font9">위 내용을 충분히 검토하였고 신고인이 사실 그대로를 정확하게 적었음을 확인합니다.<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
 </tr>
 <tr class=xl65 height=20 style='mso-height-source:userset;height:15.6pt'>
  <td colspan=10 height=20 class=xl161 width=297 style='height:15.6pt;
  width:224pt'>신고인(대표자)</td>
  <td colspan=13 class=xl178 width=246 style='width:187pt'><%=obox.get("rep_person_nm")%></td>
  <td class=xl77 width=84 style='width:63pt'>&nbsp;(서명 또는 인)</td>
 </tr>
 <tr class=xl65 height=24 style='mso-height-source:userset;height:18.6pt'>
  <td colspan=8 height=24 class=xl162 width=194 style='height:18.6pt;
  width:146pt'><%=obox.get("tax_office")%>&nbsp;시장ㆍ군수ㆍ구청장<font class="font9">&nbsp;</font></td>
  <td colspan=16 class=xl163 width=433 style='width:328pt'>귀하</td>
 </tr>
 <tr class=xl65 height=19 style='mso-height-source:userset;height:14.25pt'>
  <td colspan=24 height=19 class=xl164 width=627 style='height:14.25pt;
  width:474pt'>210mm×297mm(백상지(80g/㎡)&nbsp;</td>
 </tr>
</table>
</body>
</html>