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
<title>[별지 제43호서식] 법인지방소득세 과세표준 및 세액신고서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.39in .71in .59in .79in;
	mso-header-margin:.51in;
	mso-footer-margin:.51in;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
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
.font6
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:blue;
	font-size:9.0pt;
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
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font10
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font11
	{color:black;
	font-size:12.6pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
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
	font-family:한양신명조, monospace;
	mso-font-charset:129;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
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
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
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
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl126
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
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#CCCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
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
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl195
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
.xl196
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
.xl197
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
.xl198
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
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:8.1pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
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
	border-bottom:none;
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
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl210
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
.xl211
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
.xl212
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
.xl213
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양신명조, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl214
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양신명조, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양신명조, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #939393;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl216
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
.xl217
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
.xl218
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
.xl219
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:한양신명조, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:.5pt solid #939393;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-family:한양신명조, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl221
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
.xl222
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
.xl223
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
.xl224
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl225
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl226
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl227
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
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl228
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
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl229
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl230
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl231
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl232
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
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl233
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
.xl234
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
.xl235
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl236
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl237
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl238
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
	border-bottom:.5pt solid #787878;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl239
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
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl240
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
.xl241
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
.xl242
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
.xl243
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl244
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
	border-left:.5pt dotted #A6A6A6;
	white-space:normal;}
.xl245
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
.xl246
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
.xl247
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl248
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl249
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl250
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl251
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl252
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl253
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl254
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl255
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl256
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl257
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl258
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl259
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl260
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt dotted #AEAEAE;
	border-left:.5pt dotted #787878;
	white-space:normal;}
.xl261
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt dotted #AEAEAE;
	border-left:none;
	white-space:normal;}
.xl262
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt dotted #AEAEAE;
	border-left:none;
	white-space:normal;}
.xl263
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt dotted #AEAEAE;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl264
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt dotted #AEAEAE;
	border-left:none;
	white-space:normal;}
.xl265
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt dotted #AEAEAE;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #787878;
	white-space:normal;}
.xl266
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt dotted #AEAEAE;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl267
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt dotted #AEAEAE;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl268
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt dotted #AEAEAE;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl269
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt dotted #AEAEAE;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl270
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
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl271
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl272
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
	border-bottom:.5pt dotted #7F7F7F;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl273
	{mso-style-parent:style0;
	color:black;
	font-size:6.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl274
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
.xl275
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl276
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl277
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl278
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl279
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl280
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl281
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl282
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
.xl283
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl284
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt dotted #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl285
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl286
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl287
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl288
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl289
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl290
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl291
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt dotted #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl292
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl293
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl294
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt dotted #AEAEAE;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl295
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt dotted #AEAEAE;
	white-space:normal;}
.xl296
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:justify;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl297
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl298
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl299
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl300
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl301
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl302
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl303
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl304
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl305
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl306
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl307
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl308
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl309
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl310
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl311
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl312
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt dotted #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl313
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl314
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl315
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt dotted #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl316
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #939393;
	border-left:none;
	white-space:normal;}
