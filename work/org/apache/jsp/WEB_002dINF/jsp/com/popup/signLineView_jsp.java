/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-03 01:39:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.com.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class signLineView_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!-- 결재라인 조회  -->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\t\r\n");
      out.write("\tfunction goMouseEvent(event_nm, sign_seq) {\r\n");
      out.write("\t\t$('#tr_'+sign_seq).css(\"background-color\", event_nm == 'over' ? '#b2e1f1' : '#ffffff');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$(\".page-logo-text\").html(\"결재라인 조회\");\t\r\n");
      out.write("\t}); \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form name=\"pForm\" method=\"post\" class=\"fType\" action=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_no\" \t\tvalue=\"");
      out.print(box.get("msg_no"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"marB5\">\r\n");
      out.write("\t<b>제목 : ");
      out.print(obox.get("subject"));
      out.write("</b> (작성자 : ");
      out.print(obox.get("send_empl_nm"));
      out.write(")\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"table-scrollable\">\r\n");
      out.write("\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"5%\">No</th>\r\n");
      out.write("\t\t\t<th width=\"15%\">결재단계</th>\r\n");
      out.write("\t\t\t<th width=\"10%\">결재자</th>\r\n");
      out.write("\t\t\t<th width=\"15%\">결재상태</th>\r\n");
      out.write("\t\t\t<th width=\"25%\">결재일시</th>\r\n");
      out.write("\t\t\t<th width=\"30%\">의견</th>\r\n");
      out.write("       \t</tr> \r\n");
      out.write("\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t<tr><td colspan=\"6\" class=\"t-center\">결재라인이 생성되지 않았습니다.</td></tr>\r\n");
      out.write("\t");
 }else {
		for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" onMouseOver=\"goMouseEvent('over','");
      out.print(i);
      out.write("')\" onMouseOut=\"goMouseEvent('out','");
      out.print(i);
      out.write("')\"> \r\n");
      out.write("\t\t\t<td class=\"t-center\">");
      out.print(String.valueOf(i+1));
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("sign_step_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t");
 if(!rsWp.get("real_empl_no",i).equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("real_empl_no",i));
      out.write("')\">");
      out.print(rsWp.get("sign_empl_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t");
if(rsWp.get("sign_empl_no",i).length() > 3){
      out.write("<a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("sign_empl_no",i));
      out.write("')\">");
}
      out.print(rsWp.get("sign_empl_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("sign_status_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("sign_date",i));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>");
      out.print(rsWp.get("opinion",i));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\t\r\n");
      out.write("\t");
 }
	} 
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div class=\"table-bottom-control\">\r\n");
      out.write("\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"window.close();\"><img src=\"/com/img/ico_btn_cancel.png\">닫기</button>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</span>\r\n");
      out.write("</div>");
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
