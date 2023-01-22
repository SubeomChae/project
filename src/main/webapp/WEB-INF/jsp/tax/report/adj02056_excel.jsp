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
<title>[별지 제56호 서식] 법인세·농어촌특별세 과세표준(조정계산)및 세액신고서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.55in .51in .55in .75in;
	mso-header-margin:.31in;
	mso-footer-margin:.31in;}
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
	font-size:16.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:10.0pt;
	font-weight:700;
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
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font11
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font12
	{color:black;
	font-size:14.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:HY견고딕, serif;
	mso-font-charset:129;}
.font13
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양견고딕, monospace;
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
	border:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:bottom;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl75
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
.xl76
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
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl88
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
.xl89
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
.xl90
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
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl92
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
.xl93
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
.xl94
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
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #666666;
	border-left:none;
	white-space:normal;
	padding-right:15px;
	mso-char-indent-count:1;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid #666666;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:1.5pt solid #666666;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
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
.xl100
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
.xl101
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
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
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
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
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
	font-size:16.0pt;
	font-weight:700;
	font-family:한양견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl111
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
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #787878;
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
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
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
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
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
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D6D6D6;
	mso-pattern:black none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
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
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl155
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
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl157
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
.xl158
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
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl160
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
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl162
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
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid #787878;
	border-left:none;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #787878;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:bottom;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl177
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
.xl178
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"Long Date";
	text-align:right;
	white-space:normal;
	padding-right:15px;
	mso-char-indent-count:1;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;
	padding-right:15px;
	mso-char-indent-count:1;}
