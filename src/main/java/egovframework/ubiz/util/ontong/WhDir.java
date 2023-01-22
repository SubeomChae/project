package egovframework.ubiz.util.ontong;

import java.util.ArrayList;

import egovframework.ubiz.util.ontong.batch.DoctbFileEnt;
import egovframework.ubiz.util.ontong.batch.DoctbFoldEnt;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;

public class WhDir extends WhAbstract implements WhItem {
	public Wh wh = null;
	public String rcvNo = "";
	public String dirId = "";
	public String parentDirId = "";
	public String dirNm = "";
	public String dirPath = "";
	public String sysRegId = "";
	
	public WhDir(Wh wh) {
		this.wh = wh;
	}
	
	public WhDir(Wh wh, Box box) {
		this.wh = wh;
		this.rcvNo = box.get("rcv_no");
		this.dirId = box.get("dir_id");
		this.parentDirId = box.get("parent_dir_id");
		this.dirNm = box.get("dir_nm");
		this.dirPath = box.get("dir_path");
	}
	
	public WhDir mkDir(String rcvNo, String dirNm, String sysRegId, ArrayList<DoctbFoldEnt> entLst) throws Exception {
		WhDir whDir = new WhDir(wh);
		whDir.rcvNo = rcvNo;
		whDir.dirId = WhCD.getNewID();
		whDir.parentDirId = this.dirId;
		whDir.dirNm = dirNm;
		whDir.dirPath = this.dirPath + dirNm + "/";
		whDir.sysRegId = sysRegId;
		
		entLst.add(new DoctbFoldEnt(whDir.dirId, whDir.parentDirId, whDir.dirNm, whDir.dirPath, sysRegId));
		
		return whDir;
	}
	
	public WhFile uploadFile(String rcvNo, String fileNm, String filePath, String fileSize, String sysRegId, ArrayList<DoctbFileEnt> entLst) throws Exception {
		WhFile whFile = new WhFile(wh);
		whFile.rcvNo = rcvNo;
		whFile.fileId = WhCD.getNewID();
		whFile.dirId = this.dirId;
		whFile.fileNm = fileNm;
		whFile.filePath = filePath;
		whFile.fileSize = fileSize;
		whFile.sysRegId = sysRegId;
		whFile.uploadYn = "Y";
		
		entLst.add(new DoctbFileEnt(whFile.fileId, whFile.dirId, whFile.fileNm, whFile.filePath, whFile.fileSize, whFile.uploadYn, whFile.sysRegId));
		return whFile;
	}
	
	public ArrayList<WhFile> getFiles() throws Exception {
		ArrayList<WhFile> fileList = new ArrayList<WhFile>();
		
		RsWrapper rsWp = wh.commDBService.execList("PR_DOCTB_FILE01_LIST", "LIST001", this.getBox());
		for(int i=0 ; i< rsWp.getLength(); i++) {
			fileList.add(new WhFile(wh, rsWp.getRsBoxAt(i)));
		}
		return fileList;
	}
	
	public ArrayList<WhItem> getDirFiles() throws Exception {
		ArrayList<WhItem> whItemList = new ArrayList<WhItem>();
		
		RsWrapper rsWp = wh.commDBService.execList("PR_DOCTB_FOLD01", "INSERT", this.getBox());
		for(int i=0 ; i< rsWp.getLength(); i++) {
			whItemList.add(new WhFile(wh, rsWp.getRsBoxAt(i)));
		}
		return whItemList;
	}
	
	public Box getBox() {
		Box ibox = new Box("");
		
		ibox.put("dir_id", dirId);
		ibox.put("parent_dir_id", parentDirId);
		ibox.put("dir_nm", dirNm);
		ibox.put("dir_path", dirPath);
		ibox.put("sys_reg_id", sysRegId);
		
		return ibox;
	}

	@Override
	public String getItemType() {
		return "DIR";
	}
	
}

