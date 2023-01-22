package egovframework.ubiz;

import java.util.HashMap;

public class ErrMsg {

	private static ErrMsg singleton = new ErrMsg();

	private HashMap<String, String> hm = new HashMap<String, String>();

	private ErrMsg() {
		hm.put("SYS_EX", "오류가 발생하였습니다.");
	}

	public static ErrMsg getInstance() {
		return singleton;
	}

	public String getMsg(String errCd) {
		if (hm.containsKey(errCd)) {
			return hm.get(errCd);
		} else {
			return "오류가 발생하였습니다.";
		}
	}

}
