/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 08:33:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.com.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class slipView_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- 전표조회  -->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\t\r\n");
      out.write("\tfunction goMouseEvent(event_nm, slip_seq) {\r\n");
      out.write("\t\t$('#tr_'+slip_seq).css(\"background-color\", event_nm == 'over' ? '#b2e1f1' : '#ffffff');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDetail(rel_no_type, rel_no, bank_nm, issue_ymd, finish_ymd, rel_amt, intr_rate, tax_rate, vat_amt, proof_ymd, vat_nm, slip_seq) {\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(slip_seq != '') { $(\"tr[slip_seq='\"+slip_seq+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tif(rel_no_type == '11') { $(\"#rel_no_type\").html(\"계좌번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '12') { $(\"#rel_no_type\").html(\"카드번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '13') { $(\"#rel_no_type\").html(\"어음번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '14') { $(\"#rel_no_type\").html(\"유가증권번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '15') { $(\"#rel_no_type\").html(\"사업자번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '16') { $(\"#rel_no_type\").html(\"주민등록번호\"); }\r\n");
      out.write("\t\telse if(rel_no_type == '17') { $(\"#rel_no_type\").html(\"자산번호\"); }\r\n");
      out.write("\t\telse { $(\"#rel_no_type\").html(\"관련번호\"); }\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#rel_no\").html(bank_nm + ' ' + rel_no);\r\n");
      out.write("\t\t$(\"#issue_ymd\").html(issue_ymd.fmtYmd());\r\n");
      out.write("\t\t$(\"#finish_ymd\").html(finish_ymd.fmtYmd());\r\n");
      out.write("\t\t$(\"#rel_amt\").html((rel_amt == '' ? '' : insertComma(rel_amt) + ' 원'));\r\n");
      out.write("\t\t$(\"#intr_rate\").html((intr_rate == '' ? '' : intr_rate + '%'));\r\n");
      out.write("\t\t$(\"#tax_rate\").html((tax_rate == '' ? '' : tax_rate + '%'));\r\n");
      out.write("\t\t$(\"#vat_amt\").html((vat_amt == '' ? '' : insertComma(vat_amt) + ' 원'));\r\n");
      out.write("\t\t$(\"#proof_ymd\").html(proof_ymd.fmtYmd());\r\n");
      out.write("\t\t$(\"#vat_nm\").html(vat_nm);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\t$(\".page-logo-text\").html(\"전표조회\");\t\r\n");
      out.write("\t");
 if(rsWp.getLength() > 0) {
        out.println("goDetail('"+rsWp.get("rel_no_type",0)+"','"+rsWp.get("rel_no",0)+"','"+rsWp.get("bank_nm",0)+"','"+rsWp.get("issue_ymd",0)+"','"+rsWp.get("finish_ymd",0)+"','"+rsWp.get("rel_amt",0)+"','"+rsWp.get("intr_rate",0)+"','"+rsWp.get("tax_rate",0)+"','"+rsWp.get("vat_amt",0)+"','"+rsWp.get("proof_ymd",0)+"','"+rsWp.get("vat_nm",0)+"','"+rsWp.get("slip_seq",0)+"');");
	} 
      out.write("\r\n");
      out.write("\t}); \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"pForm\" name=\"pForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"slip_no\" \tvalue=\"");
      out.print(box.get("slip_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t");
 if(!obox.get("slip_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t<h2 class=\"page-title-2depths\">[ ");
      out.print(obox.get("slip_no",Box.SLIP_NO));
      out.write(' ');
      out.write(']');
      out.write(' ');
      out.print(obox.get("biz_type_nm"));
      out.write("</h2>\r\n");
      out.write("\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t삭제된 전표입니다.\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t<span class=\"f-right marB5\">\r\n");
      out.write("\t\t");
if(!obox.get("msg_no").equals("") && !box.get("msg_popup").equals("Y")){
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDocuViewer('");
      out.print(obox.get("msg_no"));
      out.write("')\"><img src=\"/com/img/ico_btn_search.png\">기안문 보기</button>\r\n");
      out.write("\t\t");
}
      out.write("  \r\n");
      out.write("\t\t");
 if(!obox.get("slip_no").equals("")) { 
      out.write("\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goUbiViewer('WEB-INF/jsp/account/report/slipDetailView.jrf','P_PARAM01!");
      out.print(obox.get("slip_no"));
      out.write("!')\"><img src=\"/com/img/ico_btn_print.png\">인쇄</button>\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSlipPrint('");
      out.print(obox.get("slip_no"));
      out.write("')\"><img src=\"/com/img/ico_btn_excel.png\" alt=\"icon\">엑셀다운로드</button>\r\n");
      out.write("\t   ");
      out.write("\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("    ");
 if(!obox.get("slip_no").equals("")) { 
      out.write("\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<b>&middot; 제목 :</b> <font color=gray>");
      out.print(FormatUtil.nvl2(obox.get("etc_remark"),obox.get("subject")));
      out.write("</font>&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t<b>&middot; 작성자 :</b> <font color=gray>");
      out.print(obox.get("dept_nm"));
      out.write(' ');
      out.print(obox.get("empl_nm"));
      out.write("</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t[<b><font color=red>");
      out.print(obox.get("sign_status_nm"));
      out.write("</font></b>");
if(!obox.get("sign_no").equals("")){
      out.write(',');
      out.write(' ');
      out.print(obox.get("sign_ymd"));
      out.write('-');
      out.print(obox.get("acc_unit"));
      out.write('-');
      out.print(obox.get("sign_no"));
}
      out.write("]\r\n");
      out.write("\t</div>\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("<div class=\"table-scrollable\" style=\"height:400px\">\r\n");
      out.write("\t<table class=\"table table-view table-hover table-bordered\">\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"20%\">계정과목</th>\r\n");
      out.write("\t\t  \t<th width=\"8%\">차변</th>\r\n");
      out.write("\t\t  \t<th width=\"8%\">대변</th>\r\n");
      out.write("\t\t  \t<th width=\"20%\">적요</th>\r\n");
      out.write("\t\t  \t<th width=\"16%\">거래처</th>\r\n");
      out.write("\t\t  \t<th width=\"28%\">비용귀속</th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write(" \t\t");
 int cha_amt_tot = 0; 
		   int dae_amt_tot = 0; 
		   for(int i=0; i < rsWp.getLength(); i++) { 
			cha_amt_tot += (rsWp.get("cd_flag",i).equals("1") ? rsWp.getInt("slip_amt",i) : 0);
			dae_amt_tot += (rsWp.get("cd_flag",i).equals("2") ? rsWp.getInt("slip_amt",i) : 0);
		
      out.write("\r\n");
      out.write("        <tr id=\"tr_");
      out.print(i);
      out.write("\" slip_seq=\"");
      out.print(rsWp.get("slip_seq",i));
      out.write("\" style=\"cursor:pointer\" onClick=\"goDetail('");
      out.print(rsWp.get("rel_no_type",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("rel_no",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("bank_nm",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("issue_ymd",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("finish_ymd",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("rel_amt",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("intr_rate",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("tax_rate",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("vat_amt",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("proof_ymd",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("vat_nm",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("slip_seq",i));
      out.write("')\">\r\n");
      out.write("\t\t\t<td>");
      out.print(rsWp.get("acct_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t  \t<td class=\"t-right\">");
      out.print(rsWp.get("cd_flag",i).equals("1") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : "");
      out.write("</td>\r\n");
      out.write("\t\t  \t<td class=\"t-right\">");
      out.print(rsWp.get("cd_flag",i).equals("2") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : "");
      out.write("</td>\r\n");
      out.write("\t\t  \t<td>");
      out.print(rsWp.get("etc_remark",i));
      out.write("</td>\r\n");
      out.write("\t\t  \t<td>\r\n");
      out.write("\t\t  \t");
 if(!rsWp.get("cust_nm",i).equals("")) { 
      out.write("\r\n");
      out.write("\t\t  \t\t");
if(!rsWp.get("cust_cd",i).equals("")){
      out.write("<a href=\"javascript:goCustInfo('&cust_cd=");
      out.print(rsWp.get("cust_cd",i));
      out.write("')\">");
}
      out.print(rsWp.get("cust_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t  \t");
 }else if(!rsWp.get("empl_nm",i).equals("")) { 
      out.write("\r\n");
      out.write("\t\t  \t\t");
if(!rsWp.get("empl_no",i).equals("")){
      out.write("<a href=\"javascript:goEmployeePop('");
      out.print(obox.get("empl_no"));
      out.write("')\">");
}
      out.print(rsWp.get("empl_nm",i));
      out.write("</a>\r\n");
      out.write("\t\t  \t");
 }else if(!rsWp.get("bank_nm",i).equals("")) { 
      out.write("\r\n");
      out.write("\t\t  \t\t");
      out.print(rsWp.get("bank_nm",i));
      out.write("\r\n");
      out.write("\t\t  \t");
 } 
      out.write("\r\n");
      out.write("\t\t  \t</td>\r\n");
      out.write("\t\t  \t<td>");
      out.print(rsWp.get("cost_dept_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write(" \t\t");
 } 
      out.write(" \r\n");
      out.write("\t");
 if(rsWp.getLength() > 0) { 
      out.write("\r\n");
      out.write("\t\t<tr class=\"tr-summary\">\r\n");
      out.write("\t\t\t<td style=\"text-align:center\"><b>합계</b></td>\r\n");
      out.write("\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(cha_amt_tot)));
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(dae_amt_tot)));
      out.write("</td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- 항목별 세부내용 조회 -->\r\n");
      out.write("<div class=\"table-scrollable\">\r\n");
      out.write("\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("  \t\t<tr>\r\n");
      out.write("\t\t\t<th colspan=\"6\"><b>항목별 세부내용</b></th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th><div id=\"rel_no_type\">관련번호</div></th>\r\n");
      out.write("\t\t\t<td><div id=\"rel_no\"></div></td>\r\n");
      out.write("\t\t\t<th>발생일자</th>\r\n");
      out.write("\t\t\t<td><div id=\"issue_ymd\"></div></td>\r\n");
      out.write("\t\t\t<th>만기일자</th>\r\n");
      out.write("\t\t\t<td><div id=\"finish_ymd\"></div></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>관련금액</th>\r\n");
      out.write("\t\t\t<td><div id=\"rel_amt\"></div></td>\r\n");
      out.write("\t\t\t<th>이자율</th>\r\n");
      out.write("\t\t\t<td><div id=\"intr_rate\"></div></td>\r\n");
      out.write("\t\t\t<th>세율</th>\r\n");
      out.write("\t\t\t<td><div id=\"tax_rate\"></div></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th width=\"12%\">부가세</th>\r\n");
      out.write("\t\t\t<td width=\"21%\"><div id=\"vat_amt\"></div></td>\r\n");
      out.write("\t\t\t<th width=\"12%\">증빙일자</th>\r\n");
      out.write("\t\t\t<td width=\"21%\"><div id=\"proof_ymd\"></div></td>\r\n");
      out.write("\t\t\t<th width=\"12%\">증빙유형</th>\r\n");
      out.write("\t\t\t<td width=\"21%\"><div id=\"vat_nm\"></div></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
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