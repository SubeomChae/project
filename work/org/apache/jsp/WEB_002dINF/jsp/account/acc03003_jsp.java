/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 09:24:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class acc03003_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');
 	boolean isEditable = false;
if(uSesEnt.use_auth.equals("SA")) { isEditable = true; }

      out.write("\r\n");
      out.write("<!-- ?????????????????? ?????? -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif (formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(!document.saveForm.new_seq.value.isNum()) {\r\n");
      out.write("\t\t\t\talert('????????? ????????? ???????????? ??????????????? ?????????.');\r\n");
      out.write("\t\t\t\tdocument.saveForm.new_seq.focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(isEmpty(document.saveForm.plus_arr) && isEmpty(document.saveForm.minus_arr)) {\r\n");
      out.write("\t\t\t\talert('(+)???????????? ?????? (-)???????????? ?????? ????????? ????????? ???????????? ?????????.');\r\n");
      out.write("\t\t\t\tdocument.saveForm.plus_arr.focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(!isEmpty(document.saveForm.plus_arr) && !document.saveForm.plus_arr.value.isNumCol()) {\r\n");
      out.write("\t\t\t\talert('(+)??????????????? ????????????????????? ?????????(;)??? ????????? ???????????????.');\r\n");
      out.write("\t\t\t\tdocument.saveForm.plus_arr.select();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(!isEmpty(document.saveForm.minus_arr) && !document.saveForm.minus_arr.value.isNumCol()) {\r\n");
      out.write("\t\t\t\talert('(-)??????????????? ????????????????????? ?????????(;)??? ????????? ???????????????.');\r\n");
      out.write("\t\t\t\tdocument.saveForm.minus_arr.select();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(confirm(\"?????????????????????????\")) {\r\n");
      out.write("\t\t\t\tdocument.saveForm.actionType.value = isEmpty(document.saveForm.report_seq) ? 'INSERT' : 'UPDATE';\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"acc03003_update.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\t$('#dialog-form').modal('hide');\r\n");
      out.write("\t\t\t\t\t\treturnFormSubmit(document.saveForm, 'acc03001_list.do');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('?????????????????????????')) {\r\n");
      out.write("\t\t\tdocument.saveForm.actionType.value = 'DELETE';\r\n");
      out.write("\t\t\tajaxSubmitForm(\"acc03003_delete.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t$('#dialog-form').modal('hide');\r\n");
      out.write("\t\t\t\t\treturnFormSubmit(document.saveForm, 'acc03001_list.do');\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"modal-dialog\">\r\n");
      out.write("\t<div class=\"modal-content\" style=\"width:650px\">\r\n");
      out.write("\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\"></button>\r\n");
      out.write("\t\t\t<h4 class=\"modal-title\">???????????? ??????</h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"report_id\" \tvalue=\"");
      out.print(box.get("report_id"));
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"report_seq\" \tvalue=\"");
      out.print(box.get("report_seq"));
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"actionType\">\r\n");
      out.write("\t\t\t<table class=\"table table-view table-bordered table-cover\">\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"new_seq\" value=\"");
      out.print(obox.get("report_seq"));
      out.write("\" maxlength=\"4\" title=\"???????????????\" class=\"form-control required tMONEY\" style=\"width:50px\"></td>\r\n");
      out.write("\t\t\t\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"mark_hdr_nm\" value=\"");
      out.print(obox.get("mark_hdr_nm"));
      out.write("\" maxlength=\"50\" title=\"???????????????\" class=\"form-control required\" style=\"width:95%;\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>(+) ????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"plus_arr\" value=\"");
      out.print(obox.get("plus_arr"));
      out.write("\" maxlength=\"255\" title=\"(+) ????????????\" class=\"form-control\" style=\"width:95%;\"></td>\r\n");
      out.write("\t\t\t\t\t\t<th>(-) ????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td style=\"padding-left:5px\"><input type=\"text\" name=\"minus_arr\" value=\"");
      out.print(obox.get("minus_arr"));
      out.write("\" maxlength=\"255\" title=\"(-) ????????????\" class=\"form-control\" style=\"width:95%;\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"mark_position\" value=\"");
      out.print(obox.get("mark_position"));
      out.write("\" title=\"????????????\" class=\"bs-select form-control\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"L\" ");
      out.print(obox.get("mark_position").equals("L")?"selected":"");
      out.write(">???</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"R\" ");
      out.print(obox.get("mark_position").equals("R")?"selected":"");
      out.write(">???</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"row_level\" title=\"????????????\" class=\"bs-select form-control\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"\">??????</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"1\" ");
      out.print(obox.get("row_level").equals("1")?"selected":"");
      out.write(">1??????</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"2\" ");
      out.print(obox.get("row_level").equals("2")?"selected":"");
      out.write(">2??????</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"outer_cd\" value=\"\" maxlength=\"100\" title=\"????????????\" class=\"form-control\" style=\"width:200px\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goSave()\"><img src=\"/com/img/ico_btn_save.png\">??????</button>\r\n");
      out.write("\t\t\t\t\t");
 if(box.get("actionType").equals("view")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete()\"><img src=\"/com/img/ico_btn_delete.png\">??????</button>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"$('button.close').trigger('click');\"><img src=\"/com/img/ico_btn_cancel.png\">??????</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
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
