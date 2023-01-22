<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = box.get("excel_file_nm");
	excel_file_nm = StringUtil.get8859_1(excel_file_nm); // 서버에서는 주석처리
	response.reset();
    if(lm_sAgentType.indexOf("MSIE 5.5") > -1 || lm_sAgentType.indexOf("MSIE 6.0") > -1) {
	    response.setHeader("Content-Type",        "doesn/matter;");
	    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls");
    }else {
	    response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
    	response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls");
	}
	response.setHeader("Content-Transfer-Encoding", "binary;");
	response.setHeader("Pragma", "no-cache;");
	response.setHeader("Expires", "-1;");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제47호 서식] 주요계정명세서(갑)</title>
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
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
<table border=0 cellpadding=0 cellspacing=0 width=629 style='border-collapse:
 collapse;table-layout:fixed;width:475pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1440;width:34pt'>
 <col width=30 style='mso-width-source:userset;mso-width-alt:960;width:23pt'>
 <col width=44 style='mso-width-source:userset;mso-width-alt:1408;width:33pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
 <col width=37 span=3 style='mso-width-source:userset;mso-width-alt:1184;
 width:28pt'>
 <col width=34 style='mso-width-source:userset;mso-width-alt:1088;width:26pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=39 style='mso-width-source:userset;mso-width-alt:1248;width:29pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=23 span=2 style='mso-width-source:userset;mso-width-alt:736;
 width:17pt'>
 <col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
 <col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=16 height=31 class=xl78 width=579 style='height:23.25pt;
  width:437pt'>■ 법인세법 시행규칙 [별지 제47호서식(갑)] <font class="font5">&lt;개정
  2014.3.14&gt;</font></td>
  <td class=xl72 width=50 style='width:38pt'>(앞쪽)</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 rowspan=4 height=67 class=xl120 width=75 style='border-bottom:
  1.0pt solid black;height:50.25pt;width:57pt'>사 업<br>
    연 도</td>
  <td colspan=2 rowspan=4 class=xl199 width=81 style='border-right:.5pt solid #595959;
  border-bottom:1.0pt solid black;width:61pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=7 rowspan=4 class=xl123 width=264 style='border-right:.5pt solid #5D5D5D;
  border-bottom:1.0pt solid black;width:200pt'>주요계정명세서(갑)</td>
  <td colspan=3 rowspan=2 class=xl129 width=99 style='width:74pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=3 rowspan=2 class=xl129 width=110 style='width:83pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td colspan=3 rowspan=2 height=34 class=xl130 width=99 style='border-bottom:
  1.0pt solid black;height:25.5pt;width:74pt'>사업자등록번호</td>
  <td colspan=3 rowspan=2 class=xl130 width=110 style='border-bottom:1.0pt solid black;
  width:83pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=17 height=6 class=xl75 width=629 style='height:5.1pt;width:475pt'>　</td>
 </tr>
 <tr height=41 style='mso-height-source:userset;height:30.75pt'>
  <td colspan=5 height=41 class=xl77 width=206 style='height:30.75pt;
  width:156pt'>① 구<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>분</td>
  <td colspan=4 class=xl135 width=145 style='border-right:.5pt solid black;
  width:110pt'>② 근거법 조항</td>
  <td class=xl73 width=32 style='width:24pt'>코드</td>
  <td colspan=2 class=xl76 width=76 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:57pt'>③회사계상<br>
    금액</td>
  <td colspan=3 class=xl76 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>④세무상부인<br>
    (조정)금액</td>
  <td colspan=2 class=xl76 width=87 style='border-left:none;width:66pt'>⑤차가감금액<br>
    (③-④)</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7400101","","", uSesEnt.dbo); 
	Long amt_22008 = rbox.getLong("cur_acum"); // 고유목적사업준비금 %>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td rowspan=5 height=150 class=xl65 width=45 style='border-bottom:.5pt solid black;
  height:115.5pt;width:34pt'>준비금<br>
    충당금<br>
    등</td>
  <td colspan=4 class=xl138 width=161 style='border-left:none;width:122pt'>(101)고유목적사업준비금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제29조<br>
    「조세특례제한법」 제74조</td>
  <td class=xl69 width=32 style='width:24pt'>53</td>
  <td colspan=2 class=xl82 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'><%=FormatUtil.insertComma(String.valueOf(amt_22008))%></td>
  <td colspan=3 class=xl82 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>0</td>
  <td colspan=2 class=xl82 width=87 style='border-left:none;width:66pt'><%=FormatUtil.insertComma(String.valueOf(amt_22008))%></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(102)퇴직급여충당금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제33조</td>
  <td class=xl67 width=32 style='width:24pt'>12</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(103)퇴직연금부담금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법 시행령」 제44조의2</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>71</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(104)대손충당금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제34조</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>13</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl98 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(105)대손금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제19조의2</td>
  <td class=xl68 width=32 style='border-top:none;width:24pt'>72</td>
  <td colspan=2 class=xl90 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl90 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl90 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td rowspan=5 height=150 class=xl65 width=45 style='border-bottom:.5pt solid black;
  height:115.5pt;border-top:none;width:34pt'>손금<br>
    산입</td>
  <td colspan=4 class=xl88 width=161 style='border-left:none;width:122pt'>(106)합병양도손익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제44조</td>
  <td class=xl66 width=32 style='border-top:none;width:24pt'>55</td>
  <td colspan=2 class=xl85 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl85 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl85 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(107)분할양도손익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제46조</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>56</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(108)물적분할자산양도차익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제47조</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>57</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl96 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(125)선물출자자산양도차익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제47조의 2</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>50</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:23.1pt'>
  <td colspan=4 height=30 class=xl98 width=161 style='height:23.1pt;border-left:
  none;width:122pt'>(109)교환자산양도차익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제50조</td>
  <td class=xl68 width=32 style='border-top:none;width:24pt'>58</td>
  <td colspan=2 class=xl90 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl90 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl90 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl65 width=45 style='height:30.0pt;border-top:none;
  width:34pt'>익<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>금<br>
    분산입</td>
  <td colspan=4 class=xl138 width=161 style='border-left:none;width:122pt'>(110)채무면제익
  등 이월결손금 보전액<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제18조제6호</td>
  <td class=xl69 width=32 style='border-top:none;width:24pt'>59</td>
  <td colspan=2 class=xl82 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl82 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl82 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300901","","", uSesEnt.dbo); 
	Long amt_7300901 = rbox.getLong("cur_acum"); // 법정기부금  %>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td rowspan=5 height=175 class=xl65 width=45 style='border-bottom:.5pt solid black;
  height:131.25pt;width:34pt'>기부금</td>
  <td colspan=4 class=xl88 width=161 style='border-left:none;width:122pt'>(112)법정기부금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제24조제2항</td>
  <td class=xl66 width=32 style='width:24pt'>41</td>
  <td colspan=2 class=xl85 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'><%=FormatUtil.insertComma(String.valueOf(amt_7300901))%></td>
  <td colspan=3 class=xl85 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>0</td>
  <td colspan=2 class=xl85 width=87 style='border-left:none;width:66pt'><%=FormatUtil.insertComma(String.valueOf(amt_7300901))%></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl96 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(113)특례기부금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「조세특례제한법」 제73조제1항</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>64</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl96 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(114)지정기부금 한도액</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제24조제1항</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>66</td>
  <td colspan=2 class=xl100 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl100 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300902","","", uSesEnt.dbo); 
	Long amt_7300902 = rbox.getLong("cur_acum"); // 지정기부금  %>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl96 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(115)지정기부금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제24조제1항</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>42</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'><%=FormatUtil.insertComma(String.valueOf(amt_7300902))%></td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>0</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'><%=FormatUtil.insertComma(String.valueOf(amt_7300902))%></td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300999","","", uSesEnt.dbo); 
	Long amt_7300999 = rbox.getLong("cur_acum"); // 기타기부금  %>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl98 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(116)기타기부금</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제24조제1항</td>
  <td class=xl68 width=32 style='border-top:none;width:24pt'>73</td>
  <td colspan=2 class=xl90 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'><%=FormatUtil.insertComma(String.valueOf(amt_7300999))%></td>
  <td colspan=3 class=xl90 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>0</td>
  <td colspan=2 class=xl106 width=87 style='border-left:none;width:66pt'></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td rowspan=4 height=140 class=xl65 width=45 style='border-bottom:.5pt solid black;
  height:105.0pt;border-top:none;width:34pt'>접대비</td>
  <td colspan=4 class=xl88 width=161 style='border-left:none;width:122pt'>(117)접대비한도액</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제25조제1항</td>
  <td class=xl66 width=32 style='border-top:none;width:24pt'>49</td>
  <td colspan=2 class=xl103 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl103 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl85 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl96 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(118)접대비(119,120 포함)</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제25조제1항</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>65</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl96 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(119)기준금액 초과 접대비</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제25조제2항</td>
  <td class=xl67 width=32 style='border-top:none;width:24pt'>61</td>
  <td colspan=2 class=xl79 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl79 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl79 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=4 height=35 class=xl98 width=161 style='height:26.25pt;
  border-left:none;width:122pt'>(120)문화접대비</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「조세특례제한법」 제136조제3항</td>
  <td class=xl68 width=32 style='border-top:none;width:24pt'>67</td>
  <td colspan=2 class=xl90 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl106 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl106 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=5 height=35 class=xl98 width=206 style='height:26.25pt;
  width:156pt'>(121)외화자산ㆍ부채평가손익</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  width:110pt'>「법인세법」 제42조</td>
  <td class=xl66 width=32 style='border-top:none;width:24pt'>74</td>
  <td colspan=2 class=xl85 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl85 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl85 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=68 style='mso-height-source:userset;height:51.0pt'>
  <td colspan=2 height=68 class=xl99 width=75 style='border-right:.5pt solid black;height:51.0pt;width:57pt'>업무무관부동산
  등에 관련한 차입금이자</td>
  <td colspan=3 class=xl99 width=131 style='border-right:.5pt solid black;
  width:99pt'>(122)업무무관 부동산 등</td>
  <td colspan=4 class=xl93 width=145 style='border-right:.5pt solid black;
  border-left:none;width:110pt'>「법인세법」 제28조제1항</td>
  <td class=xl68 width=32 style='border-top:none;width:24pt'>76</td>
  <td colspan=2 class=xl106 width=76 style='border-right:.5pt solid #5D5D5D;
  width:57pt'>　</td>
  <td colspan=3 class=xl106 width=83 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:62pt'>　</td>
  <td colspan=2 class=xl90 width=87 style='border-left:none;width:66pt'>　</td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=17 height=6 class=xl110 width=629 style='height:5.1pt;width:475pt'>　</td>
 </tr>
 <tr height=46 style='mso-height-source:userset;height:34.5pt'>
  <td colspan=2 height=46 class=xl111 width=75 style='border-right:.5pt solid #5D5D5D;
  height:34.5pt;width:57pt'>상 여<br>
    배당 등</td>
  <td colspan=4 class=xl113 width=168 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:127pt'>(123)소득처분금액(「법인세법 시행령」 제106조)</td>
  <td class=xl71 width=37 style='border-top:none;border-left:none;width:28pt'>97</td>
  <td colspan=2 class=xl116 width=71 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:54pt'>　</td>
  <td colspan=4 class=xl113 width=145 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:109pt'>(124)이익처분금액<br>
    (「상법」 제462조 등)</td>
  <td class=xl71 width=23 style='border-top:none;border-left:none;width:17pt'>98</td>
  <td colspan=3 class=xl118 width=110 style='width:83pt'>　</td>
 </tr>
 <tr class=xl70 height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=17 height=33 class=xl119 width=629 style='height:24.75pt;
  width:475pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>
</body>
</html>