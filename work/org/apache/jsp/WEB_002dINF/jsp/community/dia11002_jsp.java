/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 06:47:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.community;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class dia11002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      egovframework.ubiz.mapper.ent.SesUserEntity uSesEnt = null;
      synchronized (session) {
        uSesEnt = (egovframework.ubiz.mapper.ent.SesUserEntity) _jspx_page_context.getAttribute("uSesEnt", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (uSesEnt == null){
          uSesEnt = new egovframework.ubiz.mapper.ent.SesUserEntity();
          _jspx_page_context.setAttribute("uSesEnt", uSesEnt, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!-- 일정 등록 -->\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tvar pageUrl = 'dia11002_select.do';\r\n");
      out.write("\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\tdocument.main.action = pageUrl;\r\n");
      out.write("\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction goEdit() {\r\n");
      out.write("\t\tremoveMask(\"#main\");\r\n");
      out.write("\t    document.main.action = \"dia11003_edit.do\";\r\n");
      out.write("\t    document.main.target = \"_self\";\r\n");
      out.write("\t    document.main.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\t    document.main.action = \"dia11002_delete.do\";\r\n");
      out.write("\t\t    document.main.target = \"_parent\";\r\n");
      out.write("\t\t    document.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goTabpage(tab_index) {\r\n");
      out.write("\t\tdocument.main.tab_index.value = tab_index;\r\n");
      out.write("\t\tfor(var i=0; i <= 1; i++) {\r\n");
      out.write("\t\t\tdocument.getElementById('tabImage'+i).style.backgroundImage = 'url(/com/img/bg_tab120_' + (tab_index == i ? 'on' : 'off') + '.gif)';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar pageUrl = '';\r\n");
      out.write("\t}\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t");
 if(!obox.get("wrt_user_id").equals(uSesEnt.user_id)) { 
      out.write("\r\n");
      out.write("\t\tdocument.getElementById('isEditTable').style.display = 'none';\r\n");
      out.write("\t");
 } 
      out.write('\r');
      out.write('\n');
      out.write('	');
 if(box.get("popup_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("\t\t$(\".page-logo-text\").html(\"일정\");\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"plan_no\" \t\tvalue=\"");
      out.print(obox.get("plan_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"popup_yn\" \t\tvalue=\"");
      out.print(box.get("popup_yn"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover mar0\">\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"20%\">제목</th>\r\n");
      out.write("\t\t\t<td width=\"80%\" style=\"padding:0 5 0 5\">");
      out.print(obox.get("subject").replace("@@FONT@@","<font color='red'><b>").replace("@@FONT_END@@","</b></font>"));
      out.write("</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th>구분</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("plan_class_nm"));
      out.write("</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t");

      		String dateStr = obox.get("start_ymd").substring(4,6)+"."+obox.get("start_ymd").substring(6)+"("+obox.get("start_week")+")";
      		if(!obox.get("start_hhmm").equals("")) { dateStr += " "+obox.get("start_hhmm").substring(0,2)+":"+obox.get("start_hhmm").substring(2); }
      		if(!obox.get("end_ymd").equals(obox.get("start_ymd"))) { dateStr += " ~ "+obox.get("end_ymd").substring(4,6)+"."+obox.get("end_ymd").substring(6)+"("+obox.get("end_week")+")"; }
      		if(!obox.get("end_hhmm").equals("") && (!obox.get("end_ymd").equals(obox.get("start_ymd")) || !obox.get("end_hhmm").equals(obox.get("start_hhmm")))) { 
      			if(dateStr.indexOf(" ~ ") < 0) { dateStr += " ~ "; }
      			dateStr += " "+obox.get("end_hhmm").substring(0,2)+":"+obox.get("end_hhmm").substring(2);
      		}
		
      out.write("\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th>기간</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(dateStr.equals("")?obox.get("start_date",Box.DEF_DATETIME_FMT_APM)+(obox.get("end_date").equals("")?"":" ~ "+obox.get("end_date",Box.DEF_DATETIME_FMT_APM)):dateStr);
      out.write("</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("  \t\t<tr height=\"80\">\r\n");
      out.write("\t\t\t<th>내용</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("plan_memo"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th>공개범위</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("public_scope_nm"));
      out.write("</td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"isEditTable\" class=\"table-bottom-control padR5\">\r\n");
      out.write("\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goEdit();\"><img src=\"/com/img/ico_btn_edit.png\">수정</button>\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goCancel();\"><img src=\"/com/img/ico_btn_delete.png\">삭제</button>\r\n");
      out.write("\t\t\t</span>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
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
