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
<title>[별지 제16호 서식] 수입금액조정명세서</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 14">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.67in .71in .59in .79in;
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
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font11
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"MS Gothic", monospace;
	mso-font-charset:0;}
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
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl68
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
.xl69
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
.xl70
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
.xl71
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
.xl72
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
.xl73
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
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl80
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
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl82
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
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl92
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
.xl93
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
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl96
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
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
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
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl99
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
.xl100
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:0%;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl116
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
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.2pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl120
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
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl122
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
.xl123
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
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #5D5D5D;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:.5pt solid gray;
	white-space:normal;}
.xl134
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
.xl135
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
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:none;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid gray;
	border-right:.5pt solid gray;
	border-bottom:.5pt solid gray;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid gray;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
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
<table border=0 cellpadding=0 cellspacing=0 width=632 style='border-collapse:
 collapse;table-layout:fixed;width:482pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=13 span=4 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=16 span=2 style='mso-width-source:userset;mso-width-alt:512;
 width:12pt'>
 <col width=13 span=2 style='mso-width-source:userset;mso-width-alt:416;
 width:10pt'>
 <col width=17 style='mso-width-source:userset;mso-width-alt:544;width:13pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:640;width:15pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=23 style='mso-width-source:userset;mso-width-alt:736;width:17pt'>
 <col width=9 style='mso-width-source:userset;mso-width-alt:288;width:7pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=7 style='mso-width-source:userset;mso-width-alt:224;width:5pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=8 style='mso-width-source:userset;mso-width-alt:256;width:6pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=24 style='mso-width-source:userset;mso-width-alt:768;width:18pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=15 style='mso-width-source:userset;mso-width-alt:480;width:11pt'>
 <col width=16 style='mso-width-source:userset;mso-width-alt:512;width:12pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=10 span=3 style='mso-width-source:userset;mso-width-alt:320;
 width:8pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <col width=26 style='mso-width-source:userset;mso-width-alt:832;width:20pt'>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td colspan=37 height=31 class=xl135 width=580 style='height:23.25pt;
  width:442pt'>■ 법인세법 시행규칙 [별지 제16호서식] &lt;개정 2011.2.28&gt;</td>
  <td colspan=2 class=xl134 width=52 style='width:40pt'>(앞 쪽)</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 rowspan=4 height=64 class=xl92 width=58 style='border-right:
  .5pt solid #5D5D5D;border-bottom:.5pt solid black;height:48.0pt;width:44pt'>사
  업<br>
    연 도</td>
  <td colspan=6 rowspan=4 class=xl91 width=93 style='border-right:.5pt solid #5D5D5D;
  border-bottom:.5pt solid black;width:71pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%><br>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=18 rowspan=4 class=xl124 width=296 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:224pt'>수입금액조정명세서</td>
  <td colspan=6 rowspan=2 class=xl117 width=90 style='width:69pt'>법<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>인<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>명</td>
  <td colspan=6 rowspan=2 class=xl119 style='border-bottom:.5pt solid black'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=6 rowspan=2 height=32 class=xl118 width=90 style='height:24.0pt;
  width:69pt'>사업자등록번호</td>
  <td colspan=6 rowspan=2 class=xl119 width=95 style='width:74pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=39 height=6 class=xl116 width=632 style='height:5.1pt;width:482pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=39 height=30 class=xl110 width=632 style='height:22.5pt;
  width:482pt'><span style='mso-spacerun:yes'>&nbsp;</span>1.수입금액 조정계산</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td colspan=11 height=32 class=xl74 width=177 style='height:24.0pt;
  width:135pt'>계<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>정<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>과<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>목</td>
  <td colspan=5 rowspan=2 class=xl75 width=92 style='width:70pt'>③결산서상<br>
    수입금액</td>
  <td colspan=11 class=xl80 width=178 style='border-right:.5pt solid gray;
  border-left:none;width:134pt'>조<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>정</td>
  <td colspan=7 rowspan=2 class=xl75 width=103 style='width:79pt'>⑥조정 후
  수입<br>
    금액<br>
    (③＋④－⑤)</td>
  <td colspan=5 rowspan=2 class=xl80 width=82 style='width:64pt'>비&nbsp;&nbsp;
  고</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=6 height=26 class=xl74 width=97 style='height:20.1pt;width:74pt'>①항&nbsp;&nbsp;
  목</td>
  <td colspan=5 class=xl75 width=80 style='border-left:none;width:61pt'>②과&nbsp;&nbsp;
  목</td>
  <td colspan=6 class=xl80 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>④가<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>산</td>
  <td colspan=5 class=xl80 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>⑤차<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>감</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
	Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익
	
	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","", uSesEnt.dbo); 
	Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익  %>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>매출</td>
  <td colspan=5 class=xl141 style='border-left:none'>이자수익</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>매출</td>
  <td colspan=5 class=xl141 style='border-left:none'>대부이자수익</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'><%=FormatUtil.insertComma(String.valueOf(amt_61002))%></td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'><%=FormatUtil.insertComma(String.valueOf(amt_61002))%></td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>　</td>
  <td colspan=5 class=xl141 style='border-left:none'>　</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'>　</td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'>　</td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>　</td>
  <td colspan=5 class=xl141 style='border-left:none'>　</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'>　</td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'>　</td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>　</td>
  <td colspan=5 class=xl141 style='border-left:none'>　</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'>　</td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'>　</td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=6 height=21 class=xl140 style='height:15.95pt'>　</td>
  <td colspan=5 class=xl141 style='border-left:none'>　</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'>　</td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>　</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'>　</td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=11 height=21 class=xl74 width=177 style='height:15.95pt;
  width:135pt'>계</td>
  <td colspan=5 class=xl86 width=92 style='border-left:none;width:70pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%></td>
  <td colspan=6 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=5 class=xl87 width=89 style='border-right:.5pt solid gray;
  border-left:none;width:67pt'>0</td>
  <td colspan=7 class=xl86 width=103 style='border-left:none;width:79pt'><%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%></td>
  <td colspan=5 class=xl80 width=82 style='border-left:none;width:64pt'>　</td>
 </tr>
 <tr height=30 style='mso-height-source:userset;height:22.5pt'>
  <td colspan=39 height=30 class=xl109 width=632 style='height:22.5pt;
  width:482pt'><span style='mso-spacerun:yes'>&nbsp;</span>2. 수입금액 조정명세</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=39 height=25 class=xl110 width=632 style='height:18.75pt;
  width:482pt'>&nbsp; 가. 작업진행률에 의한 수입금액</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 rowspan=5 height=100 class=xl111 width=45 style='height:75.0pt;
  width:34pt'>⑦<br>
    공사명</td>
  <td colspan=4 rowspan=5 class=xl100 width=52 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid gray;width:40pt'>⑧<br>
    도급자</td>
  <td colspan=4 rowspan=5 class=xl100 width=67 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid gray;width:51pt'>⑨<br>
    도급<br>
    금액</td>
  <td colspan=12 class=xl139 style='border-left:none'>작업진행률계산</td>
  <td colspan=4 rowspan=5 class=xl75 width=70 style='width:53pt'>⑬누적익금<br>
    산입액<br>
    (⑨×⑫)</td>
  <td colspan=4 rowspan=5 class=xl75 width=66 style='width:50pt'>⑭전기말<br>
    누적수입<br>
    계상액</td>
  <td colspan=5 rowspan=5 class=xl75 width=66 style='width:51pt'>⑮당기회<br>
    사수입<br>
    계상액</td>
  <td colspan=4 rowspan=5 class=xl80 width=72 style='width:56pt'><font
  class="font11">&#9327;</font><font class="font5">조정액<br>
    </font><font class="font11">(⑬-⑭-⑮)</font></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=5 rowspan=4 height=80 class=xl138 width=83 style='height:60.0pt;
  width:63pt'>⑩해당사업<br>
    연도말<br>
    총공사비<br>
    누적액<br>
    (작업시간 등)</td>
  <td colspan=4 rowspan=4 class=xl77 width=69 style='width:52pt'>⑪<br>
    총공사<br>
    예정비<br>
    (작업시간 등)</td>
  <td colspan=3 rowspan=4 class=xl77 width=42 style='width:32pt'>⑫<br>
    진행률<br>
    (⑩/⑪)</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>　</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>　</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>　</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>　</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>　</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=2 height=18 class=xl76 width=45 style='height:14.1pt;width:34pt'>계</td>
  <td colspan=4 class=xl78 width=52 style='border-right:.5pt solid gray;
  border-left:none;width:40pt'>　</td>
  <td colspan=4 class=xl133 width=67 style='border-right:.5pt solid gray;
  border-left:none;width:51pt'>　</td>
  <td colspan=5 class=xl81 width=83 style='border-left:none;width:63pt'>　</td>
  <td colspan=4 class=xl81 width=69 style='border-left:none;width:52pt'>　</td>
  <td colspan=3 class=xl115 width=42 style='border-left:none;width:32pt'>　</td>
  <td colspan=4 class=xl81 width=70 style='border-left:none;width:53pt'>　</td>
  <td colspan=4 class=xl81 width=66 style='border-left:none;width:50pt'>　</td>
  <td colspan=5 class=xl81 width=66 style='border-left:none;width:51pt'>　</td>
  <td colspan=4 class=xl80 width=72 style='border-left:none;width:56pt'>　</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=39 height=25 class=xl67 width=632 style='height:18.75pt;
  width:482pt'>&nbsp; 나. 중소기업 등 수입금액 인식기준 적용특례에 의한 수입금액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=11 height=18 class=xl74 width=177 style='height:14.1pt;
  width:135pt'>계 정 과 목</td>
  <td colspan=6 rowspan=2 class=xl75 width=107 style='width:81pt'><font
  class="font11">&#9330;</font><font class="font5">세법상<br>
    당기 수입금액</font></td>
  <td colspan=8 rowspan=2 class=xl75 width=120 style='width:91pt'><font
  class="font11">&#9331;</font><font class="font5">당기 회사수입<br>
    금액 계상액</font></td>
  <td colspan=7 rowspan=2 class=xl68 width=119 style='border-right:.5pt solid gray;
  border-bottom:.5pt solid gray;width:90pt'>(21)조정액<br>
    (<font class="font11">&#9330;</font><font class="font5">-</font><font
  class="font11">&#9331;</font><font class="font5">)</font></td>
  <td colspan=7 rowspan=2 class=xl80 width=109 style='width:85pt'>(22)근거법령</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl74 width=97 style='height:14.1pt;width:74pt'>&#9328;항&nbsp;&nbsp;
  목</td>
  <td colspan=5 class=xl75 width=80 style='border-left:none;width:61pt'>&#9329;과&nbsp;&nbsp;
  목</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl65 width=97 style='height:14.1pt;width:74pt'>　</td>
  <td colspan=5 class=xl66 width=80 style='border-left:none;width:61pt'>　</td>
  <td colspan=6 class=xl114 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl114 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl65 width=97 style='height:14.1pt;width:74pt'>　</td>
  <td colspan=5 class=xl66 width=80 style='border-left:none;width:61pt'>　</td>
  <td colspan=6 class=xl114 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl114 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl65 width=97 style='height:14.1pt;width:74pt'>　</td>
  <td colspan=5 class=xl66 width=80 style='border-left:none;width:61pt'>　</td>
  <td colspan=6 class=xl114 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl114 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl65 width=97 style='height:14.1pt;width:74pt'>　</td>
  <td colspan=5 class=xl66 width=80 style='border-left:none;width:61pt'>　</td>
  <td colspan=6 class=xl114 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl114 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=6 height=18 class=xl65 width=97 style='height:14.1pt;width:74pt'>　</td>
  <td colspan=5 class=xl66 width=80 style='border-left:none;width:61pt'>　</td>
  <td colspan=6 class=xl114 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl114 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=11 height=18 class=xl74 width=177 style='height:14.1pt;
  width:135pt'>계</td>
  <td colspan=6 class=xl86 width=107 style='border-left:none;width:81pt'>　</td>
  <td colspan=8 class=xl86 width=120 style='border-left:none;width:91pt'>　</td>
  <td colspan=7 class=xl83 width=119 style='border-right:.5pt solid gray;
  border-left:none;width:90pt'>　</td>
  <td colspan=7 class=xl80 width=109 style='border-left:none;width:85pt'>　</td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=39 height=25 class=xl67 width=632 style='height:18.75pt;
  width:482pt'>&nbsp; 다. 기타 수입금액</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>(23)구<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>분</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>(24)근<span style='mso-spacerun:yes'>&nbsp;
  </span>거<span style='mso-spacerun:yes'>&nbsp; </span>법<span
  style='mso-spacerun:yes'>&nbsp; </span>령</td>
  <td colspan=9 class=xl80 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>(25)수<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>입<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>금<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>액</td>
  <td colspan=7 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>(26)대<span style='mso-spacerun:yes'>&nbsp;
  </span>응<span style='mso-spacerun:yes'>&nbsp; </span>원<span
  style='mso-spacerun:yes'>&nbsp; </span>가</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>비&nbsp;&nbsp;&nbsp;&nbsp;
  고</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=7 height=18 class=xl82 width=119 style='border-right:.5pt solid gray;
  height:14.1pt;width:91pt'>　</td>
  <td colspan=8 class=xl80 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  border-left:none;width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>　</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=15 height=18 class=xl82 width=247 style='height:14.1pt;
  width:188pt'>계</td>
  <td colspan=9 class=xl87 width=135 style='border-right:.5pt solid gray;
  width:102pt'>　</td>
  <td colspan=7 class=xl87 width=128 style='border-right:.5pt solid gray;
  border-left:none;width:97pt'>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td colspan=8 class=xl80 width=122 style='border-left:none;width:95pt'>　</td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=39 height=33 class=xl90 width=632 style='height:24.75pt;
  width:482pt'>210mm×297mm[일반용지 70g/㎡(재활용품)]</td>
 </tr>
</table>
</body>
</html>