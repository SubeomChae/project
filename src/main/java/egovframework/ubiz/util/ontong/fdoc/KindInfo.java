package egovframework.ubiz.util.ontong.fdoc;

import java.util.ArrayList;

public class KindInfo {
	
	public String kindNm = "";
	int kindCnt = 0;	
	public ArrayList<TitleInfo> titleList = new ArrayList<TitleInfo>();
	
	public KindInfo(String kindNm, String kindCnt) {
		this.kindNm = kindNm.trim();
		if (kindCnt.equals("") == false) {
			this.kindCnt = Integer.parseInt(kindCnt);
		}
	}
	
	public String getTitleInfoDebug() {
		String rtn = "";
		for(int i=0; i < titleList.size(); i++) {
			rtn += titleList.get(i).level + ":" + titleList.get(i).title + ":" + titleList.get(i).fileFrom + ", ";
		}
		return rtn;
	}
	
	public String getPathName() {
		return kindNm;
 	}
	
	public String getKindId() {
		return kindNm;
	}
}
