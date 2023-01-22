<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
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
<title>[별지 제3호 서식] 법인세 과세표준 및 세액조정계산서</title>
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.1in .75in .98in .98in;
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
.font8
	{color:black;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;}
.font9
	{color:black;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;}
.font10
	{color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
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
	font-size:10.0pt;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border:.5pt solid black;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	border:.5pt solid black;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:black;
	font-size:14.0pt;
	font-family:굴림, monospace;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:black;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:black;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:black;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:justify;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid black;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	color:black;
	font-size:16.0pt;
	font-weight:700;
	font-family:휴먼명조;
	mso-generic-font-family:auto;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl81
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl82
	{mso-style-parent:style0;
	color:black;
	font-size:10.0pt;
	font-family:바탕, serif;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl83
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
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
<body link=blue vlink=purple>
<table border=0 cellpadding=0 cellspacing=0 width=589 style='border-collapse:collapse;table-layout:fixed;width:442pt'>
<col width=304 style='mso-width-source:userset;mso-width-alt:9728;width:228pt'>
<col width=100 style='mso-width-source:userset;mso-width-alt:3200;width:75pt'>
<col width=185 style='mso-width-source:userset;mso-width-alt:5920;width:139pt'>
	<tr height=22 style='height:16.5pt'>
		<td colspan=3 height=22 class=xl69 width=589 style='height:16.5pt;width:442pt'>[별지 제3호 서식]</td>
	</tr>
	<tr height=31 style='mso-height-source:userset;height:23.25pt'>
		<td rowspan=2 height=69 class=xl76 width=304 style='border-bottom:.5pt solid black;height:51.75pt;width:228pt'>전산조직운용명세서</td>
		<td class=xl66 width=100 style='border-left:none;width:75pt'>법인명(상호)</td>
		<td class=xl66 width=185 style='border-left:none;width:139pt'><%=obox.get("corp_nm")%></td>
	</tr>
	<tr height=38 style='mso-height-source:userset;height:28.5pt'>
		<td height=38 class=xl66 width=100 style='height:28.5pt;border-top:none;border-left:none;width:75pt'>사업자등록번호</td>
		<td class=xl66 width=185 style='border-top:none;border-left:none;width:139pt'><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
	</tr>
	<tr height=14 style='mso-height-source:userset;height:10.5pt'>
		<td colspan=3 height=14 class=xl78 width=589 style='border-right:.5pt solid black;height:10.5pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;1. 회계프로그램(시스템) 사용현황</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("pgm_using").equals("1")){%><b><u><%}%>① 자체개발<%if(obox.get("pgm_using").equals("1")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("pgm_using").equals("2")){%><b><u><%}%>② 외주개발<%if(obox.get("pgm_using").equals("2")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("pgm_using").equals("3")){%><b><u><%}%>③ ERP<%if(obox.get("pgm_using").equals("3")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("pgm_using").equals("4")){%><b><u><%}%>④ 상업용 회계프로그램<%if(obox.get("pgm_using").equals("4")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;2. 관리(영업,판매,생산) 프로그램(시스템) 사용현황</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("system_using").equals("1")){%><b><u><%}%>① 자체개발<%if(obox.get("system_using").equals("1")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("system_using").equals("2")){%><b><u><%}%>② 외주개발<%if(obox.get("system_using").equals("2")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("system_using").equals("3")){%><b><u><%}%>③ ERP<%if(obox.get("system_using").equals("3")){%></u></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<%if(obox.get("system_using").equals("4")){%><b><u><%}%>④ 상업용 회계프로그램<%if(obox.get("system_using").equals("4")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;3. 회계시스템 DBMS 종류<font class="font8">(1번 ①② 응답자만)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("1")){%><b><u><%}%>① Oracle<%if(obox.get("dbms").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("2")){%><b><u><%}%>② MS SQL<%if(obox.get("dbms").equals("2")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("3")){%><b><u><%}%>③ DB2<%if(obox.get("dbms").equals("3")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("4")){%><b><u><%}%>④ Sybase<%if(obox.get("dbms").equals("4")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("5")){%><b><u><%}%>⑤ My SQL<%if(obox.get("dbms").equals("5")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("dbms").equals("6")){%><b><u><%}%>⑥ 기타 (<%=obox.get("dbms").equals("8")?obox.get("dbms_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("dbms").equals("8")){%></u></b><%}%><span style='mso-spacerun:yes'>&nbsp;</span>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp; <font class="font9">4. DBMS Version</font><font class="font10"> (<%=FormatUtil.nvl2(obox.get("dbms_ver"),StringUtil.strLooping("&nbsp",10))%>)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;5. ERP<font class="font8">(1번 ③ 응답자만)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("1")){%><b><u><%}%>① SAP<%if(obox.get("erp").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("2")){%><b><u><%}%>② Oracle<%if(obox.get("erp").equals("2")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("3")){%><b><u><%}%>③ Uni-ERP<%if(obox.get("erp").equals("3")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("4")){%><b><u><%}%>④ 더존ERP<%if(obox.get("erp").equals("4")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='mso-spacerun:yes'>&nbsp;</span>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("5")){%><b><u><%}%>⑤ 영림원 K.System<%if(obox.get("erp").equals("5")){%></u></b><%}%>
			&nbsp;&nbsp;<%if(obox.get("erp").equals("6")){%><b><u><%}%>⑥ 자체개발<%if(obox.get("erp").equals("6")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("erp").equals("7")){%><b><u><%}%>⑦ 기타 (<%=obox.get("erp").equals("7")?obox.get("erp_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("erp").equals("7")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;6. 상업용 회계프로그램<font class="font8">(1번 ④ 응답자만)</font></td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("1")){%><b><u><%}%>① 더존 NEOplus<%if(obox.get("acc_package").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("2")){%><b><u><%}%>② 세무사랑2<%if(obox.get("acc_package").equals("2")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("3")){%><b><u><%}%>③ 키컴 SA-Win<%if(obox.get("acc_package").equals("3")){%></u></b><%}%>
			
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("4")){%><b><u><%}%>④ 얼마에요<%if(obox.get("acc_package").equals("4")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("5")){%><b><u><%}%>⑤ Micro Win<%if(obox.get("acc_package").equals("5")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;<%if(obox.get("acc_package").equals("6")){%><b><u><%}%>⑥ 기타 (<%=obox.get("acc_package").equals("6")?obox.get("acc_package_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("acc_package").equals("6")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;7. 상용 수입금액관리 프로그램</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;제조회사(<%=obox.get("rev_pgm_maker").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("rev_pgm_maker")%>)
			&nbsp;&nbsp;&nbsp;&nbsp;S/W 명칭(<%=obox.get("rev_sw_nm").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("rev_sw_nm")%>)
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;8. 전자거래 유무</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_yn").equals("1")){%><b><u><%}%>① 있음<%if(obox.get("etxn_yn").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_yn").equals("2")){%><b><u><%}%>② 없음<%if(obox.get("etxn_yn").equals("2")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;9. 전자거래 유형(복수 선택 가능)<font class="font8">(8번 ① 응답자만)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("1")){%><b><u><%}%>① 영수증<%if(obox.get("etxn_type").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("2")){%><b><u><%}%>② 청구서<%if(obox.get("etxn_type").equals("2")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("3")){%><b><u><%}%>③ 견적서<%if(obox.get("etxn_type").equals("3")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("4")){%><b><u><%}%>④ 주문서<%if(obox.get("etxn_type").equals("4")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='mso-spacerun:yes'>&nbsp;</span>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("5")){%><b><u><%}%>⑤ 계약서<%if(obox.get("etxn_type").equals("5")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("etxn_type").equals("6")){%><b><u><%}%>⑥ 기타 (<%=obox.get("etxn_type").equals("6")?obox.get("etxn_type_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("etxn_type").equals("6")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;10. 단위업무시스템 종류<font class="font8">(복수선택 가능)</font></td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("1,")>=0){%><b><u><%}%>① 재무회계<font class="font8">(원장,재무제표, 채권&#8231;채무) </font><%if(obox.get("unit_system").indexOf("1,")>=0){%></u></b><%}%>
			<%if(obox.get("unit_system").indexOf("2,")>=0){%><b><u><%}%>② 관리회계<font class="font8">(원가,성과)</font><%if(obox.get("unit_system").indexOf("2,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("3,")>=0){%><b><u><%}%>③ 재무관리<font class="font8">(자금,예산)</font><%if(obox.get("unit_system").indexOf("3,")>=0){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("4,")>=0){%><b><u><%}%>④ 판매관리<font class="font8">(고객, 주문, 출하, 배송, 청구)</font><%if(obox.get("unit_system").indexOf("4,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("5,")>=0){%><b><u><%}%>⑤ 자재관리<font class="font8">(구매, 검수, 입출고, 재고) </font><%if(obox.get("unit_system").indexOf("5,")>=0){%></u></b><%}%>
			&nbsp;<%if(obox.get("unit_system").indexOf("6,")>=0){%><b><u><%}%>⑥ 생산관리<font class="font8">(생산계획, 생산실적)</font><%if(obox.get("unit_system").indexOf("6,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("7,")>=0){%><b><u><%}%>⑦ 품질관리<font class="font8">(품질계획, 품질검사)</font><%if(obox.get("unit_system").indexOf("7,")>=0){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("8,")>=0){%><b><u><%}%>⑧ 인사관리<font class="font8">(급여, 복지후생, 채용)</font><%if(obox.get("unit_system").indexOf("8,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("unit_system").indexOf("9,")>=0){%><b><u><%}%>⑨ 기타 (<%=obox.get("unit_system").indexOf("9,")>=0?obox.get("unit_system_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("unit_system").indexOf("9,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;11. 전자기록의 보관 장소(복수 선택 가능)<font class="font8">(8번 ① 응답자만)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("1")){%><b><u><%}%>① 회사 내<%if(obox.get("record_spot").equals("1")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("2")){%><b><u><%}%>② 외부용역업체<%if(obox.get("record_spot").equals("2")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("3")){%><b><u><%}%>③ IDC센터<%if(obox.get("record_spot").equals("3")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("4")){%><b><u><%}%>④ 클라우드 시스템<%if(obox.get("record_spot").equals("4")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("5")){%><b><u><%}%>⑤ 웹호스팅<%if(obox.get("record_spot").equals("5")){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_spot").equals("6")){%><b><u><%}%>⑥ 기타 (계열회사 등) (<%=obox.get("record_spot").equals("6")?obox.get("record_spot_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("record_spot").equals("6")){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;12. 전자기록을 관리하는 외부 전산조직 사업자<font class="font8">(11번 ②,③,④,⑤,⑥ 응답자만)</font>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;상호(<%=obox.get("record_corp_nm").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("record_corp_nm")%>)
			&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호(<%=obox.get("record_saupja_no").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("record_saupja_no")%>)
			&nbsp;&nbsp;&nbsp;&nbsp;전자기록 관리 기간(<%=obox.get("record_start_ymd")%> ~ <%=obox.get("record_end_ymd")%>)
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>　</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl74 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>&nbsp;&nbsp;13. 전자기록 외부 운용 업무 종류 (복수선택 가능)<font class="font8">(복수선택 가능)</font></td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("1,")>=0){%><b><u><%}%>① 재무회계<font class="font8">(원장,재무제표, 채권&#8231;채무) </font><%if(obox.get("record_type").indexOf("1,")>=0){%></u></b><%}%>
			<%if(obox.get("record_type").indexOf("2,")>=0){%><b><u><%}%>② 관리회계<font class="font8">(원가,성과)</font><%if(obox.get("record_type").indexOf("2,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("3,")>=0){%><b><u><%}%>③ 재무관리<font class="font8">(자금,예산)</font><%if(obox.get("record_type").indexOf("3,")>=0){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("4,")>=0){%><b><u><%}%>④ 판매관리<font class="font8">(고객, 주문, 출하, 배송, 청구)</font><%if(obox.get("record_type").indexOf("4,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("5,")>=0){%><b><u><%}%>⑤ 자재관리<font class="font8">(구매, 검수, 입출고, 재고) </font><%if(obox.get("record_type").indexOf("5,")>=0){%></u></b><%}%>
			&nbsp;<%if(obox.get("record_type").indexOf("6,")>=0){%><b><u><%}%>⑥ 생산관리<font class="font8">(생산계획, 생산실적)</font><%if(obox.get("record_type").indexOf("6,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("7,")>=0){%><b><u><%}%>⑦ 품질관리<font class="font8">(품질계획, 품질검사)</font><%if(obox.get("record_type").indexOf("7,")>=0){%></u></b><%}%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("8,")>=0){%><b><u><%}%>⑧ 인사관리<font class="font8">(급여, 복지후생, 채용)</font><%if(obox.get("record_type").indexOf("8,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr height=25 style='mso-height-source:userset;height:18.75pt'>
		<td colspan=3 height=25 class=xl70 width=589 style='border-right:.5pt solid black;height:18.75pt;width:442pt'>
			&nbsp;&nbsp;&nbsp;&nbsp;<%if(obox.get("record_type").indexOf("9,")>=0){%><b><u><%}%>⑨ 기타 (<%=obox.get("record_type").indexOf("9,")>=0?obox.get("unit_system_etc"):StringUtil.strLooping("&nbsp",10)%>)<%if(obox.get("record_type").indexOf("9,")>=0){%></u></b><%}%>
		</td>
	</tr>
	<tr class=xl81 height=13 style='mso-height-source:userset;height:9.75pt'>
		<td colspan=3 height=13 class=xl82 width=589 style='border-right:.5pt solid black;height:9.75pt;width:442pt'>　</td>
	</tr>
	<tr height=17 style='mso-height-source:userset;height:12.75pt'>
		<td height=17 class=xl65 width=304 style='height:12.75pt;width:228pt'></td>
		<td rowspan=2 class=xl73 width=100 style='width:75pt'></td>
		<td class=xl65 width=185 style='width:139pt'></td>
	</tr>
	<tr height=23 style='page-break-before:always;mso-height-source:userset;height:17.25pt'>
		<td height=23 class=xl65 width=304 style='height:17.25pt;width:228pt'></td>
		<td class=xl65 width=185 style='width:139pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl71 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl71 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=42 style='mso-height-source:userset;height:31.5pt'>
		<td colspan=3 height=42 class=xl68 width=589 style='height:31.5pt;width:442pt'></td>
	</tr>
	<tr height=60 style='mso-height-source:userset;height:45.0pt'>
		<td colspan=3 height=60 class=xl68 width=589 style='height:45.0pt;width:442pt'></td>
	</tr>
</table>
</body>
</html>