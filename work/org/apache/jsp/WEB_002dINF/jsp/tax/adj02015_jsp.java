/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-04 04:31:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.tax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class adj02015_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"/com/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
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
 String xmlBuf = ""; 
      out.write("\r\n");
      out.write("<!-- [별지 제15호 서식] 소득금액조정합계표 -->\r\n");
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tajaxSubmitForm(\"xmlUpdate.do\",\"#taxForm\", function(rtn) {\r\n");
      out.write("\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\thideServerWorking();\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"taxForm\" name=\"taxForm\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"report_id\" \t\tvalue=\"");
      out.print(box.get("report_id"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"std_yy\" \t\t\tvalue=\"");
      out.print(box.get("std_yy"));
      out.write("\">\r\n");
      out.write("\t\r\n");
      out.write("\t<h2 class=\"page-title-2depths\">소득금액조정합계표</h2>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<span style=\"float:right;\">[별지 제15호 서식]</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB0\">\r\n");
      out.write("\t\t\t");
	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; 
      out.write("\r\n");
      out.write("         \t\t<tr>\t\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"td-head\">익금산입 및 손금불산입</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"td-head\">손금산입 및 익금불산입</td>\r\n");
      out.write("        \t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" width=\"15%\" class=\"td-head\">①  과목</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" width=\"15%\" class=\"td-head\">②  금액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">③  소득처분</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" width=\"15%\" class=\"td-head\">④  과목</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" width=\"15%\" class=\"td-head\">⑤  금액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">⑥  소득처분</td>\r\n");
      out.write("         \t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"td-head\">처분</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"td-head\">코드</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"td-head\">처분</td>\r\n");
      out.write("\t\t\t\t<td width=\"10%\" class=\"td-head\">코드</td>\r\n");
      out.write("         \t\t</tr> \r\n");
      out.write("\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t<tr><td colspan=\"8\" class=\"t-center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t");
 }else {
			   long slip_sum1 = 0;
			   long slip_sum2 = 0;
		   	   for(int i=0; i < rsWp.getLength(); i++) {	
		   	   		slip_sum1 += rsWp.getLong("slip_amt1",i);
		   	   		slip_sum2 += rsWp.getLong("slip_amt2",i); 
      out.write("\r\n");
      out.write("\t\t\t<tr> \r\n");
      out.write("\t\t\t\t");
	xmlBuf += "<LIST>\n"
						   +  "	<acct_nm1>"+rsWp.get("acct_nm1",i)+"</acct_nm1>\n"
						   +  "	<slip_amt1>"+rsWp.get("slip_amt1",i,Box.THOUSAND_COMMA)+"</slip_amt1>\n"
						   +  "	<dispose_nm1>"+rsWp.get("dispose_nm1",i)+"</dispose_nm1>\n" 
						   +  "	<dispose_cd1>"+rsWp.get("dispose_cd1",i)+"</dispose_cd1>\n"
						   +  "	<acct_nm2>"+rsWp.get("acct_nm2",i)+"</acct_nm2>\n" 
						   +  "	<slip_amt2>"+rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA)+"</slip_amt2>\n"
						   +  "	<dispose_nm2>"+rsWp.get("dispose_nm2",i)+"</dispose_nm2>\n" 
						   +  "	<dispose_cd2>"+rsWp.get("dispose_cd2",i)+"</dispose_cd2>\n"
						   +  "</LIST>\n";
				
      out.write("\r\n");
      out.write("\t\t\t\t<td>");
      out.print(rsWp.get("acct_nm1",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("slip_amt1",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dispose_nm1",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dispose_cd1",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(rsWp.get("acct_nm2",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rsWp.get("slip_amt2",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dispose_nm2",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">");
      out.print(rsWp.get("dispose_cd2",i));
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t<tr bgcolor=\"f6f6f6\">\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">합계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(slip_sum1)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">합계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(slip_sum2)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<textarea name=\"xmlBuf\" style=\"display:none\">");
      out.print(xmlBuf);
      out.write("</textarea>\r\n");
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