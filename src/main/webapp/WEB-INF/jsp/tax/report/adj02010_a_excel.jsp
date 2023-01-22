<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = StringUtil.get8859_1(box.get("excel_file_nm"));
    if( lm_sAgentType.indexOf("MSIE 5.5") != -1 ) {
	    response.setHeader("Content-Type",        "doesn/matter;");
	    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls;");
    } else {
	    response.setHeader("Content-Type",        "application/octet-stream;");
    	response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls;");
	}
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
	{margin:.84in .52in .67in .55in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
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
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;
	border:none;
	mso-protection:locked visible;
	mso-style-name:표준;
	mso-style-id:0;}
.font6
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font7
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font8
	{color:purple;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font10
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font11
	{color:purple;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:underline;
	text-underline-style:single;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font14
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.font15
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
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
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl66
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl67
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl69
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl70
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:0%;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl73
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl74
	{mso-style-parent:style0;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl75
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl79
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	text-align:right;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl80
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl82
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl83
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-weight:700;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl86
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:left;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl87
	{mso-style-parent:style0;
	font-size:8.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl88
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	mso-text-control:shrinktofit;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl98
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl99
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;}
.xl100
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl101
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl102
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl103
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-number-format:"000-00-00000";
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl104
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl105
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl106
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl107
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:black none;}
.xl108
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:black none;}
.xl109
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:black none;}
.xl110
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl111
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl112
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl113
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl114
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl115
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl119
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl120
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl121
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl122
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl123
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;}
.xl124
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl125
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl126
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl127
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl130
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;}
.xl131
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;}
.xl132
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	font-family:견고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;}

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
-->
</style>
</head>

<body link=blue vlink=purple class=xl65>

