<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
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
<title>[별지 제3호의2서식3] 표준대차대조표(금융·보험·증권업 법인용)</title>
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
.font6
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font8
	{color:blue;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font9
	{color:blue;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font10
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
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
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font13
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font14
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font15
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font16
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font20
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font22
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
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl71
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border:.5pt solid black;
	white-space:normal;}
.xl72
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl82
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
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl98
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl99
	{mso-style-parent:style16;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:12.8pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
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
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:12.8pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl118
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
.xl119
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
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	border-top:none;
	border-right:.5pt solid black;
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
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
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

<body link=blue vlink=purple>

<table border=0 cellpadding=0 cellspacing=0 width=645 style='border-collapse:
 collapse;table-layout:fixed;width:485pt'>
 <col width=158 style='mso-width-source:userset;mso-width-alt:5056;width:119pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=129 style='mso-width-source:userset;mso-width-alt:4128;width:97pt'>
 <col width=46 style='mso-width-source:userset;mso-width-alt:1472;width:35pt'>
 <col width=119 style='mso-width-source:userset;mso-width-alt:3808;width:89pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1152;width:27pt'>
 <col width=125 style='mso-width-source:userset;mso-width-alt:4000;width:94pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=6 rowspan=2 height=36 class=xl93 width=520 style='border-bottom:
  1.5pt solid black;height:27.0pt;width:391pt'>■ 법인세법 시행규칙 <font class="font7">[</font><font
  class="font6">별지 제</font><font class="font7">3</font><font class="font6">호의</font><font
  class="font7">2</font><font class="font6">서식</font><font class="font7">(3)] </font><font
  class="font8">&lt;</font><font class="font9">개정 </font><font class="font8">2015.3.13.&gt;<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td class=xl109 width=125 style='width:94pt'></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td height=14 class=xl110 width=125 style='height:10.5pt;width:94pt'>(3쪽 중
  제1쪽)</td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=7 height=27 class=xl114 width=645 style='height:20.25pt;
  width:485pt'>표준대차대조표</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl70 width=158 style='height:16.5pt;width:119pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><font class="font13"><span style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=4 class=xl108 width=326 style='width:245pt'>(금융ㆍ보험ㆍ증권업 법인용)</td>
  <td class=xl70 width=36 style='width:27pt'>　</td>
  <td class=xl115 width=125 style='width:94pt'>(단위: 원)</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl112 width=158 style='height:12.75pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl127 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl86 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl131 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl88 width=161 style='border-bottom:2.0pt double black;
  width:121pt'><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일 현재</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl113 width=158 style='height:12.75pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl129 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl74 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl68 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl69 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl69 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl69 width=125 style='border-top:none;width:94pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅰ<font
  class="font16">.</font><font class="font15">현금 및 예치금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>1</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>106</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><font
  class="font22"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font16">(1)</font><font class="font15">현금 및 현금성자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>2</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>5.<font
  class="font5">부동산담보대출금</font><font class="font14">(</font><font class="font5">보험업</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>107</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">현금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>3</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11101_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>108</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">예금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>4</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11103_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>6.<font class="font5">신용대출금</font><font
  class="font14">(</font><font class="font5">보험업</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>109</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.MMDA</td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>5</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>110</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.MMF</td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>6</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>7.<font class="font5">신용공여금</font><font
  class="font14">(</font><font class="font5">증권업</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>111</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font5">금융어음</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>7</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>112</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>6.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>8</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>8.<font class="font5">기타</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>113</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">예치금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>18</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>114</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">지급준비예치금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>19</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">콜론</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>123</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">중앙회예치금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>20</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">내국수입유산스</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>124</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>3.<font class="font5">고객예탁금별도예치금</font><span
  style='display:none'><font class="font14">(</font><font class="font5">예금</font><font
  class="font14">)</font></span></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>21</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>125</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>4.<font class="font5">고객예탁금별도예치금</font><span
  style='display:none'><font class="font14">(</font><font class="font5">신탁</font><font
  class="font14">)</font></span></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>22</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">신용카드채권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>126</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>23</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">카드대급금</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>127</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>33</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>128</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅱ<font
  class="font16">.</font><font class="font15">유가증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>43</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">카드론</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>129</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">단기매매증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>44</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>130</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font15">주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>45</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">기타</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>131</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font15">채권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>46</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>132</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">신주인수권증서</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>47</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">매입외환</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>141</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">수익증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>48</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>142</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font5">기업융통어음</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>49</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><font class="font22"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font16">(6)</font><font class="font15">할인 및 매입어음</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>143</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>6.<font class="font5">해외유가증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>50</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>144</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>7.<font class="font5">신종증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>51</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><font class="font22"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font16">(7)</font><font class="font15">환매조건부채권 매수</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>145</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>8.<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>52</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font5">팩토링채권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>146</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">매도가능증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>62</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>147</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font15">주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>63</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font15">지급보증대지급</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>148</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">출자금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>64</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>149</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font15">채권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>65</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'>(10)<font class="font5">사모사채</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>150</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">수익증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>66</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>151</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font5">해외유가증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>67</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'>(11)<font class="font5">할부금융채권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>152</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>6.<font class="font5">신종증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>68</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>153</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>7.<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>69</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅳ<font class="font16">.</font><font class="font15">파생상품자산</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>154</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">만기보유증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>79</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font5">선물</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>155</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font15">주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>80</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">옵션</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>156</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font15">채권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>81</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">장외파생상품</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>157</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">수익증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>82</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅴ<font class="font16">.</font><font class="font15">어음관리계좌자산<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>158</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">해외유가증권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>83</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font5">예치금</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>159</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>84</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">유가증권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>160</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font15">지분법적용투자주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>94</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">할인및매입어음</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>161</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>95</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>162</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">출자금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>96</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅵ<font class="font16">.</font><font class="font15">리스자산</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>163</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅲ<font
  class="font16">.</font><font class="font15">대출채권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>97</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">금융리스채권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>164</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">대출금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>98</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>165</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">원화대출금</font><font
  class="font14">(</font><font class="font5">은행업</font><font class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>99</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>166</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>100</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">운용리스자산</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>167</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">외화대출금</font><font
  class="font14">(</font><font class="font5">은행업</font><font class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>101</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>168</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>102</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">리스자산처분손실충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>169</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">보험약관대출금</font><font
  class="font14">(</font><font class="font5">보험업</font><span style='display:
  none'><font class="font14">)</font></span></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>103</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">해지금융리스채권</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>170</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>104</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl65 width=36 style='border-top:none;border-left:none;width:27pt'>171</td>
  <td class=xl118 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">유가증권담보대출금</font><font
  class="font14">(</font><font class="font5">보</font><span style='display:none'><font
  class="font5">험업</font><font class="font14">)</font></span></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>105</td>
  <td class=xl72 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">해지금융리스자산</font></td>
  <td class=xl67 width=36 style='border-top:none;border-left:none;width:27pt'>172</td>
  <td class=xl119 width=125 style='border-top:none;width:94pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl80 width=645 style='height:17.25pt;
  width:485pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl120 width=645 style='height:16.5pt;
  width:485pt'>210mm×297mm[<font class="font12">백상지 </font><font class="font10">80g/</font><font
  class="font12">㎡ 또는 중질지 </font><font class="font10">80g/</font><font
  class="font12">㎡</font><font class="font10">]</font></td>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=7 height=22 class=xl109 width=645 style='height:16.5pt;
  width:485pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl101 width=645 style='height:17.25pt;
  width:485pt'>(3<font class="font12">쪽 중 제</font><font class="font11">2</font><font
  class="font12">쪽</font><font class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=7 height=27 class=xl100 width=645 style='height:20.25pt;
  width:485pt'>표준대차대조표</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl70 width=158 style='height:16.5pt;width:119pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><font class="font13"><span style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=4 class=xl108 width=326 style='width:245pt'>(금융ㆍ보험ㆍ증권업 법인용)</td>
  <td class=xl70 width=36 style='width:27pt'>　</td>
  <td class=xl115 width=125 style='width:94pt'>(단위: 원)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl112 width=158 style='height:16.5pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl127 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl86 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl131 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl88 width=161 style='border-bottom:2.0pt double black;
  width:121pt'><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일 현재</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl113 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl129 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl74 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl68 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl69 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl69 width=125 style='border-top:none;border-left:none;width:94pt'>금
  액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>173</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅸ<font class="font16">.</font><font class="font15">특별계정자산</font><font
  class="font16">(</font><font class="font15">보험업</font><font class="font16">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>269</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font15">선급리스자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>174</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'>자산총계<font class="font16">(</font><font class="font15">Ⅰ</font><font
  class="font16">+</font><font class="font15">～Ⅸ</font><font class="font16">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>270</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'><%=rbox.get("code1_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>175</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅰ<font class="font16">.</font><font class="font15">예수부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>271</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅶ<font
  class="font16">.</font><font class="font15">유형자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>185</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">예수금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>272</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">토지</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>186</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">요구불예금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>273</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">손상차손누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>187</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">기한부예금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>274</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">건물</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>188</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">고객예수금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>275</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>189</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">수입담보금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>276</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">손상차손누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>190</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>277</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">차량운반구</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>191</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅱ<font class="font16">.</font><font class="font15">차입부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>287</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>192</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">단기차입금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>288</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">임차시설물</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>193</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">장기차입금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>289</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>194</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">콜머니</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>290</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font15">건설중인자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>195</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font15">매출어음</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>291</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font5">집기</font><font
  class="font14">,</font><font class="font5">기구</font><font class="font14">,</font><font
  class="font5">비품</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>196</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><font class="font22"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font16">(5)</font><font class="font15">환매조건부채권 매도</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>292</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>197</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>293</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">손상차손누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>198</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅲ<font class="font16">.</font><font class="font15">사채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>303</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>199</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font5">후순위사채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>304</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅷ<font
  class="font16">.</font><font class="font15">기타자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>204</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11109_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">전환사채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>305</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">투자부동산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>205</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>306</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">토지</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>206</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅳ<font class="font16">.</font><font class="font15">파생상품부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>311</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">건물</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>207</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font5">선물</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>312</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>208</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">옵션</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>313</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>209</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">장외파생상품</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>314</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">감가상각누계액</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>210</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅴ<font class="font16">.</font><font class="font15">기타부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>315</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">비업무용자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>219</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">퇴직급여충당부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>316</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">보증금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>220</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">퇴직연금미지급금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>317</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font15">미수금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>221</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">국민연금전환금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>318</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">자기매매미수금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>222</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">퇴직보험예치금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>319</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>223</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">퇴직연금운용자산</font><font
  class="font14">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>320</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">위탁매매미수금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>224</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">미지급금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>321</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>225</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">미지급배당금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>322</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">보험미수금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>226</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">미지급법인세</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>323</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>227</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">미지급비용</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>324</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>228</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">미지급이자</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>325</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>229</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>326</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font15">선급금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>238</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font5">선수금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>331</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">채권경과이자</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>239</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font15">선수수익</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>332</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>240</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font5">보증금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>333</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">선급비용</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>245</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11109_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font
  class="font15">수입보증금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>334</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">선급법인세</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>246</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code1110901_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">리스보증금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>335</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>247</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code1110902_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">임대보증금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>336</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font15">이연법인세자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>252</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>337</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font15">무형자산</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>253</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'>(10)<font class="font15">이연법인세부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>342</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>1.<font class="font5">영업권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>254</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'>(11)<font class="font15">지급보증충당부채</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>343</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>2.<font class="font5">산업재산권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>255</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'>(12)<font class="font15">기타</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>344</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>3.<font class="font5">개발비</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>256</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl102 style='border-right:.5pt solid black;border-left:
  none'>Ⅵ<font class="font16">.</font><font class="font15">보험사제준비금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>354</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>4.<font class="font5">소프트웨어</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>257</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">책임준비금</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>355</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>5.<font class="font5">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>258</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font class="font5">출재보험준비금</font><font
  class="font14">)</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>356</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(9)<font class="font5">손해배상공동기금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>263</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">계약자지분조정</font></td>
  <td class=xl66 width=36 style='border-top:none;border-left:none;width:27pt'>357</td>
  <td class=xl118 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 style='height:12.75pt;border-top:none'>(10)<font
  class="font15">기타</font></td>
  <td class=xl121 width=32 style='border-top:none;border-left:none;width:24pt'>264</td>
  <td class=xl72 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">비상위험준비금</font></td>
  <td class=xl121 width=36 style='border-top:none;border-left:none;width:27pt'>358</td>
  <td class=xl119 width=125 style='border-top:none;border-left:none;width:94pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl80 width=645 style='height:17.25pt;
  width:485pt'>　</td>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=7 height=22 class=xl109 width=645 style='height:16.5pt;
  width:485pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl101 width=645 style='height:17.25pt;
  width:485pt'>(3<font class="font12">쪽 중 제</font><font class="font11">3</font><font
  class="font12">쪽</font><font class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=7 height=27 class=xl100 width=645 style='height:20.25pt;
  width:485pt'>표준대차대조표</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td height=22 class=xl70 width=158 style='height:16.5pt;width:119pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><font class="font13"><span style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=4 class=xl108 width=326 style='width:245pt'>(금융ㆍ보험ㆍ증권업 법인용)</td>
  <td class=xl70 width=36 style='width:27pt'>　</td>
  <td class=xl115 width=125 style='width:94pt'>(단위: 원)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl112 width=158 style='height:16.5pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl127 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl86 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl131 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl88 width=161 style='border-bottom:2.0pt double black;
  width:121pt'><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일 현재</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl113 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl129 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl74 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl68 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl69 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl69 width=125 style='border-top:none;border-left:none;width:94pt'>금
  액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅶ<font
  class="font16">.</font><font class="font15">특별계정부채</font><font class="font16">(</font><font
  class="font15">보험업</font><font class="font16">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>359</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=4 rowspan=37 class=xl90 width=326 style='border-bottom:1.5pt solid black;
  width:245pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl79 style='height:12.75pt;border-top:none'>부채총계<font
  class="font16">(</font><font class="font15">Ⅰ</font><font class="font16">+</font><font
  class="font15">～Ⅶ</font><font class="font16">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>360</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅷ<font
  class="font16">.</font><font class="font15">자본금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>361</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code31_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font5">보통주자본금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>362</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code31_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">우선주자본금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>363</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅸ<font
  class="font16">.</font><font class="font15">자본잉여금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>364</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">주식발행초과금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>365</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">감자차익</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>366</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">자기주식처분이익</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>367</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font15">재평가적립금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>368</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>369</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>Ⅹ<font
  class="font16">.</font><font class="font15">자본조정</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>374</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">주식할인발행차금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>375</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">감자차손</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>376</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font15">자기주식</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>377</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">미교부주식배당금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>378</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">자기주식처분손실</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>379</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font5">주식매수선택권</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>380</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>381</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>&#8554;<font
  class="font16">.</font><font class="font15">기타포괄손익누계액</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>386</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">매도가능증권평가손익</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>387</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font5">해외사업환산손익</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>388</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">지분법자본변동</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>389</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=2 height=34 class=xl122 width=158 style='border-bottom:.5pt solid black;
  height:25.5pt;border-top:none;width:119pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font5">현금흐름위험회피파생<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>상품평가손익</font></td>
  <td rowspan=2 class=xl96 width=32 style='border-bottom:.5pt solid black;
  border-top:none;width:24pt'>390</td>
  <td rowspan=2 class=xl98 width=129 style='border-bottom:.5pt solid black;
  border-top:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font5">재평가잉여금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>391</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">기타</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>392</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'>&#8555;<font
  class="font16">.</font><font class="font15">이익잉여금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>397</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font15">이익준비금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>398</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font15">기업합리화적립금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>399</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font5">재무구조개선적립금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>400</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><font
  class="font22"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font16">(4)</font><font class="font15">「조세특례제한법」</font><span
  style='display:none'><font class="font15">상 준비금</font></span></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>401</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font15">기타임의적립금</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>402</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl124 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font15">미처분이익잉여금</font></td>
  <td rowspan=2 class=xl96 width=32 style='border-bottom:.5pt solid black;
  border-top:none;width:24pt'>403</td>
  <td rowspan=2 class=xl98 width=129 style='border-bottom:.5pt solid black;
  border-top:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl125 style='height:12.75pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>또는
  미처리결손금</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl79 style='height:12.75pt;border-top:none'>자본총계<font
  class="font16">(</font><font class="font15">Ⅷ</font><font class="font16">+</font><font
  class="font15">～&#8555;</font><font class="font16">)</font></td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>404</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code3_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl126 style='height:12.75pt;border-top:none'>부채와 자본총계</td>
  <td class=xl66 width=32 style='border-top:none;border-left:none;width:24pt'>405</td>
  <td class=xl71 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code32_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 rowspan=2 height=46 class=xl80 width=645 style='border-bottom:
  1.5pt solid black;height:34.5pt;width:485pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl82 width=645 style='height:17.25pt;
  width:485pt'>작성방법</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=7 height=30 class=xl83 width=645 style='height:22.5pt;width:485pt'>※
  이 표준대차대조표는 기업회계기준<font class="font11">(K-IFRS, </font><font class="font12">중소기업회계기준
  등</font><font class="font11">)</font><font class="font12">을 준용하여 작성한 대차대조표를
  기준으로 다음과 같이 작성하여야 합니다</font><font class="font11">.</font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=7 height=30 class=xl84 width=645 style='height:22.5pt;width:485pt'>1.
  <font class="font12">해당 법인이 기업회계기준을 준용하여 작성한 대차대조표를 기준으로 하여 </font><font
  class="font20">음영 표시된 항목란</font><font class="font12">에만 기재하여 작성할 수 있습니다</font><font
  class="font11">.<span style='mso-spacerun:yes'>&nbsp;</span></font></td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=7 height=30 class=xl84 width=645 style='height:22.5pt;width:485pt'>2.
  <font class="font12">이 표준대차대조표는 한국표준산업분류표상 금융ㆍ보험ㆍ증권업 법인</font><font
  class="font11">(</font><font class="font12">금융관련서비스업 중 기타금융서비스업과 보험 및 연금관련
  서비스업은 제외한다</font><font class="font11">)</font><font class="font12">이 작성합니다</font><font
  class="font11">.</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl85 width=645 style='height:17.25pt;
  width:485pt'>3. <font class="font12">대차대조표의 계정과목과 동일한 계정과목이 없는 경우에는 기타란에 회사에서
  사용하는 계정과목과 금액을 적습니다</font><font class="font11">.</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl80 width=645 style='height:17.25pt;
  width:485pt'>　</td>
 </tr>
</table>

</body>
</html>
