/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-26 04:36:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.welfare.SABOK22;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;
import egovframework.cbiz.service.*;

public final class wel21002_005fexcel_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("egovframework.cbiz.service");
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
      out.write("\r\n");
      egovframework.cbiz.service.impl.CommDBServiceImpl commDBService = null;
      commDBService = (egovframework.cbiz.service.impl.CommDBServiceImpl) _jspx_page_context.getAttribute("commDBService", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (commDBService == null){
        commDBService = new egovframework.cbiz.service.impl.CommDBServiceImpl();
        _jspx_page_context.setAttribute("commDBService", commDBService, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
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
      egovframework.cbiz.RsWrapper colWp = null;
      colWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("colWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (colWp == null){
        colWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("colWp", colWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
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

	String file_nm = box.get("excel_file_nm");
	String bugt_cd = StringUtil.substr(box.get("bugt_cd"), 0, 4);
	String bugt_arr = "";
	String bugt_txt = "";
	String bugt_lth = "";
	if(bugt_cd.equals("")){
		bugt_arr += "bugt_nm@";
		bugt_txt += "구분@";
		bugt_lth += "100@";
	}
	bugt_arr += "empl_no@empl_nm@dept_nm@position_nm@";
	bugt_txt += "사번@성명@부서명@직위@";
	
	if(!bugt_cd.equals("S700") && !bugt_cd.equals("S008")) { 
		bugt_arr += "apply_ymd@apply_amt@";
		bugt_txt += "신청일자@신청금액@";			
	}
	if(bugt_cd.equals("S001")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@cong_class_nm@start_ymd@end_ymd@cong_place@";
		bugt_txt += "가족관계@성명@주민등록번호@경조구분@경조시작일@경조종료일@경조장소@";
	}else if(bugt_cd.equals("S002")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@disease_nm@medi_org_nm@inner_start_ymd@inner_end_ymd@";
		bugt_txt += "가족관계@성명@주민등록번호@질병명@의료기관명@입원시작일@입원종료일@";
	}else if(bugt_cd.equals("S003") || bugt_cd.equals("S024") || bugt_cd.equals("S025")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@school_nm@school_flag_nm@school_year@school_term@major_nm@";
		bugt_txt += "가족관계@성명@주민등록번호@학교명@학교구분@학년@학기@전공@";
	}else if(bugt_cd.equals("S004")) {
		bugt_arr += "course_nm@start_ymd@end_ymd@edu_org_nm@edu_org_tel@edu_org_addr@";
		bugt_txt += "교육명@교육시작일@교육종료일@교육기관@기관연락처@기관주소@";
	}else if(bugt_cd.equals("S005")) {
		bugt_arr += "condo_nm@start_ymd@end_ymd@";
		bugt_txt += "휴양시설명@시작일@종료일@";
	}else if(bugt_cd.equals("S006")) {
		bugt_arr += "sub_nm@start_ymd@end_ymd@event_place@event_content@";
		bugt_txt += "동호인회@행사시작일@행사종료일@장소@행사내용@";
	}else if(bugt_cd.equals("S700") || bugt_cd.equals("S008")) {
		bugt_arr += "entry_ymd@reside_no@empl_class_nm@empl_status_nm@pay_ymd@pay_amt@";
		bugt_txt += "입사일자@주민번호@사원구분@재직상태@지급일자@지급액@";
	}else if(bugt_cd.equals("S022") || bugt_cd.equals("S023")) {
		bugt_arr += "desease_nm@inner_start_ymd@inner_end_ymd@";
		bugt_txt += "질병명@입원기간@입원기간@";
	}
	if(bugt_cd.equals("")){
		bugt_arr += "etc_remark@";
		bugt_txt += "비고@";
	}
	
	String[] column_arr = StringUtil.split(bugt_arr + "sign_status_nm","@",true);	
	String[] column_txt = StringUtil.split(bugt_txt + "상태","@",true);	
	String[] column_lth = StringUtil.split(bugt_lth + "100@70@200@80@","@",true);
	RsWrapper excelWp = new RsWrapper();
	for(int i=0; i < column_arr.length; i++) {
		Box rsBox = new Box("");
		String cell_key = column_arr[i];
		rsBox.put("cell_key", cell_key);
		rsBox.put("mark_hdr_nm", column_txt[i]);
		rsBox.put("cell_width", i < column_lth.length-1 ? column_lth[i] : "120");
		rsBox.put("align_type", "C");
		if(cell_key.endsWith("reside_no")) { rsBox.put("fmt_mask", "JUMIN_NO"); }
		if(cell_key.endsWith("_amt")) { rsBox.put("fmt_mask", "MONEY"); rsBox.put("align_type", "R"); }
		if(cell_key.endsWith("_ymd")) { rsBox.put("fmt_mask", "DATE"); }
		if(cell_key.endsWith("_content")) { rsBox.put("fmt_mask", "MULTILINE"); }
		
		excelWp.appendRs(rsBox);
	}
	
	String excelPath = "";
	String sql_stmt = obox.get("sql_stmt").replaceAll("&lt;","<").replaceAll("&gt;",">").replaceAll("&acute;", "'");
	System.out.println(sql_stmt);
	if(!sql_stmt.equals("")) {
		Box ibox = new Box("");
		ibox.put("sql_stmt", sql_stmt);
		ibox.put("excel_form_no", "wel21002");
		ibox.put("excel_file_nm", file_nm);
		Box rbox = commDBService.execSQLXls(excelWp, ibox); 
		excelPath = rbox.get("excelPath");
	}

      out.write("\r\n");
      out.write("<script language='javascript'>\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t\tif(!isEmpty(document.main.file_path)) {\r\n");
      out.write("\t\t\tfileDownload(document.main, document.main.file_path.value, document.main.file_nm.value);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"main\" name=\"main\" method=\"post\" action=\"\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"pathKey\" \tvalue=\"temp\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_nm\"     value=\"");
      out.print(file_nm);
      out.write(".xls\">\r\n");
      out.write("<input type=\"hidden\" name=\"file_path\"   value=\"");
      out.print(excelPath);
      out.write("\">\r\n");
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