<table border=0 cellpadding=0 cellspacing=0 width=708 style='border-collapse:
 collapse;table-layout:fixed;width:531pt'>
 <col class=xl65 width=55 style='mso-width-source:userset;mso-width-alt:1564;
 width:41pt'>
 <col class=xl65 width=25 style='mso-width-source:userset;mso-width-alt:711;
 width:19pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:455;
 width:12pt'>
 <col class=xl65 width=63 style='mso-width-source:userset;mso-width-alt:1792;
 width:47pt'>
 <col class=xl65 width=19 style='mso-width-source:userset;mso-width-alt:540;
 width:14pt'>
 <col class=xl65 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:85'>
 <col class=xl65 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:113'>
 <col class=xl65 width=78 style='mso-width-source:userset;mso-width-alt:2218;
 width:59pt'>
 <col class=xl65 width=16 style='mso-width-source:userset;mso-width-alt:455;
 width:12pt'>
 <col class=xl65 width=51 style='mso-width-source:userset;mso-width-alt:1450;
 width:38pt'>
 <col class=xl65 width=33 style='mso-width-source:userset;mso-width-alt:938;
 width:25pt'>
 <col class=xl65 width=98 style='mso-width-source:userset;mso-width-alt:2787;
 width:74pt'>
 <col class=xl65 width=47 span=2 style='mso-width-source:userset;mso-width-alt:
 1336;width:35pt'>
 <col class=xl65 width=43 span=2 style='mso-width-source:userset;mso-width-alt:
 1223;width:32pt'>
 <col class=xl65 width=74 style='mso-width-source:userset;mso-width-alt:2104;
 width:56pt'>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=17 height=20 class=xl87 width=708 style='height:15.0pt;
  width:531pt'>■ 법인세법 시행규칙 [별지 제10호서식(갑)] &lt;개정 2018.3.21&gt;</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=2 rowspan=3 height=56 class=xl75 width=80 style='height:42.0pt;width:60pt'>사<span style='mso-spacerun:yes'></span>업<br><br>연<span style='mso-spacerun:yes'></span>도</td>
  <td colspan=2 rowspan=3 class=xl68 width=79 style='width:59pt'><%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????-??-??")%><br>~<br><%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????-??-??")%></td>
  <td colspan=9 rowspan=3 class=xl132>원천납부세액 명세서(갑)<ruby><font class="font11"><rt class=font11></rt></font></ruby></td>
  <td colspan=2 rowspan=2 class=xl72 style='border-right:.5pt solid black;border-bottom:.5pt solid black'>법 인 명</td>
  <td colspan=2 rowspan=2 class=xl68 width=117 style='border-right:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=2 height=28 class=xl70 style='height:21.0pt;border-left:none'>사업자등록번호</td>
  <td colspan=2 class=xl71 width=117 style='border-right:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=10 style='mso-height-source:userset;height:7.5pt'>
  <td colspan=17 height=10 class=xl86 style='height:7.5pt'>　</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td colspan=17 height=34 class=xl85 style='height:25.5pt'><span
  style='mso-spacerun:yes'></span>원천징수 명세내용</td>
 </tr>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=2 rowspan=2 height=73 class=xl78 style='height:54.95pt'>①적<font class="font9"><span style='mso-spacerun:yes'></span></font><font class="font14">요</font></td>
  <td colspan=9 class=xl80 width=276 style='border-left:none;width:207pt'>②원천징수의무자</td>
  <td rowspan=2 class=xl80 width=98 style='border-top:none;width:74pt'>③원천<span style='mso-spacerun:yes'></span>징수일</td>
  <td colspan=2 rowspan=2 class=xl80 width=94 style='width:70pt'>④이자·<span style='mso-spacerun:yes'></span>배당금액</td>
  <td colspan=2 rowspan=2 class=xl79>⑤세 율</td>
  <td rowspan=2 class=xl81 style='border-top:none'>⑥법 인 세</td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:33.95pt'>
  <td colspan=2 height=45 class=xl83 width=79 style='border-right:.5pt solid black;height:33.95pt;border-left:none;width:59pt'>구분<span style='mso-spacerun:yes'></span>[내국인,<span style='mso-spacerun:yes'></span>외국인]</td>
  <td colspan=5 class=xl82 width=113 style='border-left:none;width:85pt'>사업자등록번호<br>(주민등록번호)<ruby><font class="font11"><rt class=font11></rt></font></ruby></td>
  <td colspan=2 class=xl82 width=84 style='border-left:none;width:63pt'>상호(성명)<ruby><font class="font11"><rt class=font11></rt></font></ruby></td>
 </tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="17" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						   long int_sum = 0;
						   long tax_sum = 0;
						   for(int i=0; i < rsWp.getLength(); i++) {	
					   	   		if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }
					   	   		int_sum += rsWp.getLong("rel_amt",i);
					   	   		tax_sum += rsWp.getLong("slip_amt",i); %>
								 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
								  <td colspan=2 height=23 class=xl111 style='border-right:.5pt solid black; height:17.25pt'><%=rsWp.get("etc_remark",i)%></td>
								  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:none'>내국인</td>
								  <td colspan=5 class=xl103 style='border-right:.5pt solid black;border-left:none'><%=rsWp.get("cust_reg_no",i)%></td>
								  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:none'><%=rsWp.get("cust_nm",i)%></td>
								  <td class=xl68 style='border-left:none'><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
								  <td colspan=2 class=xl69><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
								  <td colspan=2 class=xl70><%=rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)%> %</td>
								  <td class=xl69 style='border-right:none'><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
							</tr>
						<% }
						   for(int i=rsWp.getLength(); i < 20; i++) {	%>
								 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
								  <td colspan=2 height=23 class=xl111 style='border-right:.5pt solid black;
								  height:17.25pt'>　</td>
								  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
								  none'>　</td>
								  <td colspan=5 class=xl103 style='border-right:.5pt solid black;border-left:
								  none'>　</td>
								  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
								  none'>　</td>
								  <td class=xl67 style='border-top:none'>　</td>
								  <td colspan=2 class=xl69 style='border-left:none'>　</td>
								  <td colspan=2 class=xl70>　</td>
								  <td class=xl69 style='border-right:none'>　</td>
								 </tr>

						<% } %>
							 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
							  <td colspan=2 height=34 class=xl113 style='border-right:.5pt solid black;
							  height:25.5pt'>합<font class="font6"><span
							  style='mso-spacerun:yes'>&nbsp;&nbsp; </span></font><font class="font7">계</font></td>
							  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
							  none'></td>
							  <td colspan=5 class=xl107 style='border-right:.5pt solid black;border-left:
							  none'></td>
							  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
							  none'>　</td>
							  <td class=xl107 style='border-left:none'>　</td>
							  <td colspan=2 class=xl69><%=FormatUtil.insertComma(String.valueOf(int_sum))%></td>
							  <td colspan=2 class=xl107></td>
							  <td class=xl79 style='border-right:none'><%=FormatUtil.insertComma(String.valueOf(tax_sum))%></td>
							 </tr>
					<% } %>


</table>

</body>

</html>
