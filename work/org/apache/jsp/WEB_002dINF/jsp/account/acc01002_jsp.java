/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 07:44:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class acc01002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!-- 계정과목코드 등록/수정화면 -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif (formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(confirm('저장하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"acc01002_update.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\talert('저장되었습니다.');\r\n");
      out.write("\t\t\t\t\t\tgoSearch();\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\tajaxSubmitForm(\"acc01002_delete.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\talert('삭제되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch();\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goCopy() {\r\n");
      out.write("\t\tif (formValidate(\"#form1\")) {\r\n");
      out.write("\t\t\tif(confirm('생성하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"acc01002_copy.do\",\"#form1\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\talert('복사되었습니다.');\r\n");
      out.write("\t\t\t\t\t\tgoSearch();\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("<form id=\"form1\" name=\"form1\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover marB5\" style=\"display:");
      out.print(box.get("acct_cd").equals("")?"":"none");
      out.write("\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"17%\">코드복사</th>\r\n");
      out.write("\t\t\t<td width=\"*\" class=\"form-inline\">\r\n");
      out.write("\t\t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"old_acct_cd\" title=\"계정과목코드\" class=\"form-control required\" style=\"width:90px\" readOnly>\r\n");
      out.write("\t\t\t\t\t<span class=\"input-group-btn\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn dark marR5\" onclick=\"findAccountCode();\"><i class=\"fa fa-search\"></i></button>\r\n");
      out.write("\t\t\t\t\t\t<img src=\"/com/img/bullet_e.gif\" border=\"0\" class=\"absmiddle\"><img src=\"/com/img/bullet_e.gif\" border=\"0\" class=\"absmiddle\"><img src=\"/com/img/bullet_e.gif\" border=\"0\" class=\"absmiddle\">\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"new_acct_cd\" maxlength=\"7\" title=\"계정과목코드\" class=\"form-control required marL5\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"new_acct_nm\" maxlength=\"50\" title=\"계정과목명\" class=\"form-control required marL5\" style=\"width:150px\">\r\n");
      out.write("\t\t\t\t\t<span class=\"input-group-btn\">\r\n");
      out.write("\t\t\t\t\t\t<button type='button' class='btn btn-primary btn-table marL5' onClick=\"goCopy();\">복사</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
 } 
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"action_type\" value=\"");
      out.print(box.get("acct_cd").equals("")?"INSERT":"UPDATE");
      out.write("\">\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover marB5\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>계정과목코드</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\"><input type=\"text\" name=\"acct_cd\" value=\"");
      out.print(obox.get("acct_cd"));
      out.write("\" maxlength=\"7\" title=\"계정과목코드\" class=\"form-control required\" style=\"width:40%\" ");
      out.print(box.get("acct_cd").equals("")?"":"readonly");
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"17%\">계정과목명</th>\r\n");
      out.write("\t\t\t<td width=\"33%\"><input type=\"text\" name=\"acct_nm\" value=\"");
      out.print(obox.get("acct_nm"));
      out.write("\" maxlength=\"50\" title=\"계정과목명\" class=\"form-control required\" onChange=\"if(isEmpty(document.main.abbr_nm)) document.main.abbr_nm.value=this.value;\" style=\"width:60%\"></td>\r\n");
      out.write("\t\t\t<th width=\"17%\">약칭</th>\r\n");
      out.write("\t\t\t<td width=\"33%\"><input type=\"text\" name=\"abbr_nm\" value=\"");
      out.print(obox.get("abbr_nm"));
      out.write("\" maxlength=\"30\" title=\"계정과목명(약칭)\" class=\"form-control required\" style=\"width:60%\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th style=\"height:100px\">계정과목설명</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\"><textarea name=\"acct_desc\" class=\"form-control\" style=\"height:90px;width:100%\">");
      out.print(obox.get("acct_desc"));
      out.write("</textarea></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>계정과목구분</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"acct_class\" title=\"계정과목구분\" class=\"bs-select form-control required\" style=\"width:120px;\">\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("acct_class").equals("1")?"selected":"");
      out.write(">자산</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("acct_class").equals("2")?"selected":"");
      out.write(">부채</option>\r\n");
      out.write("\t\t\t\t\t<option value='3' ");
      out.print(obox.get("acct_class").equals("3")?"selected":"");
      out.write(">자본</option>\r\n");
      out.write("\t\t\t\t\t<option value='6' ");
      out.print(obox.get("acct_class").equals("6")?"selected":"");
      out.write(">수익</option>\r\n");
      out.write("\t\t\t\t\t<option value='7' ");
      out.print(obox.get("acct_class").equals("7")?"selected":"");
      out.write(">비용</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>차대구분</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"cd_flag\" title=\"차대구분\" class=\"bs-select form-control required\" style=\"width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("cd_flag").equals("1")?"selected":"");
      out.write(">차변</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("cd_flag").equals("2")?"selected":"");
      out.write(">대변</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>잔액관리</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"balance_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("balance_flag").compareTo("1")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("balance_flag").equals("1")?"selected":"");
      out.write(">차변</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("balance_flag").equals("2")?"selected":"");
      out.write(">대변</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>비용귀속부서</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=cost_dept_flag class=\"bs-select form-control\" style=\"");
      out.print(obox.get("cost_dept_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("cost_dept_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("cost_dept_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>거래처</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"cust_cd_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("cust_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("cust_cd_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("cust_cd_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='3' ");
      out.print(obox.get("cust_cd_flag").equals("3")?"selected":"");
      out.write(">잔액관리</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>은행관리</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"bank_cd_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("bank_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("bank_cd_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("bank_cd_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>사번</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"empl_no_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("empl_no_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("empl_no_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("empl_no_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='3' ");
      out.print(obox.get("empl_no_flag").equals("3")?"selected":"");
      out.write(">잔액관리</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>\r\n");
      out.write("\t\t\t\t<select name=\"rel_no_type\" class=\"bs-select form-control\" style=\"width:80%\">\r\n");
      out.write("\t\t\t\t\t<option value=''>:: 관련번호 ::</option>\r\n");
      out.write("\t\t            ");
      out.print(CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("rel_no_type"),"rel_no_type","","","",""));
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"rel_no_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("rel_no_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("rel_no_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("rel_no_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='3' ");
      out.print(obox.get("rel_no_flag").equals("3")?"selected":"");
      out.write(">잔액관리</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr height=\"28\">\r\n");
      out.write("\t\t\t<th>발생일</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"issue_ymd_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("issue_ymd_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("issue_ymd_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("issue_ymd_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>만기일</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"finish_ymd_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("finish_ymd_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("finish_ymd_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("finish_ymd_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr height=\"28\">\r\n");
      out.write("\t\t\t<th>이자율</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"intr_rate_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("intr_rate_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("intr_rate_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("intr_rate_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>세율</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"tax_rate_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("tax_rate_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("tax_rate_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("tax_rate_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>증빙유형</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"vat_cd_flag\" class=\"bs-select form-control\" style=\"");
      out.print(obox.get("vat_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":"");
      out.write(";width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>해당없음</option>\r\n");
      out.write("\t\t\t\t\t<option value='1' ");
      out.print(obox.get("vat_cd_flag").equals("1")?"selected":"");
      out.write(">선택입력</option>\r\n");
      out.write("\t\t\t\t\t<option value='2' ");
      out.print(obox.get("vat_cd_flag").equals("2")?"selected":"");
      out.write(">필수입력</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>일반전표사용</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<select name=\"edit_yn\" class=\"bs-select form-control\" style=\"width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=\"Y\" ");
      out.print(obox.get("edit_yn").equals("Y")?"selected":"");
      out.write(">Yes</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"N\" ");
      out.print(obox.get("edit_yn").equals("N")?"selected":"");
      out.write(">No</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"edit_yn\" value=\"");
      out.print(obox.get("edit_yn"));
      out.write("\">\r\n");
      out.write("\t\t\t\t");
      out.print(obox.get("edit_yn").equals("Y")?"Yes":"No");
      out.write("\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>사용구분</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<select name=\"use_flag\" class=\"bs-select form-control\" style=\"width:120px\" onChange=\"changeObjectProperty(document.saveForm.del_reason, this.value=='X'?'enabled':'readonly')\">\r\n");
      out.write("\t\t\t\t\t<option value=\"A1\" ");
      out.print(obox.get("use_flag").equals("A1")?"selected":"");
      out.write(">주요계정</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"A2\" ");
      out.print(obox.get("use_flag").equals("A2")?"selected":"");
      out.write(">일반계정</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"B\" ");
      out.print(obox.get("use_flag").equals("B")?"selected":"");
      out.write(">내부관리계정</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"X\" ");
      out.print(obox.get("use_flag").equals("X")?"selected":"");
      out.write(">사용금지(폐지)</option>\r\n");
      out.write("\t\t\t\t</select>\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>폐지사유</th>\r\n");
      out.write("\t\t\t<td><input type=\"text\" class=\"form-control\" name=\"del_reason\" value=\"");
      out.print(obox.get("del_reason"));
      out.write("\" size=\"30\" maxlength=\"40\" title=\"폐지사유\" class=\"form-control\" ");
if(!obox.get("use_flag").equals("X")){
      out.write("readOnly");
}
      out.write("></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 if(!box.get("acct_cd").equals("")) { 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>적요코드</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("remark_cnt"));
      out.write(" 건&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"findRemarkCode(document.saveForm.acct_cd.value, document.saveForm.acct_nm.value);\">상세보기</button>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>최초등록일시</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\r\n");
 if(uSesEnt.use_auth.equals("SA")) { 
      out.write("\r\n");
      out.write("  \t<div class=\"table-bottom-control\">\r\n");
      out.write("  \t\t<span style=\"width:100%;\">\r\n");
      out.write("  \t\t\t<span style=\"float:right;\">\r\n");
      out.write("  \t\t\t\t<button type=\"button\" class=\"btn dark\" onclick=\"goSave();\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t  \t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete();\" style=\"display:");
      out.print(!box.get("acct_cd").equals("")?"":"none");
      out.write("\"><img src=\"/com/img/ico_btn_delete.png\">삭제</button>\r\n");
      out.write("\t\t    </span>\r\n");
      out.write("\t   </span>\r\n");
      out.write("\t</div>\t\t \r\n");
 } 
      out.write("\r\n");
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