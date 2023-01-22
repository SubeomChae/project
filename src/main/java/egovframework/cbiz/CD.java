package egovframework.cbiz;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
 
public class CD  {

	public static Logger logger = LogManager.getLogger("biz");
	private static SimpleDateFormat fmt1 = new SimpleDateFormat("yyyyMMddHHmmss");
	private static SimpleDateFormat fmt2 = new SimpleDateFormat("S");
	private static String last_time_id = "0";
    public static String propPath = "";

    public static String IS_LOGIN = "IS_LOGIN";
	public static String SS_USER_ID = "SS_USER_ID";
    public static String USER_SES_KEY = "uSesEnt";

	public static synchronized String getNewID() {
		Date ct = new Date();
		fmt1.format(ct);
		String id = fmt1.format(ct) + org.apache.commons.lang.StringUtils.leftPad(fmt2.format(ct), 3, "0");
		if (Long.parseLong(id) <= Long.parseLong(last_time_id)) {
			id = String.valueOf(Long.parseLong(last_time_id) + 1);
		}
		last_time_id = id;
		return id;
	}

	public static String rgetNvl(String key, String nval, HttpServletRequest request) {
		if (request.getParameter(key) == null || request.getParameter(key).equals("")) {
			return nval;
		} else {
			return request.getParameter(key);
		}
	}
	
 
	public static String mget(String key, java.util.Map map) {
		if (map.containsKey(key.toUpperCase())) {
			return map.get(key.toUpperCase()).toString();
		} else if (map.containsKey(key.toLowerCase())) {
			return map.get(key.toLowerCase()).toString();
		} else if (map.containsKey(key)) {
			return map.get(key).toString();
		} else {
			return "";
		}
	}
}