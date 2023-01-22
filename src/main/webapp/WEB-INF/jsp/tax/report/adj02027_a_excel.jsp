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
<title>[별지 제27호 서식] 고유목적사업준비금조정명세서(갑)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.63in .39in 0in .75in;
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
	font-size:7.8pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font11
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font12
	{color:blue;
	font-size:7.8pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:HY신명조, serif;
	mso-font-charset:129;}
.font15
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
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl68
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
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl77
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
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl89
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
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl94
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
.xl95
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
.xl96
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
.xl97
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
.xl98
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
.xl99
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
.xl100
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
.xl101
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
.xl102
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
.xl103
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
.xl104
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
.xl105
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
.xl106
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
.xl107
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
.xl108
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
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
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
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:right;}
.xl118
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
.xl119
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
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:"MS Gothic", monospace;
	mso-font-charset:128;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl133
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
.xl134
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl135
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl136
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl137
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl138
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl139
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl140
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl141
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
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl146
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
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
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
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"General\0022년\0022";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"General\0022년\0022";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl174
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
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"General\0022년\0022";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"General\0022년\0022";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl178
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
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl206
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
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl209
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl210
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl211
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl212
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl213
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl214
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl216
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl217
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #4C4C4C;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl218
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #4C4C4C;
	border-left:none;
	white-space:normal;}
.xl219
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #4C4C4C;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #4C4C4C;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
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
<table border=0 cellpadding=0 cellspacing=0 width=648 style='border-collapse:collapse;table-layout:fixed;width:484pt'>
 <col width=45 style='mso-width-source:userset;mso-width-alt:1440;width:34pt'>
 <col width=25 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
 <col width=20 span=2 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=31 style='mso-width-source:userset;mso-width-alt:992;width:23pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=35 span=7 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=20 span=2 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=35 span=2 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td colspan=20 height=37 class=xl94 width=613 style='height:27.75pt;width:458pt'>■ 법인세법 시행규칙 [별지 제27호서식(갑)]<font class="font6"> &lt;개정 2018.3.21&gt;</font></td>
  <td class=xl65 width=35 style='width:26pt'>(앞쪽)</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td rowspan=4 height=72 class=xl97 width=45 style='border-bottom:.5pt solid black;height:56.4pt;border-top:none;width:34pt'>사 업 <br>연 도</td>
  <td colspan=4 rowspan=4 class=xl95 width=100 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid black;width:75pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=9 rowspan=4 class=xl120 width=288 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid black;width:215pt'>고유목적사업준비금<br>조정명세서(갑)</td>
  <td colspan=3 rowspan=2 class=xl95 width=105 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:78pt'>법<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=4 rowspan=2 class=xl134 style='border-bottom:.5pt solid #7F7F7F'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=3 rowspan=2 height=36 class=xl101 width=105 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid black;height:28.2pt;width:78pt'>사업자등록번호</td>
  <td colspan=4 rowspan=2 class=xl138 style='border-bottom:.5pt solid black'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td colspan=11 height=5 class=xl110 width=328 style='height:3.75pt;width:246pt'>　</td>
  <td colspan=10 class=xl111 width=320 style='width:238pt'>　</td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=21 height=38 class=xl101 width=647 style='height:28.5pt;width:484pt'>&nbsp;1.&nbsp; 손금산입액 조정</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
	Long amt_61 = rbox.getLong("cur_acum"); // 이자수익+대부이자수익
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","74001","","", uSesEnt.dbo); 
	Long amt_74001 = rbox.getLong("cur_acum"); // 고유목적사업준비금전입액
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300902","","", uSesEnt.dbo); 
	Long amt_7300902 = rbox.getLong("cur_acum"); // 지정기부금
	
	Long cell_01 = 0L;
	Long cell_02 = amt_74001;
	Long cell_03 = amt_7300902;
	Long cell_04 = cell_01 + cell_02 + cell_03;
	Long cell_05 = amt_61;
	Long cell_06 = 0L;
	Long cell_07 = amt_7300902;
	Long cell_08 = cell_04 - cell_05 - cell_06 - cell_07;
	if(cell_08 < 0) { cell_08 = 0L; }
								
	Long cell_10 = (long)(cell_05 + cell_08 * 0.5);
	Long cell_11 = cell_02;
	Long cell_12 = cell_11 - cell_10; 
