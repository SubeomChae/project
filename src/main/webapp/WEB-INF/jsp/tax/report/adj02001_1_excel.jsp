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
<html xmlns:o="urn:schemas-microsoft-com:office:office"xmlns:x="urn:schemas-microsoft-com:office:excel"xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제1호 서식] 법인세 과세표준 및 세액신고서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.39in .71in .59in .79in;
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
	font-family:HY신명조, serif;
	mso-font-charset:129;}
.font6
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:10.0pt;
	font-weight:700;
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
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt hairline black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:bottom;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #5D5D5D;
	border-left:.5pt hairline #5D5D5D;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt hairline #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:12.6pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid #666666;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:2.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
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
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Long Date";
	text-align:right;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
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
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:.5pt hairline gray;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt hairline gray;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:.5pt hairline gray;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:.5pt hairline gray;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:.5pt hairline gray;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:.5pt hairline gray;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt hairline gray;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline gray;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline gray;
	border-right:.5pt hairline gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
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
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline black;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:1.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
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
	text-align:left;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl209
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl210
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl211
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl212
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl213
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl214
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl216
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl217
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl218
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl219
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl221
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl222
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl223
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl224
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl225
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl226
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl227
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl228
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl229
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl230
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl231
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl232
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl233
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl234
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl235
	{mso-style-parent:style0;
	color:black;
	font-size:6.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl236
	{mso-style-parent:style0;
	color:black;
	font-size:6.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl237
	{mso-style-parent:style0;
	color:black;
	font-size:6.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl238
	{mso-style-parent:style0;
	color:black;
	font-size:6.8pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl239
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl240
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl241
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl242
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl243
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl244
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl245
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl246
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl247
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl249
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl250
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl251
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl252
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl253
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl254
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl255
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl256
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl257
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl258
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl259
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl260
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl261
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl262
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline black;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl263
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl264
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl265
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl266
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl267
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:normal;}
.xl268
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl269
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl270
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl271
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl272
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl273
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl274
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl275
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl276
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl277
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl278
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt hairline #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl279
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl280
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:.5pt hairline black;
	white-space:normal;}
.xl281
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl282
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:.5pt hairline #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl283
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline #7F7F7F;
	white-space:normal;}
.xl284
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline black;
	border-left:.5pt hairline black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl285
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt hairline black;
	border-bottom:.5pt hairline black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl286
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt hairline black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl287
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt hairline black;
	border-right:.5pt hairline #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
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
<table border=0 cellpadding=0 cellspacing=0 width=635 style='border-collapse:collapse;table-layout:fixed;width:480pt'>
<col width=36 style='mso-width-source:userset;mso-width-alt:1152;width:27pt'>
<col width=42 style='mso-width-source:userset;mso-width-alt:1344;width:32pt'>
<col width=51 style='mso-width-source:userset;mso-width-alt:1632;width:38pt'>
<col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
<col width=12 style='mso-width-source:userset;mso-width-alt:384;width:9pt'>
<col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
<col width=34 style='mso-width-source:userset;mso-width-alt:1088;width:26pt'>
<col width=5 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
<col width=17 style='mso-width-source:userset;mso-width-alt:544;width:13pt'>
<col width=5 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
<col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
<col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
<col width=4 style='mso-width-source:userset;mso-width-alt:128;width:3pt'>
<col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
<col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
<col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
<col width=48 style='mso-width-source:userset;mso-width-alt:1536;width:36pt'>
<col width=50 style='mso-width-source:userset;mso-width-alt:1600;width:38pt'>
<col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
<col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
<col width=21 span=2 style='mso-width-source:userset;mso-width-alt:672;width:16pt'>
<col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
<col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
<col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
<col width=13 span=2 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
<col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
<col width=51 style='mso-width-source:userset;mso-width-alt:1632;width:38pt'>
	<tr height=30 style='mso-height-source:userset;height:22.5pt'>
		<td colspan=21 height=30 class=xl250 width=462 style='height:22.5pt;width:349pt'>■ 법인세법 시행규칙 [별지 제1호서식] <font class="font5">&lt;개정 2018.3.21&gt;</font></td>
		<td colspan=9 class=xl250 width=173 style='width:131pt'>홈택스(www.hometax.go.kr)에서도 신고할 수 있습니다.</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=30 height=25 class=xl251 width=635 style='height:18.75pt;width:480pt'>법인세 과세표준 및 세액신고서</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=24 height=15 class=xl252 width=517 style='height:11.25pt;width:391pt'>※ 뒤쪽의 신고안내 및 작성방법을 읽고 작성하여 주시기 바랍니다.</td>
		<td colspan=6 class=xl254 width=118 style='width:89pt'>(앞쪽)</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=3 height=17 class=xl131 width=129 style='border-right:.5pt hairline black;height:12.75pt;width:97pt'>①사업자등록번호</td>
		<td colspan=14 class=xl256 width=199 style='border-right:.5pt hairline black;border-left:none;width:151pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
		<td colspan=2 class=xl259 width=98 style='border-right:.5pt hairline black;border-left:none;width:74pt'>②법인등록번호</td>
		<td colspan=11 class=xl256 width=209 style='border-left:none;width:158pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=3 height=17 class=xl144 width=129 style='border-right:.5pt hairline black;height:12.75pt;width:97pt'>
			③법<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
			인<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>명
		</td>
		<td colspan=14 class=xl208 width=199 style='border-right:.5pt hairline black;border-left:none;width:151pt'><%=obox.get("corp_nm")%></td>
		<td colspan=2 class=xl247 width=98 style='border-right:.5pt hairline black;border-left:none;width:74pt'>④전 화 번 호</td>
		<td colspan=11 class=xl208 width=209 style='border-left:none;width:158pt'><%=obox.get("tel_no")%></td>
	</tr>
	<tr height=18 style='mso-height-source:userset;height:13.5pt'>
		<td colspan=3 height=18 class=xl144 width=129 style='border-right:.5pt hairline black;height:13.5pt;width:97pt'>
			⑤대<span style='mso-spacerun:yes'>&nbsp;</span>
			표<span style='mso-spacerun:yes'>&nbsp; </span>
			자<span style='mso-spacerun:yes'>&nbsp; </span>
			성<span style='mso-spacerun:yes'>&nbsp; </span>명
		</td>
		<td colspan=14 class=xl208 width=199 style='border-right:.5pt hairline black;border-left:none;width:151pt'><%=obox.get("rep_person_nm")%></td>
		<td colspan=2 class=xl247 width=98 style='border-right:.5pt hairline black;border-left:none;width:74pt'>⑥전자우편주소</td>
		<td colspan=11 class=xl208 width=209 style='border-left:none;width:158pt'><%=obox.get("email_id")%></td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=3 height=17 class=xl144 width=129 style='border-right:.5pt hairline black;height:12.75pt;width:97pt'>
			⑦소<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
			재<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>지
		</td>
		<td colspan=27 class=xl208 width=506 style='border-left:none;width:383pt'><%=obox.get("addr")%></td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=3 height=17 class=xl144 width=129 style='border-right:.5pt hairline black;height:12.75pt;width:97pt'>
			⑧업<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>태
		</td>
		<td colspan=8 class=xl208 width=134 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:102pt'><%=obox.get("uptae")%></td>
		<td colspan=6 class=xl241 width=65 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:49pt'>⑨종 목</td>
		<td colspan=2 class=xl244 width=98 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:74pt'><%=obox.get("upjong")%></td>
		<td colspan=4 class=xl241 width=78 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:59pt'>⑩주업종코드</td>
		<td colspan=7 class=xl244 width=131 style='border-left:none;width:99pt'>　</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=3 height=17 class=xl122 width=129 style='border-right:.5pt hairline black;height:12.75pt;width:97pt'>
			⑪사<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>
			업<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>
			연<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>도
		</td>
		<td colspan=14 class=xl118 width=199 style='width:151pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
		<td colspan=2 class=xl239 width=98 style='border-right:.5pt hairline #7F7F7F;width:74pt'>⑫수시부과기간</td>
		<td colspan=11 class=xl118 width=209 style='width:158pt'>~</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=28 height=5 class=xl89 width=568 style='height:3.75pt;width:430pt'>　</td>
		<td colspan=2 class=xl89 width=67 style='width:50pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 height=16 class=xl225 width=129 style='border-right:.5pt hairline black;height:12.0pt;width:97pt'>
			⑬법<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>
			인<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>
			구<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>분
		</td>
		<td colspan=14 class=xl227 width=199 style='width:151pt'><b><u>1. 내국</u></b>&nbsp; 2. 외국&nbsp; 3. 외투(비율&nbsp;&nbsp; %)<span style='mso-spacerun:yes'>&nbsp;</span></td>
		<td colspan=2 class=xl228 width=98 style='border-right:.5pt hairline #7F7F7F;width:74pt'>⑭조 정 구 분</td>
		<td colspan=11 class=xl230 width=209 style='border-left:none;width:158pt'>1. 외부&nbsp; <b><u>2. 자 기</u></b></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 rowspan=3 height=44 class=xl164 width=129 style='border-right:.5pt hairline black;border-bottom:.5pt hairline black;height:33.0pt;width:97pt'>
			⑮종<span style='mso-spacerun:yes'>&nbsp; </span>
			류<span style='mso-spacerun:yes'>&nbsp; </span>
			별<span style='mso-spacerun:yes'>&nbsp; </span>
			구<span style='mso-spacerun:yes'>&nbsp; </span>분
		</td>
		<td colspan=3 rowspan=3 class=xl275 width=36 style='border-right:.5pt hairline black;border-bottom:.5pt hairline black;width:27pt'>중소<br>기업</td>
		<td colspan=7 class=xl232 width=113 style='border-right:.5pt hairline black;border-left:none;width:86pt'>일반</td>
		<td colspan=4 rowspan=2 class=xl235 width=50 style='border-right:.5pt hairline #7F7F7F;width:38pt'>당기순이익</td>
		<td colspan=2 rowspan=3 class=xl268 width=98 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline #7F7F7F;width:74pt'>(16)외부감사대상</td>
		<td colspan=11 rowspan=3 class=xl268 width=209 style='border-bottom:.5pt hairline #7F7F7F;width:158pt'>1. 여&nbsp;&nbsp;&nbsp; <b><u>2. 부</u></b></td>
	</tr>
	<tr height=13 style='mso-height-source:userset;height:9.75pt'>
		<td height=13 class=xl67 width=37 style='height:9.75pt;border-top:none;border-left:none;width:28pt'>중견</td>
		<td colspan=2 class=xl286 style='border-right:.5pt hairline #7F7F7F;border-left:none'>상호출자</td>
		<td colspan=4 class=xl283 width=37 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:28pt'>그외</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td height=15 class=xl70 width=37 style='height:11.25pt;border-left:none;width:28pt'>기업</td>
		<td colspan=2 class=xl284 style='border-right:.5pt hairline black;border-left:none'>제한기업</td>
		<td colspan=4 class=xl274 width=37 style='border-right:.5pt hairline black;border-left:none;width:28pt'>기업</td>
		<td colspan=4 class=xl280 width=50 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:38pt'>과세</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td rowspan=3 height=48 class=xl265 width=36 style='border-bottom:.5pt hairline black;height:36.0pt;border-top:none;width:27pt'>영리<br>법인</td>
		<td colspan=2 class=xl247 width=93 style='border-right:.5pt hairline black;border-left:none;width:70pt'>
			상<span style='mso-spacerun:yes'>&nbsp;</span>
			장<span style='mso-spacerun:yes'>&nbsp; </span>
			법<span style='mso-spacerun:yes'>&nbsp; </span>인
		</td>
		<td colspan=3 class=xl66 width=36 style='border-left:none;width:27pt'>11</td>
		<td class=xl66 width=37 style='border-left:none;width:28pt'>71</td>
		<td colspan=2 class=xl66 width=39 style='border-left:none;width:30pt'>81</td>
		<td colspan=4 class=xl66 width=37 style='border-left:none;width:28pt'>91</td>
		<td colspan=4 class=xl260 width=50 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:38pt'>　</td>
		<td colspan=2 rowspan=5 class=xl268 width=98 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline #7F7F7F;width:74pt'>(17)신 고 구 분</td>
		<td colspan=11 class=xl222 width=209 style='border-left:none;width:158pt'><b><u>1. 정기신고</u></b></td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=2 height=16 class=xl247 width=93 style='border-right:.5pt hairline black;height:12.0pt;border-left:none;width:70pt'>코스닥상장법인</td>
		<td colspan=3 class=xl66 width=36 style='border-left:none;width:27pt'>21</td>
		<td class=xl66 width=37 style='border-top:none;border-left:none;width:28pt'>72</td>
		<td colspan=2 class=xl66 width=39 style='border-left:none;width:30pt'>82</td>
		<td colspan=4 class=xl66 width=37 style='border-left:none;width:28pt'>92</td>
		<td colspan=4 class=xl215 width=50 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:38pt'>　</td>
		<td colspan=11 class=xl224 width=209 style='border-left:none;width:158pt'>2. 수정신고(가.서면분석, 나.기타)</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=2 height=16 class=xl247 width=93 style='border-right:.5pt hairline black;height:12.0pt;border-left:none;width:70pt'>
			기<span style='mso-spacerun:yes'>&nbsp; </span>
			타<span style='mso-spacerun:yes'>&nbsp; </span>
			법<span style='mso-spacerun:yes'>&nbsp; </span>인
		</td>
		<td colspan=3 class=xl67 width=36 style='border-left:none;width:27pt'>30</td>
		<td class=xl67 width=37 style='border-top:none;border-left:none;width:28pt'>73</td>
		<td colspan=2 class=xl67 width=39 style='border-left:none;width:30pt'>83</td>
		<td colspan=4 class=xl67 width=37 style='border-left:none;width:28pt'>93</td>
		<td colspan=4 class=xl218 width=50 style='width:38pt'>　</td>
		<td colspan=11 class=xl224 width=209 style='border-left:none;width:158pt'>3. 기한후 신고</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 rowspan=2 height=32 class=xl200 width=129 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline black;height:24.0pt;width:97pt'>비 영 리 법 인</td>
		<td colspan=3 rowspan=2 class=xl204 width=36 style='width:27pt'>60</td>
		<td rowspan=2 class=xl204 width=37 style='width:28pt'>74</td>
		<td colspan=2 rowspan=2 class=xl204 width=39 style='width:30pt'>84</td>
		<td colspan=4 rowspan=2 class=xl204 width=37 style='width:28pt'>94</td>
		<td colspan=4 rowspan=2 class=xl204 width=50 style='width:38pt'>50</td>
		<td colspan=11 class=xl224 width=209 style='border-left:none;width:158pt'>4. 중도폐업신고</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=11 height=16 class=xl180 width=209 style='height:12.0pt;border-left:none;width:158pt'>5. 경정청구</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 height=16 class=xl206 width=129 style='border-right:.5pt hairline black;height:12.0pt;width:97pt'>(18)법인유형별 구분</td>
		<td colspan=5 class=xl208 width=107 style='border-right:.5pt hairline black;border-left:none;width:81pt'>　</td>
		<td colspan=4 class=xl66 width=34 style='border-left:none;width:26pt'>코드</td>
		<td colspan=5 class=xl208 width=58 style='border-right:.5pt hairline black;border-left:none;width:44pt'>　</td>
		<td colspan=2 class=xl220 width=98 style='border-right:.5pt hairline black;border-left:none;width:74pt'>(19)결산확정일</td>
		<td colspan=11 class=xl199 width=209 style='border-left:none;width:158pt'><%=DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D")%>&nbsp;</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 height=16 class=xl206 width=129 style='border-right:.5pt hairline black;height:12.0pt;width:97pt'>(20)신 고 일</td>
		<td colspan=14 class=xl208 width=199 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:151pt'><%=obox.get("tax_report_ymd",Box.DEF_DATE_FMT)%>&nbsp;</td>
		<td colspan=2 class=xl211 width=98 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:74pt'>(21)납 부 일</td>
		<td colspan=11 class=xl213 width=209 style='border-left:none;width:158pt'>　</td>
	</tr>
	<tr height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 height=16 class=xl122 width=129 style='height:12.0pt;width:97pt'>(22)신고기한 연장승인</td>
		<td colspan=5 class=xl192 width=107 style='border-right:.5pt hairline #7F7F7F;width:81pt'>1. 신청일</td>
		<td colspan=9 class=xl118 width=92 style='width:70pt'>　</td>
		<td colspan=2 class=xl195 width=98 style='border-right:.5pt hairline #7F7F7F;width:74pt'>2. 연장기한</td>
		<td colspan=11 class=xl197 width=209 style='border-left:none;width:158pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=30 height=5 class=xl89 width=635 style='height:3.75pt;width:480pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl183 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>구&nbsp;&nbsp; 분</td>
		<td colspan=6 class=xl185 width=46 style='border-right:.5pt hairline black;border-left:none;width:35pt'>여</td>
		<td colspan=3 class=xl185 width=46 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:35pt'>부</td>
		<td colspan=8 class=xl65 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>구&nbsp;&nbsp; 분</td>
		<td colspan=4 class=xl65 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>여</td>
		<td class=xl65 width=51 style='border-top:none;border-left:none;width:38pt'>부</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(23)주식변동</td>
		<td colspan=6 class=xl189 width=46 style='border-right:.5pt hairline black;border-left:none;width:35pt'>1</td>
		<td colspan=3 class=xl172 width=46 style='width:35pt'>2</td>
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(24)장부전산화</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>1</td>
		<td class=xl68 width=51 style='border-top:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(25)사업연도의제</td>
		<td colspan=6 class=xl109 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(26)결손금소급공제 법인세환급신청</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>1</td>
		<td class=xl68 width=51 style='border-top:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(27)감가상각방법(내용연수)신고서 제출</td>
		<td colspan=6 class=xl172 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(28)재고자산등평가방법신고서 제출</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>1</td>
		<td class=xl68 width=51 style='border-top:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(29)기능통화 채택 재무제표 작성</td>
		<td colspan=6 class=xl172 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(30)과세표준 환산시 적용환율</td>
		<td colspan=5 class=xl178 width=102 style='border-left:none;width:77pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(31)동업기업의 출자자(동업자)</td>
		<td colspan=6 class=xl172 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=8 class=xl180 width=205 style='border-left:none;width:155pt'>(32)국제회계기준(K-IFRS)적용</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;width:39pt'>1</td>
		<td class=xl68 width=51 style='border-top:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(47)내용연수승인(변경승인) 신청</td>
		<td colspan=6 class=xl172 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(48)감가상각방법변경승인 신청</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>1</td>
		<td class=xl69 width=51 style='border-top:none;border-left:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(49)기능통화 도입기업의 과세표준 계산방법</td>
		<td colspan=9 class=xl173 width=102 style='width:77pt'>　</td>		
		<td colspan=8 class=xl174 width=205 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:155pt'>(50)미환류소득에 대한 법인세 신고</td>
		<td colspan=4 class=xl69 width=51 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:39pt'>1</td>
		<td class=xl69 width=51 style='border-top:none;border-left:none;width:38pt'>2</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=8 height=15 class=xl170 width=236 style='border-right:.5pt hairline black;height:11.25pt;width:178pt'>(51)성실신고확인서 제출</td>
		<td colspan=6 class=xl172 width=46 style='width:35pt'>1</td>
		<td colspan=3 class=xl173 width=46 style='border-left:none;width:35pt'>2</td>
		<td colspan=13 class=xl174 width=205 style='border-top:none;border-left:none;width:155pt'></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 rowspan=2 height=41 class=xl186 width=152 style='border-right:.5pt hairline black;border-bottom:.5pt hairline black;height:30.75pt;width:114pt'>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 분</td>
		<td colspan=25 class=xl141 width=483 style='width:366pt'>법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 세</td>
	</tr>
	<tr height=26 style='mso-height-source:userset;height:19.5pt'>
		<td colspan=7 height=26 class=xl161 width=163 style='border-right:.5pt hairline black;height:19.5pt;border-left:none;width:124pt'>법&nbsp;&nbsp; 인&nbsp;&nbsp; 세</td>
		<td colspan=6 class=xl161 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>토지 등 양도소득에<br>대한 법인세</td>
		<td colspan=4 class=xl161 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>미환류소득에<br>대한 법인세</td>
		<td colspan=8 class=xl169 width=152 style='width:115pt'>계</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl164 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(33)수 입 금 액</td>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
	Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","", uSesEnt.dbo);
	Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61003","","", uSesEnt.dbo);
	Long amt_61003 = rbox.getLong("cur_acum"); // 배당금 수익  %>
		<td colspan=17 class=xl166 width=331 style='border-right:.5pt hairline #7F7F7F;border-left:none;width:251pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002+amt_61003))%></td>
		<td colspan=8 class=xl157 width=152 style='border-left:none;width:115pt'></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl144 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(34)과 세 표 준</td>
		<td colspan=7 class=xl153 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'>0</td>
		<td colspan=6 class=xl156 width=168 style='width:127pt'></td>
		<td colspan=4 class=xl156 width=168 style='width:127pt'></td>
		<td colspan=8 class=xl157 width=152 style='width:115pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl144 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(35)산 출 세 액</td>
		<td colspan=7 class=xl153 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'>0</td>
		<td colspan=6 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=4 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=8 class=xl159 width=152 style='border-left:none;width:115pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl144 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(36)총 부 담 세 액</td>
		<td colspan=7 class=xl146 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'>0</td>
		<td colspan=6 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=4 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=8 class=xl146 width=152 style='border-left:none;width:115pt'>　</td>
	</tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110901","","", uSesEnt.dbo); 
	Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl144 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(37)기 납 부 세 액</td>
		<td colspan=7 class=xl146 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
		<td colspan=6 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=4 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=8 class=xl146 width=152 style='border-left:none;width:115pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl144 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(38)차 감 납 부 할 세 액</td>
		<td colspan=7 class=xl146 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
		<td colspan=6 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=4 class=xl146 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=8 class=xl146 width=152 style='border-left:none;width:115pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl133 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(39)분 납 할 세 액</td>
		<td colspan=7 class=xl150 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'>　</td>
		<td colspan=6 class=xl150 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=4 class=xl150 width=168 style='border-right:.5pt hairline black;border-left:none;width:127pt'>　</td>
		<td colspan=8 class=xl146 width=152 style='border-left:none;width:115pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 height=15 class=xl122 width=152 style='border-right:.5pt hairline black;height:11.25pt;width:114pt'>(40)차 감 납 부 세 액</td>
		<td colspan=7 class=xl124 width=163 style='border-right:.5pt hairline black;border-left:none;width:124pt'>　</td>
		<td colspan=6 class=xl125 width=168 style='border-right:.5pt solid #7F7F7F;width:127pt'>　</td>
		<td colspan=4 class=xl125 width=168 style='border-right:.5pt solid #7F7F7F;width:127pt'>　</td>
		<td colspan=8 class=xl128 width=152 style='border-left:none;width:115pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=30 height=5 class=xl89 width=635 style='height:3.75pt;width:480pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=5 rowspan=2 height=22 class=xl131 width=152 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline black;height:16.5pt;width:114pt'>(41)조 정 반 번 호</td>
		<td colspan=11 rowspan=2 class=xl135 width=163 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline #7F7F7F;width:124pt'>　</td>
		<td colspan=2 rowspan=4 class=xl131 width=61 style='border-bottom:.5pt solid black;width:46pt'>(43)조정자</td>
		<td colspan=4 class=xl65 width=107 style='border-right:.5pt hairline #7F7F7F;width:81pt'>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 명</td>
		<td colspan=8 class=xl143 width=152 style='width:115pt'>　</td>
	</tr>
	<tr height=7 style='mso-height-source:userset;height:5.25pt'>
		<td colspan=4 rowspan=2 height=15 class=xl104 width=107 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt hairline #7F7F7F;height:11.25pt;width:81pt'>사업자등록번호</td>
		<td colspan=8 rowspan=2 class=xl110 width=152 style='border-bottom:.5pt hairline #7F7F7F;width:115pt'>　</td>
	</tr>
	<tr height=8 style='mso-height-source:userset;height:6.0pt'>
		<td colspan=5 rowspan=2 height=23 class=xl112 width=152 style='border-bottom:.5pt solid black;height:17.25pt;width:114pt'>(42)조 정 자 관 리 번 호</td>
		<td colspan=11 rowspan=2 class=xl114 width=163 style='border-right:.5pt hairline #7F7F7F;border-bottom:.5pt solid black;width:124pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=4 height=15 class=xl120 width=107 style='border-right:.5pt hairline #7F7F7F;height:11.25pt;width:81pt'>전 화 번 호</td>
		<td colspan=8 class=xl118 width=152 style='width:115pt'>　</td>
	</tr>
	<tr height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=30 height=5 class=xl89 width=635 style='height:3.75pt;width:480pt'>　</td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=4 rowspan=3 height=45 class=xl186 width=140 style='border-bottom:.5pt solid black;height:33.75pt;width:105pt'>국세환급금 계좌 신고<br>
    (환급세액 2천만원<br>
    미만인 경우)</td>
		<td colspan=6 class=xl90 width=118 style='border-right:.5pt hairline gray;width:90pt'>(44)예 입 처</td>
		<td colspan=20 class=xl93 width=377 style='border-left:none;width:285pt'><%=obox.get("bank_nm")%></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=6 height=15 class=xl95 width=118 style='border-right:.5pt hairline gray;height:11.25pt;width:90pt'>(45)예금종류</td>
		<td colspan=20 class=xl98 width=377 style='border-left:none;width:285pt'><%=obox.get("account_type")%></td>
	</tr>
	<tr height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=6 height=15 class=xl100 width=118 style='border-right:.5pt hairline gray;height:11.25pt;width:90pt'>(46)계 좌 번 호</td>
		<td colspan=20 class=xl103 width=377 style='width:285pt'><%=obox.get("account_no")%></td>
	</tr>
	<tr height=47 style='mso-height-source:userset;height:35.25pt'>
		<td colspan=30 height=47 class=xl86 width=635 style='height:35.25pt;width:480pt'>
			<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>신고인은 「법인세법」 제60조 및 「국세기본법」 제45조, 제45조의2, 제45조의3에 따라 위의 내용을 신고하며, 위 내용을 충분히 검토하였고
			<font class="font7">신고인이 알고 있는 사실 그대로를 정확하게 적었음을 확인합니다.</font>
		</td>
	</tr>
	<tr height=20 style='mso-height-source:userset;height:15.0pt'>
		<td colspan=30 height=20 class=xl87 width=635 style='height:15.0pt;width:480pt'><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6,8)%>일</td>
	</tr>
	<tr height=21 style='mso-height-source:userset;height:15.75pt'>
		<td colspan=15 height=21 class=xl78 width=296 style='height:15.75pt;width:224pt'>신고인(법<span style='mso-spacerun:yes'>&nbsp; </span>인)</td>
		<td class=xl72 width=19 style='width:14pt'></td>
		<td colspan=10 class=xl83 width=227 style='width:172pt'><%=obox.get("corp_nm")%></td>
		<td colspan=4 class=xl82 width=93 style='width:70pt'>( 인 )</td>
	</tr>
	<tr height=21 style='mso-height-source:userset;height:15.75pt'>
		<td colspan=15 height=21 class=xl78 width=296 style='height:15.75pt;width:224pt'>신고인(대표자)</td>
		<td class=xl73 width=19 style='width:14pt'>　</td>
		<td colspan=10 class=xl81 width=227 style='width:172pt'><%=obox.get("rep_person_nm")%></td>
		<td colspan=4 class=xl79 width=93 style='width:70pt'>(서명)</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=30 height=25 class=xl80 width=635 style='height:18.75pt;width:480pt'>세무대리인은 조세전문자격자로서 위 신고서를 성실하고 공정하게 작성하였음을 확인합니다.</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=15 height=25 class=xl78 width=296 style='height:18.75pt;width:224pt'>세무대리인</td>
		<td class=xl71 width=19 style='width:14pt'></td>
		<td colspan=8 class=xl83 width=202 style='width:153pt'></td>
		<td colspan=6 class=xl82 width=118 style='width:89pt'>&nbsp;(서명 또는 인)</td>
	</tr>
	<tr height=23 style='mso-height-source:userset;height:17.25pt'>
		<td colspan=30 height=23 class=xl84 width=635 style='height:17.25pt;width:480pt'>세무서장 <font class="font6">귀하</font></td>
	</tr>
	<tr height=6 style='mso-height-source:userset;height:4.5pt'>
		<td colspan=30 height=6 class=xl85 width=635 style='height:4.5pt;width:480pt'>　</td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=2 height=42 class=xl76 width=78 style='border-right:.5pt hairline black;height:31.5pt;width:59pt'>첨부서류</td>
		<td colspan=25 class=xl74 width=477 style='width:361pt'>
			<span style='mso-spacerun:yes'>&nbsp; </span>1. 재무상태표,&nbsp; 2. (포괄)손익계산서,&nbsp; 3. 이익잉여금처분(결손금처리)계산서, <br>
			<span style='mso-spacerun:yes'>&nbsp; </span>4. 현금흐름표(「주식회사의 외부감사에 관한 법률」 제2조에 따른 외부감사의 대상이 되는<br>
			<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>법인의 경우만 해당합니다),&nbsp; 5. 세무조정계산서
		</td>
		<td colspan=3 class=xl75 width=80 style='width:60pt'>수수료<br>없음</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=30 height=17 class=xl77 width=635 style='height:12.75pt;width:480pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
	</tr>
</table>
</body>
</html>