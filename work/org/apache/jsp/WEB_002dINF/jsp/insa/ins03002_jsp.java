/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 06:46:39 UTC
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

public final class ins03002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "work_cd|school_career_cd|","","","",""); 
      out.write("\r\n");
      out.write("<!-- 가족사항 세부정보 등록  -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif(formValidate(\"#saveForm\")) { \r\n");
      out.write("\t\t\tif(!chkLocFrnJuminNo(document.saveForm.reside_no1.value, document.saveForm.reside_no2.value)) {\r\n");
      out.write("\t\t\t\talert('주민등록번호가 잘못되었습니다.');\r\n");
      out.write("\t\t\t\tdocument.saveForm.reside_no1.select();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(confirm(\"저장하시겠습니까?\")) {\r\n");
      out.write("\t\t\t\tdocument.saveForm.actionType.value = isEmpty(document.saveForm.family_id) ? 'INSERT' : 'UPDATE';\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"ins03002_update.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\t$('#dialog-form').modal('hide');\r\n");
      out.write("\t\t\t\t\t\treturnFormSubmit(document.saveForm, 'ins03001_list.do');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tdocument.saveForm.actionType.value = 'DELETE';\r\n");
      out.write("\t\t\tajaxSubmitForm(\"ins03002_delete.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t$('#dialog-form').modal('hide');\r\n");
      out.write("\t\t\t\t\treturnFormSubmit(document.saveForm, 'ins03001_list.do');\r\n");
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
      out.write("\t\t\t<h4 class=\"modal-title\">가족사항 세부정보</h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"empl_no\"\t\tvalue=\"");
      out.print(box.get("empl_no"));
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"family_id\"\tvalue=\"");
      out.print(box.get("family_id"));
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"actionType\" \tvalue=\"\">\r\n");
      out.write("\t\t\t<table class=\"table table-bordered\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15%;\"/>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:35%;\"/>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:15%;\"/>\r\n");
      out.write("\t\t\t\t\t<col style=\"width:35%;\"/>\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>성명</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"family_nm\" value=\"");
      out.print(obox.get("family_nm"));
      out.write("\" maxlength=\"10\" title=\"성명\" class=\"form-control required\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"family_rel_cd\" title=\"가족관계\" class=\"bs-select form-control required\" onChange=\"if(this.value=='00'){alert('본인은 선택할 수 없습니다.');this.value='';}\" style=\"width:100px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("family_rel_cd"),"family_rel_cd","","","",""));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<th>주민번호</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"reside_no1\" value=\"");
      out.print(StringUtil.substr(obox.get("reside_no"),0,6));
      out.write("\" maxlength=\"6\" title=\"주민번호\" class=\"form-control required autoTab\" style=\" width:80px; border:1 solid gray\"> -\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"reside_no2\" value=\"");
      out.print(StringUtil.substr(obox.get("reside_no"),6));
      out.write("\" maxlength=\"7\" title=\"주민번호\" class=\"form-control required autoTab\" style=\" width:90px; border:1 solid gray\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>직업</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"work_cd\" title=\"직업\" class=\"bs-select form-control\" style=\"width:80px\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "work_cd",obox.get("work_cd")));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<th>최종학력</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"school_career_cd\" title=\"최종학력\" class=\"bs-select form-control\" style=\"width:130px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "school_career_cd",obox.get("school_career_cd")));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>근무처</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\"><input type=\"text\" name=\"work_place\" value=\"");
      out.print(obox.get("work_place"));
      out.write("\" maxlength=\"20\" title=\"근무처\" class='form-control' style=\"width:150px\"></td>\r\n");
      out.write("\t\t\t\t\t\t<th>부양가족여부</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"buyang_yn\" title=\"부양가족여부\" class=\"bs-select form-control\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value='Y' ");
      out.print(obox.get("buyang_yn").equals("Y")?"selected":"");
      out.write(">Yes</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value='N' ");
      out.print(obox.get("buyang_yn").equals("N")?"selected":"");
      out.write(">No</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>비고</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\"><input type=\"text\" name=\"etc_remark\" value=\"");
      out.print(obox.get("etc_remark"));
      out.write("\" maxlength=\"50\" title=\"비고\" class='form-control' style=\"width:95%\"></td>\r\n");
      out.write("\t\t\t\t\t\t<th>동거여부</th>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"living_yn\" title=\"동거여부\" class=\"bs-select form-control\" style=\"width:80px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value='Y' ");
      out.print(obox.get("living_yn").equals("Y")?"selected":"");
      out.write(">Yes</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value='N' ");
      out.print(obox.get("living_yn").equals("N")?"selected":"");
      out.write(">No</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t\t\t<div class=\"form-inline f-right\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onclick=\"goSave();\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t\t\t\t");
 if(box.get("actionType").equals("view")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete();\"><img src=\"/com/img/ico_btn_delete.png\">삭제</button>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"$('button.close').trigger('click');\"><img src=\"/com/img/ico_btn_cancel.png\">취소</button>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
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
