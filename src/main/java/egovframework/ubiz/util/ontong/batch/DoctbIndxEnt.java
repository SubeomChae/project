package egovframework.ubiz.util.ontong.batch;

public class DoctbIndxEnt  {

	public String rcvNo = "";
	public String reportId = "";
	public String indexSeq = "";
	public String fileFrom = "";
	public String fileType = "";
	public String contentLvl = "";
	public String contentDesc = "";
	public String sysRegId = "";
	
	public String toString() {
		return "rcvNo : [" + rcvNo + "] "
				+ " reportId : [" + reportId + "] "
				+ " indexSeq : [" + indexSeq + "] "
				+ " fileFrom : [" + fileFrom + "] "
				+ " fileType : [" + fileType + "] "
				+ " contentLvl : [" + contentLvl + "] "
				+ " contentDesc : [" + contentDesc + "] "
				+ " sysRegId : [" + sysRegId + "] ";
	}
}
