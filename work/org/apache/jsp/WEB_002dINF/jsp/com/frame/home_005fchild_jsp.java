/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-16 06:47:13 UTC
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

public final class home_005fchild_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.put("/WEB-INF/jsp/com/include/calendar.jsp", Long.valueOf(1564383424000L));
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
      out.write("<style type=\"text/css\">\r\n");
      out.write(".schedule_table_header_center {height: 22px; background-color: #E8E8E8; }\r\n");
      out.write(".schedule_table_header_center_sun {height: 22px; background-color: #FAF2F2; }\r\n");
      out.write(".schedule_table_header_center_sat {height: 22px; background-color: #E7F9FF; }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\tfunction goSearch() {\r\n");
      out.write("\t\tvar pageUrl = \"dia11001_list.do?popup_yn=Y\";\r\n");
      out.write("\t\tdocument.main.action = pageUrl;\r\n");
      out.write("\t\tdocument.main.target = \"_self\";\r\n");
      out.write("\t\tdocument.main.submit();\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction openPlanPopup(plan_no, action_type) {\r\n");
      out.write(" \t\tvar theUrl = '/community/pd/' + (action_type == 'SELECT' ? 'dia11002_select.do' : 'dia11003_edit.do');\r\n");
      out.write("\t\tpopupOpen(\"about:blank\", \"planPopup\", 500, 400); \r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.main.action = theUrl + '?popup_yn=Y&plan_no='+plan_no;\r\n");
      out.write("\t\tdocument.main.target = 'planPopup';\r\n");
      out.write("\t\tdocument.main.submit();\r\n");
      out.write("\t}\r\n");
      out.write("</script> \r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" class=\"fType\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"day\" \t value=\"");
      out.print(box.get("day"));
      out.write("\">\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table id=\"calTable\" class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<tr height=\"25\" bgcolor=\"#000000\">\r\n");
      out.write("\t\t\t\t<td style=\"color:#ffffff; border-right:1pt solid #000000; padding-left:10px\"><b>");
      out.print(DateUtil.getYear());
      out.write('년');
      out.write(' ');
      out.print(DateUtil.getMonth());
      out.write('월');
      out.write(' ');
      out.print(DateUtil.getDay());
      out.write('일');
      out.write(' ');
      out.print(DateUtil.getWeekDayNm(DateUtil.toString("yyyyMMdd")));
      out.write("요일</b></td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t<tr height=\"28\" bgcolor=\"f6f6f6\">\r\n");
      out.write("\t\t\t  \t<td>\r\n");
      out.write("\t\t\t  \t\t<select name=\"cal_range\" style=\"width:90px\" class=\"bs-select form-control\" onChange=\"if(this.value=='W') { parent.go_calendar('W'); }\">\r\n");
      out.write("\t\t\t\t\t\t<option value='W'>주간일정</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='M' selected>월간일정</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"year\" style=\"width:80px;\" class='bs-select form-control' onchange=\"goSearch();\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(DateUtil.getYearOptionTag(String.valueOf(intYear),"2011",DateUtil.getYear(),"desc","년"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"month\" style=\"width:65px;\" class='bs-select form-control' onchange=\"goSearch();\">\r\n");
      out.write("\t\t\t\t\t\t");
      out.print(DateUtil.getMonthOptionTag(StringUtil.lpad(String.valueOf(intMonth), "0", 2),"월"));
      out.write("\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<select name=\"plan_class\" style=\"width:85px;\" class='bs-select form-control' onchange=\"goSearch();\">\r\n");
      out.write("\t\t\t\t\t\t<option value=''>전체일정</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='1' ");
      out.print(box.get("plan_class").equals("1")?"selected":"");
      out.write(">개인일정</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='2' ");
      out.print(box.get("plan_class").equals("2")?"selected":"");
      out.write(">부서일정</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='3' ");
      out.print(box.get("plan_class").equals("3")?"selected":"");
      out.write(">전사일정</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"openPlanPopup('','EDIT');\" >새 일정 등록</button>\r\n");
      out.write("\t\t\t\t\t<span style=\"float:right\">\r\n");
      out.write("\t\t\t  \t\t\t<font color=\"blue\">●</font> 개인일정 <font color=\"4488dd\">●</font> 부서일정 <font color=\"\">●</font> 전사일정\r\n");
      out.write("\t\t\t  \t\t</span>\r\n");
      out.write("\t\t\t  \t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr height=\"300\">\r\n");
      out.write("\t\t\t\t<td class=\"table-in-table\">\r\n");
      out.write("\t\t\t\t\t<table class=\"table table-bordered\">\r\n");
      out.write("\t\t\t\t\t\t<tr height=\"20\">\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center_sun\"><font color=\"#740000\">일</font></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center\">월</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center\">화</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center\">수</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center\">목</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center\">금</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td width=\"14%\" class=\"schedule_table_header_center_sat\"><font color=\"#1B1464\"></font>토</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t");
  String memo_txt[] = {"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""};
						for(int i=0; i < rsWp.getLength(); i++) {
							String color = "";
							if(rsWp.get("plan_class_nm",i).startsWith("개인")) { color = "blue"; }
							if(rsWp.get("plan_class_nm",i).startsWith(uSesEnt.dept_nm)) { color = "4488dd"; }
							for(int j=rsWp.getInt("start_pos",i); j <= rsWp.getInt("end_pos",i); j++) {
								memo_txt[j] += (memo_txt[j].equals("")?"":"<br>");
								String memo = "<a href=\"javascript:openPlanPopup('"+rsWp.get("plan_no",i)+"','SELECT');\">"+rsWp.getCutStr("subject",i,20);
								if(rsWp.get("plan_class_nm",i).startsWith("공유")) { memo += StringUtil.replace(rsWp.get("plan_class_nm",i),"공유일정","")+"</a>"; }
								memo_txt[j] += "<span title='"+rsWp.get("plan_memo",i)+"' style=\"font-size:11px;font-weight:normal;color:"+color+";letter-spacing:-2px;\">" + memo + "</span>";
							}
						}
						
						int index = (dayOfWeek * -1) + 2;
						while(index <= monthLength){
							out.println("<tr height='90' align='center'>");
							for(int j=0; j <= 6; j++){
								boolean isToday = strToday.equals(DateUtil.toString("yyyyMM")+StringUtil.lpad(new Integer(index).toString(),"0",2)) ? true : false;
								if(j == 6) { // 토요일
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_blue' valign='top'");
								}else if(j == 0) { // 일요일
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_red'  valign='top'");
								}else {
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_gray' valign='top'"); 
								}
		
							   if(index > 0 && index <= monthLength){
									String dateStr = " onmouseover=this.style.backgroundColor='#F3F0D2' onmouseout=this.style.backgroundColor=''>";
									dateStr += "" + String.valueOf(index) + "<br><br>";
									out.println(dateStr + "<span style=\"font-size:11px; color:#666666; font-weight:normal; letter-spacing:-2px;\">"+memo_txt[index]+"</span></td>");
								}else{
									out.println("></td>");
								}
								index++;
							}
							out.println("</tr>");
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
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
