/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 08:10:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ubi4.check;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.jar.*;
import java.io.File;

public final class jarcheck_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.util.jar");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.File");
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


	String appPath = "";
	try { appPath = request.getRealPath("/"); } catch(Exception e) {}
	if( appPath == null || appPath.equals("") )
		try { appPath = this.getClass().getResource("/").getPath(); } catch(Exception e) {}

	boolean checkFlag = false;
	String jar = request.getParameter("jar");
	String version = "";

	if( jar == null || jar.equalsIgnoreCase("null") || jar.equals("") ) {

		checkFlag = false;
		jar = appPath + "WEB-INF" + File.separator + "lib" + File.separator + "UbiServer.jar";
	}
	else {

		try {
			
			JarFile fJar = new JarFile(jar);
			Manifest manifest = fJar.getManifest();
			Attributes attrs = manifest.getMainAttributes();
			version = attrs.getValue("version");
		}
		catch(Exception e) {
			
			version = e.getMessage();
		}
		finally {
			checkFlag = true;
		}
	}



      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("<title>Jar 버전 확인</title>\r\n");
      out.write("<style>\r\n");
      out.write("\tbody  { font-family:sans-serif, arial; font-size:9pt; }\r\n");
      out.write("\ttable { font-family:sans-serif, arial; font-size:9pt; }\r\n");
      out.write("</style>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("\tfunction checkVersion() {\r\n");
      out.write("\r\n");
      out.write("\t\tif(document.jarcheck.jar.value == \"\") {\r\n");
      out.write("\r\n");
      out.write("\t\t\talert(\"Please Input URL(ex : /webapp/myapp/WEB-INF/lib/UbiServer.jar)\");\r\n");
      out.write("\t\t\tdocument.jarcheck.jar.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse document.jarcheck.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("//-->\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"margin:10\">\r\n");
      out.write("\tHostname : [");
      out.print( java.net.InetAddress.getLocalHost().getHostName() );
      out.write("]<br>\r\n");
      out.write("\r\n");
      out.write("\t<h2>Jar Version Check</h2>\r\n");
      out.write("\t<form name='jarcheck' method='post' action='./jarcheck.jsp'>\r\n");
      out.write("\t\t<table width=\"585\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#808080\" bordercolorlight=\"#C0C0C0\" bordercolordark=\"#F6F6F6\">\r\n");
      out.write("\t\t\t<tr height=\"30\">\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#C0C0C0\" width=\"120px\" style='padding:3px'>App Home</td>\r\n");
      out.write("\t\t\t\t<td align=\"left\" style='padding:3px'>");
      out.print( appPath );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr height=\"30\">\r\n");
      out.write("\t\t\t\t<td align=\"center\" bgcolor=\"#C0C0C0\" width=\"120px\" style='padding:3px'>Jar File</td>\r\n");
      out.write("\t\t\t\t<td align=\"left\" style='padding:3px'>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"jar\" size=\"55\" value=\"");
      out.print( jar );
      out.write("\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");

	if( checkFlag ) {

      out.write("\r\n");
      out.write("\t\t\t<tr height=\"30\">\r\n");
      out.write("\t\t\t\t<td align=\"center\" style='padding:3px' colspan='2'>");
      out.print( version );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\r\n");
      out.write("\t\t<table width=\"585\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#808080\" bordercolorlight=\"#C0C0C0\" bordercolordark=\"#F6F6F6\">\r\n");
      out.write("\t\t\t<tr height=\"30\">\r\n");
      out.write("\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" value=\"Version CHECK\" onclick=\"checkVersion()\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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