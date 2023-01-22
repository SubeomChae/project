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
<title>[별지 제50호 서식] 자본금과 적립금 조정명세서(갑)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.59in .75in .51in .79in;
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
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:8.0pt;
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
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	border:.5pt solid black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	border:.5pt solid black;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl74
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
.xl75
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
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:8.0pt;
	border:.5pt solid black;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:.5pt solid black;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl90
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
.xl91
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
.xl92
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl109
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
.xl110
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
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl117
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
.xl118
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border:.5pt solid black;}
.xl133
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;}
.xl134
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:center;
	border-top:.5pt solid black;
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
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.0pt solid black;
	border-left:none;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl183
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl190
	{mso-style-parent:style0;
	text-align:center;}
.xl191
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl209
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl210
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl211
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl212
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl213
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl214
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl216
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl217
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl218
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl219
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl221
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl222
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl223
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl224
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl225
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl226
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl227
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl228
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid black;
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
 collapse;table-layout:fixed;width:466pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
 <col width=16 span=2 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col width=19 span=3 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:864;width:20pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=18 span=2 style='mso-width-source:userset;mso-width-alt:576;
 width:14pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=9 span=2 style='mso-width-source:userset;mso-width-alt:288;
 width:7pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=19 span=2 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=17 span=3 style='mso-width-source:userset;mso-width-alt:544;
 width:13pt'>
 <col width=19 span=2 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=19 span=4 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=19 span=4 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=31 height=23 class=xl125 width=575 style='height:17.25pt;
  width:430pt'>■ 법인세법 시행규칙 [별지 제50호서식(갑)] &lt;개정 2012.2.28&gt;</td>
  <td colspan=3 class=xl124 width=49 style='width:36pt'>(앞 쪽)</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=2 rowspan=4 height=64 class=xl74 width=35 style='border-right:
  .5pt solid #5D5D5D;border-bottom:1.0pt solid black;height:48.0pt;width:26pt'>사
  업<br>
    연 도</td>
  <td colspan=5 rowspan=4 class=xl104 width=87 style='border-bottom:1.0pt solid black;
  width:65pt'>.<span style='mso-spacerun:yes'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=17 rowspan=4 class=xl129 width=319 style='border-bottom:1.0pt solid black;
  width:240pt'>자본금과 적립금 조정명세서(갑)</td>
  <td colspan=5 rowspan=2 class=xl104 width=96 style='width:71pt'>법<span
  style='mso-spacerun:yes'>&nbsp; </span>인<span style='mso-spacerun:yes'>&nbsp;
  </span>명</td>
  <td colspan=5 rowspan=2 class=xl104 width=87 style='width:64pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 rowspan=2 height=32 class=xl105 width=96 style='border-bottom:
  1.0pt solid black;height:24.0pt;width:71pt'>사업자등록번호</td>
  <td colspan=5 rowspan=2 class=xl105 width=87 style='border-bottom:1.0pt solid black;
  width:64pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=34 height=6 class=xl83 width=624 style='height:5.1pt;width:466pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=34 height=26 class=xl84 width=624 style='height:19.5pt;
  width:466pt'>Ⅰ. 자본금과 적립금 계산서</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=9 rowspan=2 height=44 class=xl90 width=165 style='border-bottom:
  .5pt solid #5D5D5D;height:33.0pt;width:123pt'>①과목 또는 사항</td>
  <td colspan=2 rowspan=2 class=xl80 width=36 style='border-bottom:.5pt solid #5D5D5D;
  width:28pt'>코드</td>
  <td colspan=5 rowspan=2 class=xl80 width=81 style='border-bottom:.5pt solid #5D5D5D;
  width:61pt'>②기초잔액</td>
  <td colspan=9 class=xl80 width=178 style='border-left:none;width:133pt'>당 기 중
  증 감</td>
  <td colspan=4 rowspan=2 class=xl80 width=77 style='border-bottom:.5pt solid #5D5D5D;
  width:57pt'>⑤기 말 잔 액</td>
  <td colspan=5 rowspan=2 class=xl80 width=87 style='border-bottom:.5pt solid #5D5D5D;
  width:64pt'>비 고</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=5 height=22 class=xl87 width=89 style='height:16.5pt;border-left:
  none;width:67pt'>③감 소</td>
  <td colspan=4 class=xl87 width=89 style='border-left:none;width:66pt'>④증 가</td>
 </tr>
