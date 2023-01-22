<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
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
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<title>법령안</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.79in .79in .59in .79in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;}
ruby
	{ruby-align:left;}
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
	font-size:8.7pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:13.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font10
	{color:black;
	font-size:10.0pt;
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
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl72
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl79
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl80
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	font-size:10.0pt;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl100
	{mso-style-parent:style0;
	font-size:10.0pt;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	font-size:10.0pt;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl114
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl117
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl118
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	font-size:10.0pt;
	border:.5pt solid windowtext;}
.xl144
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl154
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	font-size:10.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl178
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl179
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	font-size:7.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:top;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
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
<![if !supportTabStrip]><script language="JavaScript">
<!--
function fnUpdateTabs()
 {
  if (parent.window.g_iIEVer>=4) {
   if (parent.document.readyState=="complete"
    && parent.frames['frTabs'].document.readyState=="complete")
   parent.fnSetActiveSheet(0);
  else
   window.setTimeout("fnUpdateTabs();",150);
 }
}

if (window.name!="frSheet")
 window.location.replace("../별지%20제15호서식%20%20(사내근로복지기금법인¸%20공동근로복지기금법인)운영상황%20보고서.htm");
else
 fnUpdateTabs();
//-->
</script>
<![endif]>
</head>

<body link="#0563C1" vlink="#954F72">

<table border=0 cellpadding=0 cellspacing=0 width=628 style='border-collapse:collapse;table-layout:fixed;width:473pt'>
	<col width=6 style='mso-width-source:userset;mso-width-alt:192;width:5pt'>
	<col width=67 style='mso-width-source:userset;mso-width-alt:2144;width:50pt'>
	<col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
	<col width=29 style='mso-width-source:userset;mso-width-alt:928;width:22pt'>
	<col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
	<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
	<col width=88 style='mso-width-source:userset;mso-width-alt:2816;width:66pt'>
	<col width=58 style='mso-width-source:userset;mso-width-alt:1856;width:44pt'>
	<col width=5 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
	<col width=38 style='mso-width-source:userset;mso-width-alt:1216;width:29pt'>
	<col width=30 style='mso-width-source:userset;mso-width-alt:960;width:23pt'>
	<col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
	<col width=44 style='mso-width-source:userset;mso-width-alt:1408;width:33pt'>
	<col width=64 style='mso-width-source:userset;mso-width-alt:2048;width:48pt'>
	<col width=55 style='mso-width-source:userset;mso-width-alt:1760;width:41pt'>
	<col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
	<col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
	<col width=41 style='mso-width-source:userset;mso-width-alt:1312;width:31pt'>
	<tr height=26 style='mso-height-source:userset;height:19.7pt'>
		<td height=26 width=6 style='height:19.7pt;width:5pt'></td>
		<td colspan=17 class=xl158 width=622 style='width:468pt'>■ 근로복지기본법 시행규칙<font class="font5"> [별지 제15호서식]</font><font class="font6"> &lt;개정 2018. 1. 29.&gt;</font></td>
	</tr>
	<tr height=32 style='mso-height-source:userset;height:24.6pt'>
		<td height=32 style='height:24.6pt'></td>
		<td colspan=7 class=xl69 width=293 style='width:220pt'>[<span style='mso-spacerun:yes'>&nbsp; </span>] 사내근로복지기금법인</td>
		<td colspan=10 rowspan=2 class=xl159 width=329 style='width:248pt'>운영상황 보고서(<%=box.get("std_yy")%>년도분)</td>
	</tr>
	<tr height=32 style='mso-height-source:userset;height:24.6pt'>
		<td height=32 style='height:24.6pt'></td>
		<td colspan=7 class=xl69 width=293 style='width:220pt'>[<span style='mso-spacerun:yes'>&nbsp; </span>] 공동근로복지기금법인</td>
	</tr>
	<tr height=18 style='mso-height-source:userset;height:14.1pt'>
		<td height=18 style='height:14.1pt'></td>
		<td colspan=2 class=xl65 width=74 style='width:55pt'></td>
		<td colspan=3 class=xl65 width=73 style='width:55pt'></td>
		<td class=xl65 width=88 style='width:66pt'></td>
		<td colspan=2 class=xl65 width=63 style='width:48pt'></td>
		<td class=xl65 width=38 style='width:29pt'></td>
		<td class=xl65 width=30 style='width:23pt'></td>
		<td class=xl65 width=20 style='width:15pt'></td>
		<td colspan=3 style='mso-ignore:colspan'></td>
		<td colspan=3 class=xl65 width=73 style='width:55pt'>(1쪽)</td>
	</tr>
	<tr height=18 style='mso-height-source:userset;height:14.1pt'>
		<td height=18 style='height:14.1pt'></td>
		<td colspan=17 class=xl160 width=622 style='width:468pt'><s style='visibility:hidden;mso-ignore:visibility'>　</s></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=7 class=xl74 width=74 style='width:55pt'>기금법인</td>
		<td colspan=9 class=xl109 width=312 style='border-left:none;width:236pt'>① 기금법인명</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>② 인가번호</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl78 style='border-right:.5pt solid black;border-left:none'><%=obox.get("corp_nm")%></td>
		<td colspan=6 class=xl78 style='border-left:none'><%=obox.get("license_no")%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl109 width=312 style='border-left:none;width:236pt'>③  설립등기일</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>④ 전화번호</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl78 style='border-right:.5pt solid black;border-left:none'><%=StringUtil.getFormatedText(obox.get("reg_ymd"),"????년??월??일")%></td>
		<td colspan=6 class=xl78 style='border-left:none'><%=obox.get("tel_no")%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl109 width=548 style='border-left:none;width:413pt;border-right:none'>⑤ 소재지</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-left:none'><%=obox.get("addr")%></td>
	</tr>
	<tr height=32 style='mso-height-source:userset;height:24.0pt'>
		<td height=32 style='height:24.0pt'></td>
		<td colspan=3 class=xl170 width=73 style='border-left:none;width:55pt'>⑥ 회계연도</td>
		<td colspan=12 class=xl67 width=475 style='border-left:none;width:358pt;border-right:none'>
			<%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????년??월??일")%> ~  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????년??월??일")%>
		</td>
	</tr>
	<tr height=8 style='mso-height-source:userset;height:6.0pt'>
		<td height=8 style='height:6.0pt'></td>
		<td colspan=17 class=xl84 width=622 style='width:468pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=6 class=xl168 width=74 style='width:55pt'>사업체</td>
		<td colspan=9 class=xl109 width=312 style='border-left:none;width:236pt'>⑦ 대표자</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>⑧ 업종</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl122 width=312 style='border-left:none;width:236pt'><%=obox.get("mo_rep_person")%></td>
		<td colspan=6 class=xl122 width=236 style='border-left:none;width:177pt;border-right:none'><%=obox.get("mo_upjong")%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl109 width=312 style='border-left:none;width:236pt'>⑨ 근로자 수(명)</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>⑩ 협력업체 근로자 수(명)</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=9 class=xl122 width=312 style='border-left:none;width:236pt'><%=obox.get("empl_cnt")%> 명</td>
		<td colspan=6 class=xl161 width=236 style='border-left:none;width:177pt;border-right:none'></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl107 width=548 style='border-left:none;width:413pt'>⑪ 납입자본금(천원)</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-left:none'><%=String.valueOf(Math.round(obox.getLong("capital_amt") / 1000.0))%></td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td height=7 style='height:5.85pt'></td>
		<td colspan=17 class=xl84 width=622 style='width:468pt'>　</td>
	</tr>
 <%  
	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3","","", uSesEnt.dbo); // 기금총액
	Long amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
	Long amt_3_cur_acum = rbox.getLong("cur_acum"); 
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3100103","","", uSesEnt.dbo); // 기금(기본재산)
	Long amt_3100103_dae_amt = rbox.getLong("dae_amt"); 
	Long amt_3100103_cha_amt = rbox.getLong("cha_amt"); 
%>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=12 class=xl175 width=74 style='border-right:.5pt solid black;border-bottom:.5pt solid black;width:55pt'>기본재산현황<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(천원)</td>
		<td colspan=15 class=xl107 width=548 style='width:413pt'>⑫ 전기 말 기본재산 총액</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-right:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol / 1000.0)))%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=8 class=xl67 width=36 style='width:27pt'>당기변동금액</td>
		<td rowspan=4 class=xl67 width=37 style='border-top:none;width:28pt'>증가</td>
		<td colspan=6 class=xl92 width=239 style='border-left:none;width:181pt'>⑬ 사업주  출연</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>⑭ 수익금ㆍ이월금 전입</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl122 width=239 style='width:181pt;border-right:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))%></td>
		<td colspan=6 class=xl122 width=236 style='border-left:none;width:177pt;border-right:none'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl93 width=239 style='border-right:.5pt solid black;border-left:none;width:181pt'>⑮ 사업주 외의 자 출연</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'><font class="font10">&#9327;</font><font class="font8"> 기금법인 합병</font></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl78 style='border-right:.5pt solid black;border-left:none'>　</td>
		<td colspan=6 class=xl78 style='border-left:none'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td rowspan=2 class=xl174 width=37 style='border-bottom:.5pt solid black;border-top:none;width:28pt'>감소</td>
		<td colspan=6 class=xl109 width=239 style='border-left:none;width:181pt'><font class="font10">&#9328;</font><font class="font8"> 기본재산 사용</font></td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'><font class="font10">&#9329;</font><font class="font8"> 기금법인 분할 등</font></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl78 style='border-right:.5pt solid black;border-left:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt / 1000.0)))%></td>
		<td colspan=6 class=xl78 style='border-left:none'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=13 class=xl107 width=512 style='border-left:none;width:386pt'><font class="font10">&#9330;</font><font class="font8"> 소계</font></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=13 class=xl78 style='border-left:none'><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt) / 1000.0)))%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl107 width=548 style='width:413pt'><font class="font10">&#9331;</font><font class="font8"> 당기 말 기본재산 총액</font></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-right:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum / 1000.0)))%></td>
	</tr>
	<tr height=8 style='mso-height-source:userset;height:6.0pt'>
		<td height=8 style='height:6.0pt'></td>
		<td colspan=12 class=xl173 width=430 style='width:324pt'>　</td>
		<td class=xl68></td>
		<td class=xl68></td>
		<td class=xl68></td>
		<td class=xl68></td>
		<td class=xl68></td>
	</tr>
 <% 	
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11101","","", uSesEnt.dbo); // 단기금융상품
		Long amt_11101_cur_acum = rbox.getLong("cur_acum"); 
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110005","","", uSesEnt.dbo); // 기업자유예금
		amt_11101_cur_acum += rbox.getLong("cur_acum");
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11103","","", uSesEnt.dbo); // 유가증권
		Long amt_11103_cur_acum = 0L;//rbox.getLong("cur_acum"); 
		 
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","12103","","", uSesEnt.dbo); // 장기대여금
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
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=10 class=xl74 width=74 style='width:55pt'>기금 운용및 관리(천원)</td>
		<td colspan=3 rowspan=6 class=xl129 width=73 style='border-right:.5pt solid black;border-bottom:.5pt solid black;width:55pt'>운용방법</td>
		<td colspan=6 class=xl92 width=239 style='border-left:none;width:181pt'>&#12881;  금융회사 예입ㆍ예탁</td>
		<td colspan=6 class=xl92 width=236 style='border-left:none;width:177pt;border-right:none'>&#12882; 투자신탁 수익증권 매입</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl80 width=239 style='border-right:.5pt solid black;border-left:none;width:181pt'>
		<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
			0
		<% }else { %>
			<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
		<% } %>
		</td>
		<td colspan=6 class=xl80 width=236 style='border-left:none;width:177pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl109 width=239 style='border-left:none;width:181pt'>&#12883; 유가증권 매입</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>&#12884; 보유 자사주 유상증자 참여</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl80 width=239 style='border-right:.5pt solid black;border-left:none;width:181pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum / 1000.0)))%></td>
		<td colspan=6 class=xl80 width=236 style='border-left:none;width:177pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl110 width=239 style='border-left:none;width:181pt'>&#12885; (부동산)투자회사가 발행하는 주식의 매입</td>
		<td colspan=6 class=xl109 width=236 style='border-left:none;width:177pt;border-right:none'>&#12886; 기타</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=6 class=xl80 width=239 style='border-right:.5pt solid black;border-left:none;width:181pt'>　</td>
		<td colspan=6 class=xl80 width=236 style='border-left:none;width:177pt'>
		<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
			<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
		<% } %>
		</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl92 width=548 style='border-left:none;width:413pt;border-right:none'>&#12887; 근로자 대부</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum / 1000.0)))%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl109 width=548 style='border-left:none;width:413pt;border-right:none'>&#12888; 합계</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-left:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))%></td>
	</tr>
<%  
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); // 이자수입
		Long amt_61_cur_amt = rbox.getLong("cur_amt"); 
		
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", uSesEnt.dbo); // 고유목적사업준비금1
		Long amt_2200801_dae_amt = rbox.getLong("dae_amt"); 
		Long amt_2200801_cha_amt = rbox.getLong("cha_amt"); 
		Long amt_2200801_pre_iwol = rbox.getLong("pre_iwol"); 
		 
		rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", uSesEnt.dbo); // 고유목적사업준비금2
		Long amt_2200802_dae_amt = rbox.getLong("dae_amt"); 
		Long amt_2200802_cha_amt = rbox.getLong("cha_amt"); 
		Long amt_2200802_pre_iwol = rbox.getLong("pre_iwol"); 
		Long amt_tot2 = amt_61_cur_amt + amt_3100103_cha_amt + amt_2200801_pre_iwol + amt_2200802_pre_iwol;
%>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td height=7 style='height:5.85pt'></td>
		<td colspan=17 class=xl84 width=622 style='width:468pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=2 rowspan=12 class=xl74 width=74 style='width:55pt'>기금사업재원<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(천원)</td>
		<td colspan=15 class=xl92 width=548 style='border-left:none;width:413pt;border-right:none'>&#12889; 당기 기금운용 수익금</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt / 1000.0)))%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl92 width=548 style='border-left:none;width:413pt;border-right:none'>&#12890; 해당 회계연도 출연금액의 100분의 50 또는 100분의 80 범위<span style='mso-spacerun:yes'>&nbsp;</span></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'>
		<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
			
		<% }else { %>
			<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
		<% } %>
		</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl92 width=548 style='border-left:none;width:413pt;border-right:none'>&#12891; 해당 사업(장) 자본금 100분의 50 초과액</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'>
		<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
			<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
		<% } %>
		</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl93 width=548 style='border-left:none;width:413pt'>&#12892; 기본재산 100분의 20 범위</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl109 width=548 style='border-left:none;width:413pt;border-right:none'>&#12893; 이월금&nbsp;등<span style='mso-spacerun:yes'>&nbsp;</span></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl80 width=548 style='border-left:none;width:413pt'><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol) / 1000.0)))%></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl92 width=548 style='border-left:none;width:413pt;border-right:none'>&#12894; 합계</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td height=16 style='height:12.0pt'></td>
		<td colspan=15 class=xl78 style='border-left:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 / 1000.0)))%></td>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.2pt'>
		<td height=20 style='height:15.2pt'></td>
		<td colspan=17 class=xl90 width=622 style='width:468pt'>　</td>
	</tr>
	<tr height=26 style='mso-height-source:userset;height:20.1pt'>
		<td height=26 style='height:20.1pt'></td>
		<td colspan=17 class=xl91 width=622 style='width:468pt'>210mm×297mm[백상지(80g/㎡) 또는 중질지(80g/㎡)]</td>
	</tr>
	<tr height=14 style='page-break-before:always;mso-height-source:userset;height:10.5pt'>
		<td height=14 style='height:10.5pt'></td>
		<td colspan=17 class=xl181 width=622 style='width:468pt'>(2쪽)</td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=2 rowspan=30 height=160 class=xl184 width=73 style='border-bottom:1.0pt solid black;height:138.0pt;width:55pt'>기본재산 100분의 20 범위 사용 현황(천원, 명)</td>
		<td colspan=7 rowspan=3 class=xl171 width=231 style='width:174pt'>&#12895; 사용한 기본재산  총 금액</td>
		<td colspan=2 rowspan=30 class=xl182 width=68 style='border-bottom:1.0pt solid black;width:52pt'>
			해당<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span>회계연도<span style='mso-spacerun:yes'>&nbsp; </span>출연금<span
			style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>100분의<span
			style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>80범위<span
			style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>사용 현황(천원,명)
		</td>
		<td colspan=7 rowspan=5 class=xl171 width=256 style='width:192pt;border-right:none'>&#12981; 해당 회계연도 출연금</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=3 height=15 class=xl105 width=231 style='border-bottom:.5pt solid black;height:13.05pt;width:174pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=5 height=27 class=xl105 width=256 style='border-bottom:.5pt solid black;height:23.25pt;width:192pt;border-right:none'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))%></td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=7 rowspan=3 height=17 class=xl94 width=231 style='height:14.55pt;width:174pt'>&#12977; 협력업체 근로자의 복리후생 증진에 사용한 금액</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=3 height=15 class=xl96 width=231 style='border-bottom:.5pt solid black;height:13.05pt;width:174pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=5 height=27 class=xl94 width=256 style='height:23.25pt;width:192pt;border-right:none'>&#12982; 복지혜택을 받은 협력업체 근로자 수</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=7 rowspan=3 height=17 class=xl94 width=231 style='height:14.55pt;width:174pt'>&#12980; 협력업체 근로자 1명당 수혜금액</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=3 height=15 class=xl105 width=231 style='border-bottom:.5pt solid black;height:13.05pt;width:174pt'>　</td>
		<td colspan=7 rowspan=5 class=xl96 width=256 style='border-bottom:.5pt solid black;width:192pt;border-right:none'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=7 rowspan=3 height=17 class=xl94 width=231 style='height:14.55pt;width:174pt'>&#12978; 복지혜택을 받은 협력업체 근로자 수</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=5 height=27 class=xl94 width=256 style='height:23.25pt;width:192pt;border-right:none'>&#12983; 협력업체 근로자의 복리후생 증진에 사용한 금액</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=3 height=15 class=xl105 width=231 style='border-bottom:.5pt solid black;height:13.05pt;width:174pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=7 rowspan=3 height=17 class=xl94 width=231 style='height:14.55pt;width:174pt'>&#12979; 소속 근로자 1명당 수혜금액</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=5 height=25 class=xl96 width=256 style='border-bottom:1.0pt solid black;height:21.75pt;width:192pt;border-right:none'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
		<td colspan=7 rowspan=3 height=15 class=xl105 width=231 style='border-bottom:1.0pt solid black;height:13.05pt;width:174pt;border-right:none'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:4.35pt'>
	</tr>
	<tr height=9 style='mso-height-source:userset;height:6.75pt'>
		<td colspan=18 height=9 class=xl111 style='height:6.75pt'>　</td>
	</tr>
	<tr height=24 style='mso-height-source:userset;height:18.6pt'>
		<td colspan=2 rowspan=16 height=496 class=xl144 width=73 style='border-right:.5pt solid black;border-bottom:.5pt solid black;height:373.2pt;width:55pt'>사업  실적(천원, 명)</td>
		<td colspan=5 rowspan=2 class=xl155 width=168 style='border-right:.5pt solid black;border-bottom:.5pt solid black;width:126pt'>구분</td>
		<td colspan=4 class=xl163 width=131 style='border-right:.5pt solid black;border-left:none;width:100pt'>계</td>
		<td colspan=3 class=xl122 width=128 style='border-left:none;width:96pt'>목적사업</td>
		<td colspan=4 class=xl122 width=128 style='border-left:none;width:96pt;border-right:none'>대부사업</td>
	</tr>
	<tr height=24 style='mso-height-source:userset;height:18.6pt'>
		<td colspan=2 height=24 class=xl67 width=63 style='height:18.6pt;border-left:none;width:48pt'>금액</td>
		<td colspan=2 class=xl67 width=68 style='border-left:none;width:52pt'>수혜자수</td>
		<td colspan=2 class=xl67 width=64 style='border-left:none;width:48pt'>금액</td>
		<td class=xl67 width=64 style='border-top:none;border-left:none;width:48pt'>수혜자수</td>
		<td colspan=2 class=xl67 width=64 style='border-left:none;width:48pt'>금액</td>
		<td colspan=2 class=xl67 width=64 style='border-left:none;width:48pt;border-right:none'>수혜자수</td>
	</tr>
 <%  Long use_amt_tot = 0L;
	Long use_cnt_tot = 0L;
	Long loan_amt_tot = 0L;
	Long loan_cnt_tot = 0L;
	Long amt_use_loan_tot = 0L;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(i < rsWp.getLength() - 1) {
			use_amt_tot += rsWp.getLong("use_amt",i);
			use_cnt_tot += rsWp.getLong("use_cnt",i);
			loan_amt_tot += rsWp.getLong("loan_amt",i);
			loan_cnt_tot += rsWp.getLong("loan_cnt",i);
		}
