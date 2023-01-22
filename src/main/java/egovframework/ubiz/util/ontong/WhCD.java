package egovframework.ubiz.util.ontong;

import java.text.SimpleDateFormat;
import java.util.Date;

import egovframework.cbiz.util.StringUtil;
	
public class WhCD {

	private static SimpleDateFormat fmt1 = new SimpleDateFormat("yyyyMMddHHmmss");
	
	private static SimpleDateFormat fmt2 = new SimpleDateFormat("S");

	private static String last_time_id = "0";

	public static synchronized String getNewID() {
		Date ct = new Date();
		fmt1.format(ct);
		String id = fmt1.format(ct) + StringUtil.lpad(fmt2.format(ct),"0",3);
		if(Long.parseLong(id) <= Long.parseLong(last_time_id) ) {
			id = String.valueOf(Long.parseLong(last_time_id) + 1);
		}
		last_time_id = id;
		return id;
	}
}