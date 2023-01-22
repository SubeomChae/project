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
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 15">
<title>[별지 제43호의2서식] 법인지방소득세 과세표준 및 세액조정계산서</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.79in .39in .39in .43in;
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
rt
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-char-type:none;
	display:none;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:표준;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl65
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl66
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.xl94
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:none;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl112
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl113
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl114
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:.5pt solid black;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	font-size:1.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl141
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl142
	{mso-style-parent:style0;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border:none;
	background:white;
	mso-pattern:black none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-weight:700;
	font-family:HY견고딕, serif;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border:none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl146
	{mso-style-parent:style0;
	font-size:7.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:굴림체, monospace;
	mso-font-charset:129;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
-->
</style>
</head>
<body link=blue vlink=purple>
<table border=0 cellpadding=0 cellspacing=0 width=675 style='border-collapse:
 collapse;table-layout:fixed;width:505pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:768;width:16pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:804;width:17pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:768;width:16pt'>
 <col width=136 style='mso-width-source:userset;mso-width-alt:4973;width:102pt'>
 <col width=24 style='mso-width-source:userset;mso-width-alt:877;width:18pt'>
 <col width=3 style='mso-width-source:userset;mso-width-alt:109;width:2pt'>
 <col width=27 span=4 style='mso-width-source:userset;mso-width-alt:987;
 width:20pt'>
 <col width=6 style='mso-width-source:userset;mso-width-alt:219;width:5pt'>
 <col width=21 style='mso-width-source:userset;mso-width-alt:768;width:16pt'>
 <col width=20 style='mso-width-source:userset;mso-width-alt:731;width:15pt'>
 <col width=67 style='mso-width-source:userset;mso-width-alt:2450;width:50pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:3328;width:68pt'>
 <col width=27 span=5 style='mso-width-source:userset;mso-width-alt:987;
 width:20pt'>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=20 height=22 class=xl143 width=675 style='height:17.1pt;
  width:505pt'>■ 지방세법 시행규칙[별지 제43호의2서식] &lt;개정 2016. 12. 30.&gt;</td>
 </tr>
 <tr height=56 style='mso-height-source:userset;height:42.0pt'>
  <td colspan=20 height=56 class=xl144 width=675 style='height:42.0pt;
  width:505pt'>법인지방소득세 과세표준 및 세액조정계산서</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:14.1pt'>
  <td colspan=14 height=18 class=xl145 width=449 style='height:14.1pt;
  width:337pt'>※ 뒤쪽의 작성방법을 참고하시기 바라며, 색상이 어두운 란은 신청인이 적지 않습니다.</td>
  <td colspan=6 class=xl146 width=226 style='width:168pt'>(앞쪽)</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl147 width=224 style='border-right:.5pt solid black;
  height:12.75pt;width:169pt'>법인명</td>
  <td colspan=9 class=xl149 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'>사업자등록번호</td>
  <td colspan=6 class=xl149 width=226 style='border-left:none;width:168pt'>사업연도</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=5 height=17 class=xl68 width=224 style='border-right:.5pt solid black;
  height:12.75pt;width:169pt'><%=obox.get("corp_nm")%></td>
  <td colspan=9 class=xl70 width=225 style='border-right:.5pt solid black;
  border-left:none;width:168pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=6 class=xl70 width=226 style='border-left:none;width:168pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%>~<%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:4.5pt'>
  <td colspan=20 height=6 class=xl67 width=675 style='height:4.5pt;width:505pt'>　</td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=20 height=6 class=xl66 width=675 style='height:5.1pt;width:505pt'>&nbsp;</td>
 </tr>
<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","", uSesEnt.dbo); 
	Long pre_tax_amt = rbox.getLong("cur_acum"); // 기납부세액(선급지방세) %>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=11 height=161 class=xl86 width=21 style='border-bottom:.5pt solid black;
  height:123.15pt;width:16pt'>1.<br>
    과<br>
    세<br>
    표<br>
    준<br>
    계<br>
    산</td>
  <td colspan=3 class=xl103 width=179 style='border-right:.5pt solid black;
  border-left:none;width:135pt'>(108) 각 사 업 연 도 소 득 금 액</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
  <td rowspan=55 class=xl141></td>
  <td rowspan=31 class=xl86 width=21 style='border-bottom:.5pt solid black;
  width:16pt'>4.<br>
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
    지<br>
    방<br>
    소<br>
    득<br>
    세<br>
    <br>
    계<br>
    산</td>
  <td colspan=3 rowspan=2 class=xl80 width=178 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:133pt'>(137) 과 세 표 준</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=3 rowspan=2 height=27 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.05pt;width:135pt'>(109)
  이 월 결 손 금</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 rowspan=2 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.95pt;width:133pt'>(138)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=3 rowspan=2 height=28 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.0pt;width:135pt'>(110)
  비 과 세 소 득</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 rowspan=2 height=32 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.0pt;width:133pt'>(139)
  산 출 세 액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 rowspan=2 height=24 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.0pt;width:135pt'>(111)
  소 득 공 제</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=3 rowspan=3 height=37 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:27.95pt;width:133pt'>(140)
  감 면 세 액</td>
  <td colspan=5 rowspan=3 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=3 height=28 class=xl103 width=179 style='border-right:.5pt solid black;
  height:21.0pt;border-left:none;width:135pt'>(112) 과 세 표 준<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>&nbsp;(108-109-110-111)</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=1 style='mso-height-source:userset;height:.95pt'>
  <td colspan=9 rowspan=2 height=2 class=xl122 width=314 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:1.9pt;width:235pt'>&nbsp;</td>
 </tr>
 <tr height=1 style='mso-height-source:userset;height:.95pt'>
  <td colspan=3 rowspan=3 height=31 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.05pt;width:133pt'>(141)
  차 감 세 액 (139-140)</td>
  <td colspan=5 rowspan=3 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=3 height=26 class=xl103 width=179 style='border-right:.5pt solid black;
  height:20.1pt;border-left:none;width:135pt'>(158) 선 박 표 준 이 익</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td height=4 class=xl65 style='height:3.0pt'></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
 </tr>
 <tr height=2 style='mso-height-source:userset;height:2.1pt'>
  <td height=2 class=xl65 style='height:2.1pt'></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td class=xl65></td>
  <td colspan=3 rowspan=3 class=xl80 width=178 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:133pt'>(142) 공 제 세 액</td>
  <td colspan=5 rowspan=3 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td rowspan=11 height=178 class=xl86 width=21 style='border-bottom:.5pt solid black;
  height:135.5pt;width:16pt'>2.<br>
    산<br>
    출<br>
    세<br>
    액<br>
    계<br>
    산</td>
  <td colspan=3 class=xl103 width=179 style='border-right:.5pt solid black;
  border-left:none;width:135pt'>(113) 과 세 표 준(112+159)</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.95pt'>
  <td colspan=3 rowspan=2 height=25 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.95pt;width:135pt'>(114)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=3 rowspan=2 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.95pt;width:133pt'>(143)
  동업기업 법인지방소득세<br>
    <span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>배분액 (가산세 제외)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.95pt'>
  <td colspan=3 rowspan=2 height=27 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.05pt;width:135pt'>(115)
  산 출 세 액</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=14 style='mso-height-source:userset;height:11.1pt'>
  <td colspan=3 rowspan=2 height=35 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:26.85pt;width:133pt'>(144)
  가 산 세 액<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(동업기업 배분액 포함)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td colspan=3 rowspan=2 height=29 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.75pt;width:135pt'>(116)
  지<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>점<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>유<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>보<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>소<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>득<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>(「법인세법」 제96조)</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=3 rowspan=2 height=34 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.7pt;width:133pt'>(145)
  가 감 계(139+143+144)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
  <td colspan=3 height=26 class=xl103 width=179 style='border-right:.5pt solid black;
  height:19.7pt;border-left:none;width:135pt'>(117) 지<span
  style='mso-spacerun:yes'>&nbsp;</span>점<span style='mso-spacerun:yes'>&nbsp;
  </span>유<span style='mso-spacerun:yes'>&nbsp;</span>보<span
  style='mso-spacerun:yes'>&nbsp;</span>소<span style='mso-spacerun:yes'>&nbsp;
  </span>득에<span style='mso-spacerun:yes'>&nbsp;</span>대한<br>
    <span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>법인세 산출세액</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=3 height=22 class=xl103 width=179 style='border-right:.5pt solid black;
  height:17.1pt;border-left:none;width:135pt'>(118) 법인지방소득세 산출세액</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
  <td rowspan=7 class=xl86 width=20 style='border-bottom:.5pt solid black;
  border-top:none;width:15pt'>기납부세액</td>
  <td colspan=2 rowspan=2 class=xl80 width=158 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:118pt'>(146) 수 시 부 과 세 액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=3 rowspan=2 height=25 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:18.95pt;width:135pt'>(119)
  합<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계(115+118)</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.95pt'>
  <td colspan=2 rowspan=3 height=34 class=xl80 width=158 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.9pt;width:118pt'>(147)
  (<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>) 세 액</td>
  <td colspan=5 rowspan=3 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=8 style='mso-height-source:userset;height:6.0pt'>
  <td colspan=10 height=8 class=xl140 style='height:6.0pt'>　</td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.95pt'>
  <td rowspan=30 height=419 class=xl86 width=21 style='border-bottom:.5pt solid black;
  height:323.25pt;border-top:none;width:16pt'>3.<br>
    <br>
    납<br>
    <br>
    부<br>
    <br>
    할<br>
    <br>
    세<br>
    <br>
    액<br>
    <br>
    계<br>
    <br>
    산</td>
  <td colspan=3 rowspan=2 class=xl80 width=179 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:135pt'>(120) 산 출 세 액(120 = 119)</td>
  <td colspan=6 rowspan=2 class=xl128 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>　</td>
 </tr>
 <tr height=13 style='mso-height-source:userset;height:9.95pt'>
  <td colspan=2 rowspan=2 height=34 class=xl80 width=158 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.9pt;width:118pt'>(148)<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계<span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(146+147)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 rowspan=2 height=26 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:19.9pt;width:135pt'>(121)
  최 저 한 세<span style='mso-spacerun:yes'>&nbsp; </span>적 용 대 상<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>공<span style='mso-spacerun:yes'>&nbsp; </span>제<span
  style='mso-spacerun:yes'>&nbsp; </span>감<span style='mso-spacerun:yes'>&nbsp;
  </span>면<span style='mso-spacerun:yes'>&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp; </span>액</td>
  <td colspan=6 rowspan=2 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.95pt'>
  <td colspan=3 rowspan=3 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:26.15pt;width:133pt'>(149)
  차감납부할세액 (145-148)</td>
  <td colspan=5 rowspan=3 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=3 height=26 class=xl103 width=179 style='border-right:.5pt solid black;
  height:20.1pt;border-left:none;width:135pt'>(122) 차 감 세 액</td>
  <td colspan=6 class=xl112 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=2 style='mso-height-source:userset;height:2.1pt'>
  <td colspan=3 rowspan=3 height=25 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:20.15pt;width:135pt'>(123)
  최 저 한 세<span style='mso-spacerun:yes'>&nbsp; </span>적 용 제 외<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>공<span style='mso-spacerun:yes'>&nbsp; </span>제<span
  style='mso-spacerun:yes'>&nbsp; </span>감<span style='mso-spacerun:yes'>&nbsp;
  </span>면<span style='mso-spacerun:yes'>&nbsp; </span>세<span
  style='mso-spacerun:yes'>&nbsp; </span>액</td>
  <td colspan=6 rowspan=3 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=9 height=6 class=xl140 style='height:5.1pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td rowspan=16 height=228 class=xl86 width=21 style='border-bottom:.5pt solid black;
  height:175.0pt;border-top:none;width:16pt'>5.<br>
    미<br>
    환<br>
    류<br>
    소<br>
    득<br>
    법<br>
    인<br>
    지<br>
    방<br>
    소<br>
    득<br>
    세</td>
  <td colspan=3 rowspan=2 class=xl80 width=178 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:133pt'>(150) 미 환 류 소 득</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=3 rowspan=2 height=28 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.0pt;width:135pt'>(124)
  가 산 세 액</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=12 style='mso-height-source:userset;height:9.0pt'>
  <td colspan=3 rowspan=2 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.95pt;width:133pt'>(151)
  세<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>율</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=3 rowspan=2 height=26 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:19.9pt;width:135pt'>(125)
  가<span style='mso-spacerun:yes'>&nbsp;</span>감<span
  style='mso-spacerun:yes'>&nbsp;</span>계(120-121-123+124)</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.95pt'>
  <td colspan=3 rowspan=3 height=32 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.0pt;width:133pt'>(152)
  산 출 세 액</td>
  <td colspan=5 rowspan=3 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td rowspan=13 height=180 class=xl86 width=22 style='border-bottom:.5pt solid black;
  height:139.2pt;border-top:none;width:17pt'>기납부세액</td>
  <td rowspan=9 class=xl86 width=21 style='border-bottom:.5pt solid black;
  border-top:none;width:16pt'>기한내납부세액</td>
  <td class=xl117 width=136 style='border-top:none;border-left:none;width:102pt'>(126)
  비영리내국법인의<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>예 정 신 고 세 액</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=1 style='mso-height-source:userset;height:.95pt'>
  <td rowspan=2 height=25 class=xl115 width=136 style='border-bottom:.5pt solid black;
  height:18.95pt;border-top:none;width:102pt'>(127) 수 시 부 과 세 액</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 rowspan=2 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.95pt;width:133pt'>(153)
  가 산 세 액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=9 style='mso-height-source:userset;height:6.95pt'>
  <td rowspan=2 height=26 class=xl115 width=136 style='border-bottom:.5pt solid black;
  height:19.9pt;border-top:none;width:102pt'>(128) 특별징수납부세액</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td colspan=3 rowspan=2 height=33 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.95pt;width:133pt'>(154)
  기 납 부 세 액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td rowspan=2 height=26 class=xl115 width=136 style='border-bottom:.5pt solid black;
  height:20.1pt;border-top:none;width:102pt'>(129) 간접투자회사등의<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>외 국 납 부 세 액</td>
  <td colspan=6 rowspan=2 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:8.1pt'>
  <td colspan=3 rowspan=2 height=32 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.2pt;width:133pt'>(158)<span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>이<span
  style='mso-spacerun:yes'>&nbsp; </span>자<span style='mso-spacerun:yes'>&nbsp;
  </span>상<span style='mso-spacerun:yes'>&nbsp; </span>당<span
  style='mso-spacerun:yes'>&nbsp; </span>액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td rowspan=2 height=27 class=xl115 width=136 style='border-bottom:.5pt solid black;
  height:21.05pt;border-top:none;width:102pt'>(130) 소<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(126+127+128+129)</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.95pt'>
  <td colspan=3 rowspan=3 height=32 class=xl89 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:25.0pt;width:133pt'>(155)
  차감납부할세액(152+153-154+158)</td>
  <td colspan=5 rowspan=3 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.95pt'>
  <td colspan=2 height=25 class=xl103 width=157 style='border-right:.5pt solid black;
  height:18.95pt;border-left:none;width:118pt'>(131) 신고납부전가산세액</td>
  <td colspan=6 class=xl112 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;&nbsp;</td>
 </tr>
 <tr height=2 style='mso-height-source:userset;height:2.1pt'>
  <td colspan=2 rowspan=3 height=25 class=xl80 width=157 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:20.15pt;width:118pt'>(132)
  합<span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>계(130+131)</td>
  <td colspan=6 rowspan=3 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
 </tr>
 <tr height=6 style='mso-height-source:userset;height:5.1pt'>
  <td colspan=9 height=6 class=xl140 style='height:5.1pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td rowspan=6 height=99 class=xl86 width=21 style='border-bottom:.5pt solid black;
  height:76.05pt;border-top:none;width:16pt'>6.<br>
    세<br>
    액<br>
    계</td>
  <td colspan=3 rowspan=2 class=xl80 width=178 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:133pt'>(156) 해당연도차감납부할<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>세액 계(136+149+155)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.95pt'>
  <td colspan=3 rowspan=2 height=27 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.05pt;width:135pt'>(133)
  탄력세율적용조정세액</td>
  <td colspan=6 rowspan=2 class=xl106 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:8.1pt'>
  <td colspan=3 rowspan=2 height=34 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:26.1pt;width:133pt'>(135)
  경정ㆍ수정신고 등 가감액</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=3 rowspan=2 height=29 class=xl80 width=179 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:21.95pt;width:135pt'>(134)
  감 면 분 추 가 납 부 세 액</td>
  <td colspan=6 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
 </tr>
 <tr height=5 style='mso-height-source:userset;height:3.95pt'>
  <td colspan=3 rowspan=2 height=31 class=xl80 width=178 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:24.05pt;width:133pt'>(157)
  조정<span style='mso-spacerun:yes'>&nbsp; </span>후<span
  style='mso-spacerun:yes'>&nbsp; </span>납부할<span
  style='mso-spacerun:yes'>&nbsp; </span>세액계<br>
    <span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(156+135)</td>
  <td colspan=5 rowspan=2 class=xl74 width=135 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:100pt'><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=3 height=26 class=xl103 width=179 style='border-right:.5pt solid black;
  height:20.1pt;border-left:none;width:135pt'>(136) 차<span
  style='mso-spacerun:yes'>&nbsp; </span>감<span style='mso-spacerun:yes'>&nbsp;
  </span>납<span style='mso-spacerun:yes'>&nbsp; </span>부<span
  style='mso-spacerun:yes'>&nbsp; </span>할<span style='mso-spacerun:yes'>&nbsp;
  </span>세<span style='mso-spacerun:yes'>&nbsp; </span>액 <br>
    <span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(125-132+-133+134)</td>
  <td colspan=6 class=xl71 width=135 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>&nbsp;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=20 height=24 class=xl142 style='height:18.0pt'>　</td>
 </tr>
 <tr height=21 style='mso-height-source:userset;height:15.95pt'>
  <td colspan=20 height=21 class=xl121 width=675 style='height:15.95pt;
  width:505pt'>210mm×297mm(백상지(80g/㎡)</td>
 </tr>
</table>
</body>
</html>