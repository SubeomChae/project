/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-11 06:15:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.com.viewer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class htmlReport_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	String msg_no = box.get("msg_no");
	

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>리포트뷰어</title>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=11\" />\r\n");
      out.write("<style>\r\n");
      out.write("\tbody, td, button {\r\n");
      out.write("\t\tcolor:#123456;\r\n");
      out.write("\t\tfont-size:10pt;\r\n");
      out.write("\t\tfont-family:\"바탕체\",Gulim,Arial,Helvetica,sans-serif;\r\n");
      out.write("\t\tline-height:1.5;\r\n");
      out.write("\t\tletter-spacing:0px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.tblHead {\r\n");
      out.write("\t\tborder-collapse: collapse;\r\n");
      out.write("\t\tborder: 1px solid black;\r\n");
      out.write("\t\twidth:630px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.tblHead tr {\r\n");
      out.write("\t\theight:25px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.tblHead th {\r\n");
      out.write("\t\tfont-size:10pt;\r\n");
      out.write("\t\tfont-family:\"바탕체\",Gulim,Arial,Helvetica,sans-serif;\r\n");
      out.write("\t\ttext-align:center;\r\n");
      out.write("\t\tvertical-align:middle;\r\n");
      out.write("\t\tbackground-color:#efefef;\r\n");
      out.write("\t\tborder: 1px solid black;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.tleft {\r\n");
      out.write("\t\ttext-align:left !important;\r\n");
      out.write("\t\tpadding-left:2pt;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.tblHead td {\r\n");
      out.write("\t\tfont-size:10pt;\r\n");
      out.write("\t\tfont-family:\"바탕체\",Gulim,Arial,Helvetica,sans-serif;\r\n");
      out.write("\t\ttext-align:center;\r\n");
      out.write("\t\tvertical-align:middle;\r\n");
      out.write("\t\tborder: 1px solid black;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#divHtml table {\r\n");
      out.write("\t\twhite-space:normal\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#divHtml p {\r\n");
      out.write("\t\tmargin: 0px;\r\n");
      out.write("\t\tpadding: 0px;\r\n");
      out.write("\t\tword-break:break-all;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#divCont {\r\n");
      out.write("\t\twidth:620px;\r\n");
      out.write("\t\tmargin-top:20px;\r\n");
      out.write("\t\tpadding:5px;\r\n");
      out.write("\t\tmin-height:100px;\r\n");
      out.write("\t\tborder: 1px solid black;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#pDocTitle {\r\n");
      out.write("\t\tfont-size:22pt;\r\n");
      out.write("\t\tfont-weight:bold;\r\n");
      out.write("\t\twidth:630px;\r\n");
      out.write("\t\ttext-align:center;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tvar isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);\r\n");
      out.write("\t    var isIE = /(MSIE|Trident\\/|Edge\\/)/i.test(navigator.userAgent);\r\n");
      out.write("\t\t\r\n");
      out.write("\t    if (isIE) { \r\n");
      out.write("\t    \tvar ieActiveX = \"<OBJECT id=IEPageSetupX classid='clsid:41C5BC45-1BE8-42C5-AD9F-495D6C8D7586' codebase='/com/viewer/htmlReport/IEPageSetupX.cab#version=1,4,0,3' width=0 height=0> \"\t\r\n");
      out.write("\t\t\t\t\t\t\t+ \"<param name='copyright' value='http://isulnara.com'> \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"<div style='position:absolute;top:200;left:220;width:350;height:80;border:solid 1 #99B3A0;background:#D8D7C4;overflow:hidden;z-index:1;visibility:visible;'><FONT style='font-family: '굴림', 'Verdana'; font-size: 9pt; font-style: normal;'> \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"<BR>  인쇄 여백제어 컨트롤이 설치되지 않았습니다.  <BR>  <a href='/com/viewer/htmlReport/IEPageSetupX.exe'><font color=red>이곳</font></a>을 클릭하여 수동으로 설치하시기 바랍니다.  </FONT> \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"</div> \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"</OBJECT> \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"<script type='text/javascript'>\"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"function Installed()  { \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"\ttry { \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"\t\treturn (new ActiveXObject('IEPageSetupX.IEPageSetup')); \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"\t} catch (e) { \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"\t\treturn false; \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"\t} \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"} \"\r\n");
      out.write("\t\t\t\t\t\t\t+ \"<\" + \"/script\" + \">\";\r\n");
      out.write("\t\t\t$(\"body\").append(ieActiveX);\r\n");
      out.write("\t    }\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction printBefore() {\r\n");
      out.write("\t\t$(\"#printHeader\").hide();\r\n");
      out.write("\t\t$(\"#printBody\").css(\"height\",\"\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"overflow-y\",\"\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"overflow-x\",\"\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"padding\",\"\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"background-color\",\"\");\r\n");
      out.write("\t\t$(\"#divHtml\").css(\"border\",\"0px solid gray\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction printAfter() {\r\n");
      out.write("\t\t$(\"#printHeader\").show();\r\n");
      out.write("\t\t$(\"#printBody\").css(\"height\",\"630px\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"overflow-y\",\"auto\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"overflow-x\",\"hidden\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"padding\",\"30 0 20 0\");\r\n");
      out.write("\t\t$(\"#printBody\").css(\"background-color\",\"#f3f3f3\");\r\n");
      out.write("\t\t$(\"#divHtml\").css(\"border\",\"1px solid gray\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goIEPrt() {\r\n");
      out.write("\t\tIEPageSetupX.topMargin=0;\r\n");
      out.write("\t\tIEPageSetupX.header=\"\";\r\n");
      out.write("\t\tIEPageSetupX.footer=\"\";\r\n");
      out.write("\t\tIEPageSetupX.PrintBackground=true;\r\n");
      out.write("\t\tIEPageSetupX.print(true);\r\n");
      out.write("\t\t//IEPageSetupX.Preview();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t// 인쇄 클릭시 iframe으로 html을 전송하여 인쇄 처리\r\n");
      out.write("\tfunction goPrint() {\r\n");
      out.write("\t\tvar isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);\r\n");
      out.write("\t    var isIE = /(MSIE|Trident\\/|Edge\\/)/i.test(navigator.userAgent);\r\n");
      out.write("\t    \r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (isIE) {\r\n");
      out.write("\t\t\tsetTimeout(function() { printBefore(); goIEPrt(); printAfter(); } , 500);\t\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\t$(\"#ifrmPrint\").prop(\"src\",\"about:blank\");\r\n");
      out.write("\t\t\tvar printHtml = \"\";\r\n");
      out.write("\t\t\tprintHtml +='<html><head><title>인쇄</title>';\r\n");
      out.write("\t\t\tprintHtml +=\"<head>\";\r\n");
      out.write("\t\t\tprintHtml +=\"<style>\";\r\n");
      out.write("\t\t\tprintHtml +=\"@page { size:A4;margin:0mm;}\";\r\n");
      out.write("\t\t\tif (isChrome) {\r\n");
      out.write("\t\t\t    printHtml +=\"body{-webkit-print-color-adjust: exact; margin:28mm 20mm 0mm 20mm;}\";\r\n");
      out.write("\t\t\t    printHtml +=\".divBottom { position:absolute; bottom:10mm; left:5mm;}\";\r\n");
      out.write("\t\t\t} else if (isIE) { \r\n");
      out.write("\t\t\t    printHtml +=\"body{-webkit-print-color-adjust: exact; margin:20mm 20mm 0mm 20mm;}\";\r\n");
      out.write("\t\t\t    printHtml +=\".divBottom { position:absolute; bottom:10mm; left:5mm;}\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tprintHtml +=\"</style>\";\r\n");
      out.write("\t\t\tprintHtml +=\"<link rel='stylesheet' type='text/css' href='/com/viewer/htmlPrint.css'>\";\r\n");
      out.write("\t\t\tprintHtml +='</head><body >';\r\n");
      out.write("\t\t\tprintHtml +='<div id=\"divHtml\">';\r\n");
      out.write("\t\t\tprintHtml +=$(\"#divHtml\").html();\r\n");
      out.write("\t\t\tprintHtml +='</div>';\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tprintHtml +='<' + 'script  type=\\\"text/javascript\\\" ' + '>'\r\n");
      out.write("\t\t\t   + 'window.print(); '\r\n");
      out.write("\t\t\t   + '<' + '/script' + '>';\r\n");
      out.write("\t\t\tprintHtml +='</body></html>';\r\n");
      out.write("\t\t\tvar target = $(\"#ifrmPrint\").contents()[0];\r\n");
      out.write("\t\t\ttarget.write(printHtml);\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t//target.close();\r\n");
      out.write("\t\t//$(\"#ifrmPrint\").contents().html(printHtml);\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"printHeader\" style=\"width:100%; height:44px; background-color:rgb(144,144,144); border-bottom:1px solid gray;\">\r\n");
      out.write("\t<div style=\"float:left; padding-left:5px; cursor:pointer;\"><img src=\"/com/img/report_print.gif\" onclick=\"javascript:goPrint();\"></div>\r\n");
      out.write("\t<div style=\"float:right; padding-right:5px; cursor:pointer;\"><img src=\"/com/img/report_close.gif\" onclick=\"self.close();\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"printBody\" style=\"height:630px;overflow-y:auto; overflow-x:hidden; padding:30 0 20 0; background-color:#f3f3f3;\">\r\n");
      out.write("\t<div id=\"divHtml\" style=\"width:620px; border:1px solid gray; background:white; padding:80 60 80 50; margin-left:50%; transform:translateX(-50%);\">\r\n");
      out.write("\t\t<p id=\"pDocTitle\">일반문서</p>\r\n");
      out.write("\t\t문서번호 : ");
      out.print(msgBox.get("docu_no_x") );
      out.write("\r\n");
      out.write("\t\t<table class=\"tblHead\" border=\"1\">\r\n");
      out.write("\t\t    <col width=\"10%\">\r\n");
      out.write("\t\t    <col width=\"*\">\r\n");
      out.write("\t\t    <col width=\"4%\">\r\n");
      out.write("\t\t    <col width=\"12%\">\r\n");
      out.write("\t\t    <col width=\"12%\">\r\n");
      out.write("\t\t    <col width=\"12%\">\r\n");
      out.write("\t\t    <col width=\"12%\">\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t    \t<th rowspan=\"2\">발의부서</th>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\" class=\"tleft\">");
      out.print(msgBox.get("send_dept_nm") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<th rowspan=\"3\">발<br/>의<br/>부<br/>서</th>\r\n");
      out.write("\t\t    \t<th>발의자</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign21"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign22"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign23"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(msgBox.get("send_empl_nm") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign21"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign22"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign23"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    <tr style=\"height:50px\">\r\n");
      out.write("\t\t    \t<th>발의자</th>\r\n");
      out.write("\t\t    \t<td class=\"tleft\">관리자</td>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t    \t<th rowspan=\"2\">발의일자</th>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\" class=\"tleft\">");
      out.print(msgBox.get("send_date") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<th rowspan=\"3\">접<br/>수<br/>부<br/>서</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign30"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign31"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign32"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    \t<th>");
      out.print(StringUtil.arrayCol(msgBox.get("sign33"),1,"|") );
      out.write("</th>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    <tr>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign30"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign31"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign32"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    \t<td rowspan=\"2\">");
      out.print(StringUtil.arrayCol(msgBox.get("sign33"),2,"|") );
      out.write("</td>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t    <tr style=\"height:50px\">\r\n");
      out.write("\t\t    \t<th>제목</th>\r\n");
      out.write("\t\t    \t<td class=\"tleft\">");
      out.print(msgBox.get("subject") );
      out.write("</td>\r\n");
      out.write("\t\t    </tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"divCont\">");
      out.print(obox.get("opinion") );
      out.write("</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<iframe src=\"about:blank\" frameborder=\"0\" scrolling=\"no\" id=\"ifrmPrint\" width=\"100%\" height=\"0px\" ></iframe>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