.xl181
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl183
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl184
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:bottom;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;
	padding-left:15px;
	mso-char-indent-count:1;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl193
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl194
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border:.5pt solid #5D5D5D;
	background:#ADADAD;
	mso-pattern:black none;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	background:#ADADAD;
	mso-pattern:black none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border:.5pt solid #5D5D5D;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:.5pt solid #5D5D5D;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl209
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #5D5D5D;
	border-right:none;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	background:#ADADAD;
	mso-pattern:black none;
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
<table border=0 cellpadding=0 cellspacing=0 width=646 style='border-collapse:
 collapse;table-layout:fixed;width:487pt'>
 <col width=61 span=3 style='mso-width-source:userset;mso-width-alt:1952;
 width:46pt'>
 <col width=41 style='mso-width-source:userset;mso-width-alt:1312;width:31pt'>
 <col width=61 span=3 style='mso-width-source:userset;mso-width-alt:1952;
 width:46pt'>
 <col width=59 style='mso-width-source:userset;mso-width-alt:1888;width:44pt'>
 <col width=61 span=2 style='mso-width-source:userset;mso-width-alt:1952;
 width:46pt'>
 <col width=58 style='mso-width-source:userset;mso-width-alt:1856;width:44pt'>
 <tr height=44 style='mso-height-source:userset;height:33.0pt'>
  <td colspan=8 height=44 class=xl71 width=466 style='height:33.0pt;width:351pt'>■
  법인세법 시행규칙 [별지 제56호서식] <font class="font5">&lt;개정 2013.2.23&gt;</font></td>
  <td colspan=3 class=xl70 width=180 style='width:136pt'>홈택스(www.hometax.go.kr)에서도
  신고할 수 있습니다.</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=11 height=27 class=xl66 width=646 style='height:20.25pt;
  width:487pt'>법인세ㆍ농어촌특별세 과세표준(조정계산) 및 세액신고서</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=11 height=22 class=xl67 width=646 style='height:16.5pt;
  width:487pt'>(이자소득만 있는 비영리법인 신고용)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl68 width=407 style='height:16.5pt;width:307pt'>※
  뒤쪽의 작성방법을 읽고 작성하여 주시기 바랍니다.</td>
  <td colspan=4 class=xl69 width=239 style='width:180pt'>(앞쪽)</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=7 height=17 class=xl181 width=407 style='border-right:.5pt solid black;
  height:12.75pt;width:307pt'>①소 재 지</td>
  <td colspan=4 class=xl183 width=239 style='border-left:none;width:180pt'>②전자우편주소</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=7 height=17 class=xl186 style='border-right:.5pt solid black;
  height:12.75pt'><%=obox.get("addr")%></td>
  <td colspan=4 class=xl191 style='border-left:none'><%=obox.get("email_id")%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl181 width=285 style='border-right:.5pt solid black;
  height:12.75pt;width:215pt'>③법 인 명</td>
  <td colspan=6 class=xl183 width=361 style='border-left:none;width:272pt'>④대표자성명</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl186 style='border-right:.5pt solid black;
  height:12.75pt'><%=obox.get("corp_nm")%></td>
  <td colspan=6 class=xl191 style='border-left:none'><%=obox.get("rep_person_nm")%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl181 width=285 style='border-right:.5pt solid black;
  height:12.75pt;width:215pt'>⑤사업자등록번호</td>
  <td colspan=3 class=xl183 width=181 style='border-right:.5pt solid black;
  border-left:none;width:136pt'>⑥사업연도</td>
  <td colspan=3 class=xl183 width=180 style='border-left:none;width:136pt'>⑦전화번호</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl188 style='height:12.75pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=3 class=xl189 style='border-left:none'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=3 class=xl189 style='border-right:none'><%=obox.get("tel_no")%></td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=11 height=6 class=xl77 width=646 style='height:5.1pt;width:487pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=5 height=22 class=xl75 width=285 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;width:215pt'>구 분</td>
  <td colspan=3 class=xl99 width=181 style='border-left:none;width:136pt'>법 인 세</td>
  <td colspan=3 class=xl99 width=180 style='border-right:none;width:136pt'>농 어 촌
  특 별 세</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
	Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익  %>
 <tr height=22 style='height:16.5pt'>
  <td rowspan=7 height=162 class=xl103 width=61 style='border-bottom:.5pt solid black;
  height:121.5pt;border-top:none;width:46pt'>과세표준<br>
    계산</td>
  <td colspan=4 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:169pt'>⑧이 자 소 득 금 액 계</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>⑨준 비 금 손 금 산 입 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>⑩기 부 금 손 금 산 입 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>⑪기부금한도초과 이월액손금산입</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl81 width=224 style='border-right:.5pt solid #5D5D5D;
  height:22.5pt;border-left:none;width:169pt'>⑫각 사 업 연 도 소 득 금 액<br>
    (⑧－⑨-⑩-⑪)</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>⑬비 과 세 소 득</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl201 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl78 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>⑭과 세 표 준(⑫－⑬)</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td rowspan=12 height=291 class=xl88 width=61 style='border-bottom:.5pt solid black;
  height:218.25pt;border-top:none;width:46pt'>세액의<br>
    계산</td>
  <td colspan=4 class=xl84 width=224 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:169pt'>⑮세 율</td>
  <td colspan=3 class=xl205 width=181 style='border-left:none;width:136pt'>14%</td>
  <td colspan=3 class=xl205 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>(16)산 출 세 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=4 height=33 class=xl192 width=224 style='border-right:.5pt solid #5D5D5D;
  height:24.75pt;border-left:none;width:169pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(미납세액, 미납일수, 세율)<br>
    <font class="font7">(17)가 산 세 액</font></td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl200 width=180 style='border-right:none;width:136pt'>(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>,<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>, 3/10,000)<br>
    </td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>(18)가감계(16+17)</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>0</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td rowspan=4 height=88 class=xl195 width=61 style='border-bottom:.5pt solid #5D5D5D;
  height:66.0pt;border-top:none;width:46pt'>기 납부<br>
    세액</td>
  <td colspan=3 class=xl72 width=163 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:123pt'>(19)중 간 예 납 세 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>　</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110901","","", uSesEnt.dbo); 
	Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=3 height=22 class=xl72 width=163 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:123pt'>(20)원 천 납 부 세 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=3 height=22 class=xl72 width=163 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:123pt'>(21)(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>)세 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>　</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=3 height=22 class=xl72 width=163 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:123pt'>(22)계(<font class="font7">19＋20＋21)</font></td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl93 width=224 style='border-right:.5pt solid #5D5D5D;
  height:22.5pt;border-left:none;width:169pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(세액, 미납일수, 세율)<br>
    (23)추 가 납 부 세 액</td>
  <td colspan=3 class=xl200 width=181 style='border-left:none;width:136pt'>(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>,<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>, 3/10,000)<br>
    </td>
  <td colspan=3 class=xl202 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=4 height=30 class=xl81 width=224 style='border-right:.5pt solid #5D5D5D;
  height:22.5pt;border-left:none;width:169pt'>(24)차 감 납 부 할 세 액<br>
    (<font class="font7">18－22+23)</font></td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl72 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>(25)분 납 할 세 액</td>
  <td colspan=3 class=xl203 width=181 style='border-left:none;width:136pt'>　</td>
  <td colspan=3 class=xl203 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=4 height=22 class=xl78 width=224 style='border-right:.5pt solid #5D5D5D;
  height:16.5pt;border-left:none;width:169pt'>(26)차감납부할세액(24-25)</td>
  <td colspan=3 class=xl207 width=181 style='border-left:none;width:136pt'><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
  <td colspan=3 class=xl207 width=180 style='border-right:none;width:136pt'>　</td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=11 height=6 class=xl87 width=646 style='height:5.1pt;width:487pt'>　</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td rowspan=3 height=75 class=xl88 width=61 style='border-bottom:.5pt solid black;
  height:56.25pt;border-top:none;width:46pt'>국세환급금계좌신고</td>
  <td colspan=3 class=xl84 width=163 style='border-right:.5pt solid #5D5D5D;
  border-left:none;width:123pt'>(27)예 입 처</td>
  <td colspan=7 class=xl91 width=422 style='border-left:none;width:318pt'><%=obox.get("bank_nm")%></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=3 height=25 class=xl72 width=163 style='border-right:.5pt solid #5D5D5D;
  height:18.75pt;border-left:none;width:123pt'>(28)예 금 종 류</td>
  <td colspan=7 class=xl176 width=422 style='border-left:none;width:318pt'><%=obox.get("account_type")%></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=3 height=25 class=xl78 width=163 style='border-right:.5pt solid #5D5D5D;
  height:18.75pt;border-left:none;width:123pt'>(29)계 좌 번 호</td>
  <td colspan=7 class=xl102 width=422 style='border-left:none;width:318pt'><%=obox.get("account_no")%></td>
 </tr>
 <tr height=41 style='mso-height-source:userset;height:30.75pt'>
  <td colspan=11 height=41 class=xl100 width=646 style='height:30.75pt;
  width:487pt'>신고인은 「법인세법」 제60조에 따라 위의 내용을 신고하며, <font class="font8">위 내용을 충분히
  검토하였고 신고인이 알고 있는 사실 그대로를 정확하게 적었음을 확인합니다.<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=6 height=36 class=xl173 width=346 style='height:27.0pt;
  width:261pt'>신고인(대표자)<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=3 class=xl199 width=181 style='width:136pt'><%=obox.get("rep_person_nm")%></td>
  <td colspan=2 class=xl174 width=119 style='width:90pt'>(서명 또는 인)</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=11 height=22 class=xl95 width=646 style='height:16.5pt;
  width:487pt'>세무대리인은 조세전문자격자로서 위 신고서를 성실하고 공정하게 작성하였음을 확인합니다</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=11 height=30 class=xl179 width=646 style='height:22.5pt;
  width:487pt'><%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6,8)%>일</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=6 height=30 class=xl185 width=346 style='height:22.5pt;
  width:261pt'>세무대리인<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td colspan=3 class=xl184 width=181 style='width:136pt'></td>
  <td colspan=2 class=xl175 width=119 style='width:90pt'>(서명 또는 인)</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=3 height=30 class=xl96 width=183 style='height:22.5pt;width:138pt'><%=obox.get("tax_office")%> 세무서장<font
  class="font9"><span style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=8 class=xl97 width=463 style='width:349pt'>귀하</td>
 </tr>
 <tr height=36 style='mso-height-source:userset;height:27.0pt'>
  <td colspan=11 height=36 class=xl98 width=646 style='height:27.0pt;
  width:487pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
 </tr>
</table>
</body>
</html>