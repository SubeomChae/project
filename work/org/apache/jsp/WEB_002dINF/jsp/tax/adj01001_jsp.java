/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 07:33:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.tax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class adj01001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"/com/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
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
      out.write("<!-- 법인세과세표준신고 -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tvar method_nm = document.taxList.report_id.value.toLowerCase();\r\n");
      out.write("\t\tvar pageUrl = '';\r\n");
      out.write("\t\tif(gbn == 'E') { \r\n");
      out.write("\t\t\tpageUrl = '/tax/fd/'+method_nm+'_excel.do?include=Y';\r\n");
      out.write("\t\t\tdocument.taxList.action = pageUrl + '&excel_yn=Y';\r\n");
      out.write("\t\t\tdocument.taxList.target = '_self';\r\n");
      out.write("\t\t\tdocument.taxList.submit();\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tpageUrl = 'adj01001.do?include=Y';\r\n");
      out.write("\t\t\tajaxReplaceForm(pageUrl, \"#taxList\", \"#divListData\", function() {\r\n");
      out.write("\t\t\t\tvar report_id = $(\"tr[id='tr_0']\").attr(\"report_id\");\r\n");
      out.write("\t\t\t\tif(report_id != undefined) { goDetail(report_id,\"\"); }\r\n");
      out.write("\t\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDetail(report_id, report_nm) {\r\n");
      out.write("\t\tdocument.taxList.report_id.value = report_id;\r\n");
      out.write("\t\tdocument.taxList.excel_file_nm.value = report_nm;\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(report_id != '') { $(\"tr[report_id='\"+report_id+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tvar pageUrl = '/tax/fd/'+report_id.toLowerCase()+'.do?include=Y';\r\n");
      out.write("\t\tajaxReplaceForm(pageUrl, \"#taxList\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goReport() {\r\n");
      out.write("\t\tvar params = 'P_PARAM01!");
      out.print(box.get("std_yy"));
      out.write("!P_PARAM02!'+document.taxList.report_id.value+'!';\r\n");
      out.write("\t\tgoUbiViewer('/WEB-INF/jsp/tax/report/'+document.taxList.report_id.value.toLowerCase()+'.jrf', params);\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t");
 if(!box.get("report_id").equals("")) { 
      out.write("\r\n");
      out.write("\t\tgoDetail('");
      out.print(box.get("report_id"));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(box.get("excel_file_nm"));
      out.write("');\r\n");
      out.write("\t");
 }else if(rsWp.getLength() > 0) { 
      out.write("\r\n");
      out.write("\t\tgoDetail('");
      out.print(rsWp.get("code1",0));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("data1",0));
      out.write("');\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"taxList\" name=\"taxList\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("<input type=\"hidden\" id=\"report_id\"\t\tname=\"report_id\" \t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" id=\"excel_file_nm\"\tname=\"excel_file_nm\" \tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" \tvalue=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">법인세과세표준신고</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\" width=\"15%\">기준년도</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"std_yy\" title=\"기준년도\" class=\"bs-select form-control\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(-1),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t  \t\t\t<button type=\"button\" class=\"btn btn-primary\" onclick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t  \t\t\t<button type=\"button\" id=\"btnExcel\" class=\"btn btn-primary\" onclick=\"goSearch('E');\"><img src=\"/com/img/ico_btn_excel.png\">엑셀</button>\r\n");
      out.write("\t\t\t  \t\t\t<button type=\"button\" id=\"btnRptViewer\" class=\"btn dark marL5\" onclick=\"goReport();\"><img src=\"/com/img/ico_btn_print.png\">인쇄</button>\r\n");
      out.write("\t\t  \t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\t\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"row row-set\">\r\n");
      out.write("\t\t<div class=\"col-md-4 col-xs-4 col-sm-4 row-set-col\" >\r\n");
      out.write("\t\t\t<div class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(100vh - 125px);\">\r\n");
      out.write("\t\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t\t\t<colgorup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:40%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:60%\">\r\n");
      out.write("\t\t\t\t\t</colgorup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th>규정</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>서식명</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t   \t");
 for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t \t  \t");
 if(!uSesEnt.use_auth.equals("SA") && (rsWp.get("code1",i).equals("ADJ02003_2_1") || rsWp.get("code1",i).equals("ADJ02003_3_1") || rsWp.get("code1",i).equals("ADJ02010_B") || rsWp.get("code1",i).equals("ADJ02010_C") || rsWp.get("code1",i).equals("ADJ02010_D"))) { continue; }
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" report_id=\"");
      out.print(rsWp.get("code1",i));
      out.write("\" style=\"cursor:pointer\" onClick=\"goDetail('");
      out.print(rsWp.get("code1",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("data1",i));
      out.write("')\"> \r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"t-left\"><a title=\"");
      out.print(rsWp.get("code1",i));
      out.write('"');
      out.write('>');
      out.print(rsWp.get("data2",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"t-left\">");
      out.print(rsWp.get("data1",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr height=\"25\"><td colspan=\"2\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"col-md-8 col-xs-8 col-sm-8 row-set-col pad0\">\r\n");
      out.write("\t\t\t<div id=\"divFrame\" class=\"table-cover scrollOptionY\" style=\"height:calc(100vh - 125px)\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t  \t</div>\r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t</div>\r\n");
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
