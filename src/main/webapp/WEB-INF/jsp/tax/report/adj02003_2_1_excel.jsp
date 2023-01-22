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
<title>[별지 제3호의2서식1] 표준대차대조표(일반법인용)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.50in .71in .20in .71in;
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
.font16
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font17
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font19
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font21
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font22
	{color:black;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font23
	{color:black;
	font-size:8.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font24
	{color:black;
	font-size:9.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font25
	{color:black;
	font-size:8.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font26
	{color:black;
	font-size:8.5pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font28
	{color:black;
	font-size:8.5pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font29
	{color:black;
	font-size:7.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;}
.font30
	{color:black;
	font-size:7.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font31
	{color:black;
	font-size:8.0pt;
	font-weight:400;
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
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
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
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl71
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
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl76
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
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:#282828;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
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
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid #5D5D5D;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:right;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border:.5pt solid black;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl88
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
.xl89
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
.xl90
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl91
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
.xl92
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:right;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:right;
	border-top:1.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	background:#BBBBBB;
	mso-pattern:black none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl110
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
.xl111
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl112
	{mso-style-parent:style0;
	color:black;
	font-size:8.5pt;
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
.xl113
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-size:7.0pt;
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
.xl115
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
.xl116
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
.xl117
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
.xl118
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
.xl119
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl129
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl130
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl131
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl132
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl133
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl134
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	white-space:normal;}
.xl135
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl136
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
	white-space:normal;}
.xl137
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl138
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl139
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl140
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
.xl141
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:normal;}
.xl142
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:2.0pt double black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:normal;}
.xl143
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:2.0pt double black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:normal;}
.xl144
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:normal;}
.xl145
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-weight:700;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:2.0pt double black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#D8D8D8;
	mso-pattern:black none;
	white-space:normal;}
.xl146
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
	white-space:normal;}
.xl147
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:1.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl148
	{mso-style-parent:style0;
	color:black;
	font-size:9.0pt;
	font-family:한양중고딕, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:1.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl149
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl150
	{mso-style-parent:style0;
	color:black;
	font-size:8.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl151
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:1.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl152
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
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


<table border=0 cellpadding=0 cellspacing=0 width=638 style='border-collapse:
 collapse;table-layout:fixed;width:480pt'>
 <col width=158 style='mso-width-source:userset;mso-width-alt:5056;width:119pt'>
 <col width=32 style='mso-width-source:userset;mso-width-alt:1024;width:24pt'>
 <col width=129 style='mso-width-source:userset;mso-width-alt:4128;width:97pt'>
 <col width=46 style='mso-width-source:userset;mso-width-alt:1472;width:35pt'>
 <col width=119 style='mso-width-source:userset;mso-width-alt:3808;width:89pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:1152;width:27pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:3776;width:89pt'>
 <col width=117 style='mso-width-source:userset;mso-width-alt:3744;width:88pt'>
 <tr height=22 style='height:16.5pt'>
  <td colspan=6 rowspan=2 height=45 class=xl94 width=520 style='border-bottom:
  1.5pt solid black;height:33.75pt;width:391pt'>■ 법인세법 시행규칙 <font class="font7">[</font><font
  class="font6">별지 제</font><font class="font7">3</font><font class="font6">호의</font><font
  class="font7">2</font><font class="font6">서식</font><font class="font7">(1)] </font><font
  class="font8">&lt;</font><font class="font9">개정 </font><font class="font8">2015.3.13.&gt;<span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td class=xl84 width=118 style='width:89pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl65 width=118 style='height:17.25pt;width:89pt'>(4<font
  class="font12">쪽 중 제</font><font class="font11">1</font><font class="font12">쪽</font><font
  class="font11">)</font></td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=7 height=18 class=xl140 width=638 style='height:13.5pt;
  width:480pt'>표준대차대조표</td>
 </tr>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td colspan=7 height=18 class=xl122 width=638 style='height:13.5pt;
  width:480pt'>(<font class="font22">일반법인용</font><font class="font21">)</font><font
  class="font13"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(</font><font class="font6">단위</font><font class="font13">: </font><font
  class="font6">원</font><font class="font13">)</font></td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl72 width=158 style='height:14.25pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl123 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl125 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl127 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl129 width=154 style='border-bottom:2.0pt double black;
  width:116pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 현재</td>
 </tr>
 <tr height=19 style='mso-height-source:userset;height:14.25pt'>
  <td height=19 class=xl66 width=158 style='height:14.25pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl133 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl73 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl74 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl74 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl119 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl74 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl75 width=118 style='border-top:none;border-left:none;width:89pt'>금
  액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'>Ⅰ<font class="font17">.</font><font class="font16">유동자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>1</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font
  class="font16">기타유동자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>67</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code11109_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font
  class="font16">당좌자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>2</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code111_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font5">미수수익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>68</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span><font class="font24"><span
  style='mso-spacerun:yes'>&nbsp; </span></font><font class="font17">1.</font><font
  class="font16">현금 및 현금성자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>3</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11101_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font5">선급비용</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>69</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">단기예금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>4</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code11103_amt",Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font5">이연법인세자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>70</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">유가증권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>5</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font5">기타유동자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>71</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code11109_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">단기매매증권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>6</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">선급법인세</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>72</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code1110901_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">유동성매도가능증권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>7</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">부가가치세대급금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>73</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">유동성만기보유증권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>8</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">선급관세</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>74</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">매출채권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>9</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>라<font class="font14">.</font><font
  class="font5">기타유동자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>75</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code1110902_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">외상매출금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>10</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>II.<font class="font16">비유동자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>80</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>11</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;</span>(1)<font
  class="font16">투자자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>81</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">받을어음</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>12</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">장기예금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>82</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>13</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">장기투자증권</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>83</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">기타매출채권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>14</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">매도가능증권</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>84</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>15</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">만기보유증권</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>85</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font16">단기대여금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>24</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">지분법적용투자주식</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>86</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font17">.</font><font class="font16">관계회사</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>25</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">장기대여금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>87</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>26</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font17">.</font><font
  class="font16">관계회사</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>88</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font17">.</font><font class="font16">주주ㆍ임원ㆍ종업원</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>27</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>89</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>28</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>90</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font17">.</font><font class="font16">기타</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>29</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font17">.</font><font
  class="font16">주주ㆍ임원ㆍ종업원</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>91</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>30</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>92</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">미수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>31</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>93</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font17">.</font><font class="font16">분양미수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>32</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font17">.</font><font
  class="font16">기타</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>94</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>33</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>95</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font17">.</font><font class="font16">공사미수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>34</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>96</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>35</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font16">투자부동산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>97</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font17">.</font><font class="font16">기타</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>36</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">토지</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>98</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>37</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">건물</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>99</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font16">선급금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>38</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">기타투자부동산</font></td>
  <td class=xl69 width=36 style='border-top:none;border-left:none;width:27pt'>100</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font16">기타당좌자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>39</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">기타투자자산</font></td>
  <td class=xl68 width=36 style='border-left:none;width:27pt'>105</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font
  class="font16">재고자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>44</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;</span>(2)<font
  class="font16">유형자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>110</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">상품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>45</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">토지</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>111</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">제품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>46</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>112</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">반제품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>47</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>113</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">재공품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>48</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">건물</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>114</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font5">부산물</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>49</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>115</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">원재료</font><font class="font17">(</font><font class="font16">원자재</font><font
  class="font17">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>50</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>116</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">원재료</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>51</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>117</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">부재료</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>52</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">구축물</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>118</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">기타원재료</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>53</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>119</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font16">가설재</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>54</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>120</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font16">저장품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>55</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>121</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font
  class="font16">미착상품</font><font class="font17">(</font><font class="font16">미착재료</font><font
  class="font17">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>56</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">기계장치</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>122</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font
  class="font16">완성주택</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>57</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>123</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font
  class="font16">미완성주택</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>58</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>124</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>12.<font
  class="font16">용지</font><font class="font17">(</font><font class="font16">건설업</font><font
  class="font17">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>59</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>125</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>13.<font
  class="font5">완성공사</font><font class="font14">(</font><font class="font5">주택외</font><font
  class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>60</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font16">선박ㆍ항공기</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>126</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>14.<font
  class="font5">미완성공사</font><font class="font14">(</font><font class="font5">주택외</font><font
  class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>61</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>127</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>15.<font
  class="font16">기타재고자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>62</td>
  <td class=xl87 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl147 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;
  </span>(<font class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>128</td>
  <td class=xl89 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 height=23 class=xl105 width=638 style='height:17.25pt;
  width:480pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl149 width=638 style='height:16.5pt;
  width:480pt'>210mm×297mm[<font class="font12">백상지 </font><font class="font10">80g/</font><font
  class="font12">㎡ 또는 중질지 </font><font class="font10">80g/</font><font
  class="font12">㎡</font><font class="font10">]</font></td>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=6 rowspan=2 height=45 class=xl94 width=520 style='border-bottom:
  1.5pt solid black;height:33.75pt;width:391pt'></td>
  <td class=xl83 width=118 style='width:89pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl65 width=118 style='height:17.25pt;width:89pt'>(4<font
  class="font12">쪽 중 제</font><font class="font11">2</font><font class="font12">쪽</font><font
  class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=7 height=27 class=xl140 width=638 style='height:20.25pt;
  width:480pt'>표준대차대조표</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=7 height=22 class=xl122 width=638 style='height:16.5pt;
  width:480pt'>(<font class="font22">일반법인용</font><font class="font21">)</font><font
  class="font13"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(</font><font class="font6">단위</font><font class="font13">: </font><font
  class="font6">원</font><font class="font13">)</font></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl72 width=158 style='height:16.5pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl123 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl125 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl127 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl129 width=154 style='border-bottom:2.0pt double black;
  width:116pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 현재</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl66 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl133 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl73 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl74 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl74 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl119 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl74 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl75 width=118 style='border-top:none;border-left:none;width:89pt'>금
  액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>129</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>203</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">건설용장비</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>130</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>204</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>131</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">장기미수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>205</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>132</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">분양장기미수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>206</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>133</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>207</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font16">차량운반구</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>134</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>208</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>135</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">공사장기미수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>209</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>136</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>210</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>137</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>211</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font16">건설중인유형자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>138</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">기타장기미수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>212</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>139</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>213</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>140</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>214</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font
  class="font5">시설장치</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>141</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">장기선급금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>215</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>142</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>216</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>143</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">보증금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>217</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>144</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">임차보증금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>218</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font
  class="font5">공구ㆍ기구ㆍ비품</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>145</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>219</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>146</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">기타보증금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>220</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>147</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">대손충당금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>221</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>148</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font16">이연법인세자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>222</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font
  class="font16">기타유형자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>149</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">기타비유동자산</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>223</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">감가상각누계액</font><font class="font14">)</font></td>
  <td class=xl69 width=32 style='border-top:none;border-left:none;width:24pt'>150</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl142 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>자산총계<font class="font17">(</font><font
  class="font16">Ⅰ</font><font class="font17">+</font><font class="font16">Ⅱ</font><font
  class="font17">)</font></td>
  <td class=xl79 width=36 style='border-top:none;border-left:none;width:27pt'>228</td>
  <td class=xl90 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code1_amt",Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">손상차손누계액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-left:none;width:24pt'>151</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl144 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>I.<font class="font16">유동부채</font></td>
  <td class=xl67 width=36 style='border-top:none;border-left:none;width:27pt'>229</td>
  <td class=xl91 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">정부보조금등차감액</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>152</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">매입채무</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>230</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>(3)<font
  class="font16">무형자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>169</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">외상매입금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>231</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">영업권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>170</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">지급어음</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>232</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">산업재산권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>171</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">기타매입채무</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>233</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">특허권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>172</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">단기차입금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>234</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">상표권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>173</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">관계회사</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>235</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">실용신안권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>174</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">주주ㆍ임원ㆍ종업원</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>236</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>라<font
  class="font14">.</font><font class="font5">의장권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>175</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">기타</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>237</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>마<font
  class="font14">.</font><font class="font5">기타산업재산권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>176</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font5">미지급금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>238</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">광업권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>181</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font17">.</font><font
  class="font16">미지급법인세</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>239</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">어업권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>182</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font17">.</font><font
  class="font16">미지급배당금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>240</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font16">차지권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>183</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">기타미지급금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>241</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font16">개발비</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>184</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">선수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>242</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font16">사용수익기부자산가액</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>185</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font17">.</font><font
  class="font16">분양선수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>243</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font5">소프트웨어</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>186</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font17">.</font><font
  class="font16">공사선수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>244</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font
  class="font5">저작권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>187</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl146 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font17">.</font><font
  class="font16">기타</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>245</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font
  class="font5">제이용권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>188</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font5">예수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>246</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font
  class="font16">기타무형자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>189</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">부가가치세예수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>247</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>(4)<font
  class="font16">기타비유동자산</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>194</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">제세예수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>248</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">장기매출채권</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>195</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font class="font14">.</font><font
  class="font5">예수보증금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>249</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">장기외상매출금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>196</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>라<font class="font14">.</font><font
  class="font5">기타예수금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>250</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>197</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font5">미지급비용</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>251</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>198</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font5">선수수익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>252</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">장기받을어음</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>199</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl141 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font16">유동성장기부채</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>253</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">대손충당금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>200</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl135 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font class="font14">.</font><font
  class="font5">유동성장기차입금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>254</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>201</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl136 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font class="font5">현재가치할인차금</font><font
  class="font14">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>255</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl80 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">장기기타매출채권</font></td>
  <td class=xl69 width=32 style='border-top:none;border-left:none;width:24pt'>202</td>
  <td class=xl87 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl137 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font class="font14">.</font><font
  class="font5">유동성사채</font></td>
  <td class=xl69 width=36 style='border-top:none;border-left:none;width:27pt'>256</td>
  <td class=xl89 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 rowspan=2 height=45 class=xl105 width=638 style='height:33.75pt;
  width:480pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=22 style='page-break-before:always;height:16.5pt'>
  <td colspan=6 rowspan=2 height=45 class=xl84 width=520 style='border-bottom:
  1.5pt solid black;height:33.75pt;width:391pt'></td>
  <td class=xl82 width=118 style='width:89pt'></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl65 width=118 style='height:17.25pt;width:89pt'>(4<font
  class="font12">쪽 중 제</font><font class="font11">3</font><font class="font12">쪽</font><font
  class="font11">)</font></td>
 </tr>
 <tr height=27 style='height:20.25pt'>
  <td colspan=7 height=27 class=xl140 width=638 style='height:20.25pt;
  width:480pt'>표준대차대조표</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=7 height=22 class=xl122 width=638 style='height:16.5pt;
  width:480pt'>(<font class="font22">일반법인용</font><font class="font21">)</font><font
  class="font13"><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>(</font><font class="font6">단위</font><font class="font13">: </font><font
  class="font6">원</font><font class="font13">)</font></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td height=22 class=xl72 width=158 style='height:16.5pt;border-top:none;
  width:119pt'>사업자등록번호</td>
  <td colspan=2 class=xl123 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td rowspan=2 class=xl125 width=46 style='border-bottom:2.0pt double black;
  border-top:none;width:35pt'>법인명</td>
  <td rowspan=2 class=xl127 width=119 style='border-bottom:2.0pt double black;
  border-top:none;width:89pt'><%=obox.get("corp_nm")%></td>
  <td colspan=2 rowspan=2 class=xl129 width=154 style='border-bottom:2.0pt double black;
  width:116pt'><%=StringUtil.substr(obox.get("acc_end_ymd"),0,4)%>년 <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 현재</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl66 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>법인등록번호</td>
  <td colspan=2 class=xl133 width=161 style='border-right:.5pt solid black;
  border-left:none;width:121pt'><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td height=23 class=xl73 width=158 style='height:17.25pt;border-top:none;
  width:119pt'>계 정 과 목</td>
  <td class=xl74 width=32 style='border-top:none;border-left:none;width:24pt'>코드</td>
  <td class=xl77 width=129 style='border-top:none;border-left:none;width:97pt'>금
  액</td>
  <td colspan=2 class=xl119 width=165 style='border-right:.5pt solid black;
  border-left:none;width:124pt'>계 정 과 목</td>
  <td class=xl74 width=36 style='border-top:none;border-left:none;width:27pt'>코드</td>
  <td class=xl75 width=118 style='border-top:none;border-left:none;width:89pt'>금
  액</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>257</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>13.<font class="font5">장기기타보증금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>327</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">기타유동성장기부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>258</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>14.<font class="font16">기타비유동부채</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>328</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>259</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl96 style='border-right:.5pt solid black;border-left:
  none'>부채총계<font class="font17">(</font><font class="font16">Ⅰ</font><font
  class="font17">+</font><font class="font16">Ⅱ</font><font class="font17">)</font></td>
  <td class=xl79 width=36 style='border-top:none;border-left:none;width:27pt'>333</td>
  <td class=xl90 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font
  class="font5">단기충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>268</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl120 style='border-right:.5pt solid black;border-left:
  none'>III.<font class="font16">자본금</font></td>
  <td class=xl67 width=36 style='border-top:none;border-left:none;width:27pt'>334</td>
  <td class=xl91 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code31_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font26">.</font><font class="font25">단기공사손실충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>269</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font16">보통주자본금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>335</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code31_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font26">.</font><font class="font25">단기제품보증충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>270</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font16">우선주자본금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>336</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font26">.</font><font class="font25">단기반품추정충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>271</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl117 style='border-right:.5pt solid black;border-left:
  none'>Ⅳ<font class="font17">.</font><font class="font16">자본잉여금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>337</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>라<font
  class="font26">.</font><font class="font25">단기하자보수충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>272</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font16">주식발행초과금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>338</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>마<font
  class="font26">.</font><font class="font25">단기기타충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>273</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font16">감자차익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>339</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font
  class="font16">이연법인세부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>278</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font16">합병차익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>340</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font
  class="font16">기타유동부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>279</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font5">자기주식처분이익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>341</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'>II.<font class="font16">비유동부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>284</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font16">재평가적립금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>342</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font
  class="font16">사채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>285</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font16">기타자본잉여금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>343</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>286</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'>V.<font class="font16">자본조정</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>348</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font
  class="font16">전환사채등신종사채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>287</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font16">주식할인발행차금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>349</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>288</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font5">감자차손</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>350</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font
  class="font16">장기차입금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>289</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font16">자기주식</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>351</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font17">.</font><font class="font16">관계회사</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>290</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font16">미교부주식배당금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>352</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>291</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">자기주식처분손실</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>353</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font17">.</font><font class="font16">주주ㆍ임원ㆍ종업원</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>292</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font5">부의지분법자본변동</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>354</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>293</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font class="font5">주식매수선택권</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>355</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl76 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font17">.</font><font class="font16">기타</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>294</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font class="font16">기타자본조정</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>356</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>295</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl117 style='border-right:.5pt solid black;border-left:
  none'>Ⅵ<font class="font17">.</font><font class="font16">기타포괄손익누계액</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>361</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font
  class="font16">장기매입채무</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>296</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font16">매도가능증권평가손익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>362</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">장기외상매입금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>297</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font16">해외사업환산손익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>363</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>298</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>3.<font class="font16">지분법자본변동</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>364</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">장기지급어음</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>299</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font16">파생상품평가손익</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>365</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>300</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl115 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font class="font5">재평가잉여금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>366</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">장기기타매입채무</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>301</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font class="font16">기타</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>367</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>302</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl109 style='border-right:.5pt solid black;border-left:
  none'>VII.<font class="font16">이익잉여금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>372</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>5.<font
  class="font5">장기미지급금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>303</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>1.<font class="font28">이익준비금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>373</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">현재가치할인차금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>304</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>2.<font class="font28">재무구조개선적립금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>374</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>6.<font
  class="font5">장기선수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>305</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>3.<font class="font28">「조세특례제한법상」준비금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>375</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font14">.</font><font class="font5">장기분양선수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>306</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl111 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp; </span>4.<font class="font28">기타임의적립금</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>376</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font14">.</font><font class="font5">장기공사선수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>307</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl113 style='border-right:.5pt solid black;border-left:
  none'><span style='mso-spacerun:yes'>&nbsp;</span>5.<font class="font30">미처분이익잉여금</font><font
  class="font29">(</font><font class="font30">미처리결손금</font><font class="font29">)</font></td>
  <td class=xl68 width=36 style='border-top:none;border-left:none;width:27pt'>381</td>
  <td class=xl88 width=118 style='border-top:none;border-left:none;width:89pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl70 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font14">.</font><font class="font5">장기기타선수금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>308</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl96 style='border-right:.5pt solid black;border-left:
  none'>자본총계<font class="font17">(</font><font class="font16">Ⅲ</font><font
  class="font17">+</font><font class="font16">～Ⅶ</font><font class="font17">)</font></td>
  <td class=xl79 width=36 style='border-top:none;border-left:none;width:27pt'>382</td>
  <td class=xl90 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code3_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>7.<font
  class="font16">퇴직급여충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>309</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=2 class=xl98 style='border-right:.5pt solid black;border-left:
  none'>부채와 자본총계</td>
  <td class=xl81 width=36 style='border-top:none;border-left:none;width:27pt'>383</td>
  <td class=xl92 width=118 style='border-top:none;border-left:none;width:89pt'><%=rbox.get("code32_amt", Box.THOUSAND_COMMA)%></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>8.<font
  class="font5">퇴직연금미지급금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>310</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
  <td colspan=4 rowspan=13 class=xl100 width=319 style='border-bottom:1.5pt solid black;
  width:240pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">국민연금전환금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>311</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">퇴직보험예치금</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>312</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>(<font
  class="font5">퇴직연금운용자산</font><font class="font14">)</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>313</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp; </span>9.<font
  class="font5">장기충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>314</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>가<font
  class="font26">.</font><font class="font25">장기공사손실충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>315</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>나<font
  class="font26">.</font><font class="font25">장기제품보증충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>316</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>다<font
  class="font26">.</font><font class="font25">장기반품추정충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>317</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>라<font
  class="font26">.</font><font class="font25">장기하자보수충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>318</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl85 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span>마<font
  class="font26">.</font><font class="font25">장기기타충당부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>319</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>10.<font
  class="font16">제준비금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>324</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl78 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>11.<font
  class="font16">이연법인세부채</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>325</td>
  <td class=xl86 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl71 width=158 style='height:12.75pt;border-top:none;
  width:119pt'><span style='mso-spacerun:yes'>&nbsp;</span>12.<font
  class="font5">장기임대보증금</font></td>
  <td class=xl68 width=32 style='border-top:none;border-left:none;width:24pt'>326</td>
  <td class=xl87 width=129 style='border-top:none;border-left:none;width:97pt'>　</td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 rowspan=2 height=45 class=xl105 width=638 style='height:33.75pt;
  width:480pt'>　</td>
 </tr>
 <tr height=22 style='height:16.5pt'>
 </tr>
 <tr height=23 style='page-break-before:always;height:17.25pt'>
  <td colspan=7 height=23 class=xl106 width=638 style='height:17.25pt;
  width:480pt'>(4<font class="font12">쪽 중 제</font><font class="font11">4</font><font
  class="font12">쪽</font><font class="font11">)</font></td>
 </tr>
 <tr height=23 style='height:17.25pt'>
  <td colspan=7 rowspan=26 height=618 class=xl151 width=638 style='border-bottom:
  1.5pt solid black;height:410.5pt;width:480pt'>　</td>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=22 style='height:14.5pt'>
 </tr>
 <tr height=23 style='height:17.25pt'>
 </tr>
 <tr height=44 style='mso-height-source:userset;height:25.0pt'>
  <td colspan=7 height=44 class=xl108 width=638 style='height:25.0pt;
  width:480pt'>작성방법</td>
 </tr>
 <tr height=22 style='height:13.5pt'>
  <td colspan=7 height=22 class=xl94 width=638 style='height:13.5pt;width:480pt'></td>
 </tr>
 <tr height=50 style='mso-height-source:userset;height:35.5pt'>
  <td colspan=7 height=50 class=xl95 width=638 style='height:35.5pt;width:480pt'><span
  style='mso-spacerun:yes'>&nbsp; </span>※<font class="font19"> </font><font
  class="font12">이 표준대차대조표는 기업회계기준</font><font class="font19">(K-IFRS, </font><font
  class="font12">중소기업회계기준 등</font><font class="font19">)</font><font
  class="font12">을 준용하여 작성한 대차대조표를 기준으로 다음과 같이 <br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>작성하여야
  합니다</font><font class="font19">.</font></td>
 </tr>
 <tr height=22 style='height:13.5pt'>
  <td colspan=7 height=22 class=xl94 width=638 style='height:13.5pt;width:480pt'></td>
 </tr>
 <tr height=47 style='mso-height-source:userset;height:35.25pt'>
  <td colspan=7 height=47 class=xl93 width=638 style='height:35.25pt;
  width:480pt'><font class="font31"><span
  style='mso-spacerun:yes'>&nbsp;</span></font><font class="font11">1. </font><font
  class="font12">해당 법인이 기업회계기준을 준용하여 작성한 대차대조표를 기준으로 하여 </font><font
  class="font23">음영 표시된 항목란</font><font class="font12">에만 기재하여 작성할 수 있습<br>
    <span style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>니다</font><font
  class="font11">.</font></td>
 </tr>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=7 height=38 class=xl93 width=638 style='height:28.5pt;width:480pt'><font
  class="font31"><span style='mso-spacerun:yes'>&nbsp;</span></font><font
  class="font11">2. </font><font class="font12">이 표준대차대조표는 다음 각 목의 어느 하나에 해당하는
  법인이 작성합니다</font><font class="font11">.</font></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=7 height=33 class=xl95 width=638 style='height:24.75pt;
  width:480pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>가<font
  class="font11">. </font><font class="font12">한국표준산업분류표상 금융ㆍ보험ㆍ증권업을 영위하지 아니하는
  법인</font></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td colspan=7 height=33 class=xl95 width=638 style='height:24.75pt;
  width:480pt'><span style='mso-spacerun:yes'>&nbsp;&nbsp; </span>나<font
  class="font11">.</font><font class="font12">한국표준산업분류표상 금융관련서비스업 중 기타 금융서비스업과
  보험 및 연금관련서비스업을 영위하는 법인</font></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td colspan=7 height=35 class=xl93 width=638 style='height:26.25pt;
  width:480pt'><font class="font31"><span
  style='mso-spacerun:yes'>&nbsp;</span></font><font class="font11">3. </font><font
  class="font12">대차대조표의 계정과목과 동일한 계정과목이 없는 경우에는 기타란에 회사에서 사용하는 계정과목과 금액을 적습니다</font><font
  class="font11">.</font></td>
 </tr>
 <tr height=48 style='mso-height-source:userset;height:36.0pt'>
  <td colspan=7 height=48 class=xl150 width=638 style='height:36.0pt;
  width:480pt'><span style='mso-spacerun:yes'>&nbsp;</span>4. <font
  class="font12">Ⅱ</font><font class="font11">.</font><font class="font12">비유동부채
  중 </font><font class="font11">2.</font><font class="font12">전환사채등신종사채란은 전환사채</font><font
  class="font11">, </font><font class="font12">신주인수권부사채</font><font
  class="font11">, </font><font class="font12">교환사채</font><font class="font11">,
  </font><font class="font12">그 밖에 주식으로 전환ㆍ교환하거나 주식을 인수할 수 있는 권리가 부여된 사채 등을 사채와
  구분하여 별도로 적습니다</font><font class="font11">.</font></td>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=7 height=22 class=xl83 width=638 style='height:16.5pt;width:480pt'></td>
 </tr>
</table>
</body>
</html>
