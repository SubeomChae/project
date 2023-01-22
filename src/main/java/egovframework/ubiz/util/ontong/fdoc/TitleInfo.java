package egovframework.ubiz.util.ontong.fdoc;

import egovframework.cbiz.CD;
import egovframework.cbiz.util.StringUtil;


public class TitleInfo {

	public String dirId = "";
	public String title = "";
	public String fileFrom = "";
	public String fileTo = "";
	public String dirPath = "";
	public int level = 0;	
	
	public TitleInfo(String level, String title, String fileFrom) {
		this.dirId = CD.getNewID();
		this.title = title;
		this.fileFrom = fileFrom;
		this.level = Integer.parseInt(level);
	}
	
	public String getFilePathList(String upPath) {
		int f = Integer.parseInt(fileFrom);
		int t = Integer.parseInt(fileTo);
		
		StringBuffer sb = new StringBuffer();
		for(int i=f; i <=t; i++) {
			sb.append(dirId + "@" + upPath + "@" + StringUtil.lpad(i+"", "0", 4) + ".tif@" + StringUtil.lpad(i+"", "0", 4) + ".tif\n");
		}
		return sb.toString();
	}
}
