/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 09:18:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.com.help;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class hlp01002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!-- 사내근로복지기금종합관리시스템 도움말 -->\r\n");
      out.write("<script language=\"javascript\">\t\r\n");
      out.write("\tfunction go_print() {\r\n");
      out.write("\t\twdt = 700; hgt = 750;\r\n");
      out.write("\t\txPos = Math.ceil((screen.width - wdt) / 2);\r\n");
      out.write("\t\tyPos = Math.ceil((screen.height - hgt) / 2);\r\n");
      out.write("\t\twindow.open(\"/com/other.do?method=sabokHelp&menu_id=&menu_id=");
      out.print(box.get("menu_id"));
      out.write("&print_yn=Y\", \"sabokHelpPrint\", \"width=\"+wdt+\",height=\"+hgt+\",menubar=no,toolbar=no,scrollbars=yes,resizable=no,left=\"+xPos+\",top=\"+yPos);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction page_init() {\r\n");
      out.write("\t");
 if(!obox.get("file_path").equals("")) { 
      out.write("\r\n");
      out.write("\t\tvar imgWidth = document.getElementById('imgExample').width;\r\n");
      out.write("\t\tvar imgHeight = document.getElementById('imgExample').height;\r\n");
      out.write("\t\tvar zoomRatio = 575 / imgWidth;\r\n");
      out.write("\t\tdocument.getElementById('imgExample').width  = imgWidth * zoomRatio;\r\n");
      out.write("\t\tdocument.getElementById('imgExample').height = imgHeight * zoomRatio;\r\n");
      out.write("\t");
 } 
      out.write("\t\r\n");
      out.write("\t");
 if(box.get("print_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("\t\twindow.print();\r\n");
      out.write("\t\tself.close();\r\n");
      out.write("\t");
 }else if(box.get("menu_id").length() > 1 && obox.get("menu_nm").equals("")) { 
      out.write("\r\n");
      out.write("\t\talert('준비 중입니다.');\r\n");
      out.write("\t\tself.close();\r\n");
      out.write("\t");
 } 
      out.write("\t\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"helpForm\" name=\"helpForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"menu_id\"  value=\"");
      out.print(box.get("menu_id"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">");
      out.print(obox.get("menu_nm"));
      out.write("</h1>\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<span style=\"width:100%\">\r\n");
      out.write("\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onclick=\"goUbiViewer('WEB-INF/jsp/com/help/hlp01001.jrf','!');\">미리보기</button>\r\n");
      out.write("\t\t\t</span>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\t\t\r\n");
      out.write("\t<!-- ");
if(!box.get("print_yn").equals("Y")){
      out.write("<img src=\"/com/img/btn_map_print.gif\" border=\"0\" alt=\"화면내용인쇄\" align=\"absmiddle\" style=\"cursor:hand\" onClick=\"go_print()\">");
}
      out.write(" -->\r\n");
      out.write("\r\n");
      out.write("\t\t");
 if(!box.get("print_yn").equals("Y")) { 
      out.write("\t\t\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"contentsRow\">\r\n");
      out.write("\t\t\t\t\t<p class=\"help-con-lg\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("intro_msg",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;")));
      out.write("\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t");
 if(!obox.get("file_path").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<h1 class=\"page-title-2depth\">화면예시</h1>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"padding:5 0 0 15\">\r\n");
      out.write("\t\t\t\t\t\t<img id=\"imgExample\" src=\"/upload_data/userfile/");
      out.print(obox.get("file_path"));
      out.write("\" border=\"0\" align=\"absmiddle\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<h1 class=\"page-title-2depth\">주요 기능 설명</h1>\r\n");
      out.write("\t\t\t\t<div class=\"contentsRow\">\r\n");
      out.write("\t\t\t\t\t<p class=\"help-con-sm\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("help_content",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;")));
      out.write("\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t");
 if(!obox.get("etc_remark").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<h1 class=\"page-title-2depth\">그 밖의 참고사항</h1>\r\n");
      out.write("\t\t\t\t<div class=\"contentsRow\">\r\n");
      out.write("\t\t\t\t\t<p class=\"help-con-sm\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(StringUtil.getReplaceSpecialCharacters(StringUtil.replace(obox.get("etc_remark",Box.MULTILINE_TEXT),"  ","&nbsp;&nbsp;")));
      out.write("\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t");
 if(!box.get("print_yn").equals("Y")) { 
      out.write("\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
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