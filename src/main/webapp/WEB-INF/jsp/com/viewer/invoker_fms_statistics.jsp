<%@ page contentType="text/html; charset=MS949" %> 
<%@ page language="java" import="java.io.*, java.util.*, java.net.*" %>
<%@ page language="java" import="m2soft.ers.invoker.InvokerException" %>
<%@ page language="java" import="m2soft.ers.invoker.http.ReportingServerInvoker" %>
<%
	String svr_domain = request.getParameter("server_domain");
	String export_type = "pdf";
	String export_name = request.getParameter("export_name") + "." + export_type;
	String form_id 			= request.getParameter("form_id") + ".mrd";

	ReportingServerInvoker invoker = new ReportingServerInvoker(svr_domain + "/ReportingServer/service");
	invoker.setCharacterEncoding("UTF-8");
	invoker.setReconnectionCount(5);
	invoker.setConnectTimeout(180);
	invoker.setReadTimeout(180);
	invoker.addParameter("opcode",		"500");
	invoker.addParameter("mrd_path",	svr_domain + "/com/RDHome/statistics/" + form_id);
	invoker.addParameter("mrd_param",	request.getParameter("mrd_param"));
	invoker.addParameter("export_type", export_type);
	export_name = java.net.URLDecoder.decode(export_name);
	invoker.addParameter("export_name",	export_name);
	invoker.addParameter("protocol",	"sync");

	boolean isOk = false;
	try	{
		String responseString = invoker.invoke();
		System.out.println("responseString : " + responseString);
		out.println(responseString);
		/*
		if(responseString.startsWith("1")) {
			isOk = true;
			// 리포트 PDF 파일 복사
			String file_path = "D:/WebRoot/small/upload_data/"+export_name;
			wsfw.biz.link.linkDataPkg pkg = new wsfw.biz.link.linkDataPkg();
			
			pkg.user_id 	= request.getParameter("user_id");	
			pkg.facil_no 	= request.getParameter("facil_no");	
			pkg.file_name 	= export_name;	
			pkg.data_type 	= "file";	
			pkg.mFile = wsfw.biz.link.LinkUtil.getFileByte(file_path); 
				
			BufferedReader br = new BufferedReader(new InputStreamReader(wsfw.biz.link.LinkUtil.sendPostMessage((Serializable)pkg)));
			String result = br.readLine();
			String arr[] = wsfw.lib.util.StringUtil.split(result,"|",true);
			System.out.println(arr[0]);
			if(arr[0].equals("0000")) {
				wsfw.lib.util.FileUtil.doDeleteFile(file_path);
			}else {
				isOk = false;
			}
		}
		*/
	}catch(InvokerException e) {
		e.printStackTrace();
	}
	
%>