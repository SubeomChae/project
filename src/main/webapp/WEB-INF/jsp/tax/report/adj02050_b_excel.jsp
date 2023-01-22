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
	{margin:.55in .91in .55in 1.02in;
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
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid black;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	border:.5pt solid black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	border:.5pt solid black;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl84
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl86
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl87
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl88
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl89
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl90
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl91
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;}
.xl92
	{mso-style-parent:style0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl93
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl94
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	white-space:normal;}
.xl95
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:left;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl96
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl97
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl98
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl99
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.x200
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:돋움, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl100
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl103
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:right;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl108
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl109
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl110
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl111
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;}
.xl112
	{mso-style-parent:style0;
	text-align:center;}
.xl113
	{mso-style-parent:style0;
	text-align:center;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;}
.xl114
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	white-space:normal;}
.xl115
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl116
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl117
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl118
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl119
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:1.0pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl120
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl121
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl122
	{mso-style-parent:style0;
	color:black;
	font-family:한컴바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl123
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl124
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl125
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl126
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl127
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl128
	{mso-style-parent:style0;
	color:black;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid black;
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

<table border=0 cellpadding=0 cellspacing=0 width=585 style='border-collapse:
 collapse;table-layout:fixed;width:444pt'>
 <col width=19 style='mso-width-source:userset;mso-width-alt:608;width:14pt'>
 <col width=13 style='mso-width-source:userset;mso-width-alt:416;width:10pt'>
 <col width=21 span=13 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=11 style='mso-width-source:userset;mso-width-alt:352;width:8pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=21 span=4 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=19 span=4 style='mso-width-source:userset;mso-width-alt:608;
 width:14pt'>
 <col width=22 style='mso-width-source:userset;mso-width-alt:704;width:17pt'>
 <col width=21 span=3 style='mso-width-source:userset;mso-width-alt:672;
 width:16pt'>
 <col width=14 style='mso-width-source:userset;mso-width-alt:448;width:11pt'>
 <tr height=23 style='mso-height-source:userset;height:17.25pt'>
  <td colspan=26 height=23 class=xl75 width=508 style='height:17.25pt;
  width:385pt'>[별지 제50호서식(을)]</td>
  <td colspan=4 class=xl74 width=77 style='width:59pt'>(앞 쪽)</td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
  <td colspan=4 rowspan=2 height=54 class=xl107 width=74 style='border-right:
  .5pt solid black;border-bottom:.5pt solid black;height:40.5pt;width:56pt'>사업연도</td>
  <td colspan=4 rowspan=2 class=x200 width=84 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:64pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%>~<br><%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
  <td colspan=14 rowspan=2 class=xl118 width=271 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:206pt'>자본금과 적립금조정명세서(을)</td>
  <td colspan=4 rowspan=2 class=xl118 width=79 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:59pt'>법인명</td>
  <td colspan=4 rowspan=2 class=x200 width=77 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black;width:59pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=27 style='mso-height-source:userset;height:20.25pt'>
 </tr>
 <tr height=22 style='height:16.5pt'>
  <td colspan=30 height=22 class=xl111 style='border-right:1.0pt solid black;
  height:16.5pt'>　</td>
 </tr>
 <tr height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl70 style='height:34.5pt'>　</td>
  <td colspan=3 class=xl99 width=55 style='border-right:.5pt solid black;
  width:42pt'>※ 관리<br>
    번호</td>
  <td class=xl65 width=21 style='border-left:none;width:16pt'>　</td>
  <td class=xl66 width=21 style='border-left:none;width:16pt'>　</td>
  <td class=xl72 width=21 style='width:16pt'>-</td>
  <td class=xl67 width=21 style='border-left:none;width:16pt'>　</td>
  <td class=xl67 width=21 style='border-left:none;width:16pt'>　</td>
  <td colspan=6 class=xl96 width=126 style='border-right:.5pt solid black;
  border-left:none;width:96pt'>사업자등록번호</td>
  <td colspan=2 class=xl116 width=21 style='border-right:.5pt solid black;
  border-left:none;width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),0,1)%></td>
  <td class=xl116 width=21 style='width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),1,2)%></td>
  <td class=xl116 width=21 style='width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),2,3)%></td>
  <td class=xl73 width=21 style='width:16pt'>-</td>
  <td class=xl116 width=21 style='width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),3,4)%></td>
  <td class=xl116 width=19 style='width:14pt'><%=StringUtil.substr(obox.get("saupja_no"),4,5)%></td>
  <td class=xl69 width=19 style='width:14pt'>-</td>
  <td class=xl116 width=19 style='width:14pt'><%=StringUtil.substr(obox.get("saupja_no"),5,6)%></td>
  <td class=xl116 width=19 style='width:14pt'><%=StringUtil.substr(obox.get("saupja_no"),6,7)%></td>
  <td class=xl116 width=22 style='width:17pt'><%=StringUtil.substr(obox.get("saupja_no"),7,8)%></td>
  <td class=xl116 width=21 style='width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),8,9)%></td>
  <td class=xl116 width=21 style='width:16pt'><%=StringUtil.substr(obox.get("saupja_no"),9,10)%></td>
  <td class=x171 width=21 style='width:16pt'></td>
  <td class=x171 width=14 style='border-right:1.0pt solid black;width:11pt'></td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=30 height=22 class=xl93 width=585 style='border-right:1.0pt solid black;
  height:16.5pt;width:444pt'><span style='mso-spacerun:yes'>&nbsp;</span>※ 표시란은
  기입하지 마십시오.</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=30 height=22 class=xl93 width=585 style='border-right:1.0pt solid black;border-top:.5pt solid black;
  height:16.5pt;width:444pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>세무조정유보소득 계산</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=7 rowspan=2 height=58 class=xl102 width=137 style='height:43.5pt;
  width:104pt'>①과목 또는 사항</td>
  <td colspan=4 rowspan=2 class=xl90 width=84 style='width:64pt'>②기초잔액</td>
  <td colspan=10 class=xl90 width=189 style='border-left:none;width:144pt'>당 기
  중 증 감</td>
  <td colspan=5 rowspan=2 class=xl80 width=98 style='border-right:.5pt solid black;
  border-bottom:.5pt solid black;width:73pt'>⑤기말잔액<br>
    (익기초현재)</td>
  <td colspan=4 rowspan=2 class=xl80 width=77 style='border-right:1.0pt solid black;
  border-bottom:.5pt solid black;width:59pt'>비고</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td colspan=5 height=29 class=xl90 width=95 style='height:21.75pt;border-left:
  none;width:72pt'>③감소</td>
  <td colspan=5 class=xl90 width=94 style='border-left:none;width:72pt'>④증가</td>
 </tr>
 
 <% long slip_sum2 = 0;
    long slip_sum3 = 0;
    long slip_sum4 = 0;
    long slip_sum5 = 0;
    for(int i=0; i < rsWp.getLength(); i++) {	
		slip_sum2 += rsWp.getLong("slip_wamt2",i);
		slip_sum3 += rsWp.getLong("slip_wamt3",i);
		slip_sum4 += rsWp.getLong("slip_wamt4",i);
		slip_sum5 += rsWp.getLong("slip_wamt5",i); %>
 	<tr height=38 style='mso-height-source:userset;height:28.5pt'>
		<td colspan=7 height=38 class=xl91 style='height:28.5pt'><%=rsWp.get("acct_nm1",i)%></td>
		<td colspan=4 class=xl88 width=84 style='width:64pt'><%=rsWp.get("slip_wamt2",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=5 class=xl88 width=95 style='border-left:none;width:72pt'><%=rsWp.get("slip_wamt3",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=5 class=xl88 width=94 style='border-left:none;width:72pt'><%=rsWp.get("slip_wamt4",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=5 class=xl88 width=98 style='border-left:none;width:73pt'><%=rsWp.get("slip_wamt5",i,Box.THOUSAND_COMMA)%></td>
		<td colspan=4 class=xl88 width=77 style='border-right:1.0pt solid black; border-left:none;width:59pt'><%=rsWp.get("remark",i)%></td>
	</tr>
<% } %>
<% for(int i=rsWp.getLength(); i < 14; i++) { %>
	<tr height=38 style='mso-height-source:userset;height:28.5pt'>
		<td colspan=7 height=38 class=xl91 style='height:28.5pt'>　</td>
		<td colspan=4 class=xl88 width=84 style='width:64pt'>　</td>
		<td colspan=5 class=xl88 width=95 style='border-left:none;width:72pt'>　</td>
		<td colspan=5 class=xl88 width=94 style='border-left:none;width:72pt'>　</td>
		<td colspan=5 class=xl88 width=98 style='border-left:none;width:73pt'>　</td>
		<td colspan=4 class=xl88 width=77 style='border-right:1.0pt solid black; border-left:none;width:59pt'>　</td>
	</tr>
<% } %>
 <tr height=38 style='mso-height-source:userset;height:28.5pt'>
  <td colspan=7 height=38 class=xl114 width=137 style='height:28.5pt;
  width:104pt'>합계</td>
  <td colspan=4 class=xl76 width=84 style='width:64pt'><%=FormatUtil.insertComma(String.valueOf(slip_sum2))%></td>
  <td colspan=5 class=xl76 width=95 style='border-left:none;width:72pt'><%=FormatUtil.insertComma(String.valueOf(slip_sum3))%></td>
  <td colspan=5 class=xl76 width=94 style='border-left:none;width:72pt'><%=FormatUtil.insertComma(String.valueOf(slip_sum4))%></td>
  <td colspan=5 class=xl76 width=98 style='border-left:none;width:73pt'><%=FormatUtil.insertComma(String.valueOf(slip_sum5))%></td>
  <td colspan=4 class=xl76 width=77 style='border-right:1.0pt solid black; border-left:none;width:59pt'>　</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
  <td colspan=11 rowspan=2 height=44 class=xl78 width=221 style='height:33.0pt;
  width:168pt'>22226-84011일<br>
    99.4.1 개정승인</td>
  <td colspan=19 rowspan=2 class=xl79 width=364 style='width:276pt'>210mm×297mm<br>
    (신문용지 54g/㎡(재활용품))</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:16.5pt'>
 </tr>
</table>

</body>

</html>