%>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=3 rowspan=3 height=96 class=xl155 width=90 style='border-bottom:.5pt solid #7F7F7F;height:72.0pt;width:68pt'>① 소득금액<br><br></td>
  <td colspan=3 rowspan=3 class=xl156 width=86 style='border-bottom:.5pt solid #7F7F7F;width:64pt'>② 당기 계상<span style='mso-spacerun:yes'></span>고유 목적사업<span style='mso-spacerun:yes'></span>준비금<br></td>
  <td colspan=3 rowspan=3 class=xl156 width=97 style='border-bottom:.5pt solid #7F7F7F;width:73pt'>③ 「법인세법」<br>제24조제2항에<span style='mso-spacerun:yes'></span>따른 기부금</td>
  <td colspan=3 rowspan=3 class=xl156 width=90 style='border-bottom:.5pt solid #7F7F7F;width:67pt'>④ 해당 사업연도<br>소득금액<br>(①+②+③)</td>
  <td colspan=3 rowspan=3 class=xl156 width=95 style='border-bottom:.5pt solid #7F7F7F;width:71pt'>⑤ 「법인세법」<br>제29조제1항제1호부터 제3호까지에 따른 금액</td>
  <td colspan=3 rowspan=3 class=xl156 width=99 style='border-bottom:.5pt solid #7F7F7F;width:74pt'>⑥-1 「법인세법」 <br>제13조제1호에 따른 결손금</td>
  <td colspan=3 rowspan=3 class=xl157 width=90 style='border-bottom:.5pt solid #7F7F7F;width:67pt'>⑥-2 「법인세법」 <br>제29조제1항<span style='mso-spacerun:yes'></span>제4호에 따른<span style='mso-spacerun:yes'></span>수익사업에서<span style='mso-spacerun:yes'></span>발생한 결손금</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
 </tr>
 <tr height=61 style='mso-height-source:userset;height:45.75pt'>
  <td colspan=3 height=61 class=xl165 width=90 style='height:45.75pt;width:68pt'><%=FormatUtil.insertComma(String.valueOf(cell_01))%></td>
  <td colspan=3 class=xl166 width=86 style='width:64pt'><%=FormatUtil.insertComma(String.valueOf(cell_02))%></td>
  <td colspan=3 class=xl166 width=97 style='width:73pt'><%=FormatUtil.insertComma(String.valueOf(cell_03))%></td>
  <td colspan=3 class=xl166 width=90 style='width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell_04))%></td>
  <td colspan=3 class=xl166 width=95 style='width:71pt'><%=FormatUtil.insertComma(String.valueOf(cell_05))%></td>
  <td colspan=3 class=xl166 width=99 style='width:74pt'><%=FormatUtil.insertComma(String.valueOf(cell_06))%></td>
  <td colspan=3 class=xl166 width=90 style='border-right:none;width:67pt'>0</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 rowspan=4 height=88 class=xl112 width=110 style='border-bottom:.5pt solid #7F7F7F;height:66.0pt;width:83pt'>⑦「법인세법」<br>제24조제2항에<br>따른 기부금</td>
  <td colspan=4 rowspan=4 class=xl167 width=141 style='border-bottom:.5pt solid #7F7F7F;width:105pt'>⑧ 「조세특례제한법」<span style='mso-spacerun:yes'></span>제121조의 23 및<span style='mso-spacerun:yes'></span>제121조의 25에 따른 금액&nbsp;</td>
  <td colspan=4 rowspan=4 class=xl167 width=112 style='border-bottom:.5pt solid #7F7F7F;width:84pt'>⑨ 수익사업<br>소득금액<br>(④-⑤-(⑥-1)-⑦-⑧)</td>
  <td colspan=3 rowspan=4 class=xl167 width=95 style='border-bottom:.5pt solid #7F7F7F;width:71pt'>⑩ 손금산입률<br><br></td>
  <td colspan=3 rowspan=4 class=xl167 width=99 style='border-bottom:.5pt solid #7F7F7F;width:74pt'>⑪ 손금산입한도액<br>(⑤+⑧+⑨×⑩)<span style='mso-spacerun:yes'></span>또는[⑤+⑧+(⑥-2)]<br></td>
  <td colspan=3 rowspan=4 class=xl167 width=90 style='border-right:none;border-bottom:.5pt solid #7F7F7F;width:67pt'>⑫ 손금부인액<br>[(②－⑪)&gt;0]<br></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=4 rowspan=3 height=66 class=xl114 width=110 style='border-left:none;border-bottom:.5pt solid black;height:49.5pt;width:83pt'><%=FormatUtil.insertComma(String.valueOf(cell_07))%></td>
  <td colspan=4 rowspan=3 class=xl170 width=141 style='border-bottom:.5pt solid black;width:105pt'>0</td>
  <td colspan=4 rowspan=3 class=xl170 width=112 style='border-bottom:.5pt solid black;width:84pt'><%=FormatUtil.insertComma(String.valueOf(cell_08))%></td>
  <td colspan=3 rowspan=3 class=xl171 width=95 style='border-bottom:.5pt solid black;width:71pt'><%=uSesEnt.dbo.equals("SABOK03")?"100":"50"%>(80,100)<br>-----------<br>100</td>
  <td colspan=3 rowspan=3 class=xl170 width=99 style='border-bottom:.5pt solid black;width:74pt'><%=FormatUtil.insertComma(String.valueOf(cell_10))%></td>
  <td colspan=3 rowspan=3 class=xl170 width=90 style='border-bottom:.5pt solid black;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell_12))%></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td colspan=21 height=40 class=xl88 width=648 style='height:30.0pt;width:484pt'>&nbsp;2. 고유목적사업준비금 명세서</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=3 rowspan=3 height=81 class=xl129 width=90 style='border-bottom:.5pt solid gray;height:60.75pt;width:68pt'>⑬ 사업연도</td>
  <td colspan=3 rowspan=3 class=xl130 width=86 style='border-bottom:.5pt solid gray;width:64pt'>⑭ 손금산입액</td>
  <td colspan=3 rowspan=3 class=xl130 width=97 style='border-bottom:.5pt solid gray;width:73pt'>⑮ 직전 사업연도까지 고유목적사업&nbsp; 지출액</td>
  <td colspan=3 rowspan=3 class=xl131 width=90 style='border-bottom:.5pt solid gray;width:67pt'>&#9327;<font class="font11">해당 사업연도 고유목적사업<br>지출액</font></td>
  <td colspan=3 rowspan=3 class=xl131 width=105 style='border-bottom:.5pt solid gray;width:78pt'>&#9328;<font class="font11"> 익금산입액</font></td>
  <td colspan=6 rowspan=2 class=xl132 width=180 style='border-bottom:.5pt solid #7F7F7F;width:134pt'>
  	&nbsp;<font class="font15">&#9329;</font><font class="font11">잔&nbsp;&nbsp;&nbsp;&nbsp;<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp; 액<br>
    (⑭－⑮－</font><font class="font15">&#9327;</font><font class="font11">－</font><font class="font15">&#9328;</font><font class="font11">)</font>
  </td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td colspan=3 height=37 class=xl80 width=90 style='height:27.75pt;width:67pt'>&#9330;5년 이내분</td>
  <td colspan=3 class=xl144 width=90 style='border-left:none;width:67pt'>&#9331; 5년 경과분</td>
 </tr>
			<% Long cell[][] = {{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L}};  
			   // 최근 5개년 손금산입액 및 고유목적사업지출액 구하기	
			   int start_yy = box.getInt("std_yy")-4;
			   long tot_cost = 0L;
			   Long cur_cost = 0L;
			   for(int i=0; i < 5; i++) {
				   	// ⑭ 손금산입액 : 고유목적사업준비금전입액
				 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",String.valueOf(start_yy+i)+"12","","74001","","", uSesEnt.dbo); 
					cell[i][0] = rbox.getLong("cur_acum");
					
				   	// 고유목적사업지출액 : 고유목적사업비 수입대체금액
					if(i > 0) {
					 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",String.valueOf(start_yy+i)+"12","00","2200801","","", uSesEnt.dbo); 
						//cell[i][1] = rbox.getLong("cha_amt");
						tot_cost += rbox.getLong("cha_amt");
						if(i == 4) { cur_cost = rbox.getLong("cha_amt"); }	// 당해년도 고유목적사업지출액
					}
				}

				// 당해년도 고유목적사업지출액을 먼저 손금에 계상한 사업연도의 준비금부터 순차로 차감
				for(int i=0; i < 5; i++) {
					if(tot_cost > cell[i][0]) {
						cell[i][1] = cell[i][0];
					}else {
						cell[i][1] = tot_cost;
					}
					tot_cost -= cell[i][0];
				}

				for(int i=4; i >= 0; i--) {
					if(cur_cost >= cell[i][1]) {
						cell[i][2] = cell[i][1];
						cell[i][1] = 0L;
						cur_cost -= cell[i][2];
					}else {
						cell[i][2] = cur_cost;
						cell[i][1] -= cur_cost;
						break;
					}
				}

				// 잔액
				for(int i=0; i < 5; i++) {
					if(i == 0) { // 5년 경과분
						cell[i][4] = cell[i][0] - cell[i][1] - cell[i][2];
						cell[i][4] = cell[i][4] < 0 ? 0 : cell[i][4];
					}else { // 5년 이내분
						cell[i][3] = cell[i][0] - cell[i][1] - cell[i][2];
						cell[i][3] = cell[i][3] < 0 ? 0 : cell[i][3];
					}
				}

				// 합계
				for(int i=0; i < 5; i++) {
					cell[5][0] += cell[i][0];
					cell[5][1] += cell[i][1];
					cell[5][2] += cell[i][2];
					cell[5][3] += cell[i][3];
					cell[5][4] += cell[i][4];
				}
			%>
<% for(int i=0; i < 4; i++) { %>
	 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
	  <td colspan=3 height=37 class=xl172 width=90 style='border-right:.5pt solid #7F7F7F;height:27.95pt;width:68pt'><%=String.valueOf(start_yy+i)%></td>
	  <td colspan=3 class=xl179 width=86 style='border-right:.5pt solid #7F7F7F;border-left:none;width:64pt'><%=FormatUtil.insertComma(String.valueOf(cell[i][0]))%></td>
	  <td colspan=3 class=xl179 width=97 style='border-right:.5pt solid #7F7F7F;border-left:none;width:73pt'><%=FormatUtil.insertComma(String.valueOf(cell[i][1]))%></td>
	  <td colspan=3 class=xl179 width=90 style='border-right:.5pt solid #7F7F7F;border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[i][2]))%></td>
	  <td colspan=3 class=xl179 width=105 style='border-left:none;width:78pt'>　</td>
	  <td colspan=3 class=xl145 width=90 style='width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[i][3]))%></td>
	  <td colspan=3 class=xl144 width=90 style='border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[i][4]))%></td>
	 </tr>
<% } %>
<% for(int i=0; i < 5; i++) { %>
 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
  <td colspan=3 height=37 class=xl175 width=90 style='border-right:.5pt solid #7F7F7F;height:27.95pt;width:68pt'>　</td>
  <td colspan=3 class=xl144 width=86 style='border-right:.5pt solid #7F7F7F;border-left:none;width:64pt'>　</td>
  <td colspan=3 class=xl144 width=97 style='border-right:.5pt solid #7F7F7F;border-left:none;width:73pt'>　</td>
  <td colspan=3 class=xl144 width=90 style='border-right:.5pt solid #7F7F7F;border-left:none;width:67pt'>　</td>
  <td colspan=3 class=xl144 width=105 style='border-left:none;width:78pt'>　</td>
  <td colspan=3 class=xl145 width=90 style='width:67pt'>　</td>
  <td colspan=3 class=xl144 width=90 style='border-left:none;width:67pt'>　</td>
 </tr>
<% } %>
 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
  <td colspan=3 height=37 class=xl66 width=90 style='border-right:.5pt solid #7F7F7F;height:27.95pt;width:68pt'>(당&nbsp; 기)</td>
  <td colspan=3 class=xl144 width=86 style='border-right:.5pt solid #7F7F7F;border-left:none;width:64pt'><%=FormatUtil.insertComma(String.valueOf(cell[4][0]))%></td>
  <td colspan=3 class=xl144 width=97 style='border-right:.5pt solid #7F7F7F;border-left:none;width:73pt'><%=FormatUtil.insertComma(String.valueOf(cell[4][1]))%></td>
  <td colspan=3 class=xl144 width=90 style='border-right:.5pt solid #7F7F7F;border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[4][2]))%></td>
  <td colspan=3 class=xl144 width=105 style='border-left:none;width:78pt'>　</td>
  <td colspan=3 class=xl145 width=90 style='width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[4][3]))%></td>
  <td colspan=3 class=xl144 width=90 style='border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[4][4]))%></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:27.95pt'>
  <td colspan=3 height=37 class=xl67 width=90 style='border-right:.5pt solid #7F7F7F;height:27.95pt;width:68pt'>계</td>
  <td colspan=3 class=xl182 width=86 style='border-right:.5pt solid #7F7F7F;border-left:none;width:64pt'><%=FormatUtil.insertComma(String.valueOf(cell[5][0]))%></td>
  <td colspan=3 class=xl182 width=97 style='border-right:.5pt solid #7F7F7F;border-left:none;width:73pt'><%=FormatUtil.insertComma(String.valueOf(cell[5][1]))%></td>
  <td colspan=3 class=xl182 width=90 style='border-right:.5pt solid #7F7F7F;border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[5][2]))%></td>
  <td colspan=3 class=xl182 width=105 style='border-left:none;width:78pt'>　</td>
  <td colspan=3 class=xl185 width=90 style='width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[5][3]))%></td>
  <td colspan=3 class=xl144 width=90 style='border-left:none;width:67pt'><%=FormatUtil.insertComma(String.valueOf(cell[5][4]))%></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=21 height=33 class=xl116 width=648 style='height:24.75pt;width:484pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>
</body>
</html>