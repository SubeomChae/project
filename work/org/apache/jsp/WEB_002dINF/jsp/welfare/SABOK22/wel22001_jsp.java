/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-26 04:37:01 UTC
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
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class wel22001_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/jsp/com/include/excel_header.jsp", Long.valueOf(1568793281369L));
  }

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
      out.write('\r');
      out.write('\n');
 if(box.get("excel_yn").equals("Y")) { 
      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write('\n');
	
	String lm_sAgentType = request.getHeader("User-Agent"); 
	String excel_file_nm = box.get("excel_file_nm");
	excel_file_nm = StringUtil.get8859_1(excel_file_nm); // ìë²ììë ì£¼ìì²ë¦¬
	response.reset();
    if(lm_sAgentType.indexOf("MSIE 5.5") > -1 || lm_sAgentType.indexOf("MSIE 6.0") > -1) {
	    response.setHeader("Content-Type",        "doesn/matter;");
	    response.setHeader("Content-Disposition", "filename="+excel_file_nm+".xls");
    }else {
	    response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
    	response.setHeader("Content-Disposition", "attachment;filename="+excel_file_nm+".xls");
	}
	response.setHeader("Content-Transfer-Encoding", "binary;");
	response.setHeader("Pragma", "no-cache;");
	response.setHeader("Expires", "-1;");

      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("\ttd { font-size:12px; font-family:\"ë§ì ê³ ë\", \"Arial\", \"sans-serif\"; color:#00000; text-align:center; border:.5pt solid #000; }\n");
      out.write("</style>\n");
      out.write("<center><h2>");
      out.print(box.get("excel_file_nm"));
      out.write("</h2></center>");
      out.write('\r');
      out.write('\n');
 } 
      out.write("\r\n");
      out.write("<!-- 개인별 목적사업지원현황  -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tdocument.main.page_count.value = '';\r\n");
      out.write("\t\t\tif(gbn == 'E') { \r\n");
      out.write("\t\t\t\tdocument.main.action = 'wel22001_excel.do?excel_yn=Y';\r\n");
      out.write("\t\t\t\tdocument.main.target = 'excelFrm';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\tajaxReplaceForm(\"wel22001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\tajaxReplaceForm(\"wel22001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<iframe name=\"excelFrm\" style=\"display:none\"></iframe>\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" enctype=\"multipart/form-data\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"select_yn\" \tvalue=\"Y\">\r\n");
      out.write("<input type=\"hidden\" name=\"excel_file_nm\" value=\"개인별목적사업지원현황\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\tvalue=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">개인별 목적사업지원현황</h1>\r\n");
      out.write("\t        \r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:12%;\">\r\n");
      out.write("\t\t\t<col style=\"width:28%;\">\r\n");
      out.write("\t\t\t<col style=\"width:12%;\">\r\n");
      out.write("\t\t\t<col style=\"width:48%;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">기준년도</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"std_yy\" title=\"기준년도\" class=\"bs-select form-control\" style=\"width:100px\" onChange=\"goSearch('N')\">\r\n");
      out.write("\t           \t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("std_yy"),"2013",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
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
      out.write("\" class=\"form-control\" style=\"width:150px;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch();\">\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('E');\"><img src=\"/com/img/ico_btn_excel.png\">엑셀</button>\r\n");
      out.write("\t\t\t    \t</span>\r\n");
      out.write("\t\t\t    </td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>    \r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"table-top-control form-inline\">\r\n");
      out.write("\t\t<div class=\"notice-view\">\r\n");
      out.write("\t\t\t<span style=\"color:#01a1db;\">성명을 클릭</span>하면 해당 임직원 세부정보를 조회할 수 있습니다.\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"f-right\">(단위 : 원)</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write(" \t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"height:calc(100vh - 170px)\">\r\n");
      out.write(" \t");
 RsWrapper codeWp = CodeUtil.getRsWrapper("PR_BUDTB_CODE01_LIST","LIST001", "", "S","","","N","",uSesEnt.dbo); 
	   int column_cnt = codeWp.getLength() + 4; int col_width = 100 / column_cnt; 
      out.write("\t\r\n");
      out.write("\t\t<table id=\"MyTable\" class=\"table table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:");
      out.print(col_width);
      out.write("%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:");
      out.print(col_width);
      out.write("%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:");
      out.print(col_width);
      out.write("%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:");
      out.print(col_width);
      out.write("%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:");
      out.print(col_width);
      out.write("%\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>사번</th>\r\n");
      out.write("\t\t\t\t\t<th>성명</th>\r\n");
      out.write("\t\t\t\t\t<th>부서명</th>\r\n");
      out.write("\t\t\t\t");
 for(int k=0; k < codeWp.getLength(); k++) { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t<th>");
      out.print(codeWp.get("bugt_nm",k));
      out.write("</th>\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t<th>합계</th>\r\n");
      out.write("\t       \t\t</tr>\r\n");
      out.write("\t       </thead>\r\n");
      out.write("\t       <tbody> \r\n");
      out.write("\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr><td colspan=\"");
      out.print(column_cnt);
      out.write("\" class=\"t-center\">검색된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t");
 }else {
			   	   for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t   \t   ");
 if(rsWp.get("empl_nm",i).equals("합계")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr bgcolor=\"f6f6f6\"> \r\n");
      out.write("\t\t\t   \t   ");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr > \r\n");
      out.write("\t\t\t   \t   ");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("empl_no",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t\t\t");
if(!box.get("excel_yn").equals("Y") && !rsWp.get("empl_nm",i).equals("합계")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("empl_no",i));
      out.write("')\">\r\n");
      out.write("\t\t\t\t\t\t\t");
 } 
      out.print(rsWp.get("empl_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");
 for(int k=0; k < codeWp.getLength(); k++) { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("amt_"+codeWp.get("bugt_cd",k).toLowerCase(),i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("amt_tot",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
 if(!box.get("excel_yn").equals("Y")) { 
      out.write('\r');
      out.write('\n');
      out.write('	');
      out.print(PageUtil.makePaging(box, rsWp, 50, request));
      out.write('\r');
      out.write('\n');
 } 
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
