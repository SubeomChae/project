/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 02:45:44 UTC
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
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class crd11001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("<!-- 복지카드 정산 -->\r\n");
 if(!box.get("excel_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch(gbn) {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tvar theURL = 'crd11001_list.do';\r\n");
      out.write("\t\t\tif(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }\r\n");
      out.write("\t\r\n");
      out.write("\t\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t\t\tdocument.main.action = theURL;\r\n");
      out.write("\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goUpload() {\r\n");
      out.write("    \tvar file_nm = document.main.upload_file.value;\r\n");
      out.write("    \tvar file_type = file_nm.substring(file_nm.lastIndexOf('.')+1).toLowerCase();\r\n");
      out.write("    \tif(file_type != 'xls') {\r\n");
      out.write("    \t\talert('파일형식이 옳바르지 않습니다.\\n\\n[xls 형식만 업로드 가능)');\r\n");
      out.write("    \t\treturn;\r\n");
      out.write("    \t}\r\n");
      out.write("    \t\r\n");
      out.write("    \tif(confirm('청구서파일을 업로드하시겠습니까?')) {\r\n");
      out.write("\t\t\tajaxSubmitForm(\"crd11001_upload.do\",\"#main\", function(rtn) {\r\n");
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
      out.write("\t\t\r\n");
      out.write("\tfunction goCreateSlip() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('복지카드 정산전표를 생성하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#main\");\r\n");
      out.write("\t\t\t\tdocument.main.action = 'crd11001_create_slip.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDeleteAll() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm('");
      out.print(box.get("apply_yy"));
      out.write('년');
      out.write(' ');
      out.print(box.get("apply_mm"));
      out.write("월 복지카드 청구서를 전체 삭제하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\t\t\tdocument.main.action = 'crd11001_delete_all.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction sign_request_post() { \r\n");
      out.write("\t\tgoSearch('N'); \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" enctype=\"multipart/form-data\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"pathKey\"\t\tvalue=\"temp\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_nm\"\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_path\"\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"select_yn\" \tvalue=\"Y\">\r\n");
      out.write("<input type=\"hidden\" name=\"excel_file_nm\" \tvalue=\"복지카드 정산\">\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"page-title\">복지카드 정산</h1>\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"td-head\">청구년월</td>\r\n");
      out.write("\t\t\t\t<td width=\"35%\" nowrap>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-inline f-left marL5\">\r\n");
      out.write("\t\t\t\t\t\t<select name=\"apply_yy\" title=\"청구년도\" class=\"bs-select form-control\" style=\"width:90px\" onChange=\"goSearch('N')\">\r\n");
      out.write("\t            \t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("apply_yy"),"2010",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t<select name=\"apply_mm\" title=\"청구월\" class=\"bs-select form-control\" style=\"width:70px\" onChange=\"goSearch('N')\">\r\n");
      out.write("\t            \t\t\t");
      out.print(DateUtil.getMonthOptionTag(box.get("apply_mm"),"월"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group marL10\">\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" id=\"btnDownFile\" class=\"btn btn-primary\" onclick=\"fileDownload(document.main, 'cardBillTemplate.xls', 'cardBillTemplate.xls')\"><img src=\"/com/img/ico_btn_excel.png\">업로드 양식 다운로드</button>\r\n");
      out.write("\t\t\t\t\t\t\t<label id=\"btnUpFile\" class=\"btn btn-primary marL5\" for=\"uploadFile\"><img src=\"/com/img/ico_btn_save.png\"> 업로드</label>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"file\" id=\"uploadFile\" name=\"uploadFile\" onChange=\"goUpload()\" style=\"position:absolute; clip:rect(0, 0, 0, 0);\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t");
 }else if(rsWp.getLength() > 0 && !obox.get("sign_status").equals("2") && !obox.get("sign_status").equals("3")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goDeleteAll()\">전체삭제</button>\r\n");
      out.write("\t\t  \t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t    </td>\r\n");
      out.write("\t\t \t\t<td width=\"10%\" class=\"td-head\">전표번호</td>\r\n");
      out.write("\t\t\t\t<td width=\"45%\" nowrap>\r\n");
      out.write("\t\t\t \t\t<div class=\"form-inline\">\r\n");
      out.write("\t\t\t\t");
 if(!obox.get("slip_no").equals("")) { 
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
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t미작성\r\n");
      out.write("\t\t\t \t\t");
 if(rsWp.getLength() > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goCreateSlip()\">전표분개</button>\r\n");
      out.write("\t\t\t\t\t\t<b>(증빙일자 : \r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" id=\"proof_ymd\" name=\"proof_ymd\" value=\"");
      out.print(DateUtil.toString("yyyyMMdd"));
      out.write("\" maxlength=\"8\" title=\"증빙일자\" class=\"form-control tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t  \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<span class=\"f-right marR60\">\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('N');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('E');\"><img src=\"/com/img/ico_btn_excel.png\">엑셀</button>\r\n");
      out.write("\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t    </td>\r\n");
      out.write("\t\t \t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\t\t\t\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t<div class=\"table-top-guide\">\r\n");
      out.write("  \t");
 if(obox.getInt("card_cnt") > 0) { 
      out.write("\r\n");
      out.write("  \t\t<span style=\"color:#01a1db;\">카드수 : </span> ");
      out.print(obox.get("card_cnt",Box.THOUSAND_COMMA));
      out.write("개,&nbsp;\r\n");
      out.write("  \t\t<span style=\"color:#01a1db;\">청구건수 : </span> ");
      out.print(obox.get("apply_cnt",Box.THOUSAND_COMMA));
      out.write("건,&nbsp;\r\n");
      out.write("  \t\t<span style=\"color:#01a1db;\">청구금액 : </span> ");
      out.print(obox.get("apply_amt",Box.THOUSAND_COMMA));
      out.write("원\r\n");
      out.write("  \t");
 }else { 
      out.write("\r\n");
      out.write("  \t\t<span style=\"color:#01a1db;\">당월 청구서 엑셀파일</span>을 카드회사에서 수령해서 등록하신 후, 정산전표를 분개하시기 바랍니다.\r\n");
      out.write("  \t");
 } 
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"height:calc(100vh - 150px)\">\t\r\n");
 } 
      out.write("\r\n");
      out.write("\t\t<table id=\"MyTable\" class=\"table table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:5%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:15%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:7%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:8%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:15%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:8%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:10%\">\r\n");
      out.write("\t\t\t\t<col style=\"width:*\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>No</th>\r\n");
      out.write("\t\t\t\t\t<th>카드번호</th>\r\n");
      out.write("\t\t\t\t\t<th>사번</th>\r\n");
      out.write("\t\t\t\t\t<th>성명</th>\r\n");
      out.write("\t\t\t\t\t<th>부서명</th>\r\n");
      out.write("\t\t\t\t\t<th>청구건수</th>\r\n");
      out.write("\t\t\t\t\t<th>청구금액</th>\r\n");
      out.write("\t\t\t\t\t<th>수수료</th>\r\n");
      out.write("\t\t\t\t\t<th>합계</th>\r\n");
      out.write("\t\t\t\t\t<th>비고</th>\r\n");
      out.write("\t         \t</tr> \r\n");
      out.write("\t        <tbody>\r\n");
      out.write("\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr><td colspan=\"10\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t");
 }else {
		   		for(int i=0; i < rsWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(String.valueOf(i+1));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("card_no_x",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("empl_no",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
 if(!box.get("excel_yn").equals("Y")) { 
if(!box.get("excel_yn").equals("Y")){
      out.write("<a href=\"javascript:goEmployeePop('");
      out.print(rsWp.get("empl_no",i));
      out.write("')\">");
}
}
      out.print(rsWp.get("empl_nm",i));
 if(!box.get("excel_yn").equals("Y")) { 
      out.write("</a>");
}
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("apply_cnt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("apply_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("charge_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("tot_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(rsWp.get("etc_remark",i));
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
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<form name=\"signForm\" method=\"post\" action=\"\" style=\"display:none\">\r\n");
      out.write("<input type=\"hidden\" name=\"send_empl_no\" \tvalue=\"");
      out.print(uSesEnt.empl_no);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"subject\" \t\tvalue=\"복지카드 정산(");
      out.print(obox.get("apply_ym",Box.DEF_DATE_FMT));
      out.write(")\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_type\" \t\tvalue=\"SLP004\">\r\n");
      out.write("<input type=\"hidden\" name=\"search_key\" \t\tvalue=\"ACCTB_SLIP01|");
      out.print(obox.get("slip_no"));
      out.write('|');
      out.print(obox.get("apply_ym"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"etc_remark\"\t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_ym\" \t\tvalue=\"");
      out.print(box.get("apply_yy"));
      out.write('년');
      out.write(' ');
      out.print(box.get("apply_mm"));
      out.write("월\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_cnt\" \t\tvalue=\"");
      out.print(obox.get("apply_cnt",Box.THOUSAND_COMMA));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"apply_amt\" \t\tvalue=\"");
      out.print(obox.get("apply_amt",Box.THOUSAND_COMMA));
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
