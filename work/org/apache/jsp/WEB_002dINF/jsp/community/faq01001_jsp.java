/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-03 02:37:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.community;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class faq01001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');
 RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE","","group_type|faq_category|","","","",""); 
      out.write("\r\n");
      out.write("<!-- FAQ -->\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tajaxReplaceForm(\"faq01001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\t\t$(\"tr#Q_0\").find(\"a\").trigger(\"click\");\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\tajaxReplaceForm(\"faq01001_list.do\", \"#main\", \"#divListData\");\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goTabpage(tab_index, faq_category) {\r\n");
      out.write("\t\tdocument.main.tab_index.value = tab_index;\r\n");
      out.write("\t\tdocument.main.faq_category.value = faq_category;\r\n");
      out.write("\t\t$(\"#faqTabMenu li\").removeClass('active');\t\t\r\n");
      out.write("\t\t$(\"#faqTabMenu #tabMenu\"+tab_index).addClass('active');\r\n");
      out.write("\t\tif(tab_index == '2') {\r\n");
      out.write("\t\t\t$(\"#faq_sub_category\").show();\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\t$(\"#faq_sub_category\").hide();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tgoSearch();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goView(inx) {\r\n");
      out.write("\t\tif($('#A_'+inx).css(\"display\") == 'none') {\r\n");
      out.write("\t\t\t$('#A_'+inx).show();\r\n");
      out.write("\t\t\tif(!isEmpty(document.main.selectedRow) && document.main.selectedRow.value != inx) {\r\n");
      out.write("\t\t\t\t$('#A_'+document.main.selectedRow.value).hide();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tdocument.main.selectedRow.value = inx;\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\t$('#A_'+inx).hide();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goWrite() {\r\n");
      out.write("\t\tdocument.saveForm.faq_no.value = '';\r\n");
      out.write("\t\tdocument.saveForm.faq_head.value = '';\r\n");
      out.write("\t\tdocument.saveForm.faq_content.value = '';\r\n");
      out.write("\t\tdocument.saveForm.faq_category.value = '';\r\n");
      out.write("\t\tdocument.saveForm.faq_sub_category.value = '';\r\n");
      out.write("\t\t$('#divEditModal').modal('show');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goEdit(faq_no, corp_cd, faq_head, faq_content, faq_category, faq_sub_category) {\r\n");
      out.write("\t\tdocument.saveForm.faq_no.value = faq_no;\r\n");
      out.write("\t\tdocument.saveForm.corp_cd.value = corp_cd;\r\n");
      out.write("\t\tdocument.saveForm.faq_head.value = faq_head;\r\n");
      out.write("\t\tdocument.saveForm.faq_content.value = replaceSpecial(faq_content);\r\n");
      out.write("\t\tdocument.saveForm.faq_category.value = faq_category;\r\n");
      out.write("\t\tdocument.saveForm.faq_sub_category.value = faq_sub_category;\r\n");
      out.write("\t\tchange_faq_category(faq_category);\r\n");
      out.write("\t\t$('#divEditModal').modal('show');\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif(formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(confirm('저장하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tvar callurl = 'faq01001_update.do?action_type=' + (isEmpty(document.saveForm.faq_no) ? 'INSERT' : 'UPDATE');\r\n");
      out.write("\t\t\t\tajaxSubmitForm(callurl,\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\treturnFormSubmit(document.main, 'faq01001_list.do');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete(faq_no, faq_category) {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\tdocument.saveForm.faq_no.value = faq_no;\r\n");
      out.write("\t\t\tdocument.saveForm.faq_category.value = faq_category;\r\n");
      out.write("\t\t\tajaxSubmitForm(\"faq01001_delete.do?faq_no=\"+faq_no,\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\treturnFormSubmit(document.main, 'faq01001_list.do');\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction change_faq_category(faq_category) {\r\n");
      out.write("\t\tchangeObjectProperty(document.saveForm.faq_sub_category, faq_category == 'B' ? 'required' : 'readonly');\r\n");
      out.write("\t\tdocument.getElementById('spanSubCategory').style.display = faq_category == 'B' ? '' : 'none';\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$(\"tr#Q_0\").find(\"a\").trigger(\"click\");\r\n");
      out.write("\t\tgoTabpage('1','A')\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form  id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px;\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" \tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"tab_index\" \t\tvalue=\"");
      out.print(box.get("tab_index"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"faq_category\" \tvalue=\"");
      out.print(box.get("faq_category"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\t\tvalue=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">FAQ</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td width=\"*\" class=\"form-inline\">\r\n");
      out.write("\t\t\t\t<select name=\"search_key\" class=\"bs-select form-control\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(box.get("search_key").equals("1")?"selected":"");
      out.write(">질문</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(box.get("search_key").equals("2")?"selected":"");
      out.write(">답변</option>\r\n");
      out.write("\t\t\t\t\t<option value='3' ");
      out.print(box.get("search_key").equals("3")?"selected":"");
      out.write(">질문+답변</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<select id=\"faq_sub_category\" name=\"faq_sub_category\" class=\"bs-select form-control\" onChange=\"goSearch();\" style=\"display:none;\">\r\n");
      out.write("\t\t\t\t\t<option value=''>:: 회계실무사례 ::</option>\r\n");
      out.write("\t\t\t\t\t<option value='01' ");
      out.print(box.get("faq_sub_category").equals("01")?"selected":"");
      out.write(">목적사업</option>\r\n");
      out.write("\t\t\t\t\t<option value='02' ");
      out.print(box.get("faq_sub_category").equals("02")?"selected":"");
      out.write(">대부사업</option>\r\n");
      out.write("\t\t\t\t\t<option value='03' ");
      out.print(box.get("faq_sub_category").equals("03")?"selected":"");
      out.write(">예적금거래</option>\r\n");
      out.write("\t\t\t\t\t<option value='04' ");
      out.print(box.get("faq_sub_category").equals("04")?"selected":"");
      out.write(">고유목적사업준비금</option>\r\n");
      out.write("\t\t\t\t\t<option value='99' ");
      out.print(box.get("faq_sub_category").equals("99")?"selected":"");
      out.write(">기타</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"search_val\" value=\"");
      out.print(box.get("search_val"));
      out.write("\" class=\"form-control\" style=\"width:200px;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch();\">\r\n");
      out.write("\t  \t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch();\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goWrite();\"><img src=\"/com/img/ico_btn_refresh_edit.png\">새로작성</button>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\t  \t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<div class=\"notice-view\">\r\n");
      out.write("\t\t\t<span style=\"color:#01a1db;\">질문을 클릭</span>하면 해당 FAQ의 세부내용을 검색할 수 있습니다.\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\t\t\t  \r\n");
      out.write("\t<ul id=\"faqTabMenu\" class=\"nav nav-tabs\">\r\n");
      out.write("\t\t<li id=\"tabMenu1\" onClick=\"goTabpage('1','A')\" ");
if(box.get("faq_category").equals("A")){
      out.write("class=\"active\"");
}
      out.write("><a data-toggle=\"tab\">시스템사용법</a></li>\r\n");
      out.write("\t\t<li id=\"tabMenu2\" onClick=\"goTabpage('2','B')\" ");
if(box.get("faq_category").equals("B")){
      out.write("class=\"active\"");
}
      out.write("><a data-toggle=\"tab\">회계실무사례</a></li>\r\n");
      out.write("\t\t<li id=\"tabMenu3\" onClick=\"goTabpage('3','C')\" ");
if(box.get("faq_category").equals("C")){
      out.write("class=\"active\"");
}
      out.write("><a data-toggle=\"tab\">기타</a></li>\r\n");
      out.write("\t</ul>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(100vh - 219px);\">\r\n");
      out.write("\t\t<table class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t");
 for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t<tr id=\"Q_");
      out.print(i);
      out.write("\"> \r\n");
      out.write("\t\t\t\t<td width=\"90%\" colspan=\"");
      out.print(uSesEnt.use_auth.startsWith("S")?"1":"2");
      out.write("\" class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t&nbsp;<img src=\"/com/img/icon_question1.gif\"> \r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goView('");
      out.print(i);
      out.write("')\"><span style=\"font-weight:bold; color:blue;\">");
      out.print(rsWp.get("faq_sub_category_nm",i));
      out.write("</span>");
      out.print(rsWp.get("faq_head",i));
      out.write("</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" id=\"btnModify\" class=\"btn btn-primary btn-table\" onClick=\"goEdit('");
      out.print(rsWp.get("faq_no",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("corp_cd",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("faq_head",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("faq_content",i,Box.JAVASCRIPT).replaceAll("\"", "@DQUOT@"));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("faq_category",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("faq_sub_category",i));
      out.write("');\">수정</button>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" id=\"btnDelete");
      out.print(i);
      out.write("\" class=\"btn btn-primary btn-table\" onClick=\"goDelete('");
      out.print(rsWp.get("faq_no",i));
      out.write("');\">삭제</button>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t<tr id=\"A_");
      out.print(i);
      out.write("\"> \r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left pad10\">\r\n");
      out.write("\t\t\t\t\t");
      out.print(StringUtil.getReplaceSpecialCharacters(rsWp.get("faq_content",i,Box.MULTILINE_TEXT)));
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
      out.print(PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request));
      out.write("\r\n");
      out.write("\t\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("</div>\t\t\t\t\r\n");
      out.write("<!-- FAQ 등록 모달 -->\t\r\n");
      out.write("<div class=\"modal fade\" id=\"divEditModal\" tabindex=\"-1\" role=\"basic\" aria-hidden=\"true\">\r\n");
      out.write("\t<div class=\"modal-dialog\" style=\"width:800px\">\r\n");
      out.write("\t\t<div class=\"modal-content\">\r\n");
      out.write("\t\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\"></button>\r\n");
      out.write("\t\t\t\t<h4 class=\"modal-title\">자주 묻는 질문(FAQ)</h4>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t\t<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px;\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"faq_no\" value=\"\">\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<th style=\"width:15%;\">질문</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select name=\"faq_category\" title=\"FAQ 분류\" value=\"\" class=\"bs-select form-control required\" style=\"width:18%\" onChange=\"change_faq_category(this.value)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=''>::: FAQ 분류 :::</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "faq_category", ""));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span id=\"spanSubCategory\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<select name=\"faq_sub_category\" title=\"회계실무사례\" value=\"\" class=\"bs-select form-control required\" style=\"width:25%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value='01'>목적사업</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value='02'>대부사업</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value='03'>예적금거래</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value='04'>고유목적사업준비금</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option value='99'>기타</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" name=\"faq_head\" value=\"");
      out.print(box.get("faq_head"));
      out.write("\" maxlength=\"100\" title=\"질문\" class=\"form-control required\" style=\"width:55%\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr> \r\n");
      out.write("\t\t\t\t\t\t\t<tr height=\"150\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t<th>답변</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"3\"><textarea name=\"faq_content\" class=\"form-control\" style=\"height:120px;width:100%;ime-mode:active;\"></textarea></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t\t\t\t\t<th>공지대상</th>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"3\" class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select name=\"corp_cd\" title=\"공지대상\" class=\"bs-select form-control\" style=\"width:250px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=''>전체</option>\r\n");
      out.write("\t\t\t\t                \t\t");
      out.print(CodeUtil.optList("PR_COMTB_CORP01_LIST","LISTCODE","","corp_cd","","","",""));
      out.write("\r\n");
      out.write("\t\t\t\t                \t</select> \r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
 }else { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"corp_cd\" value=\"");
      out.print(uSesEnt.dbo);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t\t\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" id=\"btnSave\" class=\"btn dark\" onClick=\"goSave();\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" id=\"btnCancel\" class=\"btn dark\" onClick=\"$('#divEditModal button.close').trigger('click');\"><img src=\"/com/img/ico_btn_cancel.png\">취소</button>\r\n");
      out.write("\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
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
