/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 08:12:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.budget;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class bud21001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<title>추정재무제표</title>\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tif (formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tvar theURL = 'bud21001_list.do';\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\t\tdocument.main.action = theURL;\r\n");
      out.write("\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">추정 재무제표</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:13%;\">\r\n");
      out.write("\t\t\t<col style=\"width:27%;\">\r\n");
      out.write("\t\t\t<col style=\"width:13%;\">\r\n");
      out.write("\t\t\t<col style=\"width:47%;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">기준년도</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"bugt_yy\" class=\"bs-select form-control\" title=\"기준년도\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">보고서종류</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"report_id\" class=\"bs-select form-control\" title=\"보고서종류\" style=\"width:140px\">\r\n");
      out.write("\t\t\t\t\t\t<option value='ACC001P' ");
      out.print(box.get("report_id").equals("ACC001P")?"selected":"");
      out.write(">추정 재무상태표</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='ACC002P' ");
      out.print(box.get("report_id").equals("ACC002P")?"selected":"");
      out.write(">추정 손익계산서</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"screenToExcel('#divListData', '");
      out.print(box.get("report_id").equals("ACC001P")?"추정 재무상태표":"추정 손익계산서");
      out.write("');\"><img src=\"/com/img/ico_btn_excel.png\">엑셀</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goUbiViewer('WEB-INF/jsp/budget/report/bud21001.jrf', 'P_PARAM01!");
      out.print(box.get("report_id"));
      out.write("!P_PARAM02!");
      out.print(box.get("bugt_yy"));
      out.write("!');\"><img src=\"/com/img/ico_btn_print.png\">인쇄</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\t\t    \r\n");
      out.write("\t<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t\t<div class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(100vh - 127px);\">\r\n");
      out.write("\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:30px;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:25px;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15px;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15px;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15px;\">\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15px;\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr height=\"22\">\r\n");
      out.write("\t\t\t\t\t\t<th rowspan=\"2\">과목</th>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"3\">");
      out.print(box.get("bugt_yy"));
      out.write("년 예산</th>\r\n");
      out.write("\t\t\t\t\t\t<th rowspan=\"2\">비고</td>\r\n");
      out.write("\t\t\t\t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr height=\"22\">\r\n");
      out.write("\t\t\t\t\t\t<th>목적사업회계</th>\r\n");
      out.write("\t\t\t\t\t\t<th>기금관리회계</th>\r\n");
      out.write("\t\t\t\t\t\t<th>계</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody> \r\n");
      out.write("\t\t\t\t");
 for(int i=0; i < rsWp.getLength(); i++) {	
					String bgcolor = "#ffffff";
					if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
					if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#eeeeee"; } 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr class=\"odd gradeX\" bgcolor=\"");
      out.print(bgcolor);
      out.write("\"> \r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">");
      out.print(StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("bugt_amt1",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("bugt_amt2",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("bugt_amt3",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
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
