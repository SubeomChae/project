/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 08:03:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.budget;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class bud11001_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>사업계획 수립</title>\r\n");
 if(!box.get("ajax_yn").equals("Y")) { 
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction goSearch(acct_cd2, bugt_cd, acct_full_nm) {\r\n");
      out.write("\t\tajaxReplaceForm(\"bud11001_list.do\", \"#main\", \"#divListData\", function() {\r\n");
      out.write("\t\t\tif(bugt_cd == '') {\r\n");
      out.write("\t\t\t\tif ($(\"tr[id='tr_0']\").attr(\"acct_cd2\") != undefined) {\r\n");
      out.write("\t\t\t\t\tgoDetail($(\"tr[id='tr_0']\").attr(\"acct_cd2\"), $(\"tr[id='tr_0']\").attr(\"bugt_cd\"), $(\"tr[id='tr_0']\").attr(\"acct_full_nm\"));\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}else {\r\n");
      out.write("\t\t\t\tgoDetail(acct_cd2, bugt_cd, acct_full_nm); \r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDetail(acct_cd, bugt_cd, acct_nm) {\r\n");
      out.write("\t\t$(\"tr[id^='tr_']\").removeClass(\"bg-yellow\");\r\n");
      out.write("\t\tif(acct_cd != '') { $(\"tr[acct_cd2='\"+acct_cd+\"']\").addClass(\"bg-yellow\"); }\r\n");
      out.write("\t\tvar pageUrl = '';\r\n");
      out.write("\t\tif(acct_cd.substring(0,3) == '711' || acct_cd.substring(0,5) == '12103') { // 목적사업, 대부사업예산\r\n");
      out.write("\t\t\tpageUrl = '/budget/fd/bud13001_list.do';\r\n");
      out.write("\t\t}else { // 수입예산/비용예산/자본예산\r\n");
      out.write("\t\t\tpageUrl = '/budget/fd/bud12001_list.do';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.main.acct_nm.value = acct_nm;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.main.action = pageUrl+'?acct_cd='+acct_cd+'&bugt_cd='+ bugt_cd+ '&bugt_yy='+ document.main.bugt_yy.value;\r\n");
      out.write("\t\tdocument.main.target= 'ifrm';\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goCreate() {\r\n");
      out.write("\t\tif(formValidate(\"#main\")) {\r\n");
      out.write("\t\t\tif(confirm(document.main.bugt_yy.value +'년도 사업계획 기초데이터를 생성하시겠습니까?')) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#main\");\t\t\t\t\r\n");
      out.write("\t\t\t\tdocument.main.action = 'bud11001_create.do';\r\n");
      out.write("\t\t\t\tdocument.main.target = '_self';\r\n");
      out.write("\t\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction go_plan_code() {\r\n");
      out.write("\t\twdt = 550; hgt = 530;\r\n");
      out.write("\t   \txPos = Math.ceil((screen.width - wdt) / 2);\r\n");
      out.write("\t    yPos = Math.ceil((screen.height- hgt) / 2);\r\n");
      out.write("\t   \twindow.open('/budget/pd/bud11002_list.do', 'bud11002', \"width=\"+wdt+\",height=\"+hgt+\",menubar=no,toolbar=no,scrollbars=no,resizable=no,left=\"+xPos+\",top=\"+yPos);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t");
 if(rsWp.getLength() > 0) { 
		out.println("goDetail('"+rsWp.get("acct_cd2",0)+"','"+rsWp.get("bugt_cd",0)+"','"+rsWp.get("acct_full_nm",0)+"');");
	   }	
	
      out.write("\r\n");
      out.write("\t\tfixTableHeader(\"MyTable\");\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<table class=\"table-top-control\">\r\n");
      out.write("\t<tr height=\"35\">\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t<h1 class=\"page-title\">사업계획 수립</h1>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t");
 if(uSesEnt.use_auth.startsWith("SA")) { 
      out.write("\r\n");
      out.write("\t\t<td>\r\n");
      out.write("\t\t\t<div class=\"form-inline f-right\">\r\n");
      out.write("\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onclick=\"go_plan_code()\"><i class=\"fa fa-list fa-lg\"></i> 사업계획 계정과목코드관리</button>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</td>\t\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" enctype=\"multipart/form-data\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"acct_nm\" \tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"selectedRow\" value=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<table class=\"search-panel table table-bordered\">\r\n");
      out.write("\t\t<colgroup>\r\n");
      out.write("\t\t\t<col style=\"width:12%;\">\r\n");
      out.write("\t\t\t<col style=\"width:*;\">\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"td-head\">사업년도</td>\r\n");
      out.write("\t\t\t\t<td style=\"padding-left:5px\">\r\n");
      out.write("\t\t\t\t\t<select name=\"bugt_yy\" title=\"기준년도\" class=\"bs-select form-control\" style=\"width:100px\">\r\n");
      out.write("\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t");
      out.print(DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\" onClick=\"goSearch('', '', '');\"><img src=\"/com/img/ico_btn_search.png\">검색</button>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goCreate();\"><img src=\"/com/img/ico_btn_refresh_edit.png\">자료생성</button>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\t\t    \r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
 } 
      out.write("\r\n");
      out.write("\t<div class=\"row row-set\">\r\n");
      out.write("\t\t<div class=\"col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0\">\r\n");
      out.write("\t\t\t<div id=\"divArea\" class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(100vh - 120px);\">\r\n");
      out.write("\t\t\t\t<table id=\"MyTable\" class=\"table table-striped table-bordered table-hover order-column\">\r\n");
      out.write("\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:30px;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:70px;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:*;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:90px;\">\r\n");
      out.write("\t\t\t\t\t\t<col style=\"width:90px;\">\r\n");
      out.write("\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr align=\"center\" class=\"table01_title\">\r\n");
      out.write("\t\t\t\t\t\t\t<th colspan=\"3\" rowspan=\"2\">사업계획 계정과목</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th colspan=\"2\">금액(천원)</th>\r\n");
      out.write("\t\t\t\t\t\t</tr> \r\n");
      out.write("\t\t\t\t\t\t<tr align=\"center\" class=\"table01_title\">\r\n");
      out.write("\t\t\t\t\t\t\t<th>목적사업회계</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>기금관리회계</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t");
 if(rsWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr><td colspan=\"2\" align=\"center\">등록된 자료가 없습니다.</td></tr>\r\n");
      out.write("\t\t\t\t\t");
}else { 
						  int pass_cnt1 = 0; int pass_cnt2 = 0;
						  for(int row_index=0; row_index < rsWp.getLength(); row_index++) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr id=\"tr_");
      out.print(row_index);
      out.write("\" acct_cd2=\"");
      out.print(rsWp.get("acct_cd2",row_index));
      out.write("\" bugt_cd=\"");
      out.print(rsWp.get("bugt_cd",row_index));
      out.write("\" acct_full_nm=\"");
      out.print(rsWp.get("acct_full_nm",row_index));
      out.write("\" height=\"25\" style=\"cursor:pointer\" \r\n");
      out.write("\t\t\t\t\t\t\t\tonClick=\"goDetail('");
      out.print(rsWp.get("acct_cd2",row_index));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("bugt_cd",row_index));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(rsWp.get("acct_full_nm",row_index));
      out.write("');\"> \r\n");
      out.write("\t\t\t\t\t\t\t");
 if(pass_cnt1 == 0) {
									int span_cnt = 1;
									for(int tmp_index=row_index+1; tmp_index < rsWp.getLength(); tmp_index++) {
										if(!rsWp.get("acct_nm0",row_index).equals(rsWp.get("acct_nm0",tmp_index))) { break; }
										span_cnt ++;
									} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td rowspan=\"");
      out.print(span_cnt);
      out.write("\" bgcolor='ffffff' style=\"letter-spacing:-1px\">");
      out.print(rsWp.get("acct_nm0",row_index));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
	pass_cnt1 = span_cnt - 1;
							   }else {
									pass_cnt1 --;
							   }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t");
 if(pass_cnt2 == 0) {
									int span_cnt = 1;
									for(int tmp_index=row_index+1; tmp_index < rsWp.getLength(); tmp_index++) {
										if(!rsWp.get("acct_nm1",row_index).equals(rsWp.get("acct_nm1",tmp_index))) { break; }
										span_cnt ++;
									} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td rowspan=\"");
      out.print(span_cnt);
      out.write("\" bgcolor='ffffff' style=\"letter-spacing:-1px\">");
      out.print(rsWp.get("acct_nm1",row_index));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
	pass_cnt2 = span_cnt - 1;
							   }else {
									pass_cnt2 --;
							   }
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("acct_nm2",row_index));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("bugt_amt00",row_index,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print(rsWp.get("bugt_amt20",row_index,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"col-md-7 col-xs-7 col-sm-7 row-set-col\">\r\n");
      out.write("\t\t\t<iframe id ='ifrm' name=\"ifrm\" marginwidth=\"0\"  style=\"width:100%; height:calc(100vh - 120px);\" overflow-y:none;\" frameborder=\"0\" scrolling=\"no\"></iframe>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
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