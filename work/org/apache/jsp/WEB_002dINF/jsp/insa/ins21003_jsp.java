/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-23 05:12:18 UTC
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

public final class ins21003_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "tel_no|","","","",""); 
      out.write("\r\n");
      out.write("<!-- ???????????? ?????? -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif (formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(confirm('?????????????????????????')) {\r\n");
      out.write("\t\t\t\tremoveMask('#saveForm');\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"ins21003_update.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\ttoastPop1('?????????????????????.');\r\n");
      out.write("\t\t\t\t\t\tparent.goSearch('");
      out.print(box.get("dept_cd"));
      out.write("');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goCancel() {\r\n");
      out.write("\t\tdocument.saveForm.action = 'ins21002_select.do';\r\n");
      out.write("\t\tdocument.saveForm.target = '_self';\r\n");
      out.write("\t\tdocument.saveForm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeRegionCd(region_cd1, defVal) {\r\n");
      out.write("\t\tdocument.saveForm.region_cd2.options.length = 0;\r\n");
      out.write("\t\tif(region_cd1 != '') {\r\n");
      out.write("\t\t\tsetOptionByProc('PR_COMTB_REGN01_LIST@LISTCODE', document.saveForm.region_cd2, defVal, '2', '', region_cd1, '', '', '??????');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tif(!isEmpty(document.saveForm.region_cd1)) { \r\n");
      out.write("\t\t\tsetOptionByProc('PR_COMTB_REGN01_LIST@LISTCODE', document.saveForm.region_cd2, '");
      out.print(obox.get("region_cd"));
      out.write("', '2', '', document.saveForm.region_cd1.value, '', '', '??????');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin: 0px\">\r\n");
      out.write("<input type=\"hidden\" id=\"action_type\" \tname=\"action_type\" \tvalue=\"");
      out.print(box.get("dept_cd").equals("")?"INSERT":"UPDATE");
      out.write("\">\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t");
 if(box.get("dept_cd").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"dept_cd\" value=\"");
      out.print(obox.get("dept_cd"));
      out.write("\" size=\"8\" maxlength=\"7\" title=\"????????????\" class=\"form-control required\">\r\n");
      out.write("\t\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<b>");
      out.print(obox.get("dept_cd"));
      out.write("</b> <input type=\"hidden\" name=\"dept_cd\" value=\"");
      out.print(obox.get("dept_cd"));
      out.write("\">\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"dept_nm\" value=\"");
      out.print(obox.get("dept_nm"));
      out.write("\" size=\"30\" maxlength=\"40\" title=\"?????????\" class=\"form-control required\" onChange=\"if(isEmpty(document.saveForm.abbr_nm)) document.saveForm.abbr_nm.value=this.value;\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\"  name=\"abbr_nm\" value=\"");
      out.print(obox.get("abbr_nm"));
      out.write("\" size=\"30\" maxlength=\"20\" title=\"?????????(??????)\" class=\"required form-control\" style=\"border: 1 solid gray\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" style=\"padding: 5 5 5 5\">\r\n");
      out.write("\t\t\t\t\t<textarea class=\"form-control\" name=\"dept_desc\" style=\"height:70; width:100%\">");
      out.print(obox.get("dept_desc"));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<select name=\"region_cd1\" class=\"bs-select form-control\" title=\"????????????\" style=\"width:150px\" onChange=\"changeRegionCd(this.value, '')\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList("PR_COMTB_REGN01_LIST","LISTCODE",StringUtil.substr(obox.get("region_cd"),0,2),"1","","","",""));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"region_cd2\" class=\"bs-select form-control\" title=\"?????????\" style=\"width: 170px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"18%\">????????????</th>\r\n");
      out.write("\t\t\t\t<td width=\"32%\" class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<select name=\"tel_no1\" class=\"bs-select form-control\" style=\"width:60px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("tel_no"),1,"-")));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t- <input type=\"text\" name=\"tel_no2\" value=\"");
      out.print(StringUtil.arrayCol(obox.get("tel_no"),2,"-"));
      out.write("\" maxlength=\"4\" title=\"????????????\" class=\"autoTab form-control\" style=\"width:60px\"> \r\n");
      out.write("\t\t\t\t\t- <input type=\"text\" name=\"tel_no3\" value=\"");
      out.print(StringUtil.arrayCol(obox.get("tel_no"),3,"-"));
      out.write("\" maxlength=\"4\" title=\"????????????\" class=\"autoTab form-control\" style=\"width:60px\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th width=\"18%\">????????????</th>\r\n");
      out.write("\t\t\t\t<td width=\"32%\" class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<select name=\"fax_no1\" class=\"bs-select form-control\" style=\"width:60px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("fax_no"),1,"-")));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t- <input type=\"text\" name=\"fax_no2\" value=\"");
      out.print(StringUtil.arrayCol(obox.get("fax_no"),2,"-"));
      out.write("\" maxlength=\"4\" title=\"????????????\" class=\"autoTab form-control\" style=\"width:60px\"> \r\n");
      out.write("\t\t\t\t\t- <input type=\"text\" name=\"fax_no3\" value=\"");
      out.print(StringUtil.arrayCol(obox.get("fax_no"),3,"-"));
      out.write("\" maxlength=\"4\" title=\"????????????\" class=\"autoTab form-control\" style=\"width:60px\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(obox.get("open_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"open_ymd\" name=\"open_ymd\" value=\"");
      out.print(obox.get("open_ymd"));
      out.write("\" maxlength=\"8\" title=\"????????????\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(obox.get("close_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"close_ymd\" name=\"close_ymd\" value=\"");
      out.print(obox.get("close_ymd"));
      out.write("\" maxlength=\"8\" title=\"????????????\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<select name=\"upper_cd\" class=\"bs-select form-control\" style=\"width: 120px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",obox.get("upper_cd"),"","","1,2,3,4","","",uSesEnt.dbo));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"dept_lvl\" class=\"bs-select form-control\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"1\" ");
      out.print(obox.get("dept_lvl").equals("1")?"selected":"");
      out.write(">1??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"2\" ");
      out.print(obox.get("dept_lvl").equals("2")?"selected":"");
      out.write(">2??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"3\" ");
      out.print(obox.get("dept_lvl").equals("3")?"selected":"");
      out.write(">3??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"4\" ");
      out.print(obox.get("dept_lvl").equals("4")?"selected":"");
      out.write(">4??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"5\" ");
      out.print(obox.get("dept_lvl").equals("5")?"selected":"");
      out.write(">5??????</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"use_yn\" class=\"bs-select form-control\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Y\" ");
      out.print(obox.get("use_yn").equals("Y")?"selected":"");
      out.write(">???</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"N\" ");
      out.print(obox.get("use_yn").equals("N")?"selected":"");
      out.write(">?????????</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t<td class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\"  name=\"sort_order\" value=\"");
      out.print(obox.get("sort_order"));
      out.write("\" size=\"3\" maxlength=\"4\" class=\"tMONEY form-control\" title=\"????????????\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goSave()\"><img src=\"/com/img/ico_btn_save.png\">??????</button>\r\n");
      out.write("\t\t\t");
 if(!box.get("dept_cd").equals("")) { 
      out.write("\t\r\n");
      out.write("\t\t\t    <button type=\"button\" class=\"btn dark\" onClick=\"goCancel()\"><img src=\"/com/img/ico_btn_cancel.png\">??????</button>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
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
