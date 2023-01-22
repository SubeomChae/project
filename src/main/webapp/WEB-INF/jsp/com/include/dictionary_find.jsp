<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 	String myURI = request.getRequestURI();
	String key = "";
	if(myURI.indexOf("bas11002") > 0 || myURI.indexOf("bas11003") > 0 || myURI.indexOf("bas03002") > 0 || myURI.indexOf("bas03003") > 0) { 
		key = "MAST"; 
	}else if(myURI.indexOf("bas12002") > 0 || myURI.indexOf("bas12003") > 0) { 
		key = myURI.substring(myURI.indexOf("_")+1, myURI.indexOf(".")).toUpperCase();
	}
	RsWrapper dictWp = new RsWrapper();
	if(!key.equals("")) { dictWp = CodeUtil.getRsWrapper("PR_COMTB_TERM01_LIST","LIST001", "", "","",key,"",""); }
%>
<%!	public String getDictionary(RsWrapper rsWp, String column_nm) throws Exception {
		for(int i=0; i < rsWp.getLength(); i++) {
			if(rsWp.get("column_nm",i).replaceAll(" ","").equals(column_nm.replaceAll(" ",""))) {
				return rsWp.get("terms_desc",i);
			}
		}
		return "";
	}
%>
