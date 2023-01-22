<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
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
<html xmlns:o="urn:schemas-microsoft-com:office:office"xmlns:x="urn:schemas-microsoft-com:office:excel"xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>[별지 제3호의3서식1] 표준손익계산서(일반법인용)</title>
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
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font14
	{color:black;
	font-size:13.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font15
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font17
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font18
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
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font21
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font22
	{color:black;
	font-size:8.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font23
	{color:black;
	font-size:8.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font25
	{color:black;
	font-size:7.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font26
	{color:black;
	font-size:6.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font27
	{color:black;
	font-size:6.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
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
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	background:white;
	mso-pattern:black none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:.5pt solid black;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
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
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl87
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
.xl88
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl91
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-\0022\20A9\0022* \#\,\#\#0_-\;\\-\0022\20A9\0022* \#\,\#\#0_-\;_-\0022\20A9\0022* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-\0022\20A9\0022* \#\,\#\#0_-\;\\-\0022\20A9\0022* \#\,\#\#0_-\;_-\0022\20A9\0022* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	white-space:normal;}
.xl95
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
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-\0022\20A9\0022* \#\,\#\#0_-\;\\-\0022\20A9\0022* \#\,\#\#0_-\;_-\0022\20A9\0022* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-\0022\20A9\0022* \#\,\#\#0_-\;\\-\0022\20A9\0022* \#\,\#\#0_-\;_-\0022\20A9\0022* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
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
	text-align:left;
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
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:white;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:white;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:6.5pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-size:7.5pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl125
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
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:13.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl136
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl140
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl146
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:right;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl153
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl154
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl155
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl156
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;}
.xl157
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;}
.xl158
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:left;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;}
.xl159
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
.xl160
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
.xl161
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:left;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl162
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl163
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border:.5pt solid black;
	white-space:normal;}
.xl164
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl165
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl166
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl167
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl168
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl169
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl170
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl171
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl172
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl173
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl174
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl175
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
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
<table border=0 cellpadding=0 cellspacing=0 width=637 style='border-collapse:
 collapse;table-layout:fixed;width:478pt'>
 <col width=158 style='mso-width-source:userset;mso-width-alt:5056;width:119pt'>
 <col width=3 style='mso-width-source:userset;mso-width-alt:96;width:2pt'>
 <col width=40 style='mso-width-source:userset;mso-width-alt:1280;width:30pt'>
 <col width=122 style='mso-width-source:userset;mso-width-alt:3904;width:92pt'>
 <col width=79 span=2 style='mso-width-source:userset;mso-width-alt:2528;
 width:59pt'>
 <col width=39 style='mso-width-source:userset;mso-width-alt:1248;width:29pt'>
 <col width=0 style='display:none;mso-width-source:userset;mso-width-alt:32'>
 <col width=117 style='mso-width-source:userset;mso-width-alt:3744;width:88pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 rowspan=2 height=45 class=xl146 width=520 style='border-bottom:
  1.5pt solid black;height:33.75pt;width:390pt'>■ 법인세법 시행규칙 <font class="font7">[</font><font
  class="font6">별지 제</font><font class="font7">3</font><font class="font6">호의</font><font
  class="font7">3</font><font class="font6">서식</font><font class="font7">(1)]</font><font
  class="font8"> &lt;</font><font class="font9">개정 </font><font class="font8">2015.3.13.&gt;<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=2 class=xl148 width=117 style='width:88pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=2 height=23 class=xl125 width=117 style='height:17.25pt;
  width:88pt'>(3<font class="font12">쪽 중 제</font><font class="font11">1</font><font
  class="font12">쪽</font><font class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=2 height=27 class=xl126 width=161 style='border-right:.5pt solid black;
  height:20.25pt;width:121pt'><%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터</td>
  <td colspan=3 class=xl130 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>표준손익계산서</td>
  <td colspan=3 class=xl136 width=118 style='border-right:.5pt solid black;
  border-left:none;width:88pt'>법 인 명</td>
  <td class=xl82 width=117 style='border-top:none;border-left:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl128 width=161 style='border-right:.5pt solid black;
  height:19.5pt;width:121pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 까지</td>
  <td colspan=3 class=xl133 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>(<font class="font13">일반법인용</font><font
  class="font14">)</font></td>
  <td colspan=3 class=xl139 width=118 style='border-right:.5pt solid black;
  border-left:none;width:88pt'>사업자등록번호</td>
  <td class=xl83 width=117 style='border-top:none;border-left:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl117 width=637 style='height:16.5pt;
  width:478pt'>(<font class="font5">단위 </font><font class="font15">: </font><font
  class="font5">원</font><font class="font15">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl78 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td colspan=2 class=xl118 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>코드</td>
  <td class=xl65 width=122 style='border-top:none;border-left:none;width:92pt'>금
  액</td>
  <td colspan=2 class=xl118 width=158 style='border-right:.5pt solid black;
  border-left:none;width:118pt'>계 정 과 목</td>
  <td class=xl66 width=39 style='border-top:none;border-left:none;width:29pt'>코드</td>
  <td colspan=2 class=xl119 width=117 style='border-left:none;width:88pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl84 style='height:12.75pt;border-top:none'>Ⅰ<font
  class="font18">.</font><font class="font17">매출액</font></td>
  <td colspan=2 class=xl121 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>1</td>
  <td class=xl162 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl161 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(7)<font class="font5">지분법손실</font><font
  class="font15">(</font><font class="font5">지주회사</font><font class="font15">)</font></td>
  <td class=xl67 width=39 style='border-top:none;border-left:none;width:29pt'>60</td>
  <td colspan=2 class=xl166 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>1.<font class="font17">상품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>2</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>(8)<font class="font17">기타매출원가</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>61</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내상품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>3</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">기초재고액</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>62</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">수출상품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>4</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">당기총원가</font><font
  class="font18">(</font><font class="font17">명세별첨</font><font class="font18">)</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>63</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>2.<font class="font17">제품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>5</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">기말재고액</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>64</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내제품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>6</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">타계정대체액</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>65</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">수출제품매출</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>7</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl145 style='border-right:.5pt solid black;border-left:
  none'>Ⅲ<font class="font18">.</font><font class="font17">매출총손익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>66</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>3.<font class="font17">공사수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>8</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl145 style='border-right:.5pt solid black;border-left:
  none'>Ⅳ<font class="font18">.</font><font class="font17">판매비와관리비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>67</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내공사수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>9</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>68</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외공사수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>10</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">임원급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>69</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>4.<font class="font17">운송수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>11</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">직원급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>70</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내운송수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>12</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font15">.</font><font class="font5">임원상여금</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>71</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외운송수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>13</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>라<font
  class="font15">.</font><font class="font5">직원상여금</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>72</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>5.<font class="font17">부동산임대수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>14</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>마<font
  class="font15">.</font><font class="font5">기타</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>73</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내임대수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>15</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">퇴직급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>74</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외임대수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>16</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl108 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">임원퇴직급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>75</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>6.<font class="font17">분양수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>17</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl108 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">직원퇴직급여</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>76</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내분양수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>18</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font15">.</font><font class="font5">퇴직급여충당부채전입액</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>77</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외분양수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>19</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">보험료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>78</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>7.<font class="font5">사용료ㆍ로열티수입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>20</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">복리후생비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>79</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내사용료ㆍ로열티수</font><span style='display:none'><font class="font5">입</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>21</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font17">여비교통비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>80</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외사용료ㆍ로열티수</font><span style='display:none'><font class="font5">입</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>22</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font17">임차료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>81</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>8.<font class="font5">지분법이익</font><font
  class="font15">(</font><font class="font5">지주회사</font><font class="font15">)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>23</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">부동산임차료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>82</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td rowspan=2 height=34 class=xl149 style='border-bottom:.5pt solid black;
  height:25.5pt;border-top:none'><span style='mso-spacerun:yes'>&nbsp;</span>9.<font
  class="font17">기타매출</font></td>
  <td colspan=2 rowspan=2 class=xl151 width=43 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:32pt'>24</td>
  <td rowspan=2 class=xl164 width=122 style='border-bottom:.5pt solid black;
  border-top:none;width:92pt'>　</td>
  <td colspan=2 rowspan=2 class=xl155 width=158 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:118pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">차량ㆍ중기임차료</font><font class="font20">(</font><font class="font12">리<br>
    <span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>스료 포함</font><font class="font20">)</font></td>
  <td rowspan=2 class=xl159 width=39 style='border-bottom:.5pt solid black;
  border-top:none;width:29pt'>83</td>
  <td colspan=2 rowspan=2 class=xl170 width=117 style='border-bottom:.5pt solid black;
  width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font15">.</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>25</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font15">.</font><font class="font5">기타임차료</font><font class="font15">(</font><font
  class="font5">리스료 포함</font><font class="font15">)</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>84</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl79 style='height:12.75pt;border-top:none'>Ⅱ<font
  class="font18">.</font><font class="font17">매출원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>35</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font17">접대비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>85</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(1)<font class="font17">상품매출원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>36</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font17">유형자산감가상각비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>86</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">기초재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>37</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font17">무형자산상각비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>87</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">당기매입원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>38</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">영업권상각비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>88</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">상품관세환급금</font><font
  class="font15">(-)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>39</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">기타무형자산상각비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>89</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">기말재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>40</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font17">세금과공과</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>90</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font17">타계정대체액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>41</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font17">광고선전비</font><font
  class="font18">(</font><font class="font17">판매촉진비 포함</font><font
  class="font18">)</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>91</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(2)<font class="font17">제조원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>42</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font5">견본비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>92</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">기초재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>43</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font17">차량유지비</font><font
  class="font18">(</font><font class="font17">유류비 포함</font><font class="font18">)</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>93</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">당기총원가</font><font
  class="font18">(</font><font class="font17">명세별첨</font><font class="font18">)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>44</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>14.<font class="font17">연구비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>94</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font5">제품관세환급금</font><font
  class="font15">(-)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>45</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>15.<font class="font17">경상개발비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>95</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">기말재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>46</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>16.<font class="font17">대손상각비</font><font
  class="font18">(</font><font class="font17">충당금전입액포함</font><font
  class="font18">)</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>96</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font17">타계정대체액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>47</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>17.<font class="font17">미분양주택관리비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>97</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(3)<font class="font17">공사원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>48</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>18.<font class="font17">수주비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>98</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">기초재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>49</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">국내수주비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>99</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">당기총원가</font><font
  class="font18">(</font><font class="font17">명세별첨</font><font class="font18">)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>50</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">해외수주비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>100</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">기말재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>51</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>19.<font class="font5">자문료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>101</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">타계정대체액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>52</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">국내자문료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>102</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(4)<font class="font17">운송원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>53</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">해외자문료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>103</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(5)<font class="font17">임대원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>54</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>20.<font class="font5">지급수수료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>104</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>(6)<font class="font17">분양원가</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>55</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">국내지급수수료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>105</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">기초재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>56</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">해외지급수수료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>106</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">당기총원가</font><font
  class="font18">(</font><font class="font17">명세별첨</font><font class="font18">)</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>57</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>21.<font class="font5">판매수수료</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>107</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">기말재고액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>58</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>22.<font class="font5">소모품비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>108</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">타계정대체액</font></td>
  <td colspan=2 class=xl87 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>59</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl142 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>23.<font class="font5">통신비</font></td>
  <td class=xl69 width=39 style='border-top:none;border-left:none;width:29pt'>109</td>
  <td colspan=2 class=xl174 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl93 width=637 style='height:17.25pt;
  width:478pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl144 width=637 style='height:16.5pt;
  width:478pt'>210mm×297mm[<font class="font12">백상지 </font><font class="font10">80g/</font><font
  class="font12">㎡ 또는 중질지 </font><font class="font10">80g/</font><font
  class="font12">㎡</font><font class="font10">]</font></td>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=9 height=22 class=xl94 width=637 style='height:16.5pt;width:478pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 height=23 class=xl125 width=637 style='height:17.25pt;
  width:478pt'>(3<font class="font12">쪽 중 제</font><font class="font11">2</font><font
  class="font12">쪽</font><font class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=2 height=27 class=xl126 width=161 style='border-right:.5pt solid black;
  height:20.25pt;width:121pt'><%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터</td>
  <td colspan=3 class=xl130 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>표준손익계산서</td>
  <td colspan=3 class=xl136 width=118 style='border-right:.5pt solid black;
  border-left:none;width:88pt'>법인명</td>
  <td class=xl82 width=117 style='border-top:none;border-left:none;width:88pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl128 width=161 style='border-right:.5pt solid black;
  height:19.5pt;width:121pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 까지</td>
  <td colspan=3 class=xl133 width=241 style='border-right:.5pt solid black;
  border-left:none;width:181pt'>(<font class="font13">일반법인용</font><font
  class="font14">)</font></td>
  <td colspan=3 class=xl139 width=118 style='border-right:.5pt solid black;
  border-left:none;width:88pt'>사업자등록번호</td>
  <td class=xl83 width=117 style='border-top:none;border-left:none;width:88pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl117 width=637 style='height:16.5pt;
  width:478pt'>(<font class="font5">단위 </font><font class="font15">: </font><font
  class="font5">원</font><font class="font15">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl78 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td colspan=2 class=xl118 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>코드</td>
  <td class=xl65 width=122 style='border-top:none;border-left:none;width:92pt'>금
  액</td>
  <td colspan=2 class=xl118 width=158 style='border-right:.5pt solid black;
  border-left:none;width:118pt'>계 정 과 목</td>
  <td class=xl66 width=39 style='border-top:none;border-left:none;width:29pt'>코드</td>
  <td colspan=2 class=xl119 width=117 style='border-left:none;width:88pt'>금 액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl80 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>24.<font class="font5">운반비</font></td>
  <td colspan=2 class=xl121 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>110</td>
  <td class=xl162 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl123 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>22.<font class="font5">수수료수익</font></td>
  <td class=xl67 width=39 style='border-top:none;border-left:none;width:29pt'>164</td>
  <td colspan=2 class=xl166 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>25.<font class="font5">보관료</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>111</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내수수료수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>165</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>26.<font class="font5">건물ㆍ시설관리비</font><font
  class="font15">(</font><font class="font5">수선</font><span style='display:
  none'><font class="font5">비 제외</font><font class="font15">)</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>112</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외수수료수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>166</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>27.<font class="font5">수선비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>113</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>23.<font class="font5">사용료ㆍ로열티수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>167</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>28.<font class="font5">수도광열비</font><font
  class="font15">(</font><font class="font5">전기료 제외</font><span
  style='display:none'><font class="font15">)</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>114</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl116 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font23">.</font><font
  class="font22">국내사용료ㆍ로열티수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>168</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>29.<font class="font5">전기료</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>115</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl116 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font23">.</font><font
  class="font22">해외사용료ㆍ로열티수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>169</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>30.<font class="font5">인쇄비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>116</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>24.<font class="font5">정부보조금</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>170</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>31.<font class="font5">교육훈련비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>117</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>25.<font class="font5">판매장려금수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>171</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><font
  class="font21"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font15">32.</font><font class="font5">특허권등 사용료</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>118</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl114 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>26.<font class="font25">위약금ㆍ보상금ㆍ배상금수익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>172</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>33.<font class="font5">수출입제비용</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>119</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>27.<font class="font5">상각채권추심이익</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>173</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>34.<font class="font5">해외시장개척비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>120</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>28.<font class="font17">기타</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>174</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>35.<font class="font5">외주용역비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>121</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl97 style='border-right:.5pt solid black;border-left:
  none'>Ⅶ<font class="font18">.</font><font class="font17">영업외비용</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>179</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">국내외주용역비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>122</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">이자비용</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>180</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">해외외주용역비</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>123</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">기타대손상각비</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>181</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>36.<font class="font17">기타</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>124</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">유가증권처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>182</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl79 style='height:12.75pt;border-top:none'>Ⅴ<font
  class="font18">.</font><font class="font17">영업손익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>129</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl112 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font20">.</font><font class="font12">단기매매증권처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>183</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl79 style='height:12.75pt;border-top:none'>Ⅵ<font
  class="font18">.</font><font class="font17">영업외수익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>130</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code61_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">매도가능증권처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>184</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font17">이자수익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>131</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl110 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font27">.</font><font class="font26">지분법적용투자주식처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>185</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font17">배당금수익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>132</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6100301_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">매출채권처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>186</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font17">임대료</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>133</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">단기투자자산평가손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>187</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font17">유가증권처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>134</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font17">재고자산감모손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>188</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl81 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font23">.</font><font
  class="font22">단기매매증권처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>135</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font17">외환차손</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>189</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">매도가능증권처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>136</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font17">외화환산손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>190</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font15">.</font><font
  class="font5">지분법적용투자주식처</font><span style='display:none'><font class="font5">분이익</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>137</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font17">지분법손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>191</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">매출채권처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>138</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font17">장기투자증권손상차손</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>192</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl74 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font5">단기투자자산평가이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>139</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">매도가능증권손상차손</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>193</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font17">외환차익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>140</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">만기보유증권손상차손</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>194</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font17">외화환산이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>141</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font5">파생상품관련손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>195</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp; </span>9.<font class="font17">지분법이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>142</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl108 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">파생상품평가손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>196</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>10.<font class="font17">장기투자증권손상차</font><span
  style='display:none'><font class="font17">손환입</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>143</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">파생상품거래손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>197</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">매도가능증권손상차손</font><span style='display:none'><font class="font5">환입</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>144</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl107 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font15">.</font><font class="font5">기타파생상품손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>198</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl77 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">만기보유증권손상차손</font><span style='display:none'><font class="font5">환입</font></span></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>145</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl106 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font5">투자부동산처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>199</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>11.<font class="font5">파생상품관련이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>146</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font17">유형자산처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>200</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">파생상품평가이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>147</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font
  class="font15">.</font><font class="font5">토지처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>201</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">파생상품거래이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>148</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font
  class="font15">.</font><font class="font5">건물처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>202</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>다<font class="font15">.</font><font
  class="font5">기타파생상품이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>149</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font
  class="font15">.</font><font class="font5">기계장치처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>203</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>12.<font class="font5">투자부동산처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>150</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl105 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font
  class="font15">.</font><font class="font5">기타유형자산처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>204</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl86 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font17">유형자산처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>151</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>14.<font class="font17">무형자산처분손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>205</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font class="font15">.</font><font
  class="font5">토지처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>152</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>15.<font class="font17">기부금</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>206</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font class="font15">.</font><font
  class="font5">건물처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>153</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>16.<font class="font17">사채상환손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>207</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>다<font class="font15">.</font><font
  class="font5">기계장치처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>154</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl104 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>17.<font class="font5">위약금ㆍ보상금ㆍ배상금비용</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>208</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl75 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp; </span>라<font class="font15">.</font><font
  class="font5">기타유형자산처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>155</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>18.<font class="font17">기타충당금ㆍ준비금전입</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>209</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl86 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>14.<font class="font17">무형자산처분이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>156</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>19.<font class="font17">전기오류수정손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>210</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>15.<font class="font17">사채상환이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>157</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>20.<font class="font17">재해손실</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>211</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>16.<font class="font17">법인세환급액</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>158</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl103 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>21.<font class="font17">기타</font></td>
  <td class=xl68 width=39 style='border-top:none;border-left:none;width:29pt'>212</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>17.<font class="font17">충당금ㆍ준비금환입</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>159</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl97 style='border-right:.5pt solid black;border-left:
  none'>Ⅷ<font class="font18">.</font><font class="font17">법인세비용차감전손익</font></td>
  <td class=xl70 width=39 style='border-top:none;border-left:none;width:29pt'>217</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'><%=rbox.get("code6164_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>18.<font class="font17">전기오류수정이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>160</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl97 style='border-right:.5pt solid black;border-left:
  none'>Ⅸ<font class="font18">.</font><font class="font17">법인세비용</font></td>
  <td class=xl70 width=39 style='border-top:none;border-left:none;width:29pt'>218</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'><%=rbox.get("code7500101_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>19.<font class="font17">자산수증이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>161</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl97 style='border-right:.5pt solid black;border-left:
  none'>Ⅹ<font class="font18">.</font><font class="font17">당기순손익</font></td>
  <td class=xl70 width=39 style='border-top:none;border-left:none;width:29pt'>219</td>
  <td colspan=2 class=xl168 width=117 style='border-left:none;width:88pt'><%=rbox.get("code616475_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl73 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>20.<font class="font17">채무면제</font><font
  class="font18">(</font><font class="font17">조정</font><font class="font18">)</font><font
  class="font17">이익</font></td>
  <td colspan=2 class=xl95 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>162</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl101 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl71 width=39 style='border-top:none;border-left:none;width:29pt'>　</td>
  <td colspan=2 class=xl99 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 style='height:12.75pt;border-top:none'><span
  style='mso-spacerun:yes'>&nbsp;</span>21.<font class="font17">보험차익</font></td>
  <td colspan=2 class=xl87 width=43 style='border-right:.5pt solid black;
  border-left:none;width:32pt'>163</td>
  <td class=xl163 width=122 style='border-top:none;border-left:none;width:92pt'>　</td>
  <td colspan=2 class=xl89 style='border-right:.5pt solid black;border-left:
  none'>　</td>
  <td class=xl72 width=39 style='border-top:none;border-left:none;width:29pt'>　</td>
  <td colspan=2 class=xl91 width=117 style='border-left:none;width:88pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=9 rowspan=2 height=45 class=xl93 width=637 style='height:33.75pt;
  width:478pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
</table>
</body>
</html>