.xl317
	{mso-style-parent:style0;
	color:black;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.5pt solid #939393;
	border-right:none;
	border-bottom:1.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl318
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:1.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl319
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl320
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl321
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl322
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl323
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl324
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl325
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl326
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl327
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl328
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl329
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl330
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl331
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl332
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl333
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl334
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl335
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl336
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl337
	{mso-style-parent:style0;
	color:black;
	font-size:8.7pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl338
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Short Date";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl339
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Short Date";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl340
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Short Date";
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
-->
</style>
</head>
<body link="#0563C1" vlink="#954F72">
<table border=0 cellpadding=0 cellspacing=0 width=629 style='border-collapse: collapse;table-layout:fixed;width:478pt'>
	<col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
	<col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
	<col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
	<col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
	<col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
	<col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
	<col width=12 span=2 style='mso-width-source:userset;mso-width-alt:384;width:9pt'>
	<col width=5 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
	<col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
	<col width=6 style='mso-width-source:userset;mso-width-alt:192;width:5pt'>
	<col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
	<col width=5 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
	<col width=37 style='mso-width-source:userset;mso-width-alt:1184;width:28pt'>
	<col width=5 span=3 style='mso-width-source:userset;mso-width-alt:160;width:4pt'>
	<col width=9 span=4 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
	<col width=3 span=3 style='mso-width-source:userset;mso-width-alt:96;width:2pt'>
	<col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
	<col width=25 style='mso-width-source:userset;mso-width-alt:800;width:19pt'>
	<col width=3 span=2 style='mso-width-source:userset;mso-width-alt:96;width:2pt'>
	<col width=23 span=3 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
	<col width=9 span=5 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
	<col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
	<col width=13 span=4 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
	<col width=29 span=2 style='mso-width-source:userset;mso-width-alt:928;width:22pt'>
	<col width=57 style='mso-width-source:userset;mso-width-alt:1824;width:43pt'>
	<tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=44 height=16 class=xl124 width=629 style='height:12.0pt;width:478pt'>■ 지방세법 시행규칙[별지 제43호서식]<font class="font6"> </font><font class="font7">&lt;개정 2016. 12. 30.&gt;</font></td>
	</tr>
	<tr class=xl65 height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=44 height=25 class=xl125 width=629 style='height:18.75pt;width:478pt'>법인지방소득세 과세표준 및 세액신고서</td>
	</tr>
	<tr class=xl65 height=12 style='mso-height-source:userset;height:9.0pt'>
		<td colspan=43 height=12 class=xl130 width=572 style='height:9.0pt;width:435pt'>※ 뒤쪽의 작성방법을 참고하시기 바라며, 색상이 어두운 란은 신청인이 적지 않습니다.</td>
		<td class=xl72 width=57 style='width:43pt'>(앞쪽)</td>
	</tr>
	<tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=14 height=16 class=xl126 width=232 style='border-right:.5pt solid #7F7F7F;height:12.0pt;width:177pt'>접수번호</td>
		<td colspan=20 class=xl128 width=201 style='border-right:.5pt solid #7F7F7F;border-left:none;width:152pt'>접수일자</td>
		<td colspan=10 class=xl128 width=196 style='border-left:none;width:149pt'>관리번호</td>
	</tr>
	<tr class=xl65 height=1 style='mso-height-source:userset;height:.75pt'>
		<td colspan=44 height=1 class=xl106 width=629 style='height:.75pt;width:478pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl120 width=105 style='height:12.75pt;width:79pt'>①사업자등록번호</td>
		<td colspan=24 class=xl122 width=232 style='border-right:.5pt solid #7F7F7F;width:178pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
		<td colspan=6 class=xl119 width=96 style='border-left:none;width:72pt'>②법인등록번호</td>
		<td colspan=10 class=xl122 width=196 style='width:149pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl117 width=105 style='height:12.75pt;width:79pt'>③법인명</td>
		<td colspan=24 class=xl117 width=232 style='border-right:.5pt solid #7F7F7F;width:178pt'><%=obox.get("corp_nm")%></td>
		<td colspan=6 class=xl116 width=96 style='border-left:none;width:72pt'>④전화번호</td>
		<td colspan=10 class=xl118 width=196 style='width:149pt'><%=obox.get("tel_no")%></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl117 width=105 style='height:12.75pt;width:79pt'>⑤대표자성명</td>
		<td colspan=24 class=xl117 width=232 style='border-right:.5pt solid #7F7F7F;width:178pt'><%=obox.get("rep_person_nm")%></td>
		<td colspan=6 class=xl116 width=96 style='border-left:none;width:72pt'>⑥전자우편</td>
		<td colspan=10 class=xl118 width=196 style='width:149pt'><%=obox.get("email_id")%></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl117 width=105 style='height:12.75pt;width:79pt'>⑦소재지</td>
		<td colspan=40 class=xl117 width=524 style='width:399pt'><%=obox.get("addr")%></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl117 width=105 style='height:12.75pt;width:79pt'>⑧업태</td>
		<td colspan=15 class=xl117 width=160 style='border-right:.5pt solid #7F7F7F;width:124pt'><%=obox.get("uptae")%></td>
		<td colspan=8 class=xl116 width=69 style='border-left:none;width:52pt'>⑨종목</td>
		<td colspan=10 class=xl118 width=128 style='border-right:.5pt solid #7F7F7F;width:96pt'><%=obox.get("upjong")%></td>
		<td colspan=5 class=xl116 width=81 style='border-left:none;width:62pt'>⑩주업종코드</td>
		<td colspan=2 class=xl118 width=86 style='width:65pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=4 height=17 class=xl114 width=105 style='height:12.75pt;width:79pt'>⑪사업연도</td>
		<td colspan=24 class=xl114 width=232 style='border-right:.5pt solid #7F7F7F;width:178pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
		<td colspan=6 class=xl113 width=78 style='border-left:none;width:58pt'>⑫수시부과기간</td>
		<td colspan=10 class=xl114 width=214 style='width:163pt'></td>
	</tr>
	<tr class=xl65 height=5 style='mso-height-source:userset;height:3.75pt'>
		<td colspan=39 height=5 class=xl106 width=488 style='height:3.75pt;width:371pt'>　</td>
		<td colspan=5 class=xl106 width=141 style='width:107pt'>　</td>
	</tr>
	<tr class=xl65 height=18 style='mso-height-source:userset;height:13.5pt'>
		<td colspan=6 height=18 class=xl107 width=128 style='border-right:.5pt solid #7F7F7F;height:13.5pt;width:97pt'>⑬법&nbsp; 인&nbsp; 구&nbsp; 분</td>
		<td colspan=22 class=xl109 width=209 style='border-right:.5pt solid #7F7F7F;border-left:none;width:160pt'><b><u>1.내국</u></b> 2.외국 3.외투(비율&nbsp;&nbsp; %)<span style='mso-spacerun:yes'>&nbsp;</span></td>
		<td colspan=9 class=xl112 width=125 style='border-right:.5pt solid #7F7F7F;border-left:none;width:94pt'>⑭조 정 구 분</td>
		<td colspan=7 class=xl109 width=167 style='border-left:none;width:127pt'>1.외부&nbsp; <b><u>2. 자기</u></b></td>
	</tr>
	<tr class=xl65 height=0 style='display:none;mso-height-source:userset;mso-height-alt:240'>
		<td colspan=6 rowspan=5 class=xl97 width=128 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;width:97pt'>⑮종 류 별 구 분</td>
		<td colspan=2 rowspan=5 class=xl73 width=24 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;width:18pt'>중소<br>기업</td>
		<td colspan=13 class=xl66 width=131 style='border-right:.5pt solid #7F7F7F;border-left:none;width:102pt'>일반</td>
		<td colspan=7 rowspan=5 class=xl73 width=54 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;width:40pt'>당기순이익<br>과세</td>
		<td class=xl69 width=23 style='border-top:none;border-left:none;width:17pt'>(16)외부감사대상</td>
		<td class=xl70 width=23 style='border-top:none;width:17pt'>　</td>
		<td class=xl70 width=23 style='border-top:none;width:17pt'>　</td>
		<td class=xl70 width=9 style='border-top:none;width:7pt'>　</td>
		<td class=xl70 width=9 style='border-top:none;width:7pt'>　</td>
		<td class=xl70 width=9 style='border-top:none;width:7pt'>　</td>
		<td class=xl70 width=9 style='border-top:none;width:7pt'>　</td>
		<td class=xl70 width=9 style='border-top:none;width:7pt'>　</td>
		<td class=xl71 width=11 style='border-top:none;width:8pt'>　</td>
		<td class=xl69 width=13 style='border-top:none;border-left:none;width:10pt'>1.여&nbsp;&nbsp;&nbsp; <b><u>2.부</u></b></td>
		<td class=xl70 width=13 style='border-top:none;width:10pt'>　</td>
		<td class=xl70 width=13 style='border-top:none;width:10pt'>　</td>
		<td class=xl70 width=13 style='border-top:none;width:10pt'>　</td>
		<td class=xl70 width=29 style='border-top:none;width:22pt'>　</td>
		<td class=xl70 width=29 style='border-top:none;width:22pt'>　</td>
		<td class=xl70 width=57 style='border-top:none;width:43pt'>　</td>
	</tr>
	<tr class=xl65 height=9 style='mso-height-source:userset;height:6.75pt'>
		<td colspan=13 height=9 class=xl103 width=131 style='border-right:.5pt solid #7F7F7F;height:6.75pt;border-left:none;width:102pt'>일반</td>
		<td colspan=9 rowspan=3 class=xl88 width=125 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid gray;width:94pt'>(16)외부감사대상</td>
		<td colspan=7 rowspan=3 class=xl88 width=167 style='border-bottom:.5pt solid #7F7F7F;width:127pt'>1. 여&nbsp;&nbsp;&nbsp; 2. 부</td>
	</tr>
	<tr class=xl65 height=4 style='mso-height-source:userset;height:3.6pt'>
		<td colspan=4 rowspan=3 height=20 class=xl73 width=38 style='border-right:.5pt solid gray;border-bottom:.5pt solid #7F7F7F;height:16.2pt;width:30pt'>중견<br>기업</td>
		<td colspan=3 rowspan=3 class=xl82 width=47 style='border-right:.5pt solid gray;border-bottom:.5pt solid #7F7F7F;width:36pt'>상호출자<br>제한기업</td>
		<td colspan=6 rowspan=3 class=xl74 width=46 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;width:36pt'>그외<br>기업</td>
	</tr>
	<tr class=xl65 height=2 style='mso-height-source:userset;height:1.5pt'>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:11.1pt'>
		<td colspan=9 rowspan=5 height=70 class=xl88 width=125 style='border-right:.5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:55.5pt;width:94pt'>(17)신 고 구 분</td>
		<td colspan=7 class=xl131 width=167 style='border-left:none;width:127pt'><b><u>1.정기신고</u></b></td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:11.1pt'>
		<td rowspan=3 height=42 class=xl135 width=32 style='border-bottom:.5pt solid #7F7F7F;height:33.3pt;border-top:none;width:24pt'>영리<br>
법인</td>
		<td colspan=5 class=xl133 width=96 style='border-right:.5pt solid #7F7F7F;border-left:none;width:73pt'>상 장 법 인</td>
		<td colspan=2 class=xl134 width=24 style='border-right:.5pt solid #7F7F7F;border-left:none;width:18pt'>11</td>
		<td colspan=4 class=xl134 width=38 style='border-right:.5pt solid #7F7F7F;border-left:none;width:30pt'>71</td>
		<td colspan=3 class=xl66 width=47 style='border-right:.5pt solid gray;border-left:none;width:36pt'>81</td>
		<td colspan=6 class=xl101 width=46 style='border-right:.5pt solid #7F7F7F;border-left:none;width:36pt'>91</td>
		<td colspan=7 class=xl137 width=54 style='border-right:.5pt solid #7F7F7F;border-left:none;width:40pt'>　</td>
		<td colspan=7 class=xl307 width=167 style='border-left:none;width:127pt'>2.
수정신고(가. 서면분석, 나. 기타)</td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:11.1pt'>
		<td colspan=5 height=14 class=xl133 width=96 style='border-right:.5pt solid #7F7F7F;height:11.1pt;border-left:none;width:73pt'>코스닥상장법인</td>
		<td colspan=2 class=xl134 width=24 style='border-right:.5pt solid #7F7F7F;border-left:none;width:18pt'>21</td>
		<td colspan=4 class=xl134 width=38 style='border-right:.5pt solid #7F7F7F;border-left:none;width:30pt'>72</td>
		<td colspan=3 class=xl66 width=47 style='border-right:.5pt solid gray;border-left:none;width:36pt'>82</td>
		<td colspan=6 class=xl101 width=46 style='border-right:.5pt solid #7F7F7F;border-left:none;width:36pt'>92</td>
		<td colspan=7 class=xl137 width=54 style='border-right:.5pt solid #7F7F7F;border-left:none;width:40pt'>　</td>
		<td colspan=7 class=xl131 width=167 style='border-left:none;width:127pt'>3.
기한후 신고</td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:11.1pt'>
		<td colspan=5 height=14 class=xl133 width=96 style='border-right:.5pt solid #7F7F7F;height:11.1pt;border-left:none;width:73pt'>기 타 법 인</td>
		<td colspan=2 class=xl134 width=24 style='border-right:.5pt solid #7F7F7F;border-left:none;width:18pt'>30</td>
		<td colspan=4 class=xl134 width=38 style='border-right:.5pt solid #7F7F7F;border-left:none;width:30pt'>73</td>
		<td colspan=3 class=xl66 width=47 style='border-right:.5pt solid gray;border-left:none;width:36pt'>83</td>
		<td colspan=6 class=xl101 width=46 style='border-right:.5pt solid #7F7F7F;border-left:none;width:36pt'>93</td>
		<td colspan=7 class=xl137 width=54 style='border-right:.5pt solid #7F7F7F;border-left:none;width:40pt'>　</td>
		<td colspan=7 class=xl131 width=167 style='border-left:none;width:127pt'>4.
중도폐업신고</td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:11.1pt'>
		<td colspan=6 height=14 class=xl99 width=128 style='border-right:.5pt solid #7F7F7F;height:11.1pt;width:97pt'>비 영 리 법 인</td>
		<td colspan=2 class=xl66 width=24 style='border-right:.5pt solid #7F7F7F;border-left:none;width:18pt'>60</td>
		<td colspan=4 class=xl66 width=38 style='border-right:.5pt solid #7F7F7F;border-left:none;width:30pt'>74</td>
		<td colspan=3 class=xl66 width=47 style='border-right:.5pt solid gray;border-left:none;width:36pt'>84</td>
		<td colspan=6 class=xl101 width=46 style='border-right:.5pt solid #7F7F7F;border-left:none;width:36pt'><b><u>94</u></b></td>
		<td colspan=7 class=xl66 width=54 style='border-right:.5pt solid #7F7F7F;border-left:none;width:40pt'>50</td>
		<td colspan=7 class=xl131 width=167 style='border-left:none;width:127pt'>5.
경정청구</td>
	</tr>
	<tr class=xl65 height=18 style='mso-height-source:userset;height:13.5pt'>
		<td colspan=6 height=18 class=xl142 width=128 style='border-right:.5pt solid #7F7F7F;height:13.5pt;width:97pt'>(18)법 인 유 형 별 구 분</td>
		<td colspan=9 class=xl144 width=109 style='border-right:.5pt solid #7F7F7F;border-left:none;width:84pt'>　</td>
		<td colspan=6 class=xl66 width=46 style='border-right:.5pt solid #7F7F7F;border-left:none;width:36pt'>코드</td>
		<td colspan=7 class=xl140 width=54 style='border-right:.5pt solid #7F7F7F;border-left:none;width:40pt'>　</td>
		<td colspan=9 class=xl148 width=125 style='border-right:.5pt solid #7F7F7F;border-left:none;width:94pt'>(19)결 산 확 정 일</td>
		<td colspan=7 class=xl338 width=167 style='border-left:none;width:127pt'><%=DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D")%></td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=6 height=15 class=xl149 width=128 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:97pt'>(20)신 고 일</td>
		<td colspan=22 class=xl338 width=209 style='border-right:.5pt solid #7F7F7F;border-left:none;width:160pt'><%=obox.get("tax_report_ymd",Box.DEF_DATE_FMT)%></td>
		<td colspan=9 class=xl148 width=125 style='border-right:.5pt solid #7F7F7F;border-left:none;width:94pt'>(21)납 부 일</td>
		<td colspan=7 class=xl153 width=167 style='border-right:.5pt solid #7F7F7F;border-left:none;width:127pt'>　</td>
	</tr>
	<tr class=xl65 height=19 style='mso-height-source:userset;height:14.85pt'>
		<td colspan=6 height=19 class=xl156 width=128 style='border-right:.5pt solid #7F7F7F;height:14.85pt;width:97pt'>(22)신고기한연장승인</td>
		<td colspan=9 class=xl158 width=109 style='border-right:.5pt solid #7F7F7F;border-left:none;width:84pt'>1. 신청일</td>
		<td colspan=13 class=xl161 width=100 style='border-right:.5pt solid #7F7F7F;border-left:none;width:76pt'>　</td>
		<td colspan=9 class=xl158 width=125 style='border-right:.5pt solid #7F7F7F;border-left:none;width:94pt'>2. 연장기한</td>
		<td colspan=7 class=xl161 width=167 style='border-left:none;width:127pt'>　</td>
	</tr>
	<tr class=xl65 height=4 style='mso-height-source:userset;height:3.0pt'>
		<td colspan=44 height=4 class=xl106 width=629 style='height:3.0pt;width:478pt'>　</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=15 height=15 class=xl151 width=237 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:181pt'>구&nbsp;&nbsp; 분</td>
		<td colspan=7 class=xl67 width=49 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>여</td>
		<td colspan=6 class=xl67 width=51 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>부</td>
		<td colspan=13 class=xl67 width=177 style='border-right:.5pt solid #7F7F7F;border-left:none;width:134pt'>구&nbsp;&nbsp; 분</td>
		<td colspan=2 class=xl67 width=58 style='border-right:.5pt solid #7F7F7F;border-left:none;width:44pt'>여</td>
		<td class=xl67 width=57 style='border-top:none;border-left:none;width:43pt'>부</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=15 height=15 class=xl169 width=237 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:181pt'>(23)주식변동</td>
		<td colspan=7 class=xl66 width=49 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>1</td>
		<td colspan=6 class=xl66 width=51 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'><b><u>2</u></b></td>
		<td colspan=13 class=xl171 width=177 style='border-right:.5pt solid #7F7F7F;border-left:none;width:134pt'>(24)장부전산화</td>
		<td colspan=2 class=xl66 width=58 style='border-right:.5pt solid #7F7F7F;border-left:none;width:44pt'><b><u>1</u></b></td>
		<td class=xl66 width=57 style='border-top:none;border-left:none;width:43pt'>2</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=15 height=15 class=xl169 width=237 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:181pt'>(25)사업연도의제</td>
		<td colspan=7 class=xl66 width=49 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>1</td>
		<td colspan=6 class=xl66 width=51 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'><b><u>2</u></b></td>
		<td colspan=13 class=xl171 width=177 style='border-right:.5pt solid #7F7F7F;border-left:none;width:134pt'>(26)결손금소급공제 환급신청</td>
		<td colspan=2 class=xl66 width=58 style='border-right:.5pt solid #7F7F7F;border-left:none;width:44pt'>1</td>
		<td class=xl66 width=57 style='border-top:none;border-left:none;width:43pt'><b><u>2</u></b></td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=15 height=15 class=xl159 width=237 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:181pt'>(27)동업기업의 출자자(동업자)</td>
		<td colspan=7 class=xl68 width=49 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>1</td>
		<td colspan=6 class=xl68 width=51 style='border-right:.5pt solid #7F7F7F;border-left:none;width:38pt'>2</td>
		<td colspan=13 class=xl166 width=177 style='border-right:.5pt solid #7F7F7F;border-left:none;width:134pt'>&#12888;미환류소득에 대한 법인지방소득세 신고</td>
		<td colspan=2 class=xl68 width=58 style='border-right:.5pt solid #7F7F7F;border-left:none;width:44pt'>1</td>
		<td class=xl68 width=57 style='border-top:none;border-left:none;width:43pt'>2</td>
	</tr>
	<tr class=xl65 height=18 style='mso-height-source:userset;height:14.1pt'>
		<td colspan=44 height=18 class=xl175 width=629 style='height:14.1pt;width:478pt'>□ 법인별 세액의 계산</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 rowspan=2 height=40 class=xl176 width=171 style='border-right:.5pt solid #7F7F7F;height:31.2pt;width:130pt'>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</td>
		<td colspan=34 class=xl67 width=458 style='border-left:none;width:348pt'>법&nbsp;인&nbsp; 지&nbsp; 방&nbsp; 소&nbsp; 득&nbsp; 세<span style='mso-spacerun:yes'>&nbsp;</span></td>
	</tr>
	<tr class=xl65 height=25 style='mso-height-source:userset;height:19.35pt'>
		<td colspan=14 height=25 class=xl187 width=121 style='border-right:.5pt solid gray;height:19.35pt;border-left:none;width:93pt'>각 사업연도 소득세에 <br>대한 법인지방소득세</td>
		<td colspan=8 class=xl185 width=123 style='border-right:.5pt solid #7F7F7F;width:92pt'>토지 등 양도소득에<br>대한 법인지방소득세<span style='mso-spacerun:yes'>&nbsp;</span></td>
		<td colspan=10 class=xl180 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'>미환류소득에 대한<br>법인지방소득세</td>
		<td colspan=2 class=xl183 width=86 style='border-left:none;width:65pt'>계</td>
	</tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
	Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","", uSesEnt.dbo); 
	Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익  %>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl149 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12889;수 입 금 액</td>
		<td colspan=32 class=xl335 width=372 style='border-right:.5pt solid #7F7F7F;border-left:none;width:283pt'>(<%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%>)</td>
		<td colspan=2 class=xl153 width=86 style='border-left:none;width:65pt'>　</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl149 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12890;과 세 표 준</td>
		<td colspan=14 class=xl191 width=121 style='border-right:.5pt solid gray;border-left:none;width:93pt'>　</td>
		<td colspan=8 class=xl189 width=123 style='border-right:.5pt solid #7F7F7F;width:92pt'>　</td>
		<td colspan=10 class=xl172 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'>　</td>
		<td colspan=2 class=xl153 width=86 style='border-left:none;width:65pt'>　</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl149 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12891;표 준 산 출 세 액</td>
		<td colspan=14 class=xl191 width=121 style='border-right:.5pt solid gray;border-left:none;width:93pt'>　</td>
		<td colspan=8 class=xl189 width=123 style='border-right:.5pt solid #7F7F7F;width:92pt'>　</td>
		<td colspan=10 class=xl172 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'>　</td>
		<td colspan=2 class=xl172 width=86 style='border-left:none;width:65pt'>　</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl149 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12892;총 부 담 세 액</td>
		<td colspan=14 class=xl191 width=121 style='border-right:.5pt solid gray;border-left:none;width:93pt'>　</td>
		<td colspan=8 class=xl193 width=123 style='border-right:.5pt solid #7F7F7F;border-left:none;width:92pt'>　</td>
		<td colspan=10 class=xl172 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'>　</td>
		<td colspan=2 class=xl172 width=86 style='border-left:none;width:65pt'>　</td>
	</tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","", uSesEnt.dbo); 
	Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급지방소득세) %>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl149 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12893;기 납 부 세 액</td>
		<td colspan=14 class=xl191 width=121 style='border-right:.5pt solid gray;border-left:none;width:93pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
		<td colspan=8 class=xl193 width=123 style='border-right:.5pt solid #7F7F7F;border-left:none;width:92pt'></td>
		<td colspan=10 class=xl172 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'></td>
		<td colspan=2 class=xl172 width=86 style='border-left:none;width:65pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=10 height=15 class=xl156 width=171 style='border-right:.5pt solid #7F7F7F;height:11.85pt;width:130pt'>&#12894;차 감 납 부 할 세 액</td>
		<td colspan=14 class=xl203 width=121 style='border-right:.5pt solid gray;border-left:none;width:93pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
		<td colspan=8 class=xl206 width=123 style='border-right:.5pt solid #7F7F7F;border-left:none;width:92pt'></td>
		<td colspan=10 class=xl200 width=128 style='border-right:.5pt solid #7F7F7F;border-left:none;width:98pt'></td>
		<td colspan=2 class=xl200 width=86 style='border-left:none;width:65pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=44 height=15 class=xl194 width=629 style='height:11.85pt;width:478pt'>□ 안분율의 계산</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=3 height=15 class=xl195 width=91 style='border-right:.5pt solid #5D5D5D;height:11.85pt;width:68pt'>(35)본점/지점여부&nbsp;</td>
		<td colspan=27 class=xl197 width=292 style='border-right:.5pt solid #5D5D5D;border-left:none;width:223pt'><b><u>1.단일사업장</u></b>&nbsp;&nbsp; 2. 지점 있는 법인의 본점&nbsp;&nbsp;3. 지점<span style='mso-spacerun:yes'>&nbsp;</span></td>
		<td colspan=12 class=xl197 width=160 style='border-right:.5pt solid #5D5D5D;border-left:none;width:122pt'>(36)특ㆍ광역시 주사업장 여부</td>
		<td colspan=2 class=xl198 width=86 style='border-left:none;width:65pt'>1.여&nbsp;&nbsp;&nbsp; <b><u>2.부</u></b></td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.85pt'>
		<td colspan=3 height=15 class=xl195 width=91 style='border-right:.5pt solid #5D5D5D;height:11.85pt;width:68pt'>(37)해당사업장</td>
		<td colspan=3 class=xl197 width=37 style='border-right:.5pt solid #5D5D5D;border-left:none;width:29pt'>명칭</td>
		<td colspan=17 class=xl197 width=161 style='border-right:.5pt solid #5D5D5D;border-left:none;width:124pt'><%=obox.get("corp_nm")%></td>
		<td colspan=4 class=xl197 width=45 style='border-right:.5pt solid #5D5D5D;border-left:none;width:34pt'>소재지</td>
		<td colspan=13 class=xl224 width=167 style='border-right:.5pt solid #5D5D5D;border-left:none;width:126pt'><%=obox.get("addr")%></td>
		<td colspan=2 class=xl197 width=42 style='border-right:.5pt solid #5D5D5D;border-left:none;width:32pt'>연락처</td>
		<td colspan=2 class=xl198 width=86 style='border-left:none;width:65pt'><%=obox.get("tel_no")%></td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:10.5pt'>
		<td colspan=44 height=14 class=xl195 width=629 style='height:10.5pt;width:478pt'>(38)안분율의 계산</td>
	</tr>
	<tr class=xl65 height=16 style='mso-height-source:userset;height:12.0pt'>
		<td colspan=3 rowspan=2 height=30 class=xl208 width=91 style='border-right:.5pt solid #939393;border-bottom:.5pt solid #939393;height:22.5pt;width:68pt'>구분</td>
		<td colspan=6 class=xl212 width=66 style='border-right:.5pt solid #939393;border-left:none;width:51pt'>종업원 수</td>
		<td colspan=33 class=xl216 width=386 style='border-right:.5pt solid #939393;border-left:none;width:294pt'>건축물 연면적(㎡)</td>
		<td colspan=2 class=xl212 width=86 style='border-left:none;width:65pt'>안분율(%)</td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:10.5pt'>
		<td colspan=6 height=14 class=xl213 width=66 style='border-right:.5pt solid #939393;height:10.5pt;border-left:none;width:51pt'>(명)</td>
		<td colspan=9 class=xl221 width=99 style='border-right:.5pt solid #939393;border-left:none;width:77pt'>계</td>
		<td colspan=11 class=xl221 width=104 style='border-right:.5pt solid #939393;border-left:none;width:78pt'>건물</td>
		<td colspan=7 class=xl221 width=91 style='border-right:.5pt solid #939393;border-left:none;width:69pt'>기계장치</td>
		<td colspan=6 class=xl221 width=92 style='border-right:.5pt solid #939393;border-left:none;width:70pt'>시설물</td>
		<td colspan=2 class=xl219 width=86 style='border-left:none;width:65pt'>(소수점6자리)</td>
	</tr>
	<tr class=xl65 height=13 style='mso-height-source:userset;height:9.75pt'>
		<td colspan=3 height=13 class=xl222 width=91 style='border-right:.5pt solid #939393;height:9.75pt;width:68pt'>법인전체</td>
		<td colspan=6 class=xl221 width=66 style='border-right:.5pt solid #939393;border-left:none;width:51pt'><%=obox.get("empl_cnt")%></td>
		<td colspan=9 class=xl221 width=99 style='border-right:.5pt solid #939393;border-left:none;width:77pt'>0</td>
		<td colspan=11 class=xl221 width=104 style='border-right:.5pt solid #939393;border-left:none;width:78pt'>0</td>
		<td colspan=7 class=xl221 width=91 style='border-right:.5pt solid #939393;border-left:none;width:69pt'>0</td>
		<td colspan=6 class=xl221 width=92 style='border-right:.5pt solid #939393;border-left:none;width:70pt'>0</td>
		<td colspan=2 class=xl221 width=86 style='border-left:none;width:65pt'>100</td>
	</tr>
	<tr class=xl65 height=13 style='mso-height-source:userset;height:9.75pt'>
		<td colspan=3 height=13 class=xl222 width=91 style='border-right:.5pt solid #939393;height:9.75pt;width:68pt'>시군구내</td>
		<td colspan=6 class=xl221 width=66 style='border-right:.5pt solid #939393;border-left:none;width:51pt'><%=obox.get("empl_cnt")%></td>
		<td colspan=9 class=xl221 width=99 style='border-right:.5pt solid #939393;border-left:none;width:77pt'>0</td>
		<td colspan=11 class=xl221 width=104 style='border-right:.5pt solid #939393;border-left:none;width:78pt'>0</td>
		<td colspan=7 class=xl221 width=91 style='border-right:.5pt solid #939393;border-left:none;width:69pt'>0</td>
		<td colspan=6 class=xl221 width=92 style='border-right:.5pt solid #939393;border-left:none;width:70pt'>0</td>
		<td colspan=2 class=xl221 width=86 style='border-left:none;width:65pt'>100</td>
	</tr>
	<tr class=xl65 height=13 style='mso-height-source:userset;height:9.75pt'>
		<td colspan=3 height=13 class=xl240 width=91 style='border-right:.5pt solid #939393;height:9.75pt;width:68pt'>비율(%)</td>
		<td colspan=6 class=xl242 width=66 style='border-right:.5pt solid #939393;border-left:none;width:51pt'>100</td>
		<td colspan=9 class=xl242 width=99 style='border-right:.5pt solid #939393;border-left:none;width:77pt'>100</td>
		<td colspan=11 class=xl242 width=104 style='border-right:.5pt solid #939393;border-left:none;width:78pt'>100</td>
		<td colspan=7 class=xl242 width=91 style='border-right:.5pt solid #939393;border-left:none;width:69pt'>100</td>
		<td colspan=6 class=xl242 width=92 style='border-right:.5pt solid #939393;border-left:none;width:70pt'>100</td>
		<td colspan=2 class=xl227 width=86 style='border-left:none;width:65pt'>100</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=44 height=15 class=xl229 width=629 style='height:11.25pt;width:478pt'>□ 납세지별 세액의 계산</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=7 height=17 class=xl230 width=140 style='border-right:.5pt dotted #AEAEAE;height:12.75pt;width:106pt'>(39)납세지별 산출세액</td>
		<td colspan=19 class=xl232 width=191 style='border-right:.5pt solid #7F7F7F;border-left:none;width:147pt'>　</td>
		<td colspan=15 class=xl235 width=183 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:138pt'>(40)납세지별 세액공제ㆍ감면액</td>
		<td colspan=3 class=xl238 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=7 height=17 class=xl243 width=140 style='height:12.75pt;width:106pt'>(41)납세지별 가산세액</td>
		<td colspan=19 class=xl244 width=191 style='border-right:.5pt solid #7F7F7F;width:147pt'>　</td>
		<td colspan=15 class=xl247 width=183 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:138pt'>(42)납세지별 감면분 추가납부세액</td>
		<td colspan=3 class=xl250 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=2 rowspan=2 height=42 class=xl252 width=51 style='border-right:.5pt dotted #AEAEAE;height:31.7pt;width:38pt'>합계</td>
		<td colspan=2 rowspan=2 class=xl256 width=54 style='border-right:.5pt dotted #AEAEAE;border-bottom:.5pt dotted #7F7F7F;width:41pt'>무(과소)<br>신고</td>
		<td colspan=7 rowspan=2 class=xl256 width=72 style='border-right:.5pt dotted #AEAEAE;border-bottom:.5pt dotted #7F7F7F;width:56pt'>납부(환급)<br>불성실</td>
		<td colspan=5 rowspan=2 class=xl273 width=65 style='border-right:.5pt dotted #AEAEAE;width:50pt'>지방세법<br>제103조의30에 <br>따른 가산세</td>
		<td colspan=8 rowspan=2 class=xl279 width=50 style='border-right:.5pt dotted #AEAEAE;width:38pt'>동업기업 가산세 배분액</td>
		<td colspan=2 rowspan=2 class=xl256 width=39 style='border-right:.5pt solid #7F7F7F;width:30pt'>기타</td>
		<td colspan=5 rowspan=2 class=xl310 width=75 style='border-right:.5pt dotted #787878;border-bottom:.5pt solid #787878;width:55pt'>(43)납세지별&nbsp;기납부세액</td>
		<td colspan=10 class=xl260 width=108 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:83pt'>특별징수납부세액</td>
		<td colspan=3 class=xl263 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=25 style='mso-height-source:userset;height:18.95pt'>
		<td colspan=10 height=25 class=xl265 width=108 style='border-right:.5pt dotted #AEAEAE;height:18.95pt;border-left:none;width:83pt'>수시부과세액 및 <br>예정신고납부세액</td>
		<td colspan=3 class=xl268 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=2 height=17 class=xl270 width=51 style='border-right:.5pt dotted #AEAEAE;height:12.75pt;width:38pt'>　</td>
		<td colspan=2 class=xl272 width=54 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:41pt'>　</td>
		<td colspan=7 class=xl272 width=72 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:56pt'>　</td>
		<td colspan=5 class=xl272 width=65 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:50pt'>　</td>
		<td colspan=8 class=xl272 width=50 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:38pt'>　</td>
		<td colspan=2 class=xl272 width=39 style='border-right:.5pt solid #7F7F7F;border-left:none;width:30pt'>　</td>
		<td colspan=15 class=xl285 width=183 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:138pt'>(44)경정ㆍ수정신고 등 가감액</td>
		<td colspan=3 class=xl288 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=26 height=17 class=xl290 width=331 style='border-right:.5pt solid #7F7F7F;height:12.75pt;width:253pt'>(45)탄력세율적용 조정세액</td>
		<td colspan=15 class=xl292 width=183 style='border-right:.5pt dotted #AEAEAE;border-left:none;width:138pt'>(46)당해 납세지에 납부할 세액</td>
		<td colspan=3 class=xl295 width=115 style='border-left:none;width:87pt'>　</td>
	</tr>
	<tr class=xl65 height=4 style='mso-height-source:userset;height:3.0pt'>
		<td colspan=44 height=4 class=xl106 width=629 style='height:3.0pt;width:478pt'>　</td>
	</tr>
	<tr class=xl65 height=19 style='mso-height-source:userset;height:14.85pt'>
		<td colspan=5 rowspan=2 height=36 class=xl297 width=114 style='border-right:.5pt solid gray;border-bottom:.5pt solid black;height:27.6pt;width:86pt'>환급금계좌<br>(환급세액을 계좌로 <br>받는 경우)</td>
		<td colspan=8 class=xl319 width=81 style='border-right:.5pt solid gray;border-left:none;width:63pt;font-size:7.0pt;text-align:center;'>(47)금융기관명</td>
		<td colspan=20 class=xl322 width=229 style='border-right:.5pt solid gray;border-left:none;width:173pt'><%=obox.get("bank_nm")%></td>
		<td colspan=8 class=xl325 width=90 style='border-right:.5pt solid gray;border-left:none;width:69pt'>(48)예금주</td>
		<td colspan=3 class=xl328 width=115 style='border-left:none;width:87pt'><%=obox.get("corp_nm")%></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=8 height=17 class=xl330 width=81 style='border-right:.5pt solid gray;height:12.75pt;border-left:none;width:63pt'>(49)계좌번호</td>
		<td colspan=31 class=xl333 width=434 style='border-left:none;width:329pt'><%=obox.get("account_no")%></td>
	</tr>
	<tr class=xl65 height=31 style='mso-height-source:userset;height:23.85pt'>
		<td colspan=44 height=31 class=xl302 width=629 style='height:23.85pt;width:478pt'>신고인은 「지방세법」 제103조의23, 제103조의24 및 「지방세기본법」 제50조, 제51조, 제52조에 따라 위의 내용을 신고하며, 위 내용을 충분히 검토하였고 <font class="font9">신고인이 사실 그대로를 정확하게 적었음을 확인합니다.</font></td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=20 height=17 class=xl303 width=274 style='height:12.75pt; width:210pt'><%=StringUtil.strLooping("&nbsp;",180)%><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일</td>
		<td colspan=18 class=xl304 width=201 style='width:151pt'>신고인(법&nbsp; 인)</td>
		<td colspan=6 class=xl303 width=154 style='width:117pt'><%=obox.get("corp_nm")%>  (인)</td>
	</tr>
	<tr class=xl65 height=17 style='mso-height-source:userset;height:12.75pt'>
		<td colspan=20 height=17 class=xl305 width=274 style='height:12.75pt;width:210pt'></td>
		<td colspan=18 class=xl304 width=201 style='width:151pt'>신고인(대표자)</td>
		<td colspan=6 class=xl306 width=154 style='width:117pt'><%=obox.get("rep_person_nm")%>  (서명 또는 인)</td>
	</tr>
	<tr class=xl65 height=20 style='mso-height-source:userset;height:15.6pt'>
		<td colspan=44 height=20 class=xl316 width=629 style='height:15.6pt;width:478pt'>시장ㆍ군수ㆍ구청장<font class="font11"> </font><font class="font10">귀하</font></td>
	</tr>
	<tr class=xl65 height=7 style='mso-height-source:userset;height:5.25pt'>
		<td colspan=44 height=7 class=xl317 width=629 style='height:5.25pt;width:478pt'>　</td>
	</tr>
	<tr class=xl65 height=15 style='mso-height-source:userset;height:11.25pt'>
		<td colspan=44 height=15 class=xl318 width=629 style='height:11.25pt;width:478pt'>신고안내</td>
	</tr>
	<tr class=xl65 height=14 style='mso-height-source:userset;height:10.5pt'>
		<td colspan=44 height=14 class=xl283 width=629 style='height:10.5pt;width:478pt'>법인지방소득세는 사업연도종료<font class="font5">일이 속하는 달의 말일</font><font class="font8">부터 4개월 이내에 납세지 관할 지방자치단체에 신고납부하여야 합니다.</font></td>
	</tr>
	<tr class=xl65 height=22 style='mso-height-source:userset;height:16.5pt'>
		<td colspan=44 height=22 class=xl301 width=629 style='height:16.5pt;width:478pt'>210mm×297mm(백상지(80g/㎡)&nbsp;</td>
	</tr>
</table>
</body>
</html>