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
<title>[별지 제43호의5서식(갑)] 법인지방소득세 특별징수세액명세서(갑)</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.79in .79in .39in .79in;
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
.style63
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
	mso-style-name:"표준 2";}
.font6
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.font7
	{color:black;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font8
	{color:black;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:돋움, monospace;
	mso-font-charset:129;}
.font9
	{color:blue;
	font-size:9.0pt;
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
.xl66
	{mso-style-parent:style63;
	color:black;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.xl67
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.xl68
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl69
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:right;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl70
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl71
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:right;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl72
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl73
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl74
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid #7F7F7F;
	background:#E5E5E5;
	mso-pattern:black none;
	white-space:normal;}
.xl75
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl77
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl78
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:right;
	mso-number-format:"\#\,\#\#0\;\0022△\0022\#\,\#\#0";
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl79
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	mso-number-format:"m\0022\/\0022d";
	border:.5pt solid #7F7F7F;
	white-space:normal;}
.xl80
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:justify;
	border-top:.5pt solid #7F7F7F;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl82
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl83
	{mso-style-parent:style63;
	color:black;
	font-size:6.0pt;
	text-align:center;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl84
	{mso-style-parent:style63;
	color:black;
	font-size:2.9pt;
	font-weight:700;
	text-align:justify;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl85
	{mso-style-parent:style63;
	color:black;
	font-size:7.8pt;
	text-align:right;
	vertical-align:bottom;
	white-space:normal;}
.xl86
	{mso-style-parent:style63;
	color:black;
	font-size:8.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl87
	{mso-style-parent:style63;
	color:black;
	font-size:8.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl88
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl89
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl90
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl91
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl92
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl93
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl94
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl95
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:left;
	vertical-align:top;
	border-top:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl96
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	vertical-align:top;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl97
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl98
	{mso-style-parent:style63;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	vertical-align:top;
	white-space:normal;}
.xl99
	{mso-style-parent:style63;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:"한양견고딕\,한컴돋움", monospace;
	mso-font-charset:129;
	text-align:center;
	vertical-align:top;
	white-space:normal;}
.xl100
	{mso-style-parent:style63;
	color:black;
	font-size:8.0pt;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl101
	{mso-style-parent:style63;
	color:black;
	font-size:7.8pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl102
	{mso-style-parent:style63;
	color:black;
	font-size:8.0pt;
	text-align:right;
	vertical-align:bottom;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl103
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	font-weight:700;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:none;
	white-space:normal;}
.xl104
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl105
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl106
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:none;
	white-space:normal;}
.xl107
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid #7F7F7F;
	border-bottom:none;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl108
	{mso-style-parent:style63;
	color:black;
	font-size:9.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid #7F7F7F;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
.xl109
	{mso-style-parent:style63;
	color:black;
	font-size:10.0pt;
	text-align:center;
	mso-font-charset:0;
	mso-number-format:0%;
	border-top:.5pt solid #7F7F7F;
	border-right:none;
	border-bottom:.5pt solid #7F7F7F;
	border-left:.5pt solid #7F7F7F;
	white-space:normal;}
	
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

<body link=blue vlink=purple class=xl66>

<table border=0 cellpadding=0 cellspacing=0 width=657 style='border-collapse:
 collapse;table-layout:fixed;width:493pt'>
 <col class=xl66 width=59 style='mso-width-source:userset;mso-width-alt:1678;
 width:44pt'>
 <col class=xl66 width=97 style='mso-width-source:userset;mso-width-alt:2759;
 width:73pt'>
 <col class=xl66 width=67 style='mso-width-source:userset;mso-width-alt:1905;
 width:50pt'>
 <col class=xl66 width=82 style='mso-width-source:userset;mso-width-alt:2332;
 width:62pt'>
 <col class=xl67 width=67 style='mso-width-source:userset;mso-width-alt:1905;
 width:50pt'>
 <col class=xl66 width=47 style='mso-width-source:userset;mso-width-alt:1336;
 width:35pt'>
 <col class=xl66 width=86 style='mso-width-source:userset;mso-width-alt:2446;
 width:65pt'>
 <col class=xl66 width=75 style='mso-width-source:userset;mso-width-alt:2133;
 width:56pt'>
 <col class=xl66 width=77 style='mso-width-source:userset;mso-width-alt:2190;
 width:58pt'>
 <tr height=26 style='mso-height-source:userset;height:19.7pt'>
  <td colspan=7 height=26 class=xl98 width=505 style='height:19.7pt;width:379pt'>■
  지방세법 시행규칙 <font class="font8">[별지 제43호의5서식(갑)]</font><font class="font7"> </font><font
  class="font9">&lt;개정 2016.12.30.&gt;</font></td>
  <td class=xl85 width=75 style='width:56pt'></td>
  <td class=xl85 width=77 style='width:58pt'></td>
 </tr>
 <tr height=37 style='mso-height-source:userset;height:28.35pt'>
  <td colspan=9 height=37 class=xl99 width=657 style='height:28.35pt;
  width:493pt'>법인지방소득세 특별징수세액명세서(갑)</td>
 </tr>
 <tr height=22 style='mso-height-source:userset;height:17.1pt'>
  <td colspan=7 height=22 class=xl100 width=419 style='height:17.1pt;
  width:314pt'>※뒤쪽의 작성방법을 참고하시기 바라며, 색상이 어두운 란은 신청인이 적지 않습니다.<font class="font8"><span
  style='mso-spacerun:yes'>&nbsp;</span></font></td>
  <td colspan=2 class=xl101 width=238 style='width:179pt'>(앞쪽)<ruby><font
  class="font6"><rt class=font6></rt></font></ruby></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=3 height=17 class=xl92 width=223 style='height:12.75pt;
  width:167pt'>법인명</td>
  <td colspan=3 class=xl93 width=196 style='border-left:none;width:147pt'>사업자등록번호</td>
  <td colspan=3 class=xl93 width=238 style='width:179pt'>사업연도<ruby><font
  class="font6"><rt class=font6></rt></font></ruby></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td colspan=3 height=17 class=xl94 width=223 style='height:12.75pt;
  width:167pt'><%=obox.get("corp_nm")%></td>
  <td colspan=3 class=xl95 width=196 style='border-left:none;width:147pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
  <td colspan=3 class=xl95 width=238 style='width:179pt'><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.6pt'>
  <td colspan=7 height=4 class=xl84 width=505 style='height:3.6pt;width:379pt'>　</td>
  <td class=xl84 width=75 style='border-top:none;width:56pt'>　</td>
  <td class=xl84 width=77 style='border-top:none;width:58pt'>　</td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.6pt'>
  <td colspan=9 height=24 class=xl103 width=657 style='height:18.6pt;
  width:493pt'>&nbsp;원천징수 및 특별징수 명세내용</td>
 </tr>
 <tr height=56 style='mso-height-source:userset;height:42.6pt'>
  <td rowspan=2 height=90 class=xl104 width=59 style='border-bottom:.5pt solid #7F7F7F;
  height:68.1pt;border-top:none;width:44pt'>①적 요</td>
  <td colspan=2 class=xl90 width=164 style='border-right:.5pt solid #7F7F7F;
  border-left:none;width:123pt'>②원천(특별)징수의무자</td>
  <td rowspan=2 class=xl107 width=82 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:62pt'>③<br>원천징수일<ruby><font class="font6"><rt class=font6></rt></font></ruby></td>
  <td rowspan=2 class=xl86 width=67 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:50pt'>④<br>이자금액<ruby><font class="font6"><rt class=font6></rt></font></ruby></td>
  <td rowspan=2 class=xl88 width=47 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:35pt'>⑤<br>세 율<ruby><font class="font6"><rt class=font6></rt></font></ruby></td>
  <td rowspan=2 class=xl88 width=86 style='border-bottom:.5pt solid #7F7F7F;
  border-top:none;width:65pt'>⑥<br>법인세</td>
  <td colspan=2 class=xl90 width=152 style='width:114pt'>법인지방소득세<br>(특별징수분)</td>
 </tr>
 <tr height=34 style='mso-height-source:userset;height:25.5pt'>
  <td height=34 class=xl83 width=97 style='height:25.5pt;border-top:none;
  border-left:none;width:73pt'>사업자(주민)등록번호<ruby><font class="font6"><rt
  class=font6></rt></font></ruby></td>
  <td class=xl82 width=67 style='border-top:none;width:50pt'>상호(성명)</td>
  <td class=xl77 width=75 style='border-top:none;width:56pt'>⑦특별징수<br>세액</td>
  <td class=xl77 width=77 style='border-top:none;width:58pt'>⑧특별<br>징수지</td>
 </tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="9" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						   long int_sum = 0;
						   long tax_sum = 0;
						   long tax_sum2 = 0;
					   	   for(int i=0; i < rsWp.getLength(); i++) {	
					   	   		if(rsWp.get("cd_flag",i).equals("2") || rsWp.get("slip_no",i).charAt(8) == 'Y') { continue; }
					   	   		int_sum += rsWp.getLong("rel_amt",i);
					   	   		tax_sum += rsWp.getLong("slip_amt",i);
								tax_sum2 += rsWp.getLong("slip_amt2",i); %>
								 <tr height=27 style='mso-height-source:userset;height:20.85pt'>
								  <td height=27 class=xl81 width=59 style='height:20.85pt;border-top:none;width:44pt'><%=rsWp.get("etc_remark",i)%></td>
								  <td class=xl77 width=97 style='border-right:.5pt solid #7F7F7F;border-top:none;border-left:none;width:73pt'><%=FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i))%></td>
								  <td class=xl80 width=67 style='border-top:none;width:50pt'><%=rsWp.get("cust_nm",i)%></td>
								  <td class=xl79 width=82 style='border-top:none;border-left:none;width:62pt'><%=rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT)%></td>
								  <td class=xl78 width=67 style='border-top:none;border-left:none;width:50pt'><%=rsWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
								  <td class=xl109 width=47 style='border-top:none;border-left:none;width:35pt'><%=rsWp.get("tax_rate",i,Box.THOUSAND_COMMA)%> %</td>
								  <td class=xl78 width=86 style='border-top:none;width:65pt'><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
								  <td class=xl78 width=75 style='border-top:none;width:56pt'><%=rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)%></td>
								  <td class=xl76 width=77 style='border-top:none;width:58pt'><%=obox.get("tax_office")%></td>
								 </tr>
						<% } %>
								 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
								  <td height=26 class=xl75 width=59 style='height:20.1pt;border-top:none;width:44pt'>합 계<span style='mso-spacerun:yes'>&nbsp;</span></td>
								  <td class=xl74 width=97 style='border-right:.5pt solid #7F7F7F;border-top:none;border-left:none;width:73pt'>　</td>
								  <td class=xl73 width=67 style='border-top:none;width:50pt'>　</td>
								  <td class=xl72 width=82 style='border-top:none;border-left:none;width:62pt'>　</td>
								  <td class=xl71 width=67 style='border-top:none;border-left:none;width:50pt'><%=FormatUtil.insertComma(String.valueOf(int_sum))%></td>
								  <td class=xl70 width=47 style='border-top:none;border-left:none;width:35pt'>　</td>
								  <td class=xl69 width=86 style='border-top:none;width:65pt'><%=FormatUtil.insertComma(String.valueOf(tax_sum))%></td>
								  <td class=xl69 width=75 style='border-top:none;width:56pt'><%=FormatUtil.insertComma(String.valueOf(tax_sum2))%></td>
								  <td class=xl68 width=77 style='border-top:none;width:58pt'></td>
								 </tr>
					<% } %>
 <tr height=22 style='height:16.5pt'>
  <td colspan=9 height=22 class=xl102 width=657 style='height:16.5pt;
  width:493pt'>210mm×297mm(백상지(80g/㎡)</td>
 </tr>
</table>
</body>
</html>
