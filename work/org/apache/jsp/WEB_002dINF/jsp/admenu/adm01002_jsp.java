/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-08-29 05:38:06 UTC
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

public final class adm01002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- ???????????? ??????-->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goEdit(corp_cd) {\r\n");
      out.write("\t\tif(formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tajaxReplaceForm(\"adm01003_edit.do\", \"#saveForm\", \"#divFrame\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif (formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif (confirm('?????????????????????????')) {\r\n");
      out.write("\t\t\t\tdocument.saveForm.action = 'adm01002_delete.do';\r\n");
      out.write("\t\t\t\tdocument.saveForm.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.saveForm.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"corp_cd\" value=\"");
      out.print(obox.get("corp_cd"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover mar0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"16%\">????????????</th>\r\n");
      out.write("\t\t\t<td width=\"35%\"><b>");
      out.print(obox.get("corp_cd"));
      out.write("</b></td>\r\n");
      out.write("\t\t\t<th width=\"16%\">?????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("corp_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>?????????????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(FormatUtil.bizRegiNoFormat(obox.get("saupja_no")));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("corp_reg_no",Box.JUMIN_NO));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("license_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("reg_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("uptae"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("upjong"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????? ??????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("rep_person_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>????????? ????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(FormatUtil.juminNo(obox.get("rep_reside_no"),"x"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("    <table class=\"table table-view table-bordered mar0\">\r\n");
      out.write("\t\t<tr> \r\n");
      out.write("\t\t\t<th style=\"width:16%\">?????????????????????</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t");
 if(!obox.get("file_nm").equals("")){ 
      out.write("\r\n");
      out.write("\t\t \t\t<a href=\"#\" title=\"?????????????????? ??????\" onClick=\"popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=");
      out.print(obox.get("logo_file"));
      out.write("','imgPopup', 200, 200);\">\r\n");
      out.write("\t\t \t");
 } 
      out.write("\r\n");
      out.write("\t\t\t <img src=\"/com/img/ico_disk.png\" border=\"0\" align=\"absmiddle\">");
      out.print(FormatUtil.nvl2(obox.get("file_nm"),"?????????"));
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("       \t\t\r\n");
      out.write("       \t</tr>\r\n");
      out.write("    </table>\r\n");
      out.write("\t<table class=\"table table-view table-bordered mar0\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">");
if(!obox.get("zip_no").equals("")){
      out.write('[');
      out.print(obox.get("zip_no"));
      out.write(']');
      out.write(' ');
}
      out.print(obox.get("addr"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th style=\"width:16%\">?????????????????????</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">");
      out.print(obox.get("tel_no"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th style=\"width:16%\">??????????????????</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">");
      out.print(obox.get("email_id"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????? ?????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("mo_rep_person"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>????????? ??????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("mo_upjong"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\"><a href=\"");
      out.print(obox.get("site_addr"));
      out.write("\" style=\"letter-spacing:0px\">");
      out.print(obox.get("site_addr"));
      out.write("</a></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
if(!obox.get("empl_cnt").equals("")){
      out.print(obox.get("empl_cnt",Box.THOUSAND_COMMA));
      out.write(' ');
      out.write('???');
}
      out.write("</td>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td>");
if(!obox.get("nojo_entry_cnt").equals("")){
      out.print(obox.get("nojo_entry_cnt",Box.THOUSAND_COMMA));
      out.write(' ');
      out.write('???');
}
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t<td>");
if(!obox.get("capital_amt").equals("")){
      out.print(obox.get("capital_amt",Box.THOUSAND_COMMA));
      out.write(' ');
      out.write('???');
}
      out.write("</td>\r\n");
      out.write("\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t<td>");
if(!obox.get("tax_office").equals("")){
      out.print(obox.get("tax_office"));
      out.write(" ?????????");
}
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th style=\"width:16%\">???????????????????????????</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t");
if(!obox.get("bank_nm").equals("")){
      out.write("<b>?????????</b> : ");
      out.print(obox.get("bank_nm"));
      out.write("&nbsp;&nbsp;");
}
      out.write("\r\n");
      out.write("\t\t\t\t");
if(!obox.get("account_type").equals("")){
      out.write("<b>????????????</b> : ");
      out.print(obox.get("account_type"));
      out.write("&nbsp;&nbsp;");
}
      out.write("\r\n");
      out.write("\t\t\t\t");
if(!obox.get("account_no").equals("")){
      out.write("<b>????????????</b> : ");
      out.print(obox.get("account_no"));
}
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t<td>");
if(!obox.get("account_closing").equals("")){
      out.print(obox.get("account_closing"));
      out.write('???');
      out.write('???');
      out.write('???');
}
      out.write("</td>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("corp_scale_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("debit_acct_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("repl_cycle_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>??????????????????</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">");
      out.print(obox.get("accounting_flag_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("open_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t<th rowspan=\"3\" width=\"15%\">????????????IP</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(StringUtil.arrayCol(obox.get("permit_ip"),1,";"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("close_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>");
      out.print(StringUtil.arrayCol(obox.get("permit_ip"),2,";"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("server_ip").startsWith("1")?"??????":"??????");
if(obox.get("server_ip").startsWith("1") && !StringUtil.arrayCol(obox.get("server_ip"),2,"|").equals("")){
      out.write("(IP?????? : ");
      out.print(StringUtil.arrayCol(obox.get("server_ip"),2,"|"));
      out.write(')');
}
      out.write("</td>\r\n");
      out.write("\t\t\t<td>");
      out.print(StringUtil.arrayCol(obox.get("permit_ip"),3,";"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t");
 if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t  \t\t<button type=\"button\" id=\"btnModify\" class=\"btn dark\" onclick=\"goEdit('');\"><img src=\"/com/img/ico_btn_edit.png\">??????</button>\r\n");
      out.write("\t\t  \t");
 } 
      out.write("\r\n");
      out.write("\t\t  \t");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t  \t\t<button type=\"button\" id=\"btnDelete\" class=\"btn dark\" onclick=\"goDelete();\"><img src=\"/com/img/ico_btn_delete.png\">??????</button>\r\n");
      out.write("\t\t  \t");
 } 
      out.write("\r\n");
      out.write("\t\t  \t</span>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"divFrame\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\t\r\n");
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
