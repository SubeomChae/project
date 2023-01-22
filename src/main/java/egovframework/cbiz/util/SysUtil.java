package egovframework.cbiz.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.cbiz.CustomProperty;

public class SysUtil {

	public static String getCookie(String key, HttpServletRequest request) {
		String rtn = "";
		if (request.getCookies() != null) {
			Cookie ck[]=request.getCookies();
			for(int i=0;i<ck.length;i++){
				if (ck[i].getName().equals(key)) {
					rtn = ck[i].getValue();
					break;
				}
			}  
		}
		return rtn;
	}
	
	public static void setCookie(String key, String val, int age, String path, HttpServletResponse response) {
		Cookie ck = new Cookie(key, val);
		ck.setMaxAge(age);
		ck.setPath(path);
		response.addCookie(ck);
	}
	
	public static boolean isPermitedIP(String key, String remote_ip) {
		boolean isOK = false;
		String permited = "";
		if(key.equals("local")) {
			if(isLocalhost(remote_ip)) { return true; } 
			permited = CustomProperty.local_addr;
		}else if(key.equals("admin")) {
			if(isLocalhost(remote_ip)) { return true; } 
			permited = CustomProperty.admin_desk;
		}
		
		String ip_arr[] = StringUtil.split(permited, ";", true);
		for(int i=0; i < ip_arr.length; i++) {
			if(!ip_arr[i].equals("") && remote_ip.startsWith(ip_arr[i])) {
				isOK = true;
				break;
			}
		}
		return isOK;
	}
	
	public static boolean isLocalhost(String remote_ip) {
		if(remote_ip.startsWith("127.") || remote_ip.startsWith("0:")) { return true; }
		return false;
	}
	
	public static String getFacilUrl(String facil_no) {
		String dir = "";
		String facil_form_cd = FormatUtil.nvl2(StringUtil.substr(facil_no,0,2),"xx"); 
		if("BR,CS".indexOf(facil_form_cd) >= 0) { dir = "bridge"; }
		else if("TU,UR".indexOf(facil_form_cd) >= 0) { dir = "tunnel"; }
		else if("HL,HM,HB".indexOf(facil_form_cd) >= 0) { dir = "habor"; }
		else if("AR".indexOf(facil_form_cd) >= 0) { dir = "building"; }
		else if("DA,ED,EB,WG,EM,BO,DP,WS,ST".indexOf(facil_form_cd) >= 0) { dir = "water"; }
		else if("RW".indexOf(facil_form_cd) >= 0) { dir = "rtwall"; }
		else if("SL".indexOf(facil_form_cd) >= 0) { dir = "slope"; }
		else if("UC".indexOf(facil_form_cd) >= 0) { dir = "upcon"; }
		
		return dir;
	}

	public static String getFacilDir(String facil_no) {
		String dir = "";
		String facil_form_cd = FormatUtil.nvl2(StringUtil.substr(facil_no,0,2),"xx"); 
		if("BR,CS".indexOf(facil_form_cd) >= 0) { dir = "br"; }
		else if("TU,UR".indexOf(facil_form_cd) >= 0) { dir = "tu"; }
		else if("HL,HM,HB".indexOf(facil_form_cd) >= 0) { dir = "ha"; }
		else if("AR".indexOf(facil_form_cd) >= 0) { dir = "ar"; }
		else if("DA,ED,EB,WG,EM,BO,DP,WS,ST".indexOf(facil_form_cd) >= 0) { dir = "wa"; }
		else if("RW".indexOf(facil_form_cd) >= 0) { dir = "rw"; }
		else if("SL".indexOf(facil_form_cd) >= 0) { dir = "sl"; }
		else if("UC".indexOf(facil_form_cd) >= 0) { dir = "uc"; }
		
		return dir;
	}

	public static void main(String[] args) {

	}
}
