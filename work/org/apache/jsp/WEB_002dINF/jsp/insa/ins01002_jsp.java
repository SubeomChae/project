/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 08:22:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.insa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class ins01002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- ?????????????????? -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goEdit() {\r\n");
      out.write("\t\tif (formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tdocument.main.action = 'ins01003_edit.do';\r\n");
      out.write("\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif (formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('?????????????????????????')) {\r\n");
      out.write("\t\t\t\tremoveMask('#main');\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"ins01002_delete.do\",\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\talert('?????????????????????.');\r\n");
      out.write("\t\t\t\t\t\tparent.goSearch('');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goChangePswd()\t{\r\n");
      out.write("\t\ttheURL = \"/popup/fd/pswdChange.do?empl_no=\"+document.main.empl_no.value;\r\n");
      out.write("\t\twindow.open(theURL,'pswdChange','width=600,height=220,left=300,top=150');\r\n");
      out.write(" \t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" enctype=\"multipart/form-data\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"empl_no\" value=\"");
      out.print(box.get("empl_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"popup_yn\" value=\"");
      out.print(box.get("popup_yn"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"dup_check_yn\" value=\"N\">\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"7\" width=\"20%\" class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t<img src=\"/upload_data/photo/");
      out.print(StringUtil.urlEncode(obox.get("photo_file")));
      out.write("\" width=\"120\" height=\"130\" border=\"0\" align=\"absmiddle\" alt=\"");
      out.print(obox.get("empl_nm"));
      out.write(' ');
      out.print(obox.get("position_nm"));
      out.write("\" onerror=\"this.src='/com/img/no_photo.gif'\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">??????</th>\r\n");
      out.write("\t\t\t\t<td width=\"25%\"><b>");
      out.print(obox.get("empl_no"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">??????</th>\r\n");
      out.write("\t\t\t\t<td width=\"25%\">");
      out.print(obox.get("empl_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(FormatUtil.juminNo(obox.get("reside_no"),"x"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("birth_ymd",Box.DEF_DATE_FMT));
if(!obox.get("solar_lunar").equals("")){
      out.write(' ');
      out.write('(');
      out.print(obox.get("solar_lunar").equals("S")?"??????":"??????");
      out.write(')');
}
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">");
      out.print(obox.get("dept_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("position_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("grade_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("bojik_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("empl_status_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("entry_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>???(???)?????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("hyutoi_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-scrollable\">\t\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">");
if(!box.get("zip_no").equals("")){
      out.write('[');
      out.print(obox.get("zip_no",Box.ZIP_CODE));
      out.write(']');
}
      out.write(' ');
      out.print(obox.get("addr"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"17%\">????????????</th>\r\n");
      out.write("\t\t\t\t<td width=\"33%\">");
      out.print(obox.get("tel_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th width=\"17%\">???????????????</th>\r\n");
      out.write("\t\t\t\t<td width=\"33%\">");
      out.print(obox.get("hp_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">");
      out.print(obox.get("email_id"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">");
      out.print(obox.get("bank_nm"));
      out.write(' ');
      out.print(obox.get("account_no"));
      out.write("\r\n");
      out.write("\t\t\t\t");
if(!obox.get("account_owner").equals("")){
      out.write("&nbsp;(????????? : ");
      out.print(obox.get("account_owner"));
      out.write(')');
}
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("empl_class_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("nojo_yn").equals("Y")?"???":"?????????");
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t");
 if(obox.get("esign_file").equals("")) { 
      out.write("?????????\r\n");
      out.write("\t\t\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#\" title=\"?????????????????? ??????\" onClick=\"popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=");
      out.print(obox.get("esign_file"));
      out.write("','imgPopup', 200, 200);\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(obox.get("esign_file").substring(obox.get("esign_file").indexOf("_")+1));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????? ID</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("user_id"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(FormatUtil.nvl2(box.get("use_auth_nm"),"???????????????"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span class=\"f-right\">\r\n");
      out.write("\t\t");
 if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goEdit()\"><img src=\"/com/img/ico_btn_edit.png\">??????</button>\r\n");
      out.write("\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t");
 if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { 
      out.write("\t\t\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goChangePswd()\"><img src=\"/com/img/ico_btn_edit.png\">???????????? ??????</button>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t");
 if(uSesEnt.user_id.equals(box.get("user_id")) || uSesEnt.use_auth.equals("SA"))  { 
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete()\"><img src=\"/com/img/ico_btn_delete.png\">??????</button>\r\n");
      out.write("\t\t");
 } 
      out.write("\t\r\n");
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
