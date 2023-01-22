package egovframework.ubiz.util.ontong;

import java.io.File;

import egovframework.cbiz.Box;
import egovframework.ubiz.util.OntongUtil;

public class WhFile extends WhAbstract implements WhItem {
	public Wh wh = null;
	public String rcvNo = "";
	public String fileId = "";
	public String dirId = "";
	public String fileNm = "";
	public String filePath = "";
	public String fileSize = "";
	public String uploadYn = "";
	public String sysRegId = "";
	
	public WhFile(Wh wh) {
		this.wh = wh;
	}
	
	public WhFile(Wh wh, Box box) {
		this.wh = wh;
		this.rcvNo = box.get("rcv_no");
		this.fileId = box.get("file_id");
		this.dirId = box.get("dir_id");
		this.fileNm = box.get("file_nm");
		this.filePath = box.get("file_path");
		this.fileSize = box.get("file_size");
		this.uploadYn = box.get("upload_yn");
		this.sysRegId = box.get("sys_reg_id");
	}
	
	public boolean deleteFile() {
		String filePath = OntongUtil.getStorageDir(rcvNo) + "/" + rcvNo + "/" + this.fileId;
		File f = new File(filePath);
		try {
			wh.commDBService.exec("PR_DOCTB_FILE01", "DELETE", this.getBox());
			f.delete();
			return true;
		} catch (Exception ex) {
			return false;
		}
	}
	
	public Box getBox() {
		Box ibox = new Box("");
		ibox.put("rcv_no", this.rcvNo);
		ibox.put("file_id", this.fileId);
		ibox.put("dir_id", this.dirId);
		ibox.put("file_nm", this.fileNm);
		ibox.put("file_path", this.filePath);
		ibox.put("file_size", this.fileSize);
		ibox.put("upload_yn", this.uploadYn);
		ibox.put("sys_reg_id", this.sysRegId);
		
		return ibox;
	}

	@Override
	public String getItemType() {
		return "FILE";
	}
}

