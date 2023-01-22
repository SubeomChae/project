<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
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
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.98in .38in .63in .42in;
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
.xl24
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;}
.xl25
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt hairline windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	mso-number-format:"\#\,\#\#0";
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:right;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid black;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-family:돋움체, monospace;
	mso-font-charset:129;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid black;
	background:silver;
	mso-pattern:auto none;
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
<body link=blue vlink=purple class=xl24>
<table x:str border="0" cellpadding=0 cellspacing=0 width=716 style='border-collapse: collapse;table-layout:fixed;width:536pt' u1:str>
 <col class=xl24 width=240 style='mso-width-source:userset;mso-width-alt:6826; width:180pt'>
 <col class=xl24 width=119 span=4 style='mso-width-source:userset;mso-width-alt: 3384;width:89pt'>
 <tr height=25 style='height:18.75pt'>
  <td colspan=5 height=25 class=xl28 width=716 style='height:18.75pt;  width:536pt'>손익계산서</td>
 </tr>
 <tr height=16 style='mso-height-source:userset;height:12.0pt'>
  <td colspan=5 height=16 class=xl29 width=716 style='height:12.0pt;width:536pt'><%=obox.get("corp_nm")%></td>
 </tr>
 <tr height=4 style='mso-height-source:userset;height:3.0pt'>
  <td colspan=5 height=4 class=xl30 width=716 style='height:3.0pt;width:536pt'>　</td>
 </tr>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td rowspan=2 height=49 class=xl31 width=240 style='border-bottom:.5pt solid black;  height:36.75pt;border-top:none;width:180pt'>계정과목</td>
  <td colspan=2 class=xl33 width=238 style='border-right:.5pt solid black;  border-left:none;width:178pt'>
	<% if(box.get("month_flag").equals("M")) { %>
		당월<br><font style="size:8pt">(<%=box.get("std_year")%>월  <%=box.get("std_month")%>월)</font>
	<%}else { %>
		당기<br><font style="size:8pt">(<%=StringUtil.substr(obox.get("acc_start_ymd"),0,4)%>년  <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터 &nbsp;<%=box.get("std_year")%>년  <%=box.get("std_month")%>월  <%=DateUtil.getDayCount(box.getInt("std_year"), box.getInt("std_month"))%>일)</font>
	<% } %>
  </td>
  <td colspan=2 class=xl35 width=238 style='border-right:.5pt solid black;  border-left:none;width:178pt'>
	<% if(box.get("month_flag").equals("M")) { %>
		<font style="size:8pt">전월<br>
		<% if(box.get("std_month").equals("01")) { %>
			(<%=Integer.parseInt(box.get("std_year"))-1%>년 12월)
		<%}else { %>
			(<%=box.get("std_year")%>년  <%=StringUtil.lpad(String.valueOf(Integer.parseInt(box.get("std_month"))-1),"0",2)%>월)
		<% } %>
		</font>
	<%}else { %>
		전기<br><font style="size:8pt">(<%=Integer.parseInt(StringUtil.substr(obox.get("acc_start_ymd"),0,4))-1%>년  <%=StringUtil.substr(obox.get("acc_start_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_start_ymd"),6)%>일 부터 &nbsp;<%=Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4))-1%>년  <%=StringUtil.substr(obox.get("acc_end_ymd"),4,6)%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일)</font>
	<% } %>
  </td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td colspan=2 height=20 class=xl33 width=238 style='border-right:.5pt solid black;  height:15.0pt;border-left:none;width:178pt'>금액</td>
  <td colspan=2 class=xl35 width=238 style='border-right:.5pt solid black;  border-left:none;width:178pt'>금액</td>
 </tr>
<% for(int i=0; i < rsWp.getLength(); i++) { %>
 <tr height=21 style='mso-height-source:userset;height:15.75pt'>
  <td height=21 class=xl25 width=240 style='height:15.75pt;width:180pt'><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></td>
  <td class=xl26 align=right width=119 style='width:89pt'><%=rsWp.get("cur_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl27 align=right width=119 style='width:89pt'><%=rsWp.get("cur_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl26 align=right width=119 style='width:89pt'><%=rsWp.get("pre_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
  <td class=xl27 align=right width=119 style='width:89pt'><%=rsWp.get("pre_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
 </tr>
<% } %>
</table>
</body>
</html>

