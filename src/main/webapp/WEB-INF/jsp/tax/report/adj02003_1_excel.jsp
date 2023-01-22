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
<title>[별지 제3호 서식] 법인세 과세표준 및 세액조정계산서</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.39in .79in .39in .79in;
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
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font6
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font7
	{color:blue;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:7.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:6.0pt;
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
	color:black;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl70
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
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl74
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
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
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
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
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
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
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
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
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
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
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
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl155
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
	border-left:.5pt solid gray;
	white-space:normal;}
.xl156
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
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl159
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl160
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl176
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl177
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	background:#939393;
	mso-pattern:black none;
	white-space:normal;}
.xl178
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl179
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl180
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
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
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl182
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
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
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
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
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl185
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl186
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl187
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl188
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl189
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl190
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl191
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl192
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl193
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
.xl194
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
.xl195
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl196
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl197
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl198
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid black;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl199
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl200
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl201
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl202
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl203
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl204
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl205
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl206
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #787878;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl207
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl208
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl209
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
	border-left:.5pt solid #787878;
	white-space:normal;}
.xl210
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl211
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl212
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl213
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid gray;
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
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl215
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl216
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl217
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl218
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl219
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl220
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl221
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl222
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl223
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl224
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl225
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
.xl226
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl227
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl228
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl229
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl230
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl231
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl232
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl233
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl234
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl235
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl236
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl237
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl238
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl239
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl240
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl241
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	white-space:normal;}
.xl242
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl243
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
.xl244
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl245
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl246
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl247
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl248
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl249
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl250
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl251
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
.xl252
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
.xl253
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl254
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl255
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl256
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl257
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl258
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl259
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl260
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl261
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl262
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
.xl263
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl264
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl265
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl266
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl267
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl268
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl269
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl270
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl271
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl272
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl273
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl274
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl275
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl276
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl277
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl278
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl279
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl280
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl281
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl282
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl283
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl284
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl285
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl286
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl287
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl288
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl289
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl290
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl291
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl292
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl293
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl294
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
.xl295
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
.xl296
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl297
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl298
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl299
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
.xl300
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl301
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl302
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl303
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl304
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	white-space:normal;}
.xl305
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl306
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl307
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl308
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl309
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl310
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl311
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl312
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl313
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl314
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl315
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl316
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl317
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl318
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl319
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl320
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl321
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl322
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl323
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl324
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl325
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl326
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl327
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl328
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl329
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl330
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;}
.xl331
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl332
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border:.5pt solid windowtext;}
.xl333
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl334
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;}
.xl335
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border:.5pt solid windowtext;}
.xl336
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl337
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl338
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}

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
<table border=0 cellpadding=0 cellspacing=0 width=694 style='border-collapse:
 collapse;table-layout:fixed;width:522pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=27 span=4 style='mso-width-source:userset;mso-width-alt:864;
 width:20pt'>
 <col width=16 span=2 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col width=17 style='mso-width-source:userset;mso-width-alt:544;width:13pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=21 span=5 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=27 style='mso-width-source:userset;mso-width-alt:864;width:20pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=21 span=2 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=30 style='mso-width-source:userset;mso-width-alt:960;width:23pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:1120;width:26pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=21 span=5 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=72 style='width:54pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=16 height=31 class=xl68 width=344 style='height:23.25pt;
  width:258pt'>■ 법인세법 시행규칙 [별지 제3호서식] <font class="font7">&lt;개정 2016.3.7.&gt;</font><ruby><font
  class="font5"><rt class=font5></rt></font></ruby></td>
  <td colspan=12 class=xl69 width=278 style='width:210pt'>(앞쪽)</td>
  <td class=xl65 width=72 style='width:54pt'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td colspan=2 rowspan=4 height=69 class=xl70 width=50 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid black;height:52.35pt;width:37pt'>사
  업<br>
    연 도</td>
  <td colspan=4 rowspan=4 class=xl76 width=97 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid black;width:72pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=13 rowspan=4 class=xl79 width=261 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid black;width:197pt'>법 인 세<span
  style='mso-spacerun:yes'>&nbsp; </span>과 세 표 준<span
  style='mso-spacerun:yes'>&nbsp; </span>및<br>
    세 액 조 정 계 산 서</td>
  <td colspan=4 rowspan=2 class=xl76 width=109 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid gray;width:82pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=5 rowspan=2 class=xl76 width=105 style='border-bottom:.5pt solid gray;
  width:80pt'><%=obox.get("corp_nm")%></td>
  <td class=xl65></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td height=17 class=xl65 style='height:12.95pt'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td colspan=4 rowspan=2 height=35 class=xl91 width=109 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid black;height:26.45pt;width:82pt'>사업자등록번호</td>
  <td colspan=5 rowspan=2 class=xl91 width=105 style='border-bottom:.5pt solid black;
  width:80pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl65 style='height:13.5pt'></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td colspan=28 height=5 class=xl115 width=622 style='height:3.75pt;
  width:468pt'>　</td>
  <td class=xl65></td>
 </tr>
 <% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110901","","", uSesEnt.dbo);
	Long pre_tax_amt = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td rowspan=15 height=188 class=xl165 width=23 style='border-bottom:.5pt solid black;
  height:142.2pt;width:17pt'>①<br>
    각<br>
    <br>
    사<br>
    업<br>
    연<br>
    도<br>
    <br>
    소<br>
    득<br>
    계<br>
    산</td>
  <td colspan=7 class=xl290 width=157 style='border-right:.5pt solid gray;
  border-left:none;width:117pt'>(101)결산서상 당기순손익</td>
  <td class=xl66 width=23 style='width:17pt'>01</td>
  <td colspan=5 class=xl281 width=105 style='border-right:.5pt solid black;
  border-left:none;width:80pt'>0</td>
  <td rowspan=79 class=xl72 width=13 style='width:10pt'></td>
  <td rowspan=3 class=xl287 width=23 style='border-bottom:.5pt solid black;
  width:17pt'>　</td>
  <td colspan=6 class=xl284 width=150 style='border-right:.5pt solid gray;
  border-left:none;width:113pt'>(133)감면분추가납부세액</td>
  <td class=xl66 width=23 style='width:17pt'>29</td>
  <td colspan=5 class=xl281 width=105 style='border-right:.5pt solid black;
  border-left:none;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.6pt'>
  <td colspan=2 rowspan=5 height=48 class=xl275 width=54 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid gray;height:37.2pt;width:40pt'>소득조정<br>
    금<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>액</td>
  <td colspan=5 rowspan=2 class=xl102 width=103 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid gray;width:77pt'>(102) 익 금 산 입</td>
  <td rowspan=2 class=xl94 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>02</td>
  <td colspan=5 rowspan=2 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td colspan=6 rowspan=2 class=xl142 width=150 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid black;width:113pt'>(134) 차 감 납 부 할 세 액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(125-132+133)<ruby><font class="font5"><rt class=font5></rt></font></ruby></td>
  <td rowspan=2 class=xl94 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>30</td>
  <td colspan=5 rowspan=2 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.6pt'>
  <td height=12 class=xl65 style='height:9.6pt'></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=5 rowspan=3 height=24 class=xl102 width=103 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid gray;height:18.0pt;width:77pt'>(103)
  손 금 산 입</td>
  <td rowspan=3 class=xl94 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>03</td>
  <td colspan=5 rowspan=3 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td colspan=13 class=xl267 width=301 style='width:227pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td rowspan=38 height=399 class=xl272 width=23 style='border-bottom:.5pt solid black;
  height:299.25pt;border-top:none;width:17pt'>⑤<br>
    토<br>
    지<br>
    등<br>
    양<br>
    도<br>
    소<br>
    득<br>
    에<br>
    <br>
    대<br>
    한<br>
    <br>
    법<br>
    인<br>
    세<br>
    <br>
    계<br>
    산</td>
  <td colspan=2 rowspan=5 class=xl116 width=43 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:32pt'>양도<br>
    차익</td>
  <td colspan=4 rowspan=3 class=xl122 width=107 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:81pt'>(135)등 기 자 산</td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>31</td>
  <td colspan=5 rowspan=3 class=xl134 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl65 style='height:6.0pt'></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=7 rowspan=2 height=26 class=xl142 width=157 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid gray;height:19.5pt;width:117pt'>(104)
  차 가 감 소 득 금 액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(101+102-103)</td>
  <td rowspan=2 class=xl94 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>04</td>
  <td colspan=5 rowspan=2 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=4 rowspan=2 height=25 class=xl122 width=107 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.75pt;width:81pt'>(136)미등기자산</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>32</td>
  <td colspan=5 rowspan=2 class=xl134 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl142 width=157 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid gray;height:18.0pt;width:117pt'>(105)
  기 부 금 한 도 초 과 액</td>
  <td rowspan=2 class=xl94 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>05</td>
  <td colspan=5 rowspan=2 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=2 height=21 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:15.75pt;width:113pt'>(137)
  비<span style='mso-spacerun:yes'>&nbsp; </span>과<span
  style='mso-spacerun:yes'>&nbsp; </span>세<span style='mso-spacerun:yes'>&nbsp;
  </span>소<span style='mso-spacerun:yes'>&nbsp; </span>득</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>33</td>
  <td colspan=5 rowspan=2 class=xl134 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl142 width=157 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid gray;height:20.25pt;width:117pt'>(106)
  기부금한도초과이월액 손금산입</td>
  <td rowspan=3 class=xl94 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>54</td>
  <td colspan=5 rowspan=3 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=6 rowspan=3 height=31 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:23.25pt;width:113pt'>(138)
  과<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>표<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>준<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span><font class="font6">(135+136-137)</font></td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>34</td>
  <td colspan=5 rowspan=3 class=xl134 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=7 rowspan=2 height=39 class=xl142 width=157 style='border-right:
  .5pt solid gray;border-bottom:.5pt solid black;height:29.25pt;width:117pt'>(107)
  각 사업연도소득금액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(104+105-106)</td>
  <td rowspan=2 class=xl94 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>06</td>
  <td colspan=5 rowspan=2 class=xl96 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=6 rowspan=2 height=35 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:26.25pt;width:113pt'>(139)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>35</td>
  <td colspan=5 rowspan=2 class=xl158 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0%</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=14 height=9 class=xl164 width=308 style='height:6.75pt;
  width:231pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td rowspan=16 height=160 class=xl165 width=23 style='border-bottom:.5pt solid black;
  height:120.0pt;border-top:none;width:17pt'>②<br>
    과<br>
    세<br>
    표<br>
    준<br>
    <br>
    계<br>
    산</td>
  <td colspan=7 rowspan=3 class=xl168 width=157 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:117pt'>(108) 각 사업연도소득금액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(108=107)</td>
  <td rowspan=3 class=xl175 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>　</td>
  <td colspan=5 rowspan=3 class=xl178 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td colspan=6 rowspan=2 class=xl122 width=150 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:113pt'>(140) 산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>출<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>36</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=6 rowspan=2 height=21 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:15.75pt;width:113pt'>(141)
  감<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>면<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>37</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(109)
  이<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>월<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>결<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>손<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>금</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>07</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=2 height=24 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.0pt;width:113pt'>(142)
  차감세액 (140-141)</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>38</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(110)
  비<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>과<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>소<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>득</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>08</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=2 height=24 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.0pt;width:113pt'>(143)
  공<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>제<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>39</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(111)
  소<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>득<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>공<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>제</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>09</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=3 height=30 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:22.5pt;width:113pt'>(144)<font
  class="font8"> 동업기업 법인세 배분액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(가산세 제외)</font></td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>58</td>
  <td colspan=5 rowspan=3 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid gray;height:20.25pt;width:117pt'>(112)
  과<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>표<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>준<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(108-109-110-111)</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid gray;
  border-top:none;width:17pt'>10</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid gray;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=6 rowspan=3 height=26 class=xl300 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:19.5pt;width:113pt'>(145)
  가<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(동업기업 배분액 포함)</td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>40</td>
  <td colspan=5 rowspan=3 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=13 height=8 class=xl196 width=285 style='border-right:.5pt solid black;
  height:6.0pt;border-left:none;width:214pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=26 class=xl102 width=157 style='border-right:
  .5pt solid #787878;border-bottom:.5pt solid black;height:19.5pt;width:117pt'>(159)
  선<span style='mso-spacerun:yes'>&nbsp; </span>박<span
  style='mso-spacerun:yes'>&nbsp; </span>표<span style='mso-spacerun:yes'>&nbsp;
  </span>준<span style='mso-spacerun:yes'>&nbsp; </span>이<span
  style='mso-spacerun:yes'>&nbsp; </span>익</td>
  <td rowspan=3 class=xl204 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>55</td>
  <td colspan=5 rowspan=3 class=xl207 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=6 rowspan=2 height=17 class=xl122 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:12.75pt;width:113pt'>(146)가감계<font
  class="font9">(142-143+144+145)</font></td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>41</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl65 style='height:6.0pt'></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=14 height=8 class=xl164 width=308 style='height:6.0pt;width:231pt'>　</td>
  <td rowspan=7 class=xl269 width=27 style='border-bottom:.5pt solid black;
  border-top:none;width:20pt'>기<br>
    납<br>
    부<br>
    세<br>
    액</td>
  <td colspan=5 rowspan=2 class=xl232 width=123 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:93pt'>(147) 수시부과세액</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>42</td>
  <td colspan=5 rowspan=2 class=xl311 width=105 style='border-right:.5pt solid black;
  width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td rowspan=17 height=174 class=xl165 width=23 style='border-bottom:.5pt solid black;
  height:130.5pt;border-top:none;width:17pt'>③<br>
    산<br>
    출<br>
    세<br>
    액<br>
    <br>
    계<br>
    산</td>
  <td colspan=7 rowspan=2 class=xl215 width=157 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:117pt'>(113) 과세표준(112+159)</td>
  <td rowspan=2 class=xl218 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>56</td>
  <td colspan=5 rowspan=2 class=xl178 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=5 rowspan=2 height=24 class=xl232 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.0pt;width:93pt'>(148)(<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>) 세 액</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>43</td>
  <td colspan=5 rowspan=2 class=xl226 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(114)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>11</td>
  <td colspan=5 rowspan=2 class=xl219 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=5 rowspan=3 height=28 class=xl232 width=123 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.0pt;width:93pt'>(149)
  계 <font class="font8"><span style='mso-spacerun:yes'>&nbsp;</span>(147+148)</font></td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>44</td>
  <td colspan=5 rowspan=3 class=xl226 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=7 rowspan=3 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(115)
  산<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>출<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>12</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl65 style='height:6.0pt'></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=6 rowspan=3 height=26 class=xl116 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:19.5pt;width:113pt'>(150)
  <font class="font8">차감납부할세액(146-149)</font></td>
  <td rowspan=3 class=xl131 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>45</td>
  <td colspan=5 rowspan=3 class=xl226 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl244 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:20.25pt;
  width:117pt'>(116) 지 점 유 보 소 득<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(「법인세법」 제96조)</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>13</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=13 height=9 class=xl264 width=301 style='height:6.75pt;
  width:227pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(117)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>14</td>
  <td colspan=5 rowspan=2 class=xl219 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td rowspan=15 class=xl263 width=23 style='width:17pt'>⑥<br>
    미<br>
    환<br>
    류<br>
    소<br>
    득<br>
    법<br>
    인<br>
    세</td>
  <td colspan=6 rowspan=2 class=xl323 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>(161) 미<span style='mso-spacerun:yes'>&nbsp;
  </span>환<span style='mso-spacerun:yes'>&nbsp; </span>류<span
  style='mso-spacerun:yes'>&nbsp; </span>소<span style='mso-spacerun:yes'>&nbsp;
  </span>득</td>
  <td rowspan=2 class=xl131 width=23 style='border-bottom:.5pt solid black;
  width:17pt'>59</td>
  <td colspan=5 rowspan=2 class=xl226 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td height=12 class=xl65 style='height:9.0pt'></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=7 rowspan=2 height=24 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:117pt'>(118)
  산<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>출<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>15</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td colspan=6 rowspan=2 class=xl323 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>(162) 세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td rowspan=2 class=xl336 style='border-bottom:.5pt solid black;border-top:
  none'>60</td>
  <td colspan=5 rowspan=2 class=xl314 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td height=12 class=xl65 style='height:9.0pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid black;height:20.25pt;width:117pt'>(119)
  합<span style='mso-spacerun:yes'>&nbsp; </span>계(115＋118)</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>16</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'>0</td>
  <td colspan=6 rowspan=3 class=xl323 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>(163) 산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>출<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=3 class=xl336 style='border-bottom:.5pt solid black;border-top:
  none'>61</td>
  <td colspan=5 rowspan=3 class=xl314 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=14 height=9 class=xl243 width=308 style='height:6.75pt;
  width:231pt'>　</td>
  <td colspan=6 rowspan=2 class=xl323 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>(164) 가<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=2 class=xl336 style='border-bottom:.5pt solid black;border-top:
  none'>62</td>
  <td colspan=5 rowspan=2 class=xl314 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td rowspan=28 height=332 class=xl165 width=23 style='border-bottom:.5pt solid black;
  height:249.0pt;border-top:none;width:17pt'>④<br>
    납<br>
    부<br>
    할<br>
    세<br>
    액<br>
    <br>
    계<br>
    산</td>
  <td colspan=7 rowspan=2 class=xl215 width=157 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:117pt'>(120) 산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>출<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(120=119)</td>
  <td rowspan=2 class=xl175 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>　</td>
  <td colspan=5 rowspan=2 class=xl178 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=6 rowspan=2 height=22 class=xl332 style='height:16.5pt'>(165)
  기<span style='mso-spacerun:yes'>&nbsp; </span>납<span
  style='mso-spacerun:yes'>&nbsp; </span>부<span style='mso-spacerun:yes'>&nbsp;
  </span>세<span style='mso-spacerun:yes'>&nbsp; </span>액</td>
  <td rowspan=2 class=xl334 style='border-top:none'>63</td>
  <td colspan=5 rowspan=2 class=xl335>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:20.25pt;
  width:117pt'>(121) 최저한세<span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>적용대상<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>공<span style='mso-spacerun:yes'>&nbsp; </span>제<span
  style='mso-spacerun:yes'>&nbsp; </span>감<span style='mso-spacerun:yes'>&nbsp;
  </span>면<span style='mso-spacerun:yes'>&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp; </span>액</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>17</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=6 rowspan=4 height=36 class=xl333 width=150 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:27.0pt;width:113pt'>(166)
  납<span style='mso-spacerun:yes'>&nbsp; </span>부<span
  style='mso-spacerun:yes'>&nbsp; </span>할<span style='mso-spacerun:yes'>&nbsp;
  </span>세<span style='mso-spacerun:yes'>&nbsp; </span>액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(163+164+165)</td>
  <td rowspan=4 class=xl334 style='border-top:none'>64</td>
  <td colspan=5 rowspan=4 class=xl335>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=7 rowspan=3 height=27 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:20.25pt;
  width:117pt'>(122) 차<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>감<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>18</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td height=9 class=xl65 style='height:6.75pt'></td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.75pt'>
  <td colspan=13 height=9 class=xl265 width=301 style='height:6.75pt;
  width:227pt'></td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=7 rowspan=2 height=26 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:19.5pt;width:117pt'>(123)<font
  class="font6"> 최저한세<span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>적용제외<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>공<span style='mso-spacerun:yes'>&nbsp; </span>제<span
  style='mso-spacerun:yes'>&nbsp; </span>감<span style='mso-spacerun:yes'>&nbsp;
  </span>면<span style='mso-spacerun:yes'>&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp; </span>액</font></td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>19</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td rowspan=20 class=xl263 width=23 style='width:17pt'>⑦<br>
    세<br>
    <br>
    액<br>
    <br>
    계</td>
  <td colspan=6 rowspan=2 class=xl310 width=150 style='width:113pt'>(151)
  차감납부할세액계<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(134+150+166)</td>
  <td rowspan=2 class=xl257 width=23 style='width:17pt'>46</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td height=13 class=xl65 style='height:9.75pt'></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=7 height=24 class=xl297 width=157 style='border-right:.5pt solid #7F7F7F;
  height:18.0pt;border-left:none;width:117pt'>(124) 가<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>산<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>액</td>
  <td class=xl67 width=23 style='width:17pt'>20</td>
  <td colspan=5 class=xl294 width=105 style='border-right:.5pt solid black;
  border-left:none;width:80pt'>0</td>
  <td colspan=6 rowspan=2 class=xl309 width=150 style='width:113pt'>(152) 사실과
  다른 회계처리 경정 세액 공제</td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>57</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=7 rowspan=2 height=26 class=xl185 width=157 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:19.5pt;width:117pt'>(125)
  가<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>감<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>계<font class="font6"><br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(122-123+124)</font></td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>21</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.75pt'>
  <td colspan=6 rowspan=3 height=29 class=xl310 width=150 style='height:21.75pt;
  width:113pt'>(153) 분납세액계산범위액<font class="font9"><br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;
  </span>(151-124-133-145-152+131)</font></td>
  <td rowspan=3 class=xl257 width=23 style='border-top:none;width:17pt'>47</td>
  <td colspan=5 rowspan=3 class=xl247 width=105 style='width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td rowspan=15 height=176 class=xl248 width=27 style='border-bottom:.5pt solid black;
  height:132.0pt;border-top:none;width:20pt'>기<br>
    납<br>
    부<br>
    세<br>
    액</td>
  <td rowspan=11 class=xl251 width=27 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:20pt'>기<br>
    한<br>
    내<br>
    납<br>
    부<br>
    세<br>
    액</td>
  <td colspan=5 rowspan=3 class=xl254 width=103 style='border-right:.5pt solid #7F7F7F;
  border-bottom:.5pt solid #7F7F7F;width:77pt'>(126)중간예납세액</td>
  <td rowspan=3 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>22</td>
  <td colspan=5 rowspan=3 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td height=8 class=xl65 style='height:6.0pt'></td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=2 rowspan=6 height=70 class=xl263 width=43 style='height:52.5pt;
  width:32pt'>분납할<br>
    세<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>액</td>
  <td colspan=4 rowspan=2 class=xl309 width=107 style='width:81pt'>(154) 현 금 납
  부</td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>48</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=5 rowspan=2 height=24 class=xl254 width=103 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:77pt'>(127)수시부과세액</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>23</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=4 rowspan=2 height=24 class=xl309 width=107 style='height:18.0pt;
  width:81pt'>(155) 물<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>납</td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>49</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=5 rowspan=2 height=24 class=xl254 width=103 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:77pt'>(128)원천납부세액</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>24</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=4 rowspan=2 height=26 class=xl309 width=107 style='height:19.5pt;
  width:81pt'>(156) 계 <font class="font8">(154+155)</font></td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>50</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td colspan=5 rowspan=2 height=28 class=xl254 width=103 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:21.0pt;width:77pt'>(129)간접투자회사등의
  외국납부세액<span style='mso-spacerun:yes'>&nbsp;</span></td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>25</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td colspan=2 rowspan=7 height=90 class=xl263 width=43 style='height:67.5pt;
  width:32pt'>차<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>감<br>
    납<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>부<br>
    세<span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>액</td>
  <td colspan=4 rowspan=2 class=xl309 width=107 style='width:81pt'>(157) 현 금 납
  부</td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>51</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td colspan=5 rowspan=2 height=28 class=xl254 width=103 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:21.0pt;width:77pt'>(130)소<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계<br>
    (126+127+128+129)</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>26</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:10.5pt'>
  <td colspan=4 rowspan=2 height=26 class=xl309 width=107 style='height:19.5pt;
  width:81pt'>(158) 물<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>납</td>
  <td rowspan=2 class=xl257 width=23 style='border-top:none;width:17pt'>52</td>
  <td colspan=5 rowspan=2 class=xl247 width=105 style='width:80pt'>0</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=2 height=24 class=xl254 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid #7F7F7F;height:18.0pt;width:97pt'>(131)신고납부전가산세액</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:17pt'>27</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid #7F7F7F;width:80pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=4 rowspan=3 height=36 class=xl310 width=107 style='height:27.0pt;
  width:81pt'>(160) 계 <font class="font9">(157+158)<br>
    (160=(151-152-156))</font></td>
  <td rowspan=3 class=xl257 width=23 style='border-top:none;width:17pt'>53</td>
  <td colspan=5 rowspan=3 class=xl247 width=105 style='width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=6 rowspan=2 height=24 class=xl254 width=130 style='border-right:
  .5pt solid #7F7F7F;border-bottom:.5pt solid black;height:18.0pt;width:97pt'>(132)합계(130+131)</td>
  <td rowspan=2 class=xl191 width=23 style='border-bottom:.5pt solid black;
  border-top:none;width:17pt'>28</td>
  <td colspan=5 rowspan=2 class=xl193 width=105 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:80pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
  <td class=xl65></td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td height=12 class=xl65 style='height:9.0pt'></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.75pt'>
  <td colspan=28 height=5 class=xl261 width=622 style='height:3.75pt;
  width:468pt'>　</td>
  <td class=xl65></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=28 height=35 class=xl262 width=622 style='height:26.25pt;
  width:468pt'>210mm×297mm[백상지 80g/㎡ 또는 중질지 80g/㎡]</td>
  <td class=xl65></td>
 </tr>
</table>
</body>
</html>