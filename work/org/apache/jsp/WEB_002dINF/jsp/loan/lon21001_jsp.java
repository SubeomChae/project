/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 07:43:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.loan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class lon21001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- ????????? ?????? ?????? -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t    \tvar pageUrl = 'lon21001_list.do';\r\n");
      out.write("\t      \tif(gbn == 'E') { \r\n");
      out.write("\t        \tif(confirm('??????????????? ??????????????????????????????????')) {\r\n");
      out.write("\t            \tpageUrl += '?excel_yn=P&excel_form_no=LON21001';\r\n");
      out.write("\t            \t//showServerWorking('??????????????? ??????????????????. ????????? ????????? ?????????.' ,$(\"#btnExcel\").offset().top ,$(\"#btnExcel\").offset().left);\r\n");
      out.write("\t            \tajaxSubmitForm(pageUrl,\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t            \t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t                \t\tpoiExcelDownload(rtn.excelPath);\r\n");
      out.write("\t               \t\t}else {\r\n");
      out.write("\t                \t\talert(rtn.errMsg);\r\n");
      out.write("\t             \t\t}\r\n");
      out.write("\t         \t\t});\r\n");
      out.write("\t     \t\t}\r\n");
      out.write("\t     \t\treturn;\r\n");
      out.write("\t    \t}\r\n");
      out.write("\t\t\tdocument.main.page_count.value = '';\r\n");
      out.write("\t     \tajaxReplaceForm(pageUrl, \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t     \t});\r\n");
      out.write("\t  \t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\tajaxReplaceForm(\"lon21001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("<input type=\"hidden\" name=\"excel_file_nm\" value=\"?????????????????????\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\tvalue=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">????????? ?????? ??????</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:15%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:25%\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"bugt_cd\" title=\"????????????\" class=\"bs-select form-control\" style=\"width:100%\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>??????</option>\r\n");
      out.write("\t\t\t            ");
      out.print(CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",box.get("bugt_cd"),"1","L","","","",uSesEnt.dbo));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t<td nowrap>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(box.get("start_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"start_ymd\" name=\"start_ymd\" value=\"");
      out.print(box.get("start_ymd"));
      out.write("\" maxlength=\"8\" title=\"????????????(??????)\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<span> ~ </span>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(box.get("end_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"end_ymd\" name=\"end_ymd\" value=\"");
      out.print(box.get("end_ymd"));
      out.write("\" maxlength=\"8\" title=\"????????????(??????)\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">\r\n");
      out.write("\t\t\t\t\t<select name=\"search_key\" class=\"bs-select form-control\" style=\"width:95%\">\r\n");
      out.write("\t\t\t\t\t\t<option value='1' ");
      out.print(box.get("search_key").equals("1")?"selected":"");
      out.write(">??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='2' ");
      out.print(box.get("search_key").equals("2")?"selected":"");
      out.write(">??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='3' ");
      out.print(box.get("search_key").equals("3")?"selected":"");
      out.write(">?????????</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"search_val\" value=\"");
      out.print(box.get("search_val"));
      out.write("\" class=\"form-control\" style=\"width:100%;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch('');\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"pro_status\" title=\"????????????\" class=\"bs-select form-control\" style=\"width:120px\" onChange=\"if(this.value=='-') this.value='';\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>?????????+??????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='-'>------------</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='31' ");
      out.print(box.get("pro_status").equals("31")?"selected":"");
      out.write(">?????????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='32' ");
      out.print(box.get("pro_status").equals("32")?"selected":"");
      out.write(">????????????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='-'>------------</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='20' ");
      out.print(box.get("pro_status").equals("20")?"selected":"");
      out.write(">????????????</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='14' ");
      out.print(box.get("pro_status").equals("14")?"selected":"");
      out.write(">?????????</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"table-top-control form-inline\">\r\n");
      out.write("\t\t<div class=\"notice-view\">\r\n");
      out.write("\t\t\t<span style=\"color:#01a1db;\">??????????????? ??????</span>?????? ?????? ???????????? ??????????????? ????????? ??? ????????????.\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<span class=\"f-right\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">??????</button>\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('E');\"><img src=\"/com/img/ico_btn_excel.png\">??????</button>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"height:calc(100vh - 170px)\">\r\n");
      out.write("\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:3%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:8%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:9%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>No</th>\r\n");
      out.write("\t\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t\t<th>??????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>1???????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>?????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>???????????????</th>\r\n");
      out.write("\t\t\t\t\t<th>????????????</th>\r\n");
      out.write("          \t\t</tr>\r\n");
      out.write("          \t</thead>\r\n");
      out.write("          \t<tbody> \r\n");
      out.write("\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr><td colspan=\"16\" class=\"t-center\">????????? ????????? ????????????.</td></tr>\r\n");
      out.write("\t\t");
 }else {
			for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("empl_no",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
if(!box.get("excel_yn").equals("Y")){
      out.write("<a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("empl_no",i));
      out.write("')\">");
}
      out.print(rsWp.get("empl_nm",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
if(!box.get("excel_yn").equals("Y")){
      out.write("<a href=\"javascript:goLoanDetail('");
      out.print(rsWp.get("loan_no",i));
      out.write("')\">");
}
      out.print(rsWp.get("bugt_nm",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("defer_end_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("end_plan_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("loan_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("unit_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("intr_rate",i));
      out.write("%</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("refund_sum",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(rsWp.getLong("remain_amt",i))));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("pro_status_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("finish_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("retire_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
      out.print(PageUtil.makePaging(box, rsWp, 30, request));
      out.write('\r');
      out.write('\n');
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