<% 	Long sum_2 = 0L;
	Long sum_3 = 0L;
	Long sum_4 = 0L;
	Long sum_5 = 0L;
	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","31","","", uSesEnt.dbo); // 자본금 
	sum_2 += rbox.getLong("pre_iwol");
	sum_3 += rbox.getLong("cha_wamt");
	sum_4 += rbox.getLong("dae_wamt");
	sum_5 += rbox.getLong("cur_acum"); %>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 rowspan=7 height=147 class=xl98 width=51 style='height:111.65pt;
  width:38pt'>자본금<br>
    및<br>
    잉여금<br>
    등의<br>
    계산</td>
  <td colspan=6 class=xl119 width=114 style='border-left:none;width:85pt'>1.자 본
  금</td>
  <td colspan=2 class=xl221 width=36 style='border-left:none;width:28pt'>01</td>
  <td colspan=5 class=xl225 width=81 style='border-left:none;width:61pt'><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl226 width=89 style='border-left:none;width:67pt'><%=rbox.get("cha_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl226 width=89 style='border-left:none;width:66pt'><%=rbox.get("dae_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl226 width=77 style='border-left:none;width:57pt'><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl122 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","32","","", uSesEnt.dbo); // 자본잉여금   
	sum_2 += rbox.getLong("pre_iwol");
	sum_3 += rbox.getLong("cha_wamt");
	sum_4 += rbox.getLong("dae_wamt");
	sum_5 += rbox.getLong("cur_acum"); %>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>2.자 본 잉 여 금</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>02</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'><%=rbox.get("cha_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'><%=rbox.get("dae_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","34","","", uSesEnt.dbo); // 자본조정   
	sum_2 += rbox.getLong("pre_iwol");
	sum_3 += rbox.getLong("cha_wamt");
	sum_4 += rbox.getLong("dae_wamt");
	sum_5 += rbox.getLong("cur_acum"); %>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>3.자 본 조 정</td>
  <td colspan=2 class=xl223 width=36 style='border-right:.5pt solid black;
  border-left:none;width:28pt'>15</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'><%=rbox.get("cha_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'><%=rbox.get("dae_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>4.기타포괄손익누계액</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>18</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","33","","", uSesEnt.dbo); // 이익잉여금  
	sum_2 += rbox.getLong("pre_iwol");
	sum_3 += rbox.getLong("cha_wamt");
	sum_4 += rbox.getLong("dae_wamt");
	sum_5 += rbox.getLong("cur_acum"); %>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>5.이 익 잉 여 금</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>14</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'><%=rbox.get("cha_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'><%=rbox.get("dae_wamt",Box.THOUSAND_COMMA)%></td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl85 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>　</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>17</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>6.계<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>20</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'><%=FormatUtil.insertComma(String.valueOf(sum_2))%></td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(sum_3))%></td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'><%=FormatUtil.insertComma(String.valueOf(sum_4))%></td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'><%=FormatUtil.insertComma(String.valueOf(sum_5))%></td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=9 height=21 class=xl90 width=165 style='height:15.95pt;
  width:123pt'>7.자본금과 적립금명세서(을) 계</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>21</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 rowspan=3 height=63 class=xl90 width=51 style='height:47.85pt;
  width:38pt'>손익<br>
    미계상<br>
    법인세<br>
    등</td>
  <td colspan=6 class=xl86 width=114 style='border-left:none;width:85pt'>8.법 인
  세</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>22</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>9.지 방 소 득 세</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>23</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl86 width=114 style='height:15.95pt;
  border-left:none;width:85pt'>10. 계 (8+9)</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>30</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'>　</td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'>　</td>
  <td colspan=5 class=xl81 width=87 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=9 height=21 class=xl90 width=165 style='height:15.95pt;
  width:123pt'>11.차 가 감 계(6+7-10)</td>
  <td colspan=2 class=xl222 width=36 style='border-left:none;width:28pt'>31</td>
  <td colspan=5 class=xl227 width=81 style='border-left:none;width:61pt'><%=FormatUtil.insertComma(String.valueOf(sum_2))%></td>
  <td colspan=5 class=xl228 width=89 style='border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(sum_3))%></td>
  <td colspan=4 class=xl228 width=89 style='border-left:none;width:66pt'><%=FormatUtil.insertComma(String.valueOf(sum_4))%></td>
  <td colspan=4 class=xl228 width=77 style='border-left:none;width:57pt'><%=FormatUtil.insertComma(String.valueOf(sum_5))%></td>
  <td colspan=5 class=xl132 style='border-left:none'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=34 height=26 class=xl88 width=624 style='height:19.5pt;
  width:466pt'>Ⅱ. 이월결손금 계산서</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=34 height=22 class=xl89 width=624 style='height:16.5pt;
  width:466pt'>1. 이월결손금 발생 및 증감내역</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=2 rowspan=3 height=107 class=xl90 width=35 style='height:80.25pt;
  width:26pt'>⑥<br>
    사업<br>
    연도</td>
  <td colspan=14 class=xl80 width=247 style='border-left:none;width:186pt'>이월결손금</td>
  <td colspan=10 class=xl80 width=197 style='border-left:none;width:147pt'>감 소
  내 역</td>
  <td colspan=8 class=xl80 width=145 style='border-left:none;width:107pt'>잔 액</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=8 height=24 class=xl80 width=148 style='height:18.0pt;border-left:
  none;width:111pt'>발 생 액</td>
  <td colspan=3 rowspan=2 class=xl80 width=47 style='width:36pt'>⑩<br>
    소급<br>
    공제</td>
  <td colspan=3 rowspan=2 class=xl80 width=52 style='width:39pt'>⑪<br>
    차감계</td>
  <td colspan=3 rowspan=2 class=xl80 width=55 style='width:41pt'>⑫<br>
    기공제액</td>
  <td colspan=3 rowspan=2 class=xl137 width=53 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:40pt'>⑬<br>당기<br>
    공제액</td>
  <td colspan=2 rowspan=2 class=xl80 width=51 style='width:38pt'>⑭<br>
    보전</td>
  <td colspan=2 rowspan=2 class=xl80 width=38 style='width:28pt'>⑮<br>
    계</td>
  <td colspan=3 rowspan=2 class=xl80 width=58 style='width:43pt'><font
  class="font7">&#9327;<br>
    </font><font class="font5">기한 내</font></td>
  <td colspan=2 rowspan=2 class=xl80 width=38 style='width:28pt'><font
  class="font7">&#9328;<br>
    </font><font class="font5">기한<br>
    경과</font></td>
  <td colspan=3 rowspan=2 class=xl80 width=49 style='width:36pt'><font
  class="font7">&#9329;<br>
    </font><font class="font5">계</font></td>
 </tr>
 <tr height=61 style='mso-height-source:userset;height:45.75pt'>
  <td colspan=2 height=61 class=xl80 width=35 style='height:45.75pt;border-left:
  none;width:26pt'>⑦계</td>
  <td colspan=3 class=xl80 width=52 style='border-left:none;width:39pt'>⑧일반<br>
    결손금</td>
  <td colspan=3 class=xl80 width=61 style='border-left:none;width:46pt'>⑨배
  분<br>
    한도초과<br>
    결손금<br>
    (⑨=)</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=2 height=21 class=xl134 width=35 style='height:15.95pt;
  width:26pt'>　</td>
  <td colspan=2 class=xl80 width=35 style='border-left:none;width:26pt'>　</td>
  <td colspan=3 class=xl80 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl80 width=61 style='border-left:none;width:46pt'>　</td>
  <td colspan=3 class=xl80 width=47 style='border-left:none;width:36pt'>　</td>
  <td colspan=3 class=xl92 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl92 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=3 class=xl135 width=53 style='border-right:.5pt solid black;
  border-left:none;width:40pt'>　</td>
  <td colspan=2 class=xl92 width=51 style='border-left:none;width:38pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=58 style='border-left:none;width:43pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=49 style='border-left:none;width:36pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=2 height=21 class=xl134 width=35 style='height:15.95pt;
  width:26pt'>　</td>
  <td colspan=2 class=xl80 width=35 style='border-left:none;width:26pt'>　</td>
  <td colspan=3 class=xl80 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl80 width=61 style='border-left:none;width:46pt'>　</td>
  <td colspan=3 class=xl80 width=47 style='border-left:none;width:36pt'>　</td>
  <td colspan=3 class=xl92 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl92 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=3 class=xl135 width=53 style='border-right:.5pt solid black;
  border-left:none;width:40pt'>　</td>
  <td colspan=2 class=xl92 width=51 style='border-left:none;width:38pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=58 style='border-left:none;width:43pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=49 style='border-left:none;width:36pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=2 height=21 class=xl134 width=35 style='height:15.95pt;
  width:26pt'>　</td>
  <td colspan=2 class=xl80 width=35 style='border-left:none;width:26pt'>　</td>
  <td colspan=3 class=xl80 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl80 width=61 style='border-left:none;width:46pt'>　</td>
  <td colspan=3 class=xl80 width=47 style='border-left:none;width:36pt'>　</td>
  <td colspan=3 class=xl92 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl92 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=3 class=xl135 width=53 style='border-right:.5pt solid black;
  border-left:none;width:40pt'>　</td>
  <td colspan=2 class=xl92 width=51 style='border-left:none;width:38pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=58 style='border-left:none;width:43pt'>　</td>
  <td colspan=2 class=xl92 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl92 width=49 style='border-left:none;width:36pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=2 height=21 class=xl90 width=35 style='height:15.95pt;width:26pt'>계</td>
  <td colspan=2 class=xl81 width=35 style='border-left:none;width:26pt'>　</td>
  <td colspan=3 class=xl81 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl81 width=61 style='border-left:none;width:46pt'>　</td>
  <td colspan=3 class=xl81 width=47 style='border-left:none;width:36pt'>　</td>
  <td colspan=3 class=xl81 width=52 style='border-left:none;width:39pt'>　</td>
  <td colspan=3 class=xl81 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=3 class=xl82 width=53 style='border-right:.5pt solid black;
  border-left:none;width:40pt'>　</td>
  <td colspan=2 class=xl81 width=51 style='border-left:none;width:38pt'>　</td>
  <td colspan=2 class=xl81 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl81 width=58 style='border-left:none;width:43pt'>　</td>
  <td colspan=2 class=xl81 width=38 style='border-left:none;width:28pt'>　</td>
  <td colspan=3 class=xl81 width=49 style='border-left:none;width:36pt'>　</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=34 height=40 class=xl155 width=624 style='height:30.0pt;
  width:466pt'>2. 법인세 신고 사업연도의 결손금에 동업기업으로부터 배분한도를 초과하여 배분받은 결손금(배분한도 초과결손금)이
  포함되어 있는 경우 사업연도별 이월결손금 구분내역</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=3 rowspan=4 height=109 class=xl138 width=51 style='border-right:
  .5pt solid #5D5D5D;border-bottom:.5pt solid #5D5D5D;height:81.75pt;
  width:38pt'><font class="font7">&#9330;<br>
    </font><font class="font5">법인세<br>
    신<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>고<br>
    사업연도</font></td>
  <td colspan=3 rowspan=4 class=xl143 width=57 style='border-right:.5pt solid #5D5D5D;
  border-bottom:.5pt solid #5D5D5D;width:42pt'><font class="font7">&#9331;<br>
    </font><font class="font5">동업기업<br>
    과세연도<br>
    종 료 일</font></td>
  <td colspan=3 rowspan=4 class=xl146 width=57 style='border-right:.5pt solid #5D5D5D;
  border-bottom:.5pt solid #5D5D5D;width:43pt'>(21)<br>
    손금산입한<br>
    배 분 한 도<br>
    초<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>과<br>
    결<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>손<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>금</td>
  <td colspan=3 rowspan=4 class=xl143 width=56 style='border-bottom:.5pt solid #5D5D5D;
  width:43pt'>(22)<br>
    법인세<br>
    신<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>고<br>
    사업연도<br>
    결 손 금</td>
  <td colspan=22 rowspan=2 class=xl137 width=403 style='width:300pt'>배분한도
  초과결손금이 포함된 이월결손금 사업연도별 구분</td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 rowspan=2 height=81 class=xl137 width=61 style='border-right:
  .5pt solid black;border-bottom:.5pt solid #5D5D5D;height:60.75pt;width:46pt'>(23)<br>
    합 계<br>
    (23=<br>
    (25)+(26))</td>
  <td colspan=9 class=xl80 width=178 style='border-left:none;width:133pt'>배분한도
  초과결손금 해당액</td>
  <td colspan=9 rowspan=2 class=xl80 width=164 style='border-bottom:.5pt solid #5D5D5D;
  width:121pt'>(26)법인세 신고 사업연도<br>
    <span style='mso-spacerun:yes'>&nbsp; </span>발생 이월결손금 해당액<br>
    <span style='mso-spacerun:yes'>&nbsp; </span>(⑧일반결손금으로 계상)<br>
    <span style='mso-spacerun:yes'>&nbsp; </span>((21)<font class="font7">&#8807;</font><font
  class="font5">(22)의 경우는 “0”,<br>
    <span style='mso-spacerun:yes'>&nbsp;</span>(21)＜(22)의 경우는 (22)-(21))</font></td>
 </tr>
 <tr height=59 style='mso-height-source:userset;height:44.25pt'>
  <td colspan=5 height=59 class=xl87 width=89 style='height:44.25pt;border-left:
  none;width:67pt'>(24)<br>
    이월결손금 발생<br>
    사업연도</td>
  <td colspan=4 class=xl156 width=89 style='border-left:none;width:66pt'>(25)이월결손금<br>
    ((25)=⑨)<br>
    (21)과(22) 중 작은<br>
    것에 상당하는 금액
    </td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 height=21 class=xl93 width=51 style='border-right:.5pt solid #5D5D5D;
  height:15.95pt;width:38pt'>　</td>
  <td colspan=3 class=xl95 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl95 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:43pt'>　</td>
  <td colspan=3 class=xl96 width=56 style='border-left:none;width:43pt'>　</td>
  <td colspan=4 class=xl95 width=61 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:46pt'>　</td>
  <td colspan=5 class=xl96 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl96 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=9 class=xl96 width=164 style='border-left:none;width:121pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 height=21 class=xl93 width=51 style='border-right:.5pt solid #5D5D5D;
  height:15.95pt;width:38pt'>　</td>
  <td colspan=3 class=xl95 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl95 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:43pt'>　</td>
  <td colspan=3 class=xl96 width=56 style='border-left:none;width:43pt'>　</td>
  <td colspan=4 class=xl95 width=61 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:46pt'>　</td>
  <td colspan=5 class=xl96 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl96 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=9 class=xl96 width=164 style='border-left:none;width:121pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 height=21 class=xl100 width=51 style='border-right:.5pt solid #5D5D5D;
  height:15.95pt;width:38pt'>　</td>
  <td colspan=3 class=xl102 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:42pt'>　</td>
  <td colspan=3 class=xl102 width=57 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:43pt'>　</td>
  <td colspan=3 class=xl157 width=56 style='border-left:none;width:43pt'>　</td>
  <td colspan=4 class=xl102 width=61 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:46pt'>　</td>
  <td colspan=5 class=xl157 width=89 style='border-left:none;width:67pt'>　</td>
  <td colspan=4 class=xl157 width=89 style='border-left:none;width:66pt'>　</td>
  <td colspan=9 class=xl157 width=164 style='border-left:none;width:121pt'>　</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=34 height=26 class=xl118 width=624 style='height:19.5pt;
  width:466pt'>Ⅲ. 회계기준 변경에 따른 자본금과 적립금 기초잔액 수정</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=10 rowspan=2 height=44 class=xl98 width=183 style='height:33.0pt;
  width:137pt'>(27)과목 또는 사항</td>
  <td colspan=2 rowspan=2 class=xl99 width=38 style='width:29pt'>(28)<br>
    코드</td>
  <td colspan=5 rowspan=2 class=xl111 width=80 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:60pt'>(29)<br>
    전기말 잔액</td>
  <td colspan=6 class=xl99 width=108 style='border-left:none;width:81pt'>기초잔액
  수정</td>
  <td colspan=5 rowspan=2 class=xl99 width=108 style='width:80pt'>(32)수정후
  기초잔액<br>
    ((29)+(30)+(31))</td>
  <td colspan=6 rowspan=2 class=xl99 width=107 style='width:79pt'>(33)비 고</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 height=22 class=xl80 width=53 style='height:16.5pt;border-left:
  none;width:40pt'>(30)증가</td>
  <td colspan=3 class=xl80 width=55 style='border-left:none;width:41pt'>(31)감소</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=10 height=21 class=xl110 width=183 style='height:15.95pt;
  width:137pt'>　</td>
  <td colspan=2 class=xl97 width=38 style='border-left:none;width:29pt'>　</td>
  <td colspan=5 class=xl109 width=80 style='border-right:.5pt solid black;
  border-left:none;width:60pt'>　</td>
  <td colspan=3 class=xl97 width=53 style='border-left:none;width:40pt'>　</td>
  <td colspan=3 class=xl97 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=5 class=xl97 width=108 style='border-left:none;width:80pt'>　</td>
  <td colspan=6 class=xl97 width=107 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=10 height=21 class=xl107 width=183 style='height:15.95pt;
  width:137pt'>　</td>
  <td colspan=2 class=xl108 width=38 style='border-left:none;width:29pt'>　</td>
  <td colspan=5 class=xl158 width=80 style='border-right:.5pt solid black;
  border-left:none;width:60pt'>　</td>
  <td colspan=3 class=xl108 width=53 style='border-left:none;width:40pt'>　</td>
  <td colspan=3 class=xl108 width=55 style='border-left:none;width:41pt'>　</td>
  <td colspan=5 class=xl108 width=108 style='border-left:none;width:80pt'>　</td>
  <td colspan=6 class=xl108 width=107 style='border-left:none;width:79pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=34 height=22 class=xl103 width=624 style='height:16.5pt;
  width:466pt'>210mm×297mm[일반용지 70g/㎡(재활용품)]</td>
 </tr>
</table>
</body>
</html>