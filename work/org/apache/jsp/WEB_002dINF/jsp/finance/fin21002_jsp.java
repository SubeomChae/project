/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 00:01:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.finance;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class fin21002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- ???????????? ?????? -->\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover\">\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th colspan=\"7\">");
      out.print(obox.get("subject"));
      out.write("</th>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>No</td>\r\n");
      out.write("\t\t\t<th>??????</td>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("  \t\t</tr> \r\n");
      out.write("\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t<tr height=\"25\"><td colspan=\"7\" class=\"t-center\">????????? ????????? ????????????.</td></tr>\r\n");
      out.write("\t");
 }else {
	   	   for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t<tr height=\"25\"> \r\n");
      out.write("\t\t\t\t<td width=\"3%\" class=\"t-center\">");
      out.print(String.valueOf(i+1));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"16%\">");
      out.print(rsWp.get("etc_remark",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"12%\" class=\"t-center\">");
      out.print(rsWp.get("wrt_dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"8%\" class=\"t-center\"><a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("wrt_empl_no",i));
      out.write("')\">");
      out.print(rsWp.get("wrt_empl_nm",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t<td width=\"8%\" class=\"t-right\">");
      out.print(rsWp.get("slip_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td width=\"13%\" class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goCustInfo('");
      out.print(rsWp.get("cust_cd",i));
      out.write("')\">");
      out.print(rsWp.get("cust_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goEmployeeInfo('");
      out.print(rsWp.get("empl_no",i));
      out.write("')\">");
      out.print(rsWp.get("empl_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td width=\"8%\" class=\"t-center\">");
      out.print(rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t ");
 } 
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("  \t</tr>\r\n");
      out.write("</table>\r\n");
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
