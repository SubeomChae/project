/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-08-29 05:37:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admenu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class adm94001_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      response.setContentType("text/html; charset=UTF-8");
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
      egovframework.cbiz.RsWrapper rsWp = null;
      rsWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("rsWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rsWp == null){
        rsWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("rsWp", rsWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
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
      out.write("\r\n");
      out.write("<!-- 회사별 시스템 접속현황 -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch() {\r\n");
      out.write("\t\tdocument.main.action = \"adm94001_list.do\";\r\n");
      out.write("\t\tdocument.main.target = \"_self\";\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\tfunction goDetail(corp_cd, corp_nm) {\r\n");
      out.write("\t\tdocument.getElementById(\"spanCorpNm\").innerHTML = \"<h2 class='page-title-2depth'> [\"+corp_nm+\"] 사용자별 접속현황</h2>\";\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(corp_cd != '') { $(\"tr[corp_cd='\"+corp_cd+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tvar theUrl = \"adm94002_list.do?corp_cd=\"+corp_cd;\r\n");
      out.write("\t\t$('#ifrm').attr('src', theUrl);\r\n");
      out.write("   \t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t");
 if(rsWp.getLength() > 1) { 
      out.write("\r\n");
      out.write("\t\t\tsetBackColor(1);\r\n");
      out.write("\t\t\tgoDetail('");
      out.print(rsWp.get("corp_cd",1));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("corp_nm",1));
      out.write("');\r\n");
      out.write("\t    ");
 } 
      out.write("\r\n");
      out.write("\t    fixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">회사별 시스템 접속현황</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<h2 class=\"page-title-2depth\">월별 접속추이\r\n");
      out.write("\t\t<div class=\"form-inline f-right marB5\">\r\n");
      out.write("\t\t\t<select name=\"std_yy\" class=\"bs-select form-control\" style=\"width:90px;\" onchange=\"goSearch();\">\r\n");
      out.write("\t\t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("std_yy"),"2015",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</h2>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(100vh - 396px);\">\r\n");
      out.write("\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>회사명</th>\r\n");
      out.write("\t\t\t\t\t<th>전년말</th>\r\n");
      out.write("\t\t\t\t\t<th>1월</th>\r\n");
      out.write("\t\t\t\t\t<th>2월</th>\r\n");
      out.write("\t\t\t\t\t<th>3월</th>\r\n");
      out.write("\t\t\t\t\t<th>4월</th>\r\n");
      out.write("\t\t\t\t\t<th>5월</th>\r\n");
      out.write("\t\t\t\t\t<th>6월</th>\r\n");
      out.write("\t\t\t\t\t<th>7월</th>\r\n");
      out.write("\t\t\t\t\t<th>8월</th>\r\n");
      out.write("\t\t\t\t\t<th>9월</th>\r\n");
      out.write("\t\t\t\t\t<th>10월</th>\r\n");
      out.write("\t\t\t\t\t<th>11월</th>\r\n");
      out.write("\t\t\t\t\t<th>12월</th>\r\n");
      out.write("\t\t\t\t\t<th>합계</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t\t<tbody>\r\n");
      out.write("\t\t\t");
 for(int i=0; i < rsWp.getLength(); i++){ 
      out.write("\r\n");
      out.write("\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" corp_cd=\"");
      out.print(rsWp.get("corp_cd",i));
      out.write("\" corp_nm=\"");
      out.print(rsWp.get("corp_nm",i));
      out.write('"');
      out.write(' ');
if(rsWp.get("sort_key",i).equals("z")){
      out.write("bgcolor=\"f6f6f6\"");
}else{
      out.write(" style=\"cursor:pointer\" onClick=\"goDetail('");
      out.print(rsWp.get("corp_cd",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("corp_nm",i));
      out.write('\'');
      out.write(')');
      out.write('"');
}
      out.write(">\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(StringUtil.replace(rsWp.get("corp_nm",i),"사내근로복지기금",""));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("pre_tot",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt01",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt02",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt03",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt04",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt05",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt06",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt07",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt08",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt09",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt10",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt11",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cnt12",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cur_tot",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<span id=\"spanCorpNm\"></span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t<iframe id=\"ifrm\" name=\"ifrm\" marginwidth=\"0\" src=\"about:blank\" frameborder=\"0\" width=\"100%\" height=\"800px\" scrolling=\"no\"></iframe>\r\n");
      out.write("\t</div>\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("</div>\r\n");
 } 
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
