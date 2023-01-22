package egovframework.ubiz.util.ontong.batch;

public class DoctbFoldEnt  {

	public String dirId = "";
	public String parentDirId = "";
	public String dirNm = "";
	public String dirPath = "";
	public String sysRegId = "";
	
	public DoctbFoldEnt(String dirId, String parentDirId, String dirNm, String dirPath, String sysRegId) {
		this.dirId = dirId;
		this.parentDirId = parentDirId;
		this.dirNm = dirNm;
		this.dirPath = dirPath;
		this.sysRegId = sysRegId;
	}
	
	public String toString() {
		return "dirId : [" + dirId + "] "
				+ " parentDirId : [" + parentDirId + "] "
				+ " dirNm : [" + dirNm + "] "
				+ " dirPath : [" + dirPath + "] "
				+ " sysRegId : [" + sysRegId + "] ";
	}
}
