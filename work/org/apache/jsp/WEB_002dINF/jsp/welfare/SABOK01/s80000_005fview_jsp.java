/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 08:38:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.welfare.SABOK01;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class s80000_005fview_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }

      out.write("\r\n");
      out.write("<!-- 직원 복지연금 신청서 조회 -->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goEdit() {\r\n");
      out.write("\t\tajaxReplaceForm(\"wel02003_edit.do\", \"#viewForm\", \"#divFrame\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeFinishYm() {\r\n");
      out.write("\t\tif (formValidate(\"#viewForm\")) {\r\n");
      out.write("\t\t\tremoveMask(\"#viewForm\");\r\n");
      out.write("\t\t\tajaxSubmitForm(\"wel02002_update.do?action_type=UPDATE_FINISH\",\"#viewForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\ttoastPop1('저장되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch(document.viewForm.apply_no.value);\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goUpdate() {\r\n");
      out.write("\t\tif (formValidate(\"#viewForm\")) {\r\n");
      out.write("\t\t\tremoveMask(\"#viewForm\");\r\n");
      out.write("\t\t\tdocument.viewForm.etc_remark.value = document.viewForm.proof_confirm.value+\"|\"+document.viewForm.etc_note.value;\r\n");
      out.write("\t\t\tajaxSubmitForm(\"wel02002_update.do?action_type=UPDATE_AMT\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\ttoastPop1('저장되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch(document.saveForm.apply_no.value);\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tajaxSubmitForm(\"wel02002_delete.do\",\"#viewForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\ttoastPop1('삭제되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch('');\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction signRequestPost() {\r\n");
      out.write("\t\tdocument.main.action = '/welfare/wel10.do?method=wel02002_select';\r\n");
      out.write("\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t");
 if(box.get("popup_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("\t\t\t$(\".page-logo-text\").html(\"직원 복지연금 신청서 조회\");\t\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"viewForm\" name=\"viewForm\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("<input type=\"hidden\" name=\"bugt_cd\" \tvalue=\"");
      out.print(box.get("bugt_cd"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_no\" \tvalue=\"");
      out.print(box.get("apply_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_popup\" \tvalue=\"");
      out.print(box.get("msg_popup"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"etc_remark\" \tvalue=\"");
      out.print(obox.get("etc_remark"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">사번/성명</th>\r\n");
      out.write("\t\t\t\t<td width=\"35%\">");
      out.print(obox.get("empl_no"));
      out.write("&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goEmployeePop('");
      out.print(obox.get("empl_no"));
      out.write("')\">");
      out.print(obox.get("empl_nm"));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"empl_no\" value=\"");
      out.print(obox.get("empl_no"));
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">부서</th>\r\n");
      out.write("\t\t\t\t<td width=\"35%\">");
      out.print(obox.get("dept_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>주민번호</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(FormatUtil.juminNo(obox.get("reside_no"),"x"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>직위</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("position_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>입사일자</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("entry_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>사원구분</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("empl_class_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">지원항목</th>\r\n");
      out.write("\t\t\t\t<td width=\"35%\">");
      out.print(obox.get("support_item_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th width=\"15%\">본인부담금</th>\r\n");
      out.write("\t\t\t\t<td width=\"35%\">");
      out.print(obox.get("self_pay_amt",Box.THOUSAND_COMMA));
      out.write(" 원</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>신청일자</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("apply_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<th>신청금액</th>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(obox.get("apply_amt",Box.THOUSAND_COMMA));
      out.write(' ');
      out.write('원');
if(!obox.get("apply_amt").equals(obox.get("support_amt"))){
      out.write("(실수령금액 : ");
      out.print(obox.get("support_amt",Box.THOUSAND_COMMA));
      out.write(' ');
      out.write('원');
      out.write(')');
}
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>계좌번호</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">");
      out.print(obox.get("bank_nm"));
      out.write(' ');
      out.print(obox.get("account_no"));
      out.write(" (예금주 : ");
      out.print(obox.get("account_owner"));
      out.write(")</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 if(uSesEnt.use_auth.startsWith("S") && obox.get("sign_status").equals("3")){ 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>지급종료월</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<select name=\"finish_yy\" title=\"지급종료년도\" class=\"bs-select form-control\" style=\"width:90px\">\r\n");
      out.write("            \t\t\t");
      out.print(DateUtil.getYearOptionTag(obox.get("finish_yy").equals("") ? "2029" : obox.get("finish_yy"), "2010", "2099", "desc", "년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>&nbsp;\r\n");
      out.write("\t\t\t\t\t<select name=\"finish_mm\" title=\"지급종료월\" class=\"bs-select form-control\" style=\"width:70px\">\r\n");
      out.write("            \t\t\t");
      out.print(DateUtil.getMonthOptionTag(obox.get("finish_mm"),"월"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"finish_ym\" value=\"\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"changeFinishYm();\">수정</button>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<th>결재상태</th>\r\n");
      out.write("\t\t\t\t<td><b><font color=red>");
      out.print(obox.get("sign_status_nm"));
      out.write("</font></b>&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t");
 if(obox.get("sign_status").equals("1")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSignRequest(document.signForm);\">기안문작성</button>\r\n");
      out.write("\t\t\t\t");
 }else if(obox.get("sign_status").compareTo("1") > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);\">결재라인</button>\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>문서번호</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t");
if(!obox.get("msg_no").equals("")){
      out.write("\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goDocuViewer('");
      out.print(obox.get("msg_no"));
      out.write("');\">");
      out.print(FormatUtil.msgNo(obox.get("msg_no")));
      out.write("</a>\r\n");
      out.write("\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
 if((obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) || obox.get("sign_status").equals("3")) {
   	   String proof_confirm = StringUtil.arrayCol(obox.get("etc_remark"),1);
   	   String etc_note = StringUtil.arrayCol(obox.get("etc_remark"),2); 
      out.write("\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<th colspan=\"4\">담당자 기재란</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t  \t\t\t<th width=\"15%\">지원금액</th>\r\n");
      out.write("\t  \t\t\t<td width=\"35%\">\r\n");
      out.write("\t  \t\t\t");
 if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t<input type=\"text\" name=\"apply_amt\" value=\"");
      out.print(obox.get("apply_amt"));
      out.write("\" size=\"13\" maxlength=\"10\" title=\"신청금액\" class=\"tMONEY\" style=\"width:70px;border:1 solid gray\" > 원\r\n");
      out.write("\t  \t\t\t");
 }else if(obox.get("sign_status").equals("3")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t");
      out.print(obox.get("support_amt",Box.THOUSAND_COMMA));
      out.write(" 원\r\n");
      out.write("\t  \t\t\t");
 } 
      out.write("\r\n");
      out.write("\t  \t\t\t</td>\r\n");
      out.write("\t  \t\t\t<th width=\"15%\">증빙확인</th>\r\n");
      out.write("\t  \t\t\t<td width=\"35%\">\r\n");
      out.write("\t  \t\t\t");
 if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t<input type=\"text\" name=\"proof_confirm\" value=\"");
      out.print(proof_confirm);
      out.write("\" size=\"13\" maxlength=\"10\" title=\"증빙확인\" style=\"width:70px;border:1 solid gray\" >\r\n");
      out.write("\t  \t\t\t");
 }else if(obox.get("sign_status").equals("3")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t");
      out.print(proof_confirm);
      out.write("\r\n");
      out.write("\t  \t\t\t");
 } 
      out.write("\r\n");
      out.write("\t  \t\t\t </td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>비고</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t  \t\t\t");
 if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t<input type=\"text\" name=\"etc_note\" value=\"");
      out.print(etc_note);
      out.write("\" maxlength=\"120\" title=\"비고\" style=\"width:90%;border:1 solid gray\">\r\n");
      out.write("\t  \t\t\t");
 }else if(obox.get("sign_status").equals("3")) { 
      out.write("\r\n");
      out.write("\t  \t\t\t\t");
      out.print(etc_note);
      out.write("\r\n");
      out.write("\t  \t\t\t");
 } 
      out.write("\r\n");
      out.write("\t  \t\t\t </td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
 } 
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span class=\"f-right\">\r\n");
      out.write("\t\t");
 if(isEditable) { 
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goEdit()\"><img src=\"/com/img/ico_btn_edit.png\">수정</button>\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete()\"><img src=\"/com/img/ico_btn_delete.png\">삭제</button>\r\n");
      out.write("\t\t");
 } else if(obox.get("sign_status").equals("2") && box.get("msg_popup").equals("Y") && uSesEnt.use_auth.startsWith("S")) {
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goUpdate()\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goUbiViewer('WEB-INF/jsp/welfare/");
      out.print(box.get("dbo"));
      out.write("/report/s800.jrf', 'P_PARAM01!BOK001,");
      out.print(obox.get("apply_no"));
      out.write("!P_PARAM02!");
      out.print(obox.get("apply_no"));
      out.write('|');
      out.print(obox.get("bugt_cd"));
      out.write('|');
      out.print(obox.get("support_item"));
      out.write('|');
      out.print(obox.get("empl_no"));
      out.write("!');\"><img src=\"/com/img/ico_btn_print.png\">인쇄</button>\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<form name=\"signForm\" method=\"post\" action=\"\" style=\"display:none\">\r\n");
      out.write("<input type=\"hidden\" name=\"send_empl_no\" \tvalue=\"");
      out.print(uSesEnt.empl_no);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"subject\" \t\tvalue=\"직원복지연금 신청(");
      out.print(obox.get("empl_nm"));
      out.write(")\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_type\" \t\tvalue=\"BOK001\">\r\n");
      out.write("<input type=\"hidden\" name=\"search_key\" \t\tvalue=\"");
      out.print(obox.get("apply_no"));
      out.write('|');
      out.print(obox.get("bugt_cd"));
      out.write('|');
      out.print(obox.get("support_item"));
      out.write('|');
      out.print(obox.get("empl_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"etc_remark\" \t\tvalue=\"");
      out.print(obox.get("etc_remark"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_ymd\" \t\tvalue=\"");
      out.print(obox.get("apply_ymd",Box.DEF_DATE_FMT));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_amt\" \t\tvalue=\"");
      out.print(obox.get("apply_amt",Box.THOUSAND_COMMA));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"nextUrl\" \t\tvalue=\"\">\r\n");
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
