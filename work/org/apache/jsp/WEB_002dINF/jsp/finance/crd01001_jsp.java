/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-27 05:29:44 UTC
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

public final class crd01001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- 복지카드 관리  -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write('\r');
      out.write('\n');
	String biz_nm = box.get("card_type").equals("A") ? "법인카드" : "복지카드"; 
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch(card_no) {\r\n");
      out.write("\t\tdocument.main.page_count.value = '';\r\n");
      out.write("\t\tajaxReplaceForm(\"crd01001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tif(card_no == '') {\r\n");
      out.write("\t\t\t\tif ($(\"tr[id='tr_0']\").attr(\"card_no\") != undefined) {\r\n");
      out.write("\t\t\t\t\tgoEdit($(\"tr[id='tr_0']\").attr(\"card_no\"));\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\tgoEdit(card_no); \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\tajaxReplaceForm(\"crd01001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tvar card_no = $(\"tr[id='tr_0']\").attr(\"card_no\");\r\n");
      out.write("\t\t\tif(card_no != undefined) { goEdit(card_no); }\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goWrite(){\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tvar theURL = \"crd01002_edit.do?1=1&card_type=");
      out.print(box.get("card_type"));
      out.write("\"\r\n");
      out.write("\t\tajaxReplaceForm(theURL, \"#main\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goEdit(card_no) {\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(card_no != '') { $(\"tr[card_no='\"+card_no+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tvar pageUrl = 'crd01002_edit.do?card_no='+card_no;\r\n");
      out.write("\t\tajaxReplaceForm(pageUrl, \"#main\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write(" \tfunction goSort(sort_order) {\r\n");
      out.write("\t\tdocument.main.sort_order.value = sort_order;\r\n");
      out.write("\t\tgoSearch('');\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t");
 if(rsWp.getLength() < 1) { 
      out.write("\r\n");
      out.write("\t\t\tgoWrite();\r\n");
      out.write("\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\tvar card_no = ");
      out.print(rsWp.get("card_no",0));
      out.write("\r\n");
      out.write("\t\t\t$(\"tr[card_no='\"+card_no+\"']\").addClass(\"bg-yellow\");\r\n");
      out.write("\t\t\tgoEdit(card_no);\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"card_type\" \tvalue=\"");
      out.print(box.get("card_type"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"sort_order\"  value=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">");
      out.print(biz_nm);
      out.write("관리</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:12%;\">\r\n");
      out.write("\t\t\t<col style=\"width:88%;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">\r\n");
      out.write("\t\t\t\t\t<select name=\"search_key\" class=\"bs-select form-control\" style=\"width:110px\">\r\n");
      out.write("\t\t\t\t\t\t<option value='1' ");
      out.print(box.get("search_key").equals("1")?"selected":"");
      out.write(">카드번호</option>\r\n");
      out.write("\t\t\t            <option value='2' ");
      out.print(box.get("search_key").equals("2")?"selected":"");
      out.write(">카드소지자</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"search_val\" value=\"");
      out.print(box.get("search_val"));
      out.write("\" class=\"bs-select form-control\" style=\"width:150px;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch('');\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"mt-checkbox mt-checkbox-outline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"use_yn\" value=\"Y\" ");
      out.print(box.get("use_yn").equals("Y")?"checked":"");
      out.write(">폐기카드 포함<span/>\r\n");
      out.write("\t\t\t\t\t\t</label>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t");
 if(uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goWrite();\"><img src=\"/com/img/ico_btn_refresh_edit.png\">신규</button>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"row row-set\">\r\n");
      out.write("\t\t<div class=\"col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0\">\r\n");
      out.write("\t\t\t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"height:calc(100vh - 140px)\">\r\n");
      out.write("\t\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\t\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:45%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:22%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:33%\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\t\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t1.card_no')\">카드번호</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t2.empl_nm')\">소지자</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t1.bank_cd')\">발급은행</a></th>\r\n");
      out.write("\t\t          \t\t</tr> \r\n");
      out.write("\t\t          \t</thead>\r\n");
      out.write("\t\t          \t<tbody>\r\n");
      out.write("\t\t\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr><td colspan=\"3\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t\t\t");
 }else {
						for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" card_no=\"");
      out.print(rsWp.get("card_no",i));
      out.write("\" style=\"cursor:pointer\" onClick=\"goEdit('");
      out.print(rsWp.get("card_no",i));
      out.write("')\"> \r\n");
      out.write("\t\t\t\t\t\t\t<td><font color=\"");
      out.print(rsWp.get("use_yn",i).equals("Y")?"black":"red");
      out.write('"');
      out.write('>');
      out.print(rsWp.get("card_no_x",i));
      out.write("</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("empl_nm",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("bank_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");
      out.print(PageUtil.makePaging(box, rsWp, 30, 5, "", request));
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-md-8 col-xs-8 col-sm-8 row-set-col\">\r\n");
      out.write("\t\t\t<div id=\"divFrame\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\t\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("</div>\r\n");
 } 
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
