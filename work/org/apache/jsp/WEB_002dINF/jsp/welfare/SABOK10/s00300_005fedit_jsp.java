/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-26 02:25:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.welfare.SABOK10;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class s00300_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/jsp/welfare/payGuide.jsp", Long.valueOf(1565714364000L));
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
      egovframework.cbiz.Box obox = null;
      obox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("obox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (obox == null){
        obox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("obox", obox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.Box rbox = null;
      rbox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("rbox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rbox == null){
        rbox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("rbox", rbox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
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
	String bank_cd;
	if(uSesEnt.dbo.equals("SABOK10")) {
		bank_cd="|bank_cd@@@@A||bank_cd@@@@C|";
	}else {
		bank_cd="|bank_cd@@@@A|";
	}
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "school_flag"+bank_cd+"family_rel_cd|","","","","","");
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }

      out.write("\r\n");
      out.write("<!-- 학자금 신청서 작성 -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif (formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tif(confirm('저장하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tdocument.saveForm.data01.value = document.saveForm.family_rel_cd.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data02.value = document.saveForm.family_nm.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data03.value = document.saveForm.family_reside_no.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data04.value = document.saveForm.school_nm.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data05.value = document.saveForm.school_flag.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data06.value = document.saveForm.major_nm.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data07.value = document.saveForm.school_year.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data08.value = document.saveForm.school_term.value;\r\n");
      out.write("\t\t\t");
 if(uSesEnt.dbo.equals("SABOK26")) { 
      out.write("\r\n");
      out.write("\t\t\t\tdocument.saveForm.data09.value = document.saveForm.grade_score.value;\r\n");
      out.write("\t\t\t\tdocument.saveForm.data10.value = document.saveForm.pay_amt.value;\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tdocument.saveForm.action = 'wel01003_update.do';\r\n");
      out.write("\t\t\t\tdocument.saveForm.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.saveForm.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\tfunction goCancel() {\r\n");
      out.write("\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\tdocument.saveForm.action = 'wel01002_select.do';\r\n");
      out.write("\t\tdocument.saveForm.target = '_self';\r\n");
      out.write("\t\tdocument.saveForm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeFamilyId(family_id) {\r\n");
      out.write("\t\tif(family_id == '') { return; }\r\n");
      out.write("\t\tvar family_value = document.saveForm.family_id.options[document.saveForm.family_id.options.selectedIndex].title;\r\n");
      out.write("\t\tvar arr = family_value.split('|');\r\n");
      out.write("\t\tdocument.saveForm.family_rel_cd.value = arr[0];\r\n");
      out.write("\t\tdocument.saveForm.family_nm.value = arr[1];\r\n");
      out.write("\t\tdocument.saveForm.family_reside_no.value = arr[2];\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction findEmployeeNoPost(empl_no, empl_nm) {\r\n");
      out.write("\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\tdocument.saveForm.apply_no.value = '';\r\n");
      out.write("\t\tdocument.saveForm.empl_no.value = empl_no;\r\n");
      out.write("\t\tdocument.saveForm.empl_nm.value = empl_nm;\r\n");
      out.write("\t\tdocument.saveForm.action = \"wel01003_edit.do\";\r\n");
      out.write("\t\tdocument.saveForm.target = \"_self\";\r\n");
      out.write("\t\tdocument.saveForm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"bugt_cd\" \tvalue=\"");
      out.print(box.get("bugt_cd"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_no\" \tvalue=\"");
      out.print(box.get("apply_no"));
      out.write("\">\r\n");
for(int i=1;i<=15;i++){
      out.write("<input type=\"hidden\" name=\"data");
      out.print(StringUtil.lpad(String.valueOf(i),"0",2));
      out.write("\" value=\"\">");
}
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
 if(!rbox.get("pay_guide").equals("")) { 
      out.write("\r\n");
      out.write("<div class=\"table-scrollable\">\r\n");
      out.write("\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>");
      out.print(rbox.get("bugt_nm"));
      out.write("</th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td class=\"t-left\">");
      out.print(rbox.get("pay_guide",Box.MULTILINE_TEXT));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
 } 
      out.write("\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover marB5\">\r\n");
      out.write("\t");
 if(uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>사원선택</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<div class=\"input-group input-medium\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"empl_nm\" value=\"");
      out.print(obox.get("empl_nm",Box.SPECIAL_CHAR));
      out.write("\" class=\"form-control\" style=\"width:90px\" readOnly>\r\n");
      out.write("\t\t\t\t\t<span class=\"input-group-btn\"><button type=\"button\" class=\"btn dark\" onClick=\"findEmployeeNo('')\"><i class=\"fa fa-search\"></i></button></span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>사번/성명</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("empl_no"));
      out.write("&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t<a href=\"javascript:goEmployeePop('");
      out.print(obox.get("empl_no"));
      out.write("')\"><b>");
      out.print(obox.get("empl_nm"));
      out.write("</b></a>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"empl_no\" value=\"");
      out.print(obox.get("empl_no"));
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>부서</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("dept_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"15%\">주민번호</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">");
      out.print(FormatUtil.juminNo(obox.get("reside_no"),"x"));
      out.write("</td>\r\n");
      out.write("\t\t\t<th width=\"15%\">직위</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">");
      out.print(obox.get("position_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>입사일자</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("entry_ymd",Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t<th>사원구분</th>\r\n");
      out.write("\t\t\t<td>");
      out.print(obox.get("empl_class_nm"));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"table table-view table-bordered table-cover marB5\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>학교명</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"school_nm\" value=\"");
      out.print(obox.get("school_nm"));
      out.write("\" size=\"10\" maxlength=\"30\" title=\"학교명\" class=\"form-control required\" style=\"width:70px\">\r\n");
      out.write("\t\t\t");
 if(uSesEnt.dbo.equals("SABOK26")) { 
      out.write("\r\n");
      out.write("\t\t\t\t대학교<input type=\"hidden\" name=\"school_flag\" value=\"5\">\r\n");
      out.write("\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t<select name=\"school_flag\" title=\"학교\" class=\"bs-select form-control required\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>:: 학교선택 ::</option>\r\n");
      out.write("\t\t            ");
      out.print(CodeUtil.optList(codeWp, "school_flag", obox.get("school_flag")));
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t    ");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t&nbsp;<input type=\"text\" name=\"school_year\" value=\"");
      out.print(obox.get("school_year"));
      out.write("\" size=\"2\" maxlength=\"1\" title=\"학년\" class=\"form-control required\" style=\"width:25px\"> 학년\t\t\t\t\t\r\n");
      out.write("\t\t\t\t&nbsp;&nbsp;<input type=\"text\" name=\"school_term\" value=\"");
      out.print(obox.get("school_term"));
      out.write("\" size=\"2\" maxlength=\"1\" title=\"학기\" class=\"form-control\" style=\"width:25px\"> 학기\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\t\r\n");
      out.write("\t\t<tr>\t\r\n");
      out.write("\t\t\t<th width=\"15%\">학과</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"major_nm\" value=\"");
      out.print(obox.get("major_nm"));
      out.write("\" size=\"20\" maxlength=\"20\" title=\"학과\" class=\"form-control\" style=\"width:140px\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th width=\"15%\">대상자</th>\r\n");
      out.write("\t\t\t<td width=\"35%\">\r\n");
      out.write("\t\t\t");
 if(uSesEnt.dbo.equals("SABOK26")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<select name=\"family_rel_cd\" class=\"required\" title=\"가족관계\" class=\"bs-select form-control\" style=\"width:70px;\">\r\n");
      out.write("\t\t\t\t\t<option value='40' ");
      out.print(obox.get("family_rel_cd").equals("40")?"selected":"");
      out.write(">자녀</option>\r\n");
      out.write("\t\t        </select>&nbsp;\r\n");
      out.write("\t\t        <input type=\"text\" name=\"family_nm\" value=\"");
      out.print(obox.get("family_nm"));
      out.write("\" class=\"form-control required\" style=\"width:120px\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"family_reside_no\" value=\"");
      out.print(obox.get("family_reside_no"));
      out.write("\">\r\n");
      out.write("\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t<select name=\"family_id\" title=\"대상자 선택\" class=\"bs-select form-control required\" style=\"width:110px\" onChange=\"changeFamilyId(this.value)\">\r\n");
      out.write("\t\t\t\t\t<option value=''>:: 선택 ::</option>\r\n");
      out.write("\t\t\t\t");
 RsWrapper familyWp = CodeUtil.getRsWrapper("PR_INSTB_EMPL12_LIST","LISTCODE", "", obox.get("empl_no"),"00","","","",uSesEnt.dbo);
					for(int i=0; i < familyWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<option value='");
      out.print(familyWp.get("code",i));
      out.write('\'');
      out.write(' ');
      out.print(StringUtil.arrayCol(familyWp.get("optkey",i),2,"|").equals(obox.get("family_nm"))?"selected":"");
      out.write(" title='");
      out.print(familyWp.get("optkey",i));
      out.write('\'');
      out.write('>');
      out.print(familyWp.get("data",i));
      out.write("</option>\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"family_rel_cd\" \tvalue=\"");
      out.print(obox.get("family_rel_cd"));
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"family_nm\" \t\tvalue=\"");
      out.print(obox.get("family_nm"));
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"family_reside_no\" value=\"");
      out.print(obox.get("family_reside_no"));
      out.write("\">\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 if(uSesEnt.dbo.equals("SABOK26")) { 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>학점</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"grade_score\" value=\"");
      out.print(obox.get("grade_score"));
      out.write("\" size=\"13\" maxlength=\"10\" title=\"학점\" class=\"form-control required\" style=\"width:90px;\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>납부금액</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"pay_amt\" value=\"");
      out.print(obox.get("pay_amt"));
      out.write("\" size=\"13\" maxlength=\"10\" title=\"납부금액\"  class=\"form-control required tMONEY\" style=\"width:90px;\" > 원\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>신청일자</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"apply_ymd\" value=\"");
      out.print(box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd"));
      out.write("\" maxlength=\"8\" title=\"신청일자\" class=\"form-control required tYMD\" ");
      out.print(isEditable?"":"readonly");
      out.write(">\r\n");
      out.write("\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>신청금액</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"apply_amt\" value=\"");
      out.print(obox.get("apply_amt"));
      out.write("\" size=\"13\" maxlength=\"10\" title=\"신청금액\" class=\"form-control required\" style=\"width:90px\"> 원\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>계좌번호</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<select name=\"bank_cd\" title=\"금융기관\" ");
if(!uSesEnt.corp_cd.equals("SABOK27")){
      out.write("class=\"bs-select form-control required\"");
}
      out.write(" style=\"width:120px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>:: 금융기관 선택 ::</option>\r\n");
      out.write("\t\t            ");
      out.print(CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd")));
      out.write("\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"account_no\" value=\"");
      out.print(obox.get("account_no"));
      out.write("\" size=\"18\" maxlength=\"30\" title=\"계좌번호\" ");
if(!uSesEnt.corp_cd.equals("SABOK27")){
      out.write("class=\"form-control required\"");
}
      out.write(" style=\"width:120px\">&nbsp;예금주 :\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"account_owner\" value=\"");
      out.print(obox.get("account_owner"));
      out.write("\" size=\"10\" maxlength=\"15\" title=\"예금주\" ");
if(!uSesEnt.corp_cd.equals("SABOK27")){
      out.write("class=\"form-control required\"");
}
      out.write(" style=\"width:90px\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>비고</th>\r\n");
      out.write("\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"etc_remark\" value=\"");
      out.print(obox.get("etc_remark"));
      out.write("\" maxlength=\"120\" title=\"비고\" class=\"form-control\" style=\"width:90%\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\t\t\t\t\r\n");
      out.write("\t");
 if(!box.get("apply_no").equals("")) { 
      out.write("\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th>전표번호</th>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t");
if(!obox.get("slip_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goSlipViewer('&slip_no=");
      out.print(obox.get("slip_no"));
      out.write("');\">");
      out.print(obox.get("slip_no",Box.SLIP_NO));
      out.write("</a>\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"slip_no\" \tvalue=\"");
      out.print(obox.get("slip_no"));
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"sign_status\" value=\"");
      out.print(obox.get("sign_status"));
      out.write("\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<th>결재상태</th>\r\n");
      out.write("\t\t\t<td><b><font color=red>");
      out.print(obox.get("sign_status_nm"));
      out.write("</font></b></td>\r\n");
      out.write("  \t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write('\r');
      out.write('\n');
      out.write('	');
 if(uSesEnt.dbo.equals("SABOK26")) { 
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"4\" style=\"padding:5 5 5 5;\">\r\n");
      out.write("\t\t\t\t* 학자금 : 입학금, 수업료, 학생회비<br>\r\n");
      out.write("\t\t\t\t* 첨부서류 : 가족관계증명서(최초1회만 제출), 해당학기 성적표 사본, 공납금고지서 사본\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span class=\"f-right\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goSave()\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t");
if(!box.get("apply_no").equals("")){
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goCancel()\"><img src=\"/com/img/ico_btn_refresh_edit.png\">취소</button>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
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
