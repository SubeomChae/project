/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 11:59:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.com.frame;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class mainframe_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      egovframework.ubiz.mapper.ent.SesUserEntity uSesEnt = null;
      synchronized (session) {
        uSesEnt = (egovframework.ubiz.mapper.ent.SesUserEntity) _jspx_page_context.getAttribute("uSesEnt", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (uSesEnt == null){
          uSesEnt = new egovframework.ubiz.mapper.ent.SesUserEntity();
          _jspx_page_context.setAttribute("uSesEnt", uSesEnt, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<title>::: 사내근로복지기금관리시스템 :::</title>\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=11\" />\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction resizing_frame() {\r\n");
      out.write("\t\tvar dummy_wdt = Math.max(document.body.clientWidth - 1600, 0) / 2;\r\n");
      out.write("\t\tdocument.body.cols = dummy_wdt + ',*,' + dummy_wdt;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction mainframe_init() {\r\n");
      out.write("\t\tif(!document.all && !document.getElementById) { return; }\r\n");
      out.write("\t\tif(document.body!=null) {\r\n");
      out.write("\t\t\tresizing_frame();\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tsetTimeout(\"mainframe_init()\",100);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tsetTimeout(\"mainframe_init()\",100);\r\n");
      out.write("</script>\r\n");
      out.write("<script for=window event=\"onresize\" language=\"JScript\">resizing_frame();</script>\r\n");
      out.write("<frameset cols=\"0,*,0\" frameborder=\"no\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("\t<frame src=\"/com/redirect.do?reqUrl=/com/frame/dummy\" name=\"dummyLeft\" frameborder=\"0\" scrolling=\"no\">\r\n");
      out.write("\t<frameset cols=\"236,*\" frameborder=\"no\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("\t\t<frame src=\"/com/leftFrame.do?menu_id=");
      out.print(box.get("menu_id"));
      out.write("\" name=\"leftFrame\" frameborder=\"0\" scrolling=\"no\" noresize>\r\n");
      out.write("\t\t<frameset rows=\"*,");
      out.print(box.get("frame_yn").equals("Y")?"0":"0");
      out.write("\" frameborder=\"no\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("\t\t\t<frame src=\"/com/subFrame.do?menu_id=");
      out.print(box.get("menu_id"));
      out.write("&default_page=");
      out.print(StringUtil.encodeURL(box.get("default_page")));
      out.write("\" name=\"middleFrame\" frameborder=\"0\" scrolling=\"no\">\r\n");
      out.write("\t\t\t<frame src=\"/com/bottomFrame.do\" name=\"bottomFrame\" frameborder=\"0\" scrolling=\"no\" noresize>\t\t\r\n");
      out.write("\t\t</frameset>\r\n");
      out.write("\t</frameset>\r\n");
      out.write("\t<frame src=\"/com/redirect.do?reqUrl=/com/frame/dummy\" name=\"dummyRight\" frameborder=\"0\" scrolling=\"no\">\r\n");
      out.write("</frameset>\r\n");
      out.write("<noframes>\r\n");
      out.write("<body>\r\n");
      out.write("</body>\r\n");
      out.write("</noframes>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
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
