package egovframework.ubiz.util.ontong.batch;

public class DoctbFileEnt  {

	public String fileId = "";
	public String dirId = "";
	public String fileNm = "";
	public String filePath = "";
	public String fileSize = "";
	public String uploadYn = "";
	public String sysRegId = "";
	
	public DoctbFileEnt(String fileId, String dirId, String fileNm, String filePath, String fileSize, String uploadYn, String sysRegId) {
		this.fileId = fileId;
		this.dirId = dirId;
		this.fileNm = fileNm;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.uploadYn = uploadYn;
		this.sysRegId = sysRegId;
	}
	
	public String toString() {
		return "fileId : [" + fileId + "] "
				+ " dirId : [" + dirId + "] "
				+ " fileNm : [" + fileNm + "] "
				+ " filePath : [" + filePath + "] "
				+ " fileSize : [" + fileSize + "] "
				+ " uploadYn : [" + uploadYn + "] "
				+ " sysRegId : [" + sysRegId + "] ";
	}
}
