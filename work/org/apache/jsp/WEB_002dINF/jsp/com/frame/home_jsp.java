/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 05:42:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.com.frame;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;
import java.util.*;
import java.util.Calendar;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

	
	int monthLength = 0;
	int yyyy=0;
	int mm=0;
	int dd=0;
	int dayOfWeek=0;
	String strToday;
	HashMap holidays;
	Calendar today = null;

	void setToday(Calendar c){
		today = c;
		yyyy = today.get(Calendar.YEAR);
		mm = today.get(Calendar.MONTH)+1;
		dd = today.get(Calendar.DATE);
		setStrToday(new Integer(yyyy).toString() + StringUtil.lpad(new Integer(mm).toString(),"0",2) + StringUtil.lpad(new Integer(dd).toString(),"0",2));
		today.set(Calendar.DAY_OF_MONTH, 1);
		dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
	}

	void setOtherToday(Calendar c, String y, String m, String d){
		today = c;
		today.set(Calendar.YEAR, Integer.parseInt(y));
		today.set(Calendar.MONTH, Integer.parseInt(m)-1);

		today.set(Calendar.DAY_OF_MONTH, 1);
		yyyy = today.get(Calendar.YEAR);
		mm = today.get(Calendar.MONTH)+1;	
		dd = today.get(Calendar.DATE);
		setStrToday(new Integer(yyyy).toString() + StringUtil.lpad(new Integer(mm).toString(),"0",2) + StringUtil.lpad(d,"0",2));
		dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
	}

	int getMonthDay(int yyyy, int mm){
		if(mm == 2)
			monthLength = getLeapYearFebruary(yyyy);
		else if(mm == 4 || mm == 6 || mm == 9 || mm == 11)
			monthLength = 30;
		else
			monthLength = 31;

		return monthLength;
	}

	int getLeapYearFebruary(int yyyy){
		if((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0)
			return 29;
		else return 28;
	}

	int getIntYear(){
		return yyyy;
	}

	int getIntMonth(){
		return mm;
	}

	public int getIntDay(){
		return dd;
	}

	public int getDayOfWeek(){
		return dayOfWeek;
	}

	String getStrToday(){
		return strToday; 
	}

	void setStrToday(String str){
		this.strToday = str;
	}

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/com/calendar/calendar.jsp", Long.valueOf(1567159650361L));
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Calendar");
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
      egovframework.cbiz.Box rbox = null;
      rbox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("rbox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rbox == null){
        rbox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("rbox", rbox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.RsWrapper notiWp = null;
      notiWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("notiWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (notiWp == null){
        notiWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("notiWp", notiWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.RsWrapper mesgWp = null;
      mesgWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("mesgWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (mesgWp == null){
        mesgWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("mesgWp", mesgWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.RsWrapper bokWp = null;
      bokWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("bokWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (bokWp == null){
        bokWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("bokWp", bokWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
	Calendar calendar = Calendar.getInstance();
	setOtherToday(calendar, box.get("year"), box.get("month"), box.get("day"));
	String strToday = getStrToday();
	int intYear  = box.getInt("year");
	int intMonth = box.getInt("month");
	int intDay 	 = box.getInt("day");
	int dayOfWeek = getDayOfWeek();
	int monthLength = getMonthDay(intYear, intMonth);

      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("<title>???????????????????????????????????????</title>\r\n");
      out.write("<link href=\"/com/calendar/css/calendar.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<style>\r\n");
      out.write(".divTabOn { \r\n");
      out.write("\tpadding:0 10 0 10;\r\n");
      out.write("color:white;\r\n");
      out.write("font-weight: bold;\r\n");
      out.write("font-size:12px;\r\n");
      out.write("text-align:center;\r\n");
      out.write("display:table-cell;\r\n");
      out.write("vertical-align:middle;\r\n");
      out.write("height:25px;\r\n");
      out.write("width:100px;\r\n");
      out.write("background: linear-gradient(#92abd1, #3061a1);\r\n");
      out.write("border-radius: 3px 3px 0px 0px;\r\n");
      out.write("cursor:hand;\r\n");
      out.write("}\r\n");
      out.write(".divTabOff { \r\n");
      out.write("\tpadding:0 10 0 10;\r\n");
      out.write("text-align:center;\r\n");
      out.write("font-weight: bold;\r\n");
      out.write("font-size:12px;\r\n");
      out.write("display:table-cell;\r\n");
      out.write("vertical-align:middle;\r\n");
      out.write("height:25px;\r\n");
      out.write("width:100px;\r\n");
      out.write("border:1px solid c5c5c5;\r\n");
      out.write("background: linear-gradient(#efefef, #ffffff);\r\n");
      out.write("border-radius: 3px 3px 0px 0px;\r\n");
      out.write("cursor:hand;\r\n");
      out.write("}\r\n");
      out.write(".divDownload { \r\n");
      out.write("\tdisplay: table-cell;\r\n");
      out.write("\ttext-align:right;\r\n");
      out.write("vertical-align:bottom;\r\n");
      out.write("padding-bottom:2px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tfunction go_search() {\r\n");
      out.write("\t\tdocument.main.action = \"/com/rightFrame.do\";\r\n");
      out.write("\t\tdocument.main.target = \"_self\";\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\tfunction go_menu(menu_id, default_page) {\r\n");
      out.write("\t\tparent.parent.leftFrame.go_menu(menu_id.substring(0,1), default_page);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\tfunction go_sign_detail(msg_no, sign_status) {\r\n");
      out.write("\t\tif(sign_status == '1') {\r\n");
      out.write("\t\t\tlocation.href = '/esign/sgn02001_list.do?msg_no='+msg_no;\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tlocation.href = '/esign/sgn03001_list.do';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction go_calendar(cal_range) {\r\n");
      out.write("\t\tif(cal_range == 'W') {\r\n");
      out.write("\t\t\tdocument.main.action = '/community/fd/dia11004_list.do?popup_yn=Y';\r\n");
      out.write("\t\t\tdocument.main.target = 'ifrm';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}else if(cal_range == 'M') {\r\n");
      out.write("\t\t\tdocument.main.action = '/community/fd/dia11001_list.do?popup_yn=Y';\r\n");
      out.write("\t\t\tdocument.main.target = 'ifrm';\r\n");
      out.write("\t\t\tdocument.main.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goTabpage(tabIdx) {\r\n");
      out.write("\t\tvar theUrl = \"\";\r\n");
      out.write("\t\tif(tabIdx == 0) {\r\n");
      out.write("\t\t\t$('#ApplyTable').show();\r\n");
      out.write("\t\t\t$(\"#ifrm\").css(\"height\",\"calc(70vh - 102px)\");\r\n");
      out.write("\t\t\t$(\"#ifrm\").attr(\"scrolling\",\"yes\");\r\n");
      out.write("\t\t\ttheUrl = \"/budget/fd/bud22002_list.do\";\r\n");
      out.write("\t\t}else if(tabIdx == 1) {\r\n");
      out.write("\t\t\t$('#ApplyTable').hide();\r\n");
      out.write("\t\t\t$(\"#ifrm\").css(\"height\",\"calc(100vh - 75px)\");\r\n");
      out.write("\t\t\t$(\"#ifrm\").attr(\"scrolling\",\"no\");\r\n");
      out.write("\t\t\ttheUrl = \"/community/fd/dia11004_list.do?popup_yn=Y\";\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t\t$('#ifrm').attr('src', theUrl);\r\n");
      out.write("\t} \r\n");
      out.write("\t\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tgoTabpage(0);\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div id=\"divListData\" class=\"contentsRow\">\r\n");
      out.write("<form name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"sys_ymd\"\tvalue=\"");
      out.print(rbox.get("start_ymd"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"year\" \t\tvalue=\"");
      out.print(intYear);
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"month\" \t\tvalue=\"");
      out.print(StringUtil.lpad(String.valueOf(intMonth),"0",2));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"day\" \t\tvalue=\"");
      out.print(StringUtil.lpad(String.valueOf(intDay),"0",2));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"tab_index\" \tvalue=\"1\">\r\n");
      out.write("\t<div class=\"row row-set\">\t\r\n");
      out.write("\t\t<div class=\"col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR5\">\r\n");
      out.write("\t\t\t<div class=\"table-scrollable\" style=\"overflow-y:auto\">\r\n");
      out.write("\t\t\t\t<table class=\"table table-bordered\" style=\"padding-top:15px\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"2\"><img src=\"/com/img/icon_license.gif\" align=\"absmiddle\" border=\"0\"> ");
      out.print(obox.get("empl_nm"));
      out.write(" ???</th>\r\n");
      out.write("\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td rowspan=\"5\" width=\"25%\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"/upload_data/photo/");
      out.print(StringUtil.urlEncode(obox.get("photo_file")));
      out.write("\" width=\"100\" height=\"130\" border=\"0\" align=\"absmiddle\" alt=\"");
      out.print(obox.get("empl_nm"));
      out.write(' ');
      out.print(obox.get("position_nm"));
      out.write("\" onerror=\"this.src='/com/img/no_photo.gif'\">\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"75%\" class=\"t-left\">");
      out.print(obox.get("dept_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">");
      out.print(obox.get("empl_class_nm"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
if(!obox.get("grade_nm").equals("")){
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(obox.get("grade_nm"));
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
if(!obox.get("position_nm").equals("")){
      out.write(' ');
      out.write('/');
      out.write(' ');
      out.print(obox.get("position_nm"));
}
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">");
      out.print(obox.get("bojik_nm"));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">???????????? : <span style=\"font-weight:bold; color:#01a1db;\">");
      out.print(obox.get("use_auth_nm"));
      out.write("</span></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\" style=\"font-size:11px; color:#666666;\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"/com/img/icon_doc.gif\" align=\"absmiddle\" border=\"0\"> <a href=\"javascript:go_menu('A01','/insa/ins01001_list.do')\">???????????????</a>&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"/com/img/bu_icon02.gif\" align=\"absmiddle\" border=\"0\"> <a href=\"javascript:go_menu('G10','/esign/sgn31001_list.do')\">???????????????</a>&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"/com/img/icon_note.gif\" align=\"absmiddle\" border=\"0\"> <a href=\"javascript:send_note('')\">???????????????</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"table-scrollable scrollOptionY\" style=\"width:100%; height:calc(45vh - 20px)\">\r\n");
      out.write("\t\t\t\t<table class=\"table table-bordered\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t??????????????? <a href=\"javascript:go_menu('G02','/esign/sgn02001_list.do')\"><img src=\"/com/img/btn_more_on.gif\" align=\"absmiddle\" border=\"0\" style=\"float:right\"></a>\r\n");
      out.write("\t\t\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"55%\" class=\"td-head\">??????</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"15%\" class=\"td-head\">?????????</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"30%\" class=\"td-head\">?????????</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");
 if(mesgWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\"><td colspan=\"3\" align=\"center\">????????? ???????????? ????????????.</td></tr>\r\n");
      out.write("\t\t\t\t");
 }else {
					for(int i=0; i < mesgWp.getLength(); i++) { 
      out.write(" \r\n");
      out.write("\t\t\t\t\t\t<tr height=\"25\" onMouseOver=\"this.className='btnover'\" onMouseOut=\"this.className='btnbase'\" class=\"buttonbase\">\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"t-left\"><a href=\"javascript:go_sign_detail('");
      out.print(mesgWp.get("msg_no",i));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(mesgWp.get("sign_status",i));
      out.write("')\">");
      out.print(mesgWp.get("subject",i));
      out.write("</a></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(mesgWp.get("send_empl_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(mesgWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"table-scrollable scrollOptionY\" style=\"height:calc(35vh - 20px)\">\r\n");
      out.write("\t\t\t\t<table class=\"table table-bordered\">\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t?????? ?????? <a href=\"javascript:go_menu('Y','/community/boa01001_list.do?board_type=01')\"><img src=\"/com/img/btn_more_on.gif\" align=\"absmiddle\" border=\"0\"  style=\"float:right\"></a>\r\n");
      out.write("\t\t\t\t\t\t</th>\r\n");
      out.write("\t\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\" class=\"table01_title\">\r\n");
      out.write("\t\t\t\t\t\t<td width=\"65%\" class=\"td-head\">??????</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"15%\" class=\"td-head\">?????????</td>\r\n");
      out.write("\t\t\t\t\t\t<td width=\"20%\" class=\"td-head\">?????????</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t");
 if(notiWp.getLength() == 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<tr height=\"25\"><td colspan=\"3\" align=\"center\">????????? ????????? ????????????.</td></tr>\r\n");
      out.write("\t\t\t\t");
 }else {
					for(int i=0; i < notiWp.getLength(); i++) { 
      out.write(" \r\n");
      out.write("\t\t\t\t\t<tr height=\"25\">\r\n");
      out.write("\t\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t\t");
if(DateUtil.dayDiff(notiWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 7) {
      out.write("<img src=\"/com/img/ico_new_s.gif\" border=\"0\"> ");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"javascript:go_menu('H01','/community/inf01002_select.do?inform_no=");
      out.print(notiWp.get("ref_pk",i));
      out.write("');\">");
      out.print(StringUtil.getReplaceSpecialCharacters(notiWp.get("subject",i)));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print(notiWp.get("sys_reg_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print(notiWp.get("sys_reg_date",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"col-md-7 col-xs-7 col-sm-7 row-set-col\">\r\n");
      out.write("\t\t\t<div class=\"portlet-body\">\r\n");
      out.write("\t\t\t\t<div class=\"contentsRow portlet-body-hr\">\r\n");
      out.write("\t\t\t\t\t<ul id=\"ulTab\" class=\"nav nav-tabs\">\r\n");
      out.write("\t\t\t\t\t\t<li id=\"tabDef\" class=\"active\" onclick=\"goTabpage(0)\"><a href=\"#\" data-toggle=\"tab\">");
      out.print(DateUtil.toString("yyyy"));
      out.write("??? ????????????</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li onclick=\"goTabpage(1)\"><a href=\"#\" data-toggle=\"tab\">????????????</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t  \t\t<iframe id=\"ifrm\" name=\"ifrm\" marginwidth=\"0\" src=\"\" frameborder=\"0\" width=\"100%\" scrolling=\"yes\"></iframe>\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t\t\t<table id=\"ApplyTable\" class=\"table table-bordered table-cover\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th colspan=\"4\">?????? ????????????</th>\r\n");
      out.write("\t\t\t\t</tr>\t\r\n");
      out.write("\t\t\t");
 if(bokWp.getLength() > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td width=\"40%\" class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"20%\" class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"20%\" class=\"td-head\">????????????</td>\r\n");
      out.write("\t\t\t\t\t<td width=\"20%\" class=\"td-head\">??????</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 for(int i=0; i < bokWp.getLength(); i++) { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-left\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"javascript:go_menu('C02','/welfare/fd/wel01001_list.do?bugt_cd=");
      out.print(bokWp.get("bugt_cd",i));
      out.write("&apply_no=");
      out.print(bokWp.get("apply_no",i));
      out.write("');\">");
      out.print(StringUtil.getReplaceSpecialCharacters(bokWp.get("subject",i)));
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(bokWp.get("apply_amt",i,Box.THOUSAND_COMMA));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(bokWp.get("apply_ymd",i,Box.DEF_DATE_FMT));
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t<td>");
      out.print(bokWp.get("sign_status_nm",i));
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t");
 }else { 
      out.write("\r\n");
      out.write("\t\t\t\t<tr><td colspan=\"4\" align=\"center\">????????? ????????? ????????????.</td></tr>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("</div>");
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
