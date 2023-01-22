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
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.59in .98in .59in .98in;
	mso-header-margin:.47in;
	mso-footer-margin:.47in;}
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
.font7
	{color:#0070C0;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한컴바탕, serif;
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
	font-family:한컴바탕, serif;
	mso-font-charset:129;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid black;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid black;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:1.0pt solid black;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:1.0pt solid black;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:1.0pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-weight:700;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
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

<body link=blue vlink=purple class=xl65>

<table border=0 cellpadding=0 cellspacing=0 width=591 style='border-collapse:
 collapse;table-layout:fixed;width:447pt'>
 <col class=xl65 width=22 style='mso-width-source:userset;mso-width-alt:704;
 width:17pt'>
 <col class=xl65 width=25 style='mso-width-source:userset;mso-width-alt:800;
 width:19pt'>
 <col class=xl65 width=13 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col class=xl65 width=18 style='mso-width-source:userset;mso-width-alt:576;
 width:14pt'>
 <col class=xl65 width=13 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col class=xl65 width=15 style='mso-width-source:userset;mso-width-alt:480;
 width:11pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:384;
 width:9pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col class=xl65 width=14 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col class=xl65 width=13 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:384;
 width:9pt'>
 <col class=xl65 width=19 span=2 style='mso-width-source:userset;mso-width-alt:
 608;width:14pt'>
 <col class=xl65 width=11 style='mso-width-source:userset;mso-width-alt:352;
 width:8pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col class=xl65 width=13 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col class=xl65 width=14 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col class=xl65 width=4 style='mso-width-source:userset;mso-width-alt:128;
 width:3pt'>
 <col class=xl65 width=11 style='mso-width-source:userset;mso-width-alt:352;
 width:8pt'>
 <col class=xl65 width=14 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col class=xl65 width=14 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col class=xl65 width=13 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:384;
 width:9pt'>
 <col class=xl65 width=8 style='mso-width-source:userset;mso-width-alt:256;
 width:6pt'>
 <col class=xl65 width=20 style='mso-width-source:userset;mso-width-alt:640;
 width:15pt'>
 <col class=xl65 width=17 style='mso-width-source:userset;mso-width-alt:544;
 width:13pt'>
 <col class=xl65 width=21 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col class=xl65 width=19 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col class=xl65 width=23 style='mso-width-source:userset;mso-width-alt:736;
 width:17pt'>
 <col class=xl65 width=19 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col class=xl65 width=18 style='mso-width-source:userset;mso-width-alt:576;
 width:14pt'>
 <col class=xl65 width=17 style='mso-width-source:userset;mso-width-alt:544;
 width:13pt'>
 <col class=xl65 width=14 style='mso-width-source:userset;mso-width-alt:448;
 width:11pt'>
 <col class=xl65 width=15 style='mso-width-source:userset;mso-width-alt:480;
 width:11pt'>
 <col class=xl65 width=11 style='mso-width-source:userset;mso-width-alt:352;
 width:8pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:384;
 width:9pt'>
 <col class=xl65 width=12 style='mso-width-source:userset;mso-width-alt:384;
 width:9pt'>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=33 height=33 class=xl79 width=510 style='height:24.75pt;
  width:386pt'><a name="Print_Area">[별지 제17호서식] <font class="font7">&lt;개정
  2013.6.28&gt;</font></a></td>
  <td colspan=6 class=xl78 width=81 style='width:61pt'>(앞 쪽)</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=2 rowspan=4 height=64 class=xl97 width=47 style='border-bottom:
  1.0pt solid black;height:48.0pt;width:36pt'>사업<br>
    연도</td>
  <td colspan=6 rowspan=4 class=xl103 width=87 style='border-right:.5pt solid black;
  border-bottom:1.0pt solid black;width:66pt'><%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????.??.??")%><br>
  ~<br>
  <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????.??.??")%>
  <td colspan=19 rowspan=4 class=xl111 width=259 style='border-right:.5pt solid black;
  border-bottom:1.0pt solid black;width:196pt'>조정후수입금액명세서</td>
  <td colspan=6 rowspan=2 class=xl85 width=117 style='width:88pt'>법인명</td>
  <td colspan=6 rowspan=2 class=xl88 width=81 style='border-right:1.0pt solid black;
  width:61pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=6 rowspan=2 height=32 class=xl86 width=117 style='border-bottom:
  1.0pt solid black;height:24.0pt;width:88pt'>사업자등록번호</td>
  <td colspan=6 rowspan=2 class=xl90 width=81 style='border-right:1.0pt solid black;
  border-bottom:1.0pt solid black;width:61pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=11 style='mso-height-source:userset;height:8.25pt'>
  <td colspan=39 height=11 class=xl66 width=591 style='height:8.25pt;
  width:447pt'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=39 height=28 class=xl94 width=591 style='border-right:1.0pt solid black;
  height:21.0pt;width:447pt'>1. 업종별 수입금액명세서</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td colspan=4 rowspan=3 height=70 class=xl80 width=78 style='height:52.7pt;
  width:60pt'>①업태</td>
  <td colspan=4 rowspan=3 class=xl72 width=56 style='width:42pt'>②종목</td>
  <td colspan=3 rowspan=3 class=xl72 width=43 style='width:33pt'>코드</td>
  <td colspan=5 rowspan=3 class=xl72 width=77 style='width:57pt'>③기준<br>
    (단순)경비율<br>
    번호</td>
  <td colspan=23 class=xl72 width=337 style='border-right:1.0pt solid black;
  border-left:none;width:255pt'>수입금액</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=8 rowspan=2 height=45 class=xl72 width=99 style='height:33.75pt;
  width:76pt'>④계(⑤+⑥+⑦)</td>
  <td colspan=10 class=xl72 width=174 style='border-left:none;width:131pt'>내수</td>
  <td colspan=5 rowspan=2 class=xl72 width=64 style='border-right:1.0pt solid black;
  width:48pt'>⑦수<span style='mso-spacerun:yes'>&nbsp; </span>출</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=5 height=21 class=xl117 width=78 style='border-right:.5pt solid black;
  height:15.75pt;border-left:none;width:59pt'>⑤국내생산품</td>
  <td colspan=5 class=xl72 width=96 style='border-left:none;width:72pt'>⑥수입상품</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
	Long amt_61 = rbox.getLong("cur_acum"); // 이자수익+대부이자수익  %>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;101&gt;비영리</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>복지기금</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>01</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>000000</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;102&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>02</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;103&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>03</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;104&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>04</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;105&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>05</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;106&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>06</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;107&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>07</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;108&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>08</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;109&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>09</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=4 height=22 class=xl120 width=78 style='height:17.1pt;width:60pt'>&lt;110&gt;</td>
  <td colspan=4 class=xl73 width=56 style='border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>10</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=8 height=30 class=xl121 width=134 style='height:22.5pt;
  width:102pt'>&lt;111&gt;기 타</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>11</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'>　</td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'>　</td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'>　</td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=8 height=27 class=xl121 width=134 style='height:20.25pt;
  width:102pt'>&lt;112&gt;합 계</td>
  <td colspan=3 class=xl123 width=43 style='border-left:none;width:33pt'>99</td>
  <td colspan=5 class=xl73 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=8 class=xl73 width=99 style='border-left:none;width:76pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=5 class=xl73 width=78 style='border-left:none;width:59pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=5 class=xl73 width=96 style='border-left:none;width:72pt'></td>
  <td colspan=5 class=xl73 width=64 style='border-right:1.0pt solid black;
  border-left:none;width:48pt'>　</td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl67 width=22 style='height:6.75pt;width:17pt'></td>
  <td class=xl67 width=25 style='width:19pt'></td>
  <td class=xl67 width=13 style='width:10pt'></td>
  <td class=xl67 width=18 style='width:14pt'></td>
  <td class=xl67 width=13 style='width:10pt'></td>
  <td class=xl67 width=15 style='width:11pt'></td>
  <td class=xl67 width=16 style='width:12pt'></td>
  <td class=xl67 width=12 style='width:9pt'></td>
  <td class=xl67 width=16 style='width:12pt'></td>
  <td class=xl67 width=14 style='width:11pt'></td>
  <td class=xl68 width=13 style='width:10pt'></td>
  <td class=xl68 width=12 style='width:9pt'></td>
  <td class=xl68 width=19 style='width:14pt'></td>
  <td class=xl68 width=19 style='width:14pt'></td>
  <td class=xl68 width=11 style='width:8pt'></td>
  <td class=xl69 width=16 style='width:12pt'></td>
  <td class=xl69 width=13 style='width:10pt'></td>
  <td class=xl69 width=14 style='width:11pt'></td>
  <td class=xl69 width=4 style='width:3pt'></td>
  <td class=xl69 width=11 style='width:8pt'></td>
  <td class=xl69 width=14 style='width:11pt'></td>
  <td class=xl69 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=8 style='width:6pt'></td>
  <td class=xl66 width=20 style='width:15pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=21 style='width:16pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=23 style='width:17pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=39 height=28 class=xl94 width=591 style='border-right:1.0pt solid black;
  height:21.0pt;width:447pt'>2.<span style='mso-spacerun:yes'>&nbsp;
  </span>부가가치세 과세표준과 수입금액 차액 검토</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=39 height=28 class=xl124 width=591 style='border-right:1.0pt solid black;
  height:21.0pt;width:447pt'><span style='mso-spacerun:yes'>&nbsp;</span>(1)
  부가가치세 과세표준과 수입금액 차액</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=5 height=25 class=xl80 width=91 style='height:18.75pt;width:70pt'>⑧과세(일반)</td>
  <td colspan=7 class=xl72 width=98 style='border-left:none;width:74pt'>⑨과세(영세율)</td>
  <td colspan=6 class=xl72 width=92 style='border-left:none;width:69pt'>⑩면세수입금액</td>
  <td colspan=9 class=xl72 width=112 style='border-left:none;width:85pt'>⑪합계(⑧+⑨+⑩)</td>
  <td colspan=5 class=xl72 width=99 style='border-left:none;width:74pt'>⑫수입금액</td>
  <td colspan=7 class=xl72 width=99 style='border-right:1.0pt solid black;
  border-left:none;width:75pt'>⑬차액(⑪-⑫)</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=5 height=25 class=xl80 width=91 style='height:18.75pt;width:70pt'>　</td>
  <td colspan=7 class=xl72 width=98 style='border-left:none;width:74pt'>　</td>
  <td colspan=6 class=xl72 width=92 style='border-left:none;width:69pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=9 class=xl72 width=112 style='border-left:none;width:85pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=5 class=xl72 width=99 style='border-left:none;width:74pt'><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
  <td colspan=7 class=xl72 width=99 style='border-right:1.0pt solid black;
  border-left:none;width:75pt'>　</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=39 height=28 class=xl82 width=591 style='border-right:1.0pt solid black;
  height:21.0pt;width:447pt'><span style='mso-spacerun:yes'>&nbsp;</span>(2)
  수입금액과의 차액내역</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=8 rowspan=2 height=42 class=xl72 width=134 style='height:32.1pt;
  width:102pt'>⑭구분</td>
  <td colspan=2 rowspan=2 class=xl72 width=30 style='width:23pt'>⑮<br>
    코드</td>
  <td colspan=5 rowspan=2 class=xl72 width=74 style='width:55pt'>&lt;16&gt;금액</td>
  <td colspan=3 rowspan=2 class=xl72 width=43 style='width:33pt'>비고</td>
  <td rowspan=13 class=xl127 width=4 style='border-bottom:1.0pt solid black;
  border-top:none;width:3pt'>　</td>
  <td colspan=10 rowspan=2 class=xl72 width=146 style='width:111pt'>⑭구분</td>
  <td colspan=2 class=xl127 width=42 style='border-left:none;width:31pt'>⑮</td>
  <td colspan=5 rowspan=2 class=xl72 width=83 style='width:63pt'>&lt;16&gt;금액</td>
  <td colspan=3 rowspan=2 class=xl72 width=35 style='border-right:1.0pt solid black;
  width:26pt'>비 고</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 height=24 class=xl128 width=42 style='height:18.0pt;border-left:
  none;width:31pt'>코드</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>자가공급</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>21</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>거래시기차이감액</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>30</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>사업상증여</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>22</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>주세·특별소비세</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>31</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>개인적공급</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>23</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>매출누락</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>32</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>간주임대료</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>24</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>　</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>33</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td rowspan=4 height=60 class=xl73 width=22 style='height:45.0pt;border-top:
  none;width:17pt'>자산매각</td>
  <td colspan=7 rowspan=2 class=xl75 width=112 style='width:85pt'>고정자산매각액</td>
  <td colspan=2 rowspan=2 class=xl146 width=30 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:23pt'>25</td>
  <td colspan=5 rowspan=2 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 rowspan=2 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 rowspan=2 class=xl156 width=146 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:111pt'>　</td>
  <td colspan=2 rowspan=2 class=xl134 width=42 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:31pt'>34</td>
  <td colspan=5 rowspan=2 class=xl138 width=83 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:63pt'>　</td>
  <td colspan=3 rowspan=2 class=xl138 width=35 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black;width:26pt'>　</td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=7 rowspan=2 height=30 class=xl75 width=112 style='height:22.5pt;
  width:85pt'>그 밖의 자산매각액</td>
  <td colspan=2 rowspan=2 class=xl146 width=30 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:23pt'>26</td>
  <td colspan=5 rowspan=2 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 rowspan=2 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 rowspan=2 class=xl156 width=146 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:111pt'>　</td>
  <td colspan=2 rowspan=2 class=xl134 width=42 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:31pt'>35</td>
  <td colspan=5 rowspan=2 class=xl138 width=83 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:63pt'>　</td>
  <td colspan=3 rowspan=2 class=xl138 width=35 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black;width:26pt'>　</td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>잔고재고재화</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>27</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>　</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>36</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl75 width=134 style='height:15.95pt;
  width:102pt'>작업진행률차이</td>
  <td colspan=2 class=xl73 width=30 style='border-left:none;width:23pt'>28</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl75 width=146 style='border-left:none;width:111pt'>　</td>
  <td colspan=2 class=xl72 width=42 style='border-left:none;width:31pt'>37</td>
  <td colspan=5 class=xl76 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl76 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=8 height=21 class=xl129 width=134 style='height:15.95pt;
  width:102pt'>거래시기차이가산</td>
  <td colspan=2 class=xl130 width=30 style='border-left:none;width:23pt'>29</td>
  <td colspan=5 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=3 class=xl73 width=117 style='border-left:none;'>　</td>
  <td colspan=10 class=xl129 width=146 style='border-left:none;width:111pt'>&lt;17&gt;차액계</td>
  <td colspan=2 class=xl131 width=42 style='border-left:none;width:31pt'>50</td>
  <td colspan=5 class=xl132 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=3 class=xl132 width=35 style='border-right:1.0pt solid black;
  border-left:none;width:26pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=39 rowspan=2 height=36 class=xl70 width=591 style='height:28.2pt;
  width:447pt'>210mm×297mm[신문용지 70g/㎡(재활용품)]</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 class=xl66 width=22 style='height:14.1pt;width:17pt'></td>
  <td class=xl66 width=25 style='width:19pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=4 style='width:3pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=8 style='width:6pt'></td>
  <td class=xl66 width=20 style='width:15pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=21 style='width:16pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=23 style='width:17pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 class=xl66 width=22 style='height:14.1pt;width:17pt'></td>
  <td class=xl66 width=25 style='width:19pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=4 style='width:3pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=8 style='width:6pt'></td>
  <td class=xl66 width=20 style='width:15pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=21 style='width:16pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=23 style='width:17pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td height=18 class=xl66 width=22 style='height:14.1pt;width:17pt'></td>
  <td class=xl66 width=25 style='width:19pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=4 style='width:3pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=16 style='width:12pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=13 style='width:10pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=8 style='width:6pt'></td>
  <td class=xl66 width=20 style='width:15pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=21 style='width:16pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=23 style='width:17pt'></td>
  <td class=xl66 width=19 style='width:14pt'></td>
  <td class=xl66 width=18 style='width:14pt'></td>
  <td class=xl66 width=17 style='width:13pt'></td>
  <td class=xl66 width=14 style='width:11pt'></td>
  <td class=xl66 width=15 style='width:11pt'></td>
  <td class=xl66 width=11 style='width:8pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
  <td class=xl66 width=12 style='width:9pt'></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=39 rowspan=164 height=2970 class=xl66 width=591 style='height:
  2228.1pt;width:447pt'></td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
 <tr height=18 style='height:13.5pt'>
 </tr>
</table>

</body>

</html>
