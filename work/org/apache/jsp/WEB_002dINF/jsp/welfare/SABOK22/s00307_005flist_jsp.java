/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 11:22:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.welfare.SABOK22;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class s00307_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- 학자금신청(안양) -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch(apply_no) {\r\n");
      out.write("\t\tdocument.main.page_count.value = '';\r\n");
      out.write("\t\tajaxReplaceForm(\"wel01001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tif(apply_no == '') {\r\n");
      out.write("\t\t\t\tgoDetail($(\"tr[id='tr_0']\").attr(\"apply_no\"));\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\tgoDetail(apply_no); \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\tajaxReplaceForm(\"wel01001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tvar apply_no = $(\"tr[id='tr_0']\").attr(\"apply_no\");\r\n");
      out.write("\t\t\tif(apply_no != undefined) { goDetail(apply_no); }\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goWrite(){\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tajaxReplaceForm(\"wel01003_edit.do\", \"#main\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDetail(apply_no) {\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(apply_no != '') { $(\"tr[apply_no='\"+apply_no+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tvar pageUrl = 'wel01002_select.do?apply_no='+apply_no;\r\n");
      out.write("\t\tajaxReplaceForm(pageUrl, \"#main\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\tfunction goSort(sort_order) {\r\n");
      out.write("\t\tdocument.main.sort_order.value = sort_order;\r\n");
      out.write("\t\tgoSearch('');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t");
 if(box.get("apply_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\tgoWrite();\r\n");
      out.write("\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t");
 for(int i=0; i < rsWp.getLength(); i++) { 
      out.write(" \r\n");
      out.write("\t\t\t");
 if(rsWp.get("apply_no",i).equals(box.get("apply_no"))) { 
      out.write("\r\n");
      out.write("\t\t\t\t$(\"tr[apply_no='\"+apply_no+\"']\").addClass(\"bg-yellow\");\r\n");
      out.write("\t\t  \t\tgoDetail('");
      out.print(box.get("apply_no"));
      out.write("');\r\n");
      out.write("\t \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t");
 } 
      out.write('\r');
      out.write('\n');
      out.write('	');
 } 
      out.write("\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"bugt_cd\"  \tvalue=\"");
      out.print(box.get("bugt_cd"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"sort_order\"  value=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">학자금 신청(안양)</h1>\r\n");
      out.write("\t     \r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:22%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:18%;\">\r\n");
      out.write("\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">신청일자</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(box.get("start_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"start_ymd\" value=\"");
      out.print(box.get("start_ymd"));
      out.write("\" maxlength=\"8\" title=\"신청일자(부터)\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<span> ~ </span>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(box.get("end_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"end_ymd\" value=\"");
      out.print(box.get("end_ymd"));
      out.write("\" maxlength=\"8\" title=\"신청일자(까지)\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">\r\n");
      out.write("\t\t\t\t\t<select name=\"search_key\" class=\"bs-select form-control\" style=\"width:90px\">\r\n");
      out.write("\t\t\t\t\t\t<option value='1' ");
      out.print(box.get("search_key").equals("1")?"selected":"");
      out.write(">성명</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='2' ");
      out.print(box.get("search_key").equals("2")?"selected":"");
      out.write(">사번</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='3' ");
      out.print(box.get("search_key").equals("3")?"selected":"");
      out.write(">부서명</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"search_val\" value=\"");
      out.print(box.get("search_val"));
      out.write("\" class=\"form-control\" style=\"width:140px;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch('');\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">결재상태</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"sign_status\" title=\"결재상태\" class=\"bs-select form-control\" style=\"width:115px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>전체</option>\r\n");
      out.write("\t\t\t            ");
      out.print(CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("sign_status"),"sign_status","","","",""));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right marR50\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goWrite();\"><img src=\"/com/img/ico_btn_refresh_edit.png\">신규</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"table-top-guide\">\r\n");
      out.write("\t\t<span style=\"color:#01a1db;\">신청일자를 클릭</span>하면 해당 학자금 신청 세부내역을 조회할 수 있습니다.\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"row row-set\">\r\n");
      out.write("\t\t<div class=\"col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0\">\r\n");
      out.write("\t\t\t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"height:calc(100vh - 160px)\">\r\n");
      out.write("\t\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\t\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:18%;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:30%;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:15%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:23%;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:14%;\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\t\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t1.apply_ymd')\">신청일자</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t3.dept_nm')\">부서명</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t2.empl_nm')\">성명</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t1.data04')\">학교명</a></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th><a href=\"javascript:goSort('t4.sign_status')\">상태</a></th>\t\t\t\t\t\r\n");
      out.write("\t\t          \t\t</tr>\r\n");
      out.write("\t\t          \t</thead>\r\n");
      out.write("\t\t          \t<tbody>\r\n");
      out.write("\t\t\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr><td colspan=\"5\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t\t\t");
}else { 
						  for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" apply_no=\"");
      out.print(rsWp.get("apply_no",i));
      out.write("\"  style=\"cursor:pointer\" onClick=\"goDetail('");
      out.print(rsWp.get("apply_no",i));
      out.write("')\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("empl_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("school_nm",i));
      out.print(rsWp.get("school_flag_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("sign_status_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t</tbody>\t\t\t          \t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");
 if(rsWp.getLength() > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.print(PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request));
      out.write("\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-md-7 col-xs-7 col-sm-7 row-set-col\">\r\n");
      out.write("\t\t\t<div id=\"divFrame\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
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