%>
	<tr height=32 style='mso-height-source:userset;height:24.0pt'>
 <% if(i == 0) { %>
		<td colspan=2 rowspan=11 height=352 class=xl129 width=36 style='border-right:.5pt solid black;border-bottom:.5pt solid black;height:264.0pt;width:27pt'>복지사업비</td>
  <% } %>
		<td colspan=3 class=xl126 width=132 style='border-right:.5pt solid black;border-left:none;width:99pt'><%=rsWp.get("bugt_nm",i)%></td>
		<td colspan=2 class=xl114 width=63 style='border-right:.5pt solid black;border-left:none;width:48pt'><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i)))%></td>
		<td colspan=2 class=xl67 width=68 style='border-left:none;width:52pt'><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_cnt",i)+rsWp.getLong("loan_cnt",i)))%></td>
		<td colspan=2 class=xl114 width=64 style='border-right:.5pt solid black;border-left:none;width:48pt'><%=rsWp.get("use_amt",i,Box.THOUSAND_COMMA)%></td>
		<td class=xl67 width=64 style='border-top:none;border-left:none;width:48pt'><%=rsWp.get("use_cnt",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=2 class=xl114 style='border-left:none'><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=2 class=xl67 style='border-right:none'><%=rsWp.get("loan_cnt",i,Box.THOUSAND_COMMA)%></td>
	</tr>
<% if(i == 10) { 
		amt_use_loan_tot = rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i);
	   } %>
