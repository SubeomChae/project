/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 00:05:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.tax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class adj02001_005f2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/jsp/com/include/excel_header.jsp", Long.valueOf(1568793281369L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("egovframework.cbiz");
    _jspx_imports_packages.add("egovframework.cbiz.util");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      egovframework.cbiz.Box box = null;
      box = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("box", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (box == null){
        box = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("box", box, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.Box obox = null;
      obox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("obox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (obox == null){
        obox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("obox", obox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.Box rbox = null;
      rbox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("rbox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rbox == null){
        rbox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("rbox", rbox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.ubiz.mapper.ent.SesUserEntity uSesEnt = null;
      synchronized (session) {
        uSesEnt = (egovframework.ubiz.mapper.ent.SesUserEntity) _jspx_page_context.getAttribute("uSesEnt", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (uSesEnt == null){
          uSesEnt = new egovframework.ubiz.mapper.ent.SesUserEntity();
          _jspx_page_context.setAttribute("uSesEnt", uSesEnt, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
 String xmlBuf = ""; 
      out.write('\r');
      out.write('\n');
 if(box.get("excel_yn").equals("Y")) { 
      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write('\n');
	
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = box.get("excel_file_nm");
	excel_file_nm = StringUtil.get8859_1(excel_file_nm); // ìë²ììë ì£¼ìì²ë¦¬
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

      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("\ttd { font-size:12px; font-family:\"ë§ì ê³ ë\", \"Arial\", \"sans-serif\"; color:#00000; text-align:center; border:.5pt solid #000; }\n");
      out.write("</style>\n");
      out.write("<center><h2>");
      out.print(box.get("excel_file_nm"));
      out.write("</h2></center>");
      out.write('\r');
      out.write('\n');
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--[별지 제43호 서식] 법인세지방소득세 과세표준 및 세액신고서  -->\r\n");
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tajaxSubmitForm(\"xmlUpdate.do\",\"#taxForm\", function(rtn) {\r\n");
      out.write("\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"taxForm\" name=\"taxForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"report_id\" \tvalue=\"");
      out.print(box.get("report_id"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"std_yy\" \t\tvalue=\"");
      out.print(box.get("std_yy"));
      out.write("\">\r\n");
      out.write("\t\r\n");
      out.write("\t<h2 class=\"page-title-2depths\">법인세지방소득세 과세표준 및 세액신고서</h2>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<span style=\"float:right;\">[별지 제43호 서식]</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t\t");
	xmlBuf += "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
						   +  "<corp_reg_no>"+FormatUtil.juminNo(obox.get("corp_reg_no"))+"</corp_reg_no>\n"
						   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
						   +  "<tel_no>"+obox.get("tel_no")+"</tel_no>\n"
						   +  "<rep_person_nm>"+obox.get("rep_person_nm")+"</rep_person_nm>\n"
						   +  "<email_id>"+obox.get("email_id")+"</email_id>\n"
						   +  "<addr>"+obox.get("addr")+"</addr>\n"
						   +  "<uptae>"+obox.get("uptae")+"</uptae>\n"
						   +  "<upjong>"+obox.get("upjong")+"</upjong>\n"
						   +  "<saup_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+" ~ "+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</saup_ymd>\n"
						   +  "<report_ymd>"+DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D")+"</report_ymd>\n"
						   +  "<tax_report_ymd>"+obox.get("tax_report_ymd",Box.DEF_DATE_FMT)+"</tax_report_ymd>\n"
						   +  "<empl_cnt>"+obox.get("empl_cnt")+"</empl_cnt>\n";
				
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"15%\" class=\"t-left\">①사업자등록번호</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"35%\" class=\"t-left\">");
      out.print(FormatUtil.bizRegiNoFormat(obox.get("saupja_no")));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" class=\"t-left\">②법인등록번호</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"35%\" class=\"t-left\">");
      out.print(FormatUtil.juminNo(obox.get("corp_reg_no")));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">③법인명</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-left\">");
      out.print(obox.get("corp_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">④전화번호</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">");
      out.print(obox.get("tel_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">⑤대표자성명</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-left\">");
      out.print(obox.get("rep_person_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">⑥전자우편주소</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">");
      out.print(obox.get("email_id"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">⑦소재지</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"8\" class=\"t-left\">");
      out.print(obox.get("addr"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">⑧업태</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"22%\" class=\"t-left\">");
      out.print(obox.get("uptae"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"13%\" class=\"t-left\">⑨종목</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" class=\"t-left\">");
      out.print(obox.get("upjong"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"13%\" class=\"t-left\">⑩주업종코드</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"22%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">⑪사업연도</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-center\">");
      out.print(obox.get("acc_start_ymd",Box.DEF_DATE_FMT));
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(obox.get("acc_end_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">⑫수시부과기간</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"15%\" class=\"t-left\">⑬법인구분</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\" width=\"35%\" class=\"t-left\"><b><u>1.내국</u></b>&nbsp;&nbsp;2.외국&nbsp;&nbsp;3.외투(비율");
      out.print(StringUtil.strLooping("&nbsp;",5));
      out.write("%)</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" class=\"t-left\">⑭조정구분</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"35%\" class=\"t-left\">1.외부&nbsp;&nbsp;<b><u>2.자기</u></b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-left\">⑮종류별구분</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" width=\"8%\" class=\"t-center\">중소기업</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">일반</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" width=\"7%\" class=\"t-center\">당기순이익<br>과세</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"t-left\">(16)외부감사대상</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" rowspan=\"2\" class=\"t-left\">1.여 &nbsp;&nbsp;<b><u>2.부</u></b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"7%\" class=\"t-center\">중견<br>기업</td>\r\n");
      out.write("\t\t\t\t<td width=\"9%\" class=\"t-center\">상호출자<br>제한기업</td>\r\n");
      out.write("\t\t\t\t<td width=\"7%\" class=\"t-center\">그외<br>기업</td>\r\n");
      out.write("\t\t\t</tr>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" width=\"5%\" class=\"t-center\">영리<br>법인</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"t-center\">상장법인</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">11</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">71</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">81</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">91</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"5\" class=\"t-left\">(17)신고구분</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\"><b><u>1.정기신고</u></b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td style=\"width:12%\" class=\"t-center\">코스닥상장법인</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">21</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">72</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">82</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">92</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">2.수정신고(가.서면분석, 나.기타)</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">기타법인</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">30</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">73</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">83</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">93</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">3.기한후 신고</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">비영리법인</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"t-center\">60</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"t-center\">74</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"t-center\">84</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"t-center\"><b><u>94</u></b></td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">50</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">4.중도폐업 신고</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">5.경정청구</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(18)법인유형별구분</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"></td>\r\n");
      out.write("\t\t\t\t<td width=\"6%\" class=\"t-center\">코드</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"7%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">(19)결산확정일</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">");
      out.print(DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(20)신고일</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\" class=\"t-center\">");
      out.print(obox.get("tax_report_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\" class=\"t-left\">(21)납부일</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(22)신고기한연장승인</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">1. 신청일</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\" class=\"t-left\">2. 연장기한</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"37%\" class=\"t-center\">구분</td>\r\n");
      out.write("\t\t\t\t<td width=\"6%\" class=\"t-center\">여</td>\r\n");
      out.write("\t\t\t\t<td width=\"7%\" class=\"t-center\">부</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"37%\" class=\"t-center\">구분</td>\r\n");
      out.write("\t\t\t\t<td width=\"6%\" class=\"t-center\">여</td>\r\n");
      out.write("\t\t\t\t<td width=\"7%\" class=\"t-center\">부</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-left\">(23)주식변동</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">1</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"><b><u>2</u></b></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(24)장부전산화</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"><b><u>1</u></b></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">2</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-left\">(25)사업연도의제</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">1</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"><b><u>2</u></b></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(26)결손금소급공제 법인세환급신청</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">1</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"><b><u>2</u></b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-left\">(27)동업기업의 출자자(동업자)</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">1</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">2</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">(28)미환류소득에 대한 법인지방소득세 신고</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">1</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">2</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"3\" width=\"20%\" class=\"t-center\">구분</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"7\" width=\"80%\" class=\"t-center\">법인지방소득세</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"20%\" class=\"t-center\">각 사업연도 소득세에 대한<br>법인지방소득세</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"20%\" class=\"t-center\">토지 등 양도소득에 대한 <br>법인지방소득세</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"20%\" class=\"t-center\">미환류소득에 대한 <br>법인지방소득세</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" width=\"20%\" class=\"t-center\">계</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","",uSesEnt.dbo);
				Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익

				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","",uSesEnt.dbo);
				Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익  
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t");
	xmlBuf += "<amt_6>"+FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))+"</amt_6>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(28)수입금액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\" class=\"t-center\">(");
      out.print(FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002)));
      out.write(")</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(29)과세표준</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\" bgcolor=\"f6f6f6\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(30)표준산출세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(31)총부담세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","",uSesEnt.dbo);
				Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급지방소득세) 
      out.write("\r\n");
      out.write("\t\t\t");
	xmlBuf += "<amt_1111202>"+FormatUtil.insertComma(String.valueOf(amt_1111202))+"</amt_1111202>\n"
					   +  "<amt_1111202_min>"+FormatUtil.insertComma(String.valueOf(amt_1111202*-1))+"</amt_1111202_min>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(32)기납부세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">");
      out.print(FormatUtil.insertComma(String.valueOf(amt_1111202)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\">");
      out.print(FormatUtil.insertComma(String.valueOf(amt_1111202)));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">(33)차감납부할세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">");
      out.print(FormatUtil.insertComma(String.valueOf(amt_1111202*-1)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" class=\"t-center\">");
      out.print(FormatUtil.insertComma(String.valueOf(amt_1111202*-1)));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-left\">(35)본점/지점</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"9\" width=\"45%\" class=\"t-left\"><b><u>1.단일사업장</u></b>  2.지점 있는 법인의 본점  3.지점 </td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(36)특ㆍ광역시 주사업장 여부</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-center\">1.여    <b><u>2.부</u></b></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-left\">(37)해당사업장</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" width=\"5%\" class=\"t-center\">명칭</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\" class=\"t-left\">");
      out.print(obox.get("corp_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" width=\"6%\" class=\"t-center\">소재지</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"7\" width=\"35%\" class=\"t-left\">");
      out.print(obox.get("addr"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" width=\"6%\" class=\"t-center\">연락처</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-center\">");
      out.print(obox.get("tel_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"20\" class=\"t-left\">(38)안분율의 계산</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"3\" width=\"15%\" class=\"t-center\">구분</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" width=\"10%\" class=\"t-center\">종업원 수<br>(명)</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"12\" class=\"t-center\" width=\"60%\">건축물 연면적(㎡)</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"3\" width=\"15%\" class=\"t-center\">안분율(%)<br>(소수점6자리)</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" colspan=\"3\" class=\"t-center\">계</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" colspan=\"3\" class=\"t-center\">건물</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" colspan=\"3\" class=\"t-center\">기계장치</td>\r\n");
      out.write("\t\t\t\t<td width=\"15%\" colspan=\"3\" class=\"t-center\">시설물</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">법인전체</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">");
      out.print(obox.get("empl_cnt"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">시군구내</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">");
      out.print(obox.get("empl_cnt"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">0</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">비율(%)</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-center\">100</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" class=\"t-left\">(39)납세지별 세액산출</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\" width=\"30%\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(40)납세지별 세액공제ㆍ감면액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(41)납세지별 가산세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"6\" width=\"30%\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(42)납세지별 감면분 추가납부세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">합계</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">무(과소)<br>신고</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">납부(환급)<br>불성실</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">지방세법<br>제103조의30에<br>따른 가산세</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">동업기업<br>가산세<br>배분액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"1\"  class=\"t-center\">기타</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"t-center\">(43)납세지별<br>기납부세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-left\">특별징수납부세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" width=\"15%\" class=\"t-left\">수시부과세액 및<br>예정신고납부세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"10%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"10%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"10%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"10%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" width=\"10%\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"1\" width=\"5%\"  class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(44)경정ㆍ수정신고 등 가감액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"11\" width=\"55%\" class=\"t-left\">(45)탄력세율적용 조정세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" width=\"25%\" class=\"t-left\">(46)당해 납세지에 납부할 세액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" width=\"20%\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB0\">\r\n");
      out.write("\t\t\t");
	xmlBuf += "<bank_nm>"+obox.get("bank_nm")+"</bank_nm>\n"
					   +  "<account_no>"+obox.get("account_no")+"</account_no>\n"
					   +  "<today_ymd>"+StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)+"년 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)+"월 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)+"일"+"</today_ymd>\n" 
					   +  "<tax_office>"+obox.get("tax_office")+"</tax_office>\n"; 
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" width=\"20%\" class=\"t-center\">환급금 계좌<br>(환급세액을 계좌로<br>받는 경우)</td>\r\n");
      out.write("\t\t\t\t<td width=\"25%\" class=\"t-left\">(47)금융기관명</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(obox.get("bank_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"25%\" class=\"t-left\">(48)예금주</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(obox.get("corp_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"25%\" class=\"t-left\">(49)계좌번호</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(obox.get("account_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t신고인은 「지방세법」 제 103조의 23, 제 103조의 24 및 「지방세기본법」 제50조, 제51조, 제52조에 따라 위의 내용을 신고하며, 위 내용을 충분히 검토하였고 신고인이 알고 있는 사실 그대로를 정확하게 기재하였음을 확인합니다.\r\n");
      out.write("\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4));
      out.write("년\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6));
      out.write("월\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.substr(DateUtil.toString("yyyyMMdd"),6));
      out.write("일\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t");
      out.print(StringUtil.strLooping("&nbsp;",90));
      out.write("신고인(법 인) &nbsp;&nbsp;");
      out.print(StringUtil.strLooping("&nbsp;",10));
      out.write("( 인 )\r\n");
      out.write("\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t");
      out.print(StringUtil.strLooping("&nbsp;",90));
      out.write("신고인(대표자) &nbsp;&nbsp;");
      out.print(obox.get("rep_person_nm"));
      out.write(" (서명)\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr> \t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" align=\"left\" style=\"padding-left:5px\" class=\"t-left\">");
      out.print(obox.get("tax_office"));
      out.write(" 시장ㆍ군수ㆍ구청장 귀하</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<textarea name=\"xmlBuf\" style=\"display:none\">");
      out.print(xmlBuf);
      out.write("</textarea>\r\n");
      out.write("</form>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
