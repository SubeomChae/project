/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-02 11:14:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.finance;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class fin11002_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "acct_cd|bank_cd@@@@A|","","","","",""); 
      out.write("\r\n");
      out.write("<!-- 예적금 계좌관리 -->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\"> \r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif (formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('저장하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask('#main');\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"fin11002_update.do\",\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\ttoastPop1('저장되었습니다.');\r\n");
      out.write("\t\t\t\t\t\tgoSearch();\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDelete() {\r\n");
      out.write("\t\tif (formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask('#main');\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"fin11002_delete.do\",\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\talert('삭제되었습니다.');\r\n");
      out.write("\t\t\t\t\t\tgoSearch('');\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDetail(account_no) {\r\n");
      out.write("\t\tparent.location.href = 'fin03011_list.do?account_no='+account_no; \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction change_acct_cd(acct_cd) {\r\n");
      out.write("\t\tif(acct_cd.indexOf('11101') >= 0) { // 보통예금\r\n");
      out.write("\t\t\tdocument.getElementById('repAccountArea').style.display = '';\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tfor(var i=0; i < document.main.rep_account.length; i++) {\r\n");
      out.write("\t\t\t\tdocument.main.rep_account[i].checked = false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tdocument.getElementById('repAccountArea').style.display = 'none';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(acct_cd.indexOf('11103') >= 0 || acct_cd.indexOf('12101') >= 0) { // 정기예금, 정기적금 \r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.close_ymd, 'required');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.deposit_amt, 'required');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.intr_rate, 'required');\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.close_ymd, 'enabled');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.deposit_amt, 'readonly');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.main.intr_rate, 'enabled');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction page_init() {\r\n");
      out.write("\t\tchange_acct_cd('");
      out.print(obox.get("acct_cd"));
      out.write("');\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" action=\"\" class=\"fType\">\r\n");
      out.write("<input type=\"hidden\" name=\"account_no\"  value=\"");
      out.print(box.get("account_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"action_type\"\tvalue=\"");
      out.print(box.get("account_no").equals("")?"INSERT":"UPDATE");
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>계좌번호</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t");
 if(box.get("account_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"account_no\" value=\"");
      out.print(obox.get("account_no"));
      out.write("\" maxlength=\"30\"  class=\"required form-control\"  title=\"계좌번호\" style=\"width:140px;border:1 solid gray\">\r\n");
      out.write("\t\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<b>");
      out.print(obox.get("account_no"));
      out.write("</b><input type=\"hidden\" name=\"account_no\" value=\"");
      out.print(obox.get("account_no"));
      out.write("\">\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>은행명</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"bank_cd\" title=\"은행명\"  class=\"required form-control\"  style=\"width:140px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd")));
      out.write("\r\n");
      out.write("\t\t \t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>예적금유형</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"acct_cd\" title=\"예적금유형\"  class=\"required form-control\"  style=\"width:140px\" onChange=\"change_acct_cd(this.value)\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(CodeUtil.optList("PR_ACCTB_CODE01_LIST","LISTCODE",obox.get("acct_cd"),"1","","11","","",uSesEnt.dbo));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>거래처코드</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<div class=\"input-group input-medium\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"cust_nm\" value=\"");
      out.print(obox.get("cust_nm"));
      out.write("\" widht=\"30\" maxlength=\"50\" title=\"거래처명\"  class=\"form-control required\"  style=\"width:300px\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"input-group-btn\"><button type=\"button\" class=\"btn dark\" onClick=\"find_cust_code('&cust_type=30')\"><i class=\"fa fa-search\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"cust_cd\" value=\"");
      out.print(obox.get("cust_cd"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"20%\">개설일자</th>\r\n");
      out.write("\t\t\t\t<td width=\"30%\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t    <div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(obox.get("open_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"open_ymd\" name=\"open_ymd\" value=\"");
      out.print(obox.get("open_ymd"));
      out.write("\" maxlength=\"8\" title=\"개설일자\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th width=\"20%\">만기일자</th>\r\n");
      out.write("\t\t\t\t<td width=\"30%\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"");
      out.print(obox.get("close_ymd",Box.DEF_DATE_FMT));
      out.write("\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"close_ymd\" name=\"close_ymd\" value=\"");
      out.print(obox.get("close_ymd"));
      out.write("\" maxlength=\"8\" title=\"만기일자\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>금액</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"deposit_amt\" value=\"");
      out.print(obox.get("deposit_amt"));
      out.write("\" maxlength=\"13\" title=\"금액\" class=\"form-control tMONEY\" style=\"width:100px\"> 원\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th>이자율</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"intr_rate\" value=\"");
      out.print(obox.get("intr_rate"));
      out.write("\" title=\"이자율\" class=\"form-control tFMONEY\" style=\"width:100px\"> %\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>비고</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<textarea name=\"etc_remark\" class=\"form-control\" style=\"height:70px;width:100%\">");
      out.print(obox.get("etc_remark"));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr id=\"repAccountArea\">\r\n");
      out.write("\t\t\t\t<th>(대표)결제계좌</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<div class=\"mt-checkbox-inline\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"mt-checkbox mt-checkbox-outline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"rep_account\" value=\"S\" ");
      out.print(obox.get("rep_account").indexOf("S")>=0 ? "checked":"");
      out.write(">목적사업\r\n");
      out.write("\t\t\t\t\t\t\t<span></span>\r\n");
      out.write("\t\t\t\t\t\t</label>\r\n");
      out.write("\t\t\t\t\t\t<label class=\"mt-checkbox mt-checkbox-outline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"rep_account\" value=\"L\" ");
      out.print(obox.get("rep_account").indexOf("L")>=0 ? "checked":"");
      out.write(">대부사업\r\n");
      out.write("\t\t\t\t\t\t\t<span></span>\r\n");
      out.write("\t\t\t\t\t\t</label>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>사용여부</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<select name=\"use_yn\" style=\"width:80px\" class=\"bs-select form-control\" >\r\n");
      out.write("\t\t\t\t\t\t<option value='Y' ");
      out.print(obox.get("use_yn").equals("Y")?"selected":"");
      out.write(">예</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='N' ");
      out.print(obox.get("use_yn").equals("N")?"selected":"");
      out.write(">아니오</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t<span class=\"f-right marR5\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goSave()\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t\t\t");
if(!box.get("apply_no").equals("")){
      out.write("\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDelete()\"><img src=\"/com/img/ico_btn_delete.png\">삭제</button>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</span>\r\n");
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