<% } %>
<% 	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","72","","", uSesEnt.dbo); // 일반관리비
	Long amt_72_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", uSesEnt.dbo); // 고유목적사업준비금1
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", uSesEnt.dbo); // 고유목적사업준비금2
	Long amt_22008_cur_acum = Math.round(amt_tot1 / 1000.0) + Math.round(amt_tot2 / 1000.0) + Math.round(amt_12103_cur_acum / 1000.0) - amt_use_loan_tot - amt_72_cur_amt;
%>
	<tr height=32 style='mso-height-source:userset;height:24.0pt'>
		<td colspan=5 height=32 class=xl114 width=168 style='border-right:.5pt solid black;height:24.0pt;width:126pt'>(54) 기금 운영비</td>
		<td colspan=11 class=xl87 width=387 style='border-left:none;width:292pt'><%=FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))%></td>
	</tr>
	<tr height=32 style='mso-height-source:userset;height:24.0pt'>
		<td colspan=5 height=32 class=xl114 width=168 style='border-right:.5pt solid black;height:24.0pt;width:126pt'>(55)&nbsp;잔액</td>
		<td colspan=11 class=xl87 width=387 style='border-left:none;width:292pt'><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))%></td>
	</tr>
	<tr height=32 style='mso-height-source:userset;height:24.0pt'>
		<td colspan=5 height=32 class=xl114 width=168 style='border-right:.5pt solid black;height:24.0pt;width:126pt'>(56)&nbsp;합계</td>
		<td colspan=11 class=xl87 width=387 style='border-left:none;width:292pt'><%=FormatUtil.insertComma(String.valueOf(/*Math.round(amt_tot1 / 1000.0)*/+Math.round(amt_tot2 / 1000.0)+Math.round(amt_12103_cur_acum / 1000.0)))%></td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td height=7 style='height:5.85pt'></td>
		<td class=xl66 width=67 style='width:50pt'></td>
		<td colspan=2 class=xl125 width=36 style='width:27pt'></td>
		<td colspan=7 class=xl84 width=263 style='width:199pt'>　</td>
		<td class=xl66 width=20 style='width:15pt'></td>
		<td class=xl66 width=44 style='width:33pt'></td>
		<td class=xl66 width=64 style='width:48pt'></td>
		<td colspan=4 style='mso-ignore:colspan'></td>
	</tr>
<% 	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7110900","","", uSesEnt.dbo); // 복지카드
	Long amt_7110900_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
	Long amt_tot = amt_7110900_cur_amt;
%>
	<tr height=23 style='mso-height-source:userset;height:17.85pt'>
		<td colspan=7 rowspan=2 height=50 class=xl118 width=241 style='border-right:.5pt solid black;border-bottom:.5pt solid black;height:38.7pt;width:181pt'>선택적 복지비<br>(천원, 명)</td>
		<td colspan=6 class=xl87 width=195 style='border-right:.5pt solid black;border-left:none;width:148pt'>(57)&nbsp;금액</td>
		<td colspan=5 class=xl67 width=192 style='border-left:none;width:144pt;border-right:none'>(58)&nbsp;수혜자수</td>
	</tr>
	<tr height=27 style='mso-height-source:userset;height:20.85pt'>
		<td colspan=6 height=27 class=xl72 width=195 style='border-right:.5pt solid black;height:20.85pt;border-left:none;width:148pt'><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
		<td colspan=5 class=xl85 width=192 style='border-left:none;width:144pt;border-right:none'></td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=18 class=xl84 width=622 style='width:468pt'>　</td>
	</tr>
	<tr height=23 style='mso-height-source:userset;height:17.25pt'>
		<td colspan=2 rowspan=2 height=66 class=xl118 width=73 style='border-right:.5pt solid black;border-bottom:.5pt solid black;height:49.5pt;width:55pt'>부동산<span
			style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>현황<span
			style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>(천원)
		</td>
		<td colspan=5 class=xl87 width=168 style='border-right:.5pt solid black;border-left:none;width:126pt'>&nbsp;(59)&nbsp;명칭</td>
		<td colspan=7 class=xl87 width=259 style='border-right:.5pt solid black;border-left:none;width:196pt'>(60)&nbsp;금액</td>
		<td colspan=4 class=xl67 width=128 style='border-left:none;width:96pt;border-right:none'>&nbsp;(61)&nbsp;취득일</td>
	</tr>
	<tr height=43 style='mso-height-source:userset;height:32.25pt'>
		<td colspan=5 height=43 class=xl75 width=168 style='border-right:.5pt solid black;height:32.25pt;border-left:none;width:126pt'>　</td>
		<td colspan=7 class=xl72 width=259 style='border-right:.5pt solid black;border-left:none;width:196pt'>　</td>
		<td colspan=4 class=xl70 style='border-left:none;border-right:none'>　</td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.85pt'>
		<td colspan=18 height=7 class=xl153 style='height:5.85pt'>　</td>
	</tr>
	<tr height=1 style='mso-height-source:userset;height:.75pt'>
		<td height=1 style='height:.75pt'></td>
		<td colspan=13 class=xl66 width=494 style='width:372pt'></td>
		<td colspan=4 style='mso-ignore:colspan'></td>
	</tr>
	<tr height=37 style='mso-height-source:userset;height:27.75pt'>
		<td colspan=18 height=37 class=xl83 width=628 style='height:27.75pt;width:473pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>「근로복지기본법」
			제93조제 1 항제 3 호, 같은 법 시행령 제55조의4 또는 제63조제 1 항 및 같은 법 시행규칙 제30조에 따라 위와 같이 기금법인의
			운영상황을 보고합니다.
		</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=18 height=17 class=xl154 width=628 style='height:12.75pt;width:473pt'><%=box.getInt("std_yy")+1%>년&nbsp;3월&nbsp;31일</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=10 height=17 style='height:12.75pt'></td>
		<td colspan=5 class=xl83 width=213 style='width:160pt'>기금법인 대표자</td>
		<td colspan=3 class=xl133 width=73 style='width:55pt'>(서명 또는 인)</td>
	</tr>
	<tr height=22 style='mso-height-source:userset;height:17.1pt'>
		<td colspan=18 height=22 class=xl134 width=628 style='height:17.1pt;width:473pt'>&nbsp; <font class="font9">○○지방고용노동청(○○○○지청)장</font><font class="font8"> 귀하</font></td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=18 height=5 class=xl139 style='height:3.75pt'>　</td>
	</tr>
	<tr height=14 style='mso-height-source:userset;height:10.7pt'>
		<td colspan=2 rowspan=2 height=28 class=xl135 width=73 style='border-right:.5pt solid black;border-bottom:.5pt solid black;height:21.2pt;width:55pt'>첨부서류</td>
		<td colspan=15 class=xl150 width=514 style='border-right:.5pt solid black;border-left:none;width:387pt'>1. 해당 연도 결산서 1부</td>
		<td rowspan=2 class=xl148 width=41 style='border-bottom:.5pt solid black;width:31pt'>수수료 없음</td>
	</tr>
	<tr height=14 style='mso-height-source:userset;height:10.5pt'>
		<td colspan=15 height=14 class=xl140 width=514 style='border-right:.5pt solid black;height:10.5pt;border-left:none;width:387pt'>2. 다음 연도의 사업계획서(추정대차대조표와 손익계산서 포함합니다) 1부</td>
 </tr>
</table>
</body>
</html>