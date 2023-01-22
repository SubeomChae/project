<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<%!	public String fn_addr_col(String p_addr, int p_index) throws Exception {
		String v_rtn = "";
		String v_addr = StringUtil.rtrim(StringUtil.ltrim(p_addr));
		int v_length = v_addr.length();
		v_addr = StringUtil.replace(v_addr, "  ", " ");
		while(true) {
			if(v_length == v_addr.length()) { break; }
			v_length = v_addr.length();
			v_addr = StringUtil.replace(v_addr, "  ", " ");
		}
		v_addr = StringUtil.replace(v_addr, "세종특별자치시 ", "세종특별자치시  ");
		String addr[] = StringUtil.split(v_addr+"   ", " ", true);
		if(p_index == 1) {
			v_rtn = addr[0];
		}else if(p_index == 2) {
			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
				v_rtn = StringUtil.rtrim(addr[1] + " " + addr[2]);
			}else {
				v_rtn = addr[1];
			}
		}else if(p_index == 3) {
			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
				v_rtn = addr[3];
			}else {
				v_rtn = addr[2];
			}
		}else if(p_index == 4) {
			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
				for(int i=4; i < addr.length; i++) { 
					if(!addr[i].equals("")) { v_rtn += addr[i] + " "; }
				}
			}else {
				for(int i=3; i < addr.length; i++) { 
					if(!addr[i].equals("")) { v_rtn += addr[i] + " "; }
				}
			}
		}
        return StringUtil.rtrim(v_rtn);
	}
%>
<% 
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = box.get("inputYn"); 
	String roadFullAddr = box.get("roadFullAddr"); 
	String roadAddrPart1 = box.get("roadAddrPart1"); 
	String roadAddrPart2 = box.get("roadAddrPart2"); 
	String engAddr = box.get("engAddr"); 
	String jibunAddr = box.get("jibunAddr"); 
	String zipNo = box.get("zipNo"); 
	String addrDetail = box.get("addrDetail"); 
	String admCd = box.get("admCd");
	String rnMgtSn = box.get("rnMgtSn");
	String bdMgtSn  = box.get("bdMgtSn");
%>
<title>우편번호 찾기</title>
<script language="javascript">
	$(function() {
		var returnUrl = location.href;
		var confmKey = "U01TX0FVVEgyMDE1MDgxOTE3MjIwOQ==";
						
		var inputYn= "<%=inputYn%>";
		if(inputYn != "Y"){
			document.form1.confmKey.value = confmKey;
			document.form1.returnUrl.value = returnUrl;
			document.form1.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do";
			document.form1.submit();
		}else{
			openURL = opener.location.href;
			if(openURL.lastIndexOf("?method=") > 0) {
				start_pos = openURL.lastIndexOf("?method=");
				openURL = openURL.substring(start_pos + 8, start_pos + 16);
			}else if(openURL.lastIndexOf("?reqUrl=") > 0) {
				start_pos = openURL.lastIndexOf("?reqUrl=");
				openURL = openURL.substring(start_pos + 23, start_pos + 31);
			}

			if(openURL.endsWith('S02400')) {
				opener.document.saveForm.new_zip_no.value = '<%=zipNo%>';
				opener.document.saveForm.new_addr.value = '<%=roadFullAddr%>';
			}else {
				opener.document.saveForm.zip_no.value = '<%=zipNo%>';
				opener.document.saveForm.addr.value = '<%=roadFullAddr%>';
			}

			window.close();
		}
	});
</script>
<form id="form" name="form1" method="post">
<input type="hidden" id="confmKey" name="confmKey" value=""/>
<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
<input type="hidden" id="encodingType" name="encodingType" value="UTF-8"/>
</form>