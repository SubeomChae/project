/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 01:05:52 UTC
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
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class lon11001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); 
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
      out.write('\r');
      out.write('\n');
 if(!box.get("excel_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<!-- 대부금 월별 상환 -->\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tdocument.main.page_count.value = '';\r\n");
      out.write("\t\t\tvar theURL = 'lon11001_list.do';\r\n");
      out.write("\t\t\tif(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }\r\n");
      out.write("\t\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\t\tdocument.main.action = theURL;\r\n");
      out.write("\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goPage(page_count) {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tdocument.main.page_count.value = page_count;\r\n");
      out.write("\t\t\tvar theURL = 'lon11001_list.do';\r\n");
      out.write("\t\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\t\tdocument.main.action = theURL;\r\n");
      out.write("\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goCalculate() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(document.main.ib_changed.value == 'Y') {\r\n");
      out.write("\t\t\t\talert('검색조건이 변경되었습니다. 다시 검색하신 후, 이자계산을 하시기 바랍니다.');\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(confirm('");
      out.print(box.get("std_yy"));
      out.write('년');
      out.write(' ');
      out.print(box.get("std_mm"));
      out.write("월 대부금 이자계산을 하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\t\t\tdocument.main.action = 'lon11001_calculate.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDeleteAll() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('");
      out.print(box.get("std_yy"));
      out.write('년');
      out.write(' ');
      out.print(box.get("std_mm"));
      out.write("월 대부금 상환자료를 전체 삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\t\t\tdocument.main.action = 'lon11001_delete.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goCreateSlip() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(document.main.ib_changed.value == 'Y') {\r\n");
      out.write("\t\t\t\talert('검색조건이 변경되었습니다. 다시 검색하신 후, 전표분개를 하시기 바랍니다.');\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(isEmpty(document.main.cha_acct_cd)) {\r\n");
      out.write("\t\t\t\talert('입금계정이 선택되지 않았습니다.');\r\n");
      out.write("\t\t\t\tdocument.main.cha_acct_cd.focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(isEmpty(document.main.account_no1)) {\r\n");
      out.write("\t\t\t\talert('원금 계좌번호가 선택되지 않았습니다.');\r\n");
      out.write("\t\t\t\tdocument.main.account_no1.focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else if(isEmpty(document.main.account_no2)) {\r\n");
      out.write("\t\t\t\talert('이자 계좌번호가 선택되지 않았습니다.');\r\n");
      out.write("\t\t\t\tdocument.main.account_no2.focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(confirm('전표분개하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tdocument.main.action = 'lon11001_create_slip.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeAcctCd(acct_cd) {\r\n");
      out.write("\t\tdocument.main.account_no1.options.length=0;\r\n");
      out.write("\t\tdocument.main.account_no2.options.length=0;\r\n");
      out.write("\t\tif(acct_cd != '') {\r\n");
      out.write("\t\t\tsetOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.main.account_no1, '', acct_cd, '', '', '', '', ':: 원금 계좌번호 선택 ::');\r\n");
      out.write("\t\t\tcopyOptions(document.main.account_no1, document.main.account_no2, '');\r\n");
      out.write("\t\t\tdocument.main.account_no2.options[0].text = ':: 이자 계좌번호 선택 ::';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction signRequestPost() { goSearch('N'); }\r\n");
      out.write("\r\n");
      out.write("\t// 대부금 상환기준\r\n");
      out.write("\tfunction goRefundCond() {\r\n");
      out.write("\t\tvar params = '&std_yy='+");
      out.print(box.get("std_yy"));
      out.write("\r\n");
      out.write("\t\tpopupOpen(\"/loan/pd/lon13001_list.do?1=1\"+params, \"lon13001\", 530, 550);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goUpload() {\r\n");
      out.write("    \tvar file_nm = document.main.upload_file.value;\r\n");
      out.write("    \tvar file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();\r\n");
      out.write("    \tif(file_type != 'xls') {\r\n");
      out.write("    \t\talert('파일형식이 옳바르지 않습니다.\\n\\n[xls 형식만 업로드 가능)');\r\n");
      out.write("    \t\treturn;\r\n");
      out.write("    \t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(confirm('");
      out.print(box.get("std_yy"));
      out.write('년');
      out.write(' ');
      out.print(box.get("std_mm"));
      out.write("월 대부금 상환자료를 업로드하시겠습니까?')) {\r\n");
      out.write("\t\t\tajaxSubmitForm(\"lon11001_upload.do?pay_key=");
      out.print(box.get("std_yy"));
      out.print(box.get("std_mm"));
      out.write("\",\"#main\", function(rtn) {\r\n");
      out.write("\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\talert('업로드되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch('');\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t$(\"#uploadFile\").val('');\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" enctype=\"multipart/form-data\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"ib_changed\" \t\tvalue=\"N\">\r\n");
      out.write("<input type=\"hidden\" name=\"pathKey\"\t\t\tvalue=\"temp\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_nm\"\t\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_path\"\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"page_count\"\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"excel_file_nm\" \tvalue=\"대부금월별상환\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">대부금 월별 상환\r\n");
      out.write("\t\t<div class=\"form-inline f-right marT10>\r\n");
      out.write("\t\t");
 if(uSesEnt.use_auth.startsWith("S")) { 
      out.write("\r\n");
      out.write("\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" id=\"btnDownFile\" class=\"btn btn-primary\" onclick=\"fileDownload(document.main, 'loanTemplate.xls', 'loanTemplate.xls')\"><img src=\"/com/img/ico_btn_excel.png\">대부금 월별 상환 입력템플릿 다운로드</button>\r\n");
      out.write("\t\t\t\t<label id=\"btnUpFile\" class=\"btn btn-primary marL5\" for=\"uploadFile\"><img src=\"/com/img/ico_btn_save.png\"> 업로드</label>\r\n");
      out.write("\t\t\t\t<input type=\"file\" id=\"uploadFile\" name=\"uploadFile\" onChange=\"goUpload()\" style=\"position:absolute; clip:rect(0, 0, 0, 0);\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t \t");
 } 
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t<col style=\"width:20%\">\r\n");
      out.write("\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t<col style=\"width:30%\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">기준년월</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"std_yy\" title=\"기준년도\" class=\"bs-select form-control\" style=\"width:120px\" onChange=\"document.main.ib_changed.value='Y';\">\r\n");
      out.write("            \t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("std_yy"),"2009",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>&nbsp;\r\n");
      out.write("\t\t\t\t\t<select name=\"std_mm\" title=\"기준월\" class=\"bs-select form-control\" style=\"width:90px\" onChange=\"goSearch('N')\">\r\n");
      out.write("            \t\t\t");
      out.print(DateUtil.getMonthOptionTag(box.get("std_mm"),"월"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select> \r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"refund_ymd\" \tvalue=\"");
      out.print(obox.get("refund_ymd"));
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">대부종류</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"bugt_cd\" title=\"대부종류\" class=\"bs-select form-control\" style=\"width:150px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>전체</option>\r\n");
      out.write("\t\t\t            ");
      out.print(CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",box.get("bugt_cd"),"1","L","","","",uSesEnt.dbo));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">\r\n");
      out.write("\t\t\t\t\t<select name=\"search_key\" class=\"bs-select form-control\" style=\"width:95%\">\r\n");
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
      out.write("\" class=\"form-control\" style=\"width:150px;ime-mode:active;\" onkeydown=\"if(event.keyCode == 13) goSearch('');\">\r\n");
      out.write("\t\t\t\t\t<span class=\"f-right marR50\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('E');\"><img src=\"/com/img/ico_btn_excel.png\">엑셀</button>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">월별상환기준</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\">\r\n");
      out.write("\t\t  \t\t");
 if(!obox.get("refund_ymd").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t기산일 : ");
      out.print(obox.get("start_ymd",Box.DEF_DATE_FMT));
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(obox.get("end_ymd",Box.DEF_DATE_FMT));
      out.write(' ');
      out.write('(');
      out.print(obox.get("intr_ilsu"));
      out.write("일), &nbsp;&nbsp;공제회수 : ");
      out.print(obox.get("gongje_cnt"));
      out.write("회\r\n");
      out.write("\t\t  \t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t  \t\t\t미등록\r\n");
      out.write("\t\t  \t\t");
 } 
      out.write("&nbsp;\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goRefundCond()\">수정</button>\r\n");
      out.write("\t\t  \t\t");
 if(!obox.get("refund_ymd").equals("") && !obox.get("sign_status").equals("2") && !obox.get("sign_status").equals("3")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goCalculate()\">이자계산</button>\r\n");
      out.write("\t\t  \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t  \t\t");
 if(obox.getInt("refund_cnt") > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goDeleteAll()\">전체삭제</button>\r\n");
      out.write("\t\t  \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t    </td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t\t");
 if(obox.getInt("refund_cnt") > 0) { 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">전표번호</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\">\r\n");
      out.write("\t\t\t\t");
 if(obox.get("slip_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<select name=\"cha_acct_cd\" title=\"입금계정\" class=\"bs-select form-control\" style=\"width:110px\" onChange=\"changeAcctCd(this.value);\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>:: 입금계정 ::</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='1110103'>보통예금</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='1110105'>기업자유예금</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"account_no1\" title=\"원금계좌번호\" class=\"bs-select form-control\" style=\"width:170px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>:: 원금 계좌번호 선택 ::</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"account_no2\" title=\"이자계좌번호\" class=\"bs-select form-control\" style=\"width:170px\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>:: 이자 계좌번호 선택 ::</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goCreateSlip()\">전표분개</button>\r\n");
      out.write("\t\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"slip_no\" value=\"");
      out.print(obox.get("slip_no"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goSlipViewer('&slip_no=");
      out.print(obox.get("slip_no"));
      out.write("');\"><b>");
      out.print(obox.get("slip_no",Box.SLIP_NO));
      out.write("</b></a>\r\n");
      out.write("\t\t\t\t\t&nbsp;(<font color=red><b>");
      out.print(obox.get("sign_status_nm"));
      out.write("</b></font>)\r\n");
      out.write("\t\t\t\t\t");
 if(obox.get("sign_status").equals("1")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSignRequest(document.signForm);\">기안문작성</button>\r\n");
      out.write("\t\t\t\t\t");
 }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);\">결재라인</button>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\t\r\n");
      out.write("</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<div class=\"notice-view\">\r\n");
      out.write("\t\t  \t");
 if(obox.getInt("refund_cnt") > 0) { 
      out.write("\r\n");
      out.write("\t\t  \t\t<span style=\"color:#01a1db;\">대상자 : </span> ");
      out.print(obox.get("refund_cnt",Box.THOUSAND_COMMA));
      out.write("명,&nbsp;\r\n");
      out.write("\t\t  \t\t<span style=\"color:#01a1db;\">원금상환 : </span> ");
      out.print(obox.get("refund_sum",Box.THOUSAND_COMMA));
      out.write("원,&nbsp;\r\n");
      out.write("\t\t  \t\t<span style=\"color:#01a1db;\">이자상환 : </span> ");
      out.print(obox.get("intr_sum",Box.THOUSAND_COMMA));
      out.write("원\r\n");
      out.write("\t\t  \t");
 }else { 
      out.write("\r\n");
      out.write("\t\t  \t\t<span style=\"color:#01a1db;\">대부종류를 클릭</span>하면 해당 대부금의 세부내용을 조회할 수 있습니다.\r\n");
      out.write("\t\t  \t");
 } 
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"divArea\" class=\"table-scrollable\" style=\"height:calc(100vh - 220px);overflow-x:auto;overflow-y:auto\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\" style=\"width:1880px !important\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:40px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:120px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:120px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:100px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:100px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:100px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:100px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:80px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:200px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:70px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:70px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:70px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:70px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:90px\">\r\n");
      out.write("\t\t\t\t<col style=\"width:100px\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">No</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">사번</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">성명</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">부서</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">대부종류</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">대부일자</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">대부금액</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">1회<br>상환금액</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">공제전<br>상환금액</th>\r\n");
      out.write("\t\t\t\t\t<th colspan=\"7\">이자계산</th>\r\n");
      out.write("\t\t\t\t\t<th colspan=\"3\">당월공제</th>\r\n");
      out.write("\t\t\t\t\t<th rowspan=\"2\">공제후<br>대부잔액</th>\r\n");
      out.write("          \t\t</tr> \r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>공제전<br>대부잔액</th>\r\n");
      out.write("\t\t\t\t\t<th>이자율</th>\r\n");
      out.write("\t\t\t\t\t<th>이자기산일</th>\r\n");
      out.write("\t\t\t\t\t<th>일수</th>\r\n");
      out.write("\t\t\t\t\t<th>구분</th>\r\n");
      out.write("\t\t\t\t\t<th>공제</th>\r\n");
      out.write("\t\t\t\t\t<th>회수</th>\r\n");
      out.write("\t\t\t\t\t<th>원금</th>\r\n");
      out.write("\t\t\t\t\t<th>이자</th>\r\n");
      out.write("\t\t\t\t\t<th>계</th>\r\n");
      out.write("          \t\t</tr> \r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t\t<tbody>\r\n");
      out.write("\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr><td colspan=\"20\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t");
 }else {
				for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr height=\"25\" onMouseOver=\"this.className='btnover'\" onMouseOut=\"this.className='btnbase'\" class=\"buttonbase\"> \r\n");
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
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("loan_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("unit_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("pre_refund_sum",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(rsWp.getLong("loan_amt",i)-rsWp.getLong("pre_refund_sum",i))));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("intr_rate",i));
      out.write("%</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("start_ymd",i,Box.DEF_DATE_FMT));
      out.write(' ');
      out.write('~');
      out.write(' ');
      out.print(rsWp.get("end_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("intr_ilsu",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("defer_yn",i).equals("Y")?"거치":"상환");
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("gongje_cnt",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("cur_refund_cnt",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("cur_refund_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("cur_intr_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("cur_gongje_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(rsWp.getLong("loan_amt",i)-rsWp.getLong("pre_refund_sum",i)-rsWp.getLong("cur_refund_amt",i))));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
 if(!box.get("excel_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.print(PageUtil.makePaging(box, rsWp, 30, request));
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<form name=\"signForm\" method=\"post\" action=\"\" style=\"display:none\">\r\n");
      out.write("<input type=\"hidden\" name=\"send_empl_no\" \tvalue=\"");
      out.print(uSesEnt.empl_no);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"subject\" \t\tvalue=\"대부금 정기상환(");
      out.print(obox.get("std_ym",Box.DEF_DATE_FMT));
      out.write(")\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_type\" \t\tvalue=\"SLP007\">\r\n");
      out.write("<input type=\"hidden\" name=\"search_key\" \t\tvalue=\"ACCTB_SLIP01|");
      out.print(obox.get("slip_no"));
      out.write("|L21|");
      out.print(obox.get("std_ym"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"etc_remark\"\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"refund_cnt\"\t\tvalue=\"");
      out.print(obox.get("refund_cnt",Box.THOUSAND_COMMA));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"refund_sum\"\t\tvalue=\"");
      out.print(obox.get("refund_sum",Box.THOUSAND_COMMA));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"intr_sum\"\t\tvalue=\"");
      out.print(obox.get("intr_sum",Box.THOUSAND_COMMA));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"std_yy\"\t\t\tvalue=\"");
      out.print(box.get("std_yy"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"std_mm\"\t\t\tvalue=\"");
      out.print(box.get("std_mm"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"nextUrl\" \t\tvalue=\"\">\r\n");
      out.write("</form>\r\n");
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
