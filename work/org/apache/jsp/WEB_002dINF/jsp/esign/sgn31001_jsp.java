/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-08-29 03:56:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.esign;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class sgn31001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- 결재권한자 위임  -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch() {\r\n");
      out.write("\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\tdocument.main.action = 'sgn31001_list.do';\r\n");
      out.write("\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDetail(empl_no, dlgt_seq) {\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\t$(\"tr[search_key='\"+empl_no+dlgt_seq+\"']\").addClass(\"bg-yellow\");\r\n");
      out.write("\t\tajaxProcJsonBox(\"PR_COMTB_DLGT01@SELECT\", {'empl_no' : empl_no, 'dlgt_seq' : dlgt_seq}, function(rtn) {\r\n");
      out.write("\t\t\tdocument.saveForm.dlgt_seq.value = rtn.dlgt_seq;\r\n");
      out.write("\t\t\tvar start_dt = rtn.start_dt;\r\n");
      out.write("\t\t\tvar end_dt = rtn.end_dt;\r\n");
      out.write("\t\t\tvar current_dt = '");
      out.print(DateUtil.toString("yyyyMMddHHmmss"));
      out.write("';\r\n");
      out.write("\t\t\tif(current_dt > start_dt && current_dt < end_dt) {\r\n");
      out.write("\t\t\t\tdocument.saveForm.dlgt_empl_no.value = rtn.dlgt_empl_no;\r\n");
      out.write("\t\t\t\tdocument.saveForm.dlgt_empl_nm.value = rtn.dlgt_empl_nm;\r\n");
      out.write("\t\t\t\tdocument.saveForm.dlgt_reason.value = rtn.dlgt_reason;\r\n");
      out.write("\t\t\t\tdocument.saveForm.start_ymd.value = start_dt.substring(0,8);\r\n");
      out.write("\t\t\t\tdocument.saveForm.start_hh.value  = start_dt.substring(8,10);\r\n");
      out.write("\t\t\t\tdocument.saveForm.start_mm.value  = start_dt.substring(10,12);\r\n");
      out.write("\t\t\t\tdocument.saveForm.end_ymd.value = end_dt.substring(0,8);\r\n");
      out.write("\t\t\t\tdocument.saveForm.end_hh.value  = end_dt.substring(8,10);\r\n");
      out.write("\t\t\t\tdocument.saveForm.end_mm.value  = end_dt.substring(10,12);\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t\t\tformatMaskElm(document.saveForm.start_ymd);\r\n");
      out.write("\t\t\t\tformatMaskElm(document.saveForm.end_ymd);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t$(\"#btnUpdate\").show();\r\n");
      out.write("\t\t\t\t$(\"#btnDelete\").show();\r\n");
      out.write("\t\t\t\t$(\"#EditTable\").show();\r\n");
      out.write("\t\t\t\t$(\"#ViewTable\").hide();\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\t$(\"#divDlgtFrom\").html(start_dt.substring(0,4)+\"-\"+start_dt.substring(4,6)+\"-\"+start_dt.substring(6,8)+\" \"+start_dt.substring(8,10)+\":\"+start_dt.substring(10,12));\r\n");
      out.write("\t\t\t\t$(\"#divDlgtTo\").html(end_dt.substring(0,4)+\"-\"+end_dt.substring(4,6)+\"-\"+end_dt.substring(6,8)+\" \"+end_dt.substring(8,10)+\":\"+end_dt.substring(10,12));\r\n");
      out.write("\t\t\t\t$(\"#divDlgtEmplNm\").html(rtn.dlgt_empl_nm);\r\n");
      out.write("\t\t\t\t$(\"#divDlgtReason\").html(rtn.dlgt_reason);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t$(\"#btnUpdate\").hide();\r\n");
      out.write("\t\t\t\t$(\"#btnDelete\").hide();\r\n");
      out.write("\t\t\t\t$(\"#EditTable\").hide();\r\n");
      out.write("\t\t\t\t$(\"#ViewTable\").show();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t$(\"#btnWrite\").show();\r\n");
      out.write("\t\t});\r\n");
      out.write("    }\r\n");
      out.write("\t\r\n");
      out.write("    function goWrite() {\r\n");
      out.write("    \tdocument.saveForm.reset();\r\n");
      out.write("    \tdocument.saveForm.dlgt_seq.value = '';\r\n");
      out.write("    \tformatMaskElm(document.saveForm.start_ymd);\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#btnUpdate\").show();\r\n");
      out.write("\t\t$(\"#btnDelete\").hide();\r\n");
      out.write("\t\t$(\"#btnWrite\").hide();\r\n");
      out.write("\t\t$(\"#EditTable\").show();\r\n");
      out.write("\t\t$(\"#ViewTable\").hide();\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif(formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(document.saveForm.dlgt_empl_no.value == '");
      out.print(uSesEnt.empl_no);
      out.write("') {\r\n");
      out.write("\t\t\t\talert('본인을 위임자로 지정할 수 없습니다.');\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\tif(parseInt(document.saveForm.start_hh.value) < 0 || parseInt(document.saveForm.start_hh.value) > 23) {\r\n");
      out.write("\t\t\t\t\talert('위임시작일(시)는 0~23사이의 값으로 입력하셔야 합니다.');\r\n");
      out.write("\t\t\t\t\tdocument.saveForm.start_hh.focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}else if(parseInt(document.saveForm.start_mm.value) < 0 || parseInt(document.saveForm.start_mm.value) > 60) {\r\n");
      out.write("\t\t\t\t\talert('위임시작일(분)는 0~60사이의 값으로 입력하셔야 합니다.');\r\n");
      out.write("\t\t\t\t\tdocument.saveForm.start_mm.focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}else if(parseInt(document.saveForm.end_hh.value) < 0 || parseInt(document.saveForm.end_hh.value) > 23) {\r\n");
      out.write("\t\t\t\t\talert('위임종료일(시)는 0~23사이의 값으로 입력하셔야 합니다.');\r\n");
      out.write("\t\t\t\t\tdocument.saveForm.end_hh.focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}else if(parseInt(document.saveForm.end_mm.value) < 0 || parseInt(document.saveForm.end_mm.value) > 60) {\r\n");
      out.write("\t\t\t\t\talert('위임종료일(시)는 0~60사이의 값으로 입력하셔야 합니다.');\r\n");
      out.write("\t\t\t\t\tdocument.saveForm.end_mm.focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}else if((document.saveForm.start_ymd.value+document.saveForm.start_hh.value+document.saveForm.start_mm.value) >= (document.saveForm.end_ymd.value+document.saveForm.end_hh.value+document.saveForm.end_mm.value)) {\r\n");
      out.write("\t\t\t\t\talert('위임종료일은 위임시작일 이후이어야 합니다.');\r\n");
      out.write("\t\t\t\t\tdocument.saveForm.end_hh.focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(confirm('저장하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tdocument.saveForm.action = 'sgn31001_update.do';\r\n");
      out.write("\t\t\t\tdocument.saveForm.target = \"_self\";\r\n");
      out.write("\t\t\t\tdocument.saveForm.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\t\t\r\n");
      out.write("\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\tdocument.saveForm.action = 'sgn31001_delete.do';\r\n");
      out.write("\t\t\tdocument.saveForm.target = \"_self\";\r\n");
      out.write("\t\t\tdocument.saveForm.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">결재권한자 위임</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("\t<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:13%;\">\r\n");
      out.write("\t\t\t<col style=\"width:22%;\">\r\n");
      out.write("\t\t\t<col style=\"width:13%;\">\r\n");
      out.write("\t\t\t<col style=\"width:17%;\">\r\n");
      out.write("\t\t\t<col style=\"width:13%;\">\r\n");
      out.write("\t\t\t<col style=\"width:22%;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t\t<tr height=\"28\">\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">사번/성명</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(uSesEnt.empl_no);
      out.write("&nbsp;&nbsp;");
      out.print(uSesEnt.empl_nm);
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">직위</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(uSesEnt.position_nm);
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">부서</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(uSesEnt.dept_nm);
      out.write("</td>\r\n");
      out.write("\t\t  \t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t<div class=\"row row-set\">\r\n");
      out.write("\t\t<div class=\"col-md-6 col-xs-6 col-sm-6 row-set-col padL0 padR0\">\r\n");
      out.write("\t\t\t<div class=\"table-top-guide\">\r\n");
      out.write("\t\t\t\t<font color=red>●</font> 표시는 현재 적용중에 있는 결재권한 위임을 의미합니다.\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"table-scrollable\" style=\"width:100%; height:calc(100vh - 165px);\">\r\n");
      out.write("\t\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t\t\t<colgorup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:15%\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:40%\">\r\n");
      out.write("\t\t\t\t\t</colgorup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>시작일시</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>종료일시</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>위임자</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>위임사유</th>\r\n");
      out.write("\t\t\t\t\t\t</tr> \r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t");
 for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr id=\"tr_");
      out.print(i);
      out.write("\" search_key=\"");
      out.print(rsWp.get("empl_no",i));
      out.print(rsWp.get("dlgt_seq",i));
      out.write("\" class=\"odd gradeX\" style=\"cursor:pointer\" onClick=\"goDetail('");
      out.print(rsWp.get("empl_no",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("dlgt_seq",i));
      out.write("')\"> \r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">");
if(rsWp.get("use_yn",i).equals("Y")){
      out.write("<font color=red>●</font>");
}
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">");
      out.print(rsWp.get("start_dt",i,Box.DEF_DATETIME_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">");
      out.print(rsWp.get("end_dt",i,Box.DEF_DATETIME_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\"><a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("dlgt_empl_no",i));
      out.write("')\">");
      out.print(rsWp.get("dlgt_empl_nm",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("dlgt_reason",i,Box.MULTILINE_TEXT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr><td colspan=\"5\" class=\"t-center\">검색된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t");
      out.print(PageUtil.makePaging(box, rsWp, request));
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"col-md-6 col-xs-6 col-sm-6 row-set-col padT20\">\r\n");
      out.write("\t\t\t<div class=\"table-scrollable\" style=\"height:100%;overflow-y:auto\">\r\n");
      out.write("\t\t\t\t<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"empl_no\" \tvalue=\"");
      out.print(uSesEnt.empl_no);
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"dlgt_seq\" \tvalue=\"\">\r\n");
      out.write("\t\t\t\t<table id=\"EditTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td colspan=\"4\" class=\"td-head\">위임장</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td width=\"25%\" class=\"td-head\">위임시작일시</td>\r\n");
      out.write("\t\t\t\t\t  \t<td width=\"75%\" class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t  \t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"start_ymd\" name=\"start_ymd\" value=\"");
      out.print(DateUtil.toString("yyyyMMdd"));
      out.write("\" maxlength=\"8\" title=\"위임시작일\" class=\"form-control required tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" name=\"start_hh\" value=\"\" maxlength=\"2\" title=\"위임시작일(시)\" class=\"form-control tMONEY required autoTab\" style=\"width:40px\" onChange=\"if(this.value.length==1) this.value='0'+this.value;\"> : <input type=\"text\" name=\"start_mm\" value=\"\" maxlength=\"2\" title=\"위임시작일(분)\" class=\"form-control tMONEY required autoTab\" style=\"width:40px\" onChange=\"if(this.value.length==1) this.value='0'+this.value;\"> 부터 \r\n");
      out.write("\t\t\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t  \t</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"td-head\">위임종료일시</td>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t  \t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"end_ymd\" name=\"end_ymd\" value=\"\" maxlength=\"8\" title=\"위임종료일\" class=\"form-control required tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" name=\"end_hh\" value=\"\" maxlength=\"2\" title=\"위임종료일(시)\" class=\"form-control tMONEY required autoTab\" style=\"width:40px\" onChange=\"if(this.value.length==1) this.value='0'+this.value;\"> : <input type=\"text\" name=\"end_mm\" value=\"\" maxlength=\"2\" title=\"위임종료일(분)\" class=\"form-control tMONEY required autoTab\" style=\"width:40px\" onChange=\"if(this.value.length==1) this.value='0'+this.value;\"> 까지 \r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t  \t</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"td-head\">위임자</td>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t  \t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t  \t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"dlgt_empl_no\" value=\"\" title=\"위임자성명\" class=\"form-control required\" style=\"width:90px;background-color:f0f0f0;\" readOnly>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button type=\"button\" class=\"btn dark\" onClick=\"findEmployeeNo('&dept_cd=");
      out.print(uSesEnt.dept_cd);
      out.write("&column=dlgt_empl_no,dlgt_empl_nm,saveForm')\"><i class=\"fa fa-search\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" name=\"dlgt_empl_nm\" value=\"\" class=\"form-control\" style=\"width:100px;background-color:f0f0f0;\" readOnly>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t  \t</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"td-head\">위임사유</td>\r\n");
      out.write("\t\t\t\t\t\t<td><textarea name=\"dlgt_reason\" title=\"위임사유\" class=\"form-control required\" style=\"height:40px;width:100%;ime-mode:active;\"></textarea></td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<table id=\"ViewTable\" class=\"table table-striped table-bordered table-hover order-column\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td colspan=\"4\" class=\"td-head\">위임장</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td width=\"25%\" class=\"td-head\">위임시작일시</td>\r\n");
      out.write("\t\t\t\t\t  \t<td width=\"75%\" class=\"t-left\"><span id=\"divDlgtFrom\"></span> 부터</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"td-head\">위임종료일시</td>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"t-left\"><span id=\"divDlgtTo\"></span> 까지</td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"td-head\">위임자</td>\r\n");
      out.write("\t\t\t\t\t  \t<td class=\"t-left\"><span id=\"divDlgtEmplNm\"></span></td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"td-head\">위임사유</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\"><span id=\"divDlgtReason\"></span></td>\r\n");
      out.write("\t          \t\t</tr> \r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t\t\t<div class=\"form-inline f-right\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" id=\"btnUpdate\" class=\"btn dark\" onClick=\"goSave();\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" id=\"btnDelete\" class=\"btn dark\" onClick=\"goDelete();\"><img src=\"/com/img/ico_btn_delete.png\" style=\"display:none\">삭제</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" id=\"btnWrite\" class=\"btn dark\" onClick=\"goWrite();\"><img src=\"/com/img/ico_btn_write.png\" style=\"display:none\">새로작성</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
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
