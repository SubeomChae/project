/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-09 02:49:22 UTC
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

public final class adj02050_005fa_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      egovframework.cbiz.Box rbox = null;
      rbox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("rbox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rbox == null){
        rbox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("rbox", rbox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
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
      out.write("\r\n");
      out.write("<!-- [별지 제50호 서식] 자본금과 적립금 조정명세서(갑) -->\r\n");
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
      out.write("<input type=\"hidden\" name=\"report_id\"  value=\"");
      out.print(box.get("report_id"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"std_yy\" \t   value=\"");
      out.print(box.get("std_yy"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\t<h2 class=\"page-title-2depths\">자본금과 적립금 조정명세서(갑)</h2>\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class=\"table-top-control\">\r\n");
      out.write("\t\t<span>[별지 제50호 서식(갑)]</span>\r\n");
      out.write("\t\t<span style=\"float:right;\">(금액단위 : 천원)</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t");
	xmlBuf += "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n";
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"11\" class=\"t-left\">I. 자본금과 적립금 계산서</th>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"td-head\" width=\"26%\">①  과목 또는 사항</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"6%\">코드</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"12%\">②  기초잔액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">당기중 증감</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"12%\">⑤  기말잔액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"4\" class=\"td-head\" width=\"20%\">비고</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\" width=\"12%\">③ 감소</td>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\" width=\"12%\">④ 증가</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t");
 	Long sum_2 = 0L;
				Long sum_3 = 0L;
				Long sum_4 = 0L;
				Long sum_5 = 0L;
				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","31","","", uSesEnt.dbo); // 자본금 
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol1>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol1>\n"
					   +  "<cha_amt1>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt1>\n"
					   +  "<dae_amt1>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt1>\n"
					   +  "<cur_acum1>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum1>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"7\" width=\"4%\" class=\"t-center\">자<br>본<br>금<br> 및<br><br>잉<br>여<br>금<br><br>등<br>의<br><br>계<br>산</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">1. 자본금</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">01</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("pre_iwol",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cha_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("dae_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cur_acum",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","32","","", uSesEnt.dbo); // 자본잉여금   
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol2>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol2>\n"
					   +  "<cha_amt2>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt2>\n"
					   +  "<dae_amt2>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt2>\n"
					   +  "<cur_acum2>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum2>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">2. 자본잉여금</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">02</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("pre_iwol",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cha_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("dae_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cur_acum",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","34","","", uSesEnt.dbo); // 자본조정   
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol3>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol3>\n"
					   +  "<cha_amt3>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt3>\n"
					   +  "<dae_amt3>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt3>\n"
					   +  "<cur_acum3>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum3>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">3. 자본조정</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">15</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("pre_iwol",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cha_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("dae_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cur_acum",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">4. 기타포괄손익누계액</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">18</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","33","","", uSesEnt.dbo); // 이익잉여금  
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol4>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol4>\n"
					   +  "<cha_amt4>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt4>\n"
					   +  "<dae_amt4>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt4>\n"
					   +  "<cur_acum4>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum4>\n"								
					   +  "<sum_2>"+FormatUtil.insertComma(String.valueOf(sum_2))+"</sum_2>\n"
					   +  "<sum_3>"+FormatUtil.insertComma(String.valueOf(sum_3))+"</sum_3>\n"
					   +  "<sum_4>"+FormatUtil.insertComma(String.valueOf(sum_4))+"</sum_4>\n"
					   +  "<sum_5>"+FormatUtil.insertComma(String.valueOf(sum_5))+"</sum_5>\n"; 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">5. 이익잉여금</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">14</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("pre_iwol",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cha_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("dae_amt",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(rbox.get("cur_acum",Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">17</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">6. 계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">20</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_2)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_3)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_4)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_5)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">7. 자본금과 적립금명세서(을) 계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">21</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"t-center\">손익<br>미계상<br>법인세<br>등</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">8. 법인세</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">22</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">9. 지방소득세</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">23</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-left\">10. 계 (8+9)</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">30</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-left\">11. 차가감계 (6+7-10) 계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">31</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_2)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_3)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_4)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\">");
      out.print(FormatUtil.insertComma(String.valueOf(sum_5)));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB10\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"13\" class=\"t-left\">II. 이월 결손금 계산서</th>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"13\" class=\"t-left\">1. 이월결손금 발생 및 증감내역</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"td-head\" width=\"9%\">⑥  사업년도</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" class=\"td-head\">이월결손금</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"td-head\">감소내역</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"td-head\">잔액</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\" class=\"td-head\">발생액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">⑩소급공제</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">⑪차감계</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">⑫기공제액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"6%\">⑬당기공제액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">⑭보전</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">⑮계</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">(16)기한내</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"6%\">(17)기한경과</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"8%\">(18)계</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"7%\" class=\"td-head\">⑦계</td>\r\n");
      out.write("\t\t\t\t<td width=\"8%\" class=\"td-head\">⑧일반결손금</td>\r\n");
      out.write("\t\t\t\t<td width=\"8%\" class=\"td-head\">⑨배분한도초과 결손금(9=25)</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 for(int i=0; i < 3; i++) { 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\">계</td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr bgcolor=\"f6f6f6\">\r\n");
      out.write("\t\t\t\t<th colspan=\"13\" class=\"t-left\">2. 법인세 신고 사업연도의 결손금에 동업기업으로부터 배분한도를 초과하여 배분받은 결손금(배분한도 초과결손금)이 포함되어 있는 경우 사업연도별 이월결손금 구분내역</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"td-head\">(19)법인세 신고 사업연도</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"td-head\">(20)동업기업 과세연도 종료일</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"td-head\">(21)손금산입한 배분한도 초과 결손금</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"3\" class=\"td-head\">(22)법인세신고 사업연도 결손금</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"9\" class=\"td-head\">배분한도 초과결손금이 포함된 이월결손금 사업연도별 구분</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\">(23)합계(23=25+26)</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"td-head\">배분한도 초과결손금 해당액</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"4\" class=\"td-head\">(26)법인세 신고 사업연도 발생 이월결손금 해당액(8일반결손금으로 계상)(21≥22의 경우는 \"0\", 21≤22의 경우는 22-21)</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">(24)이월결손금 발생 사업연도</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">(25)이월결손금(25=9)21과22중 작은것에 상당하는 금액</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 for(int i=0; i < 3; i++) { 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" class=\"t-right\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t<table class=\"table table-bordered order-column table-cover marB0\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th colspan=\"11\" class=\"t-left\">Ⅲ. 회계기준 변경에 따른 자본금과 적립금 기초잔액 수정</th>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"2\" class=\"td-head\" width=\"26%\">(27)과목 또는 사항</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"6%\">(28)코드</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"12%\">(29)전기말 잔액</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"td-head\">기초잔액 수정</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" class=\"td-head\" width=\"12%\">(32)수정후 기초잔액(29+30-31)</td>\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\" colspan=\"4\" class=\"td-head\" width=\"20%\">비고</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td width=\"12%\" class=\"td-head\">(30)증가</td>\r\n");
      out.write("\t\t\t\t<td width=\"12%\" class=\"td-head\">(31)감소</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 for(int i=0; i < 3; i++) { 
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-right\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"t-center\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\t\r\n");
      out.write("<textarea name=\"xmlBuf\" style=\"display:none\">");
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
