package egovframework.ubiz.util.ontong;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import egovframework.ubiz.util.ontong.batch.DoctbFoldEnt;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.CodeUtil;
import egovframework.cbiz.util.StringUtil;
	
public class Wh extends WhAbstract {
	
	public CommDBService commDBService = null;
	
	private String rootDirId = "ROOT";
	
	public Wh(CommDBService commDBService) {
		this.commDBService = commDBService;
	}
	
	public WhDir getDirById(String dirId) throws Exception {
		Box ibox = new Box("");
		ibox.put("dir_id", dirId);
		Box dbox = commDBService.execBox("PR_DOCTB_FOLD01", "SELECT", ibox);
		return new WhDir(this, dbox);
	}
	
	public WhDir getDirByPath(String dirPath) throws Exception {
		Box ibox = new Box("");
		ibox.put("dir_path", dirPath);
		Box dbox = commDBService.execBox("PR_DOCTB_FOLD01", "SELECT_BY_PATH", ibox);
		return new WhDir(this, dbox);
	}
	
	public WhDir mkDir(String rcvNo, String dirNm, String sysRegId, ArrayList<DoctbFoldEnt> entLst) throws Exception {
		WhDir whDir = new WhDir(this);
		whDir.rcvNo = rcvNo;
		whDir.dirId = WhCD.getNewID();
		whDir.parentDirId = rootDirId;
		whDir.dirNm = dirNm;
		whDir.dirPath = "/" + dirNm + "/";
		whDir.sysRegId = sysRegId;
		entLst.add(new DoctbFoldEnt(whDir.dirId, whDir.parentDirId, whDir.dirNm, whDir.dirPath, sysRegId));
	
		return whDir;
	} 
	
	public ArrayList<WhItem> getRcvNoItemList(String rcvNo) throws Exception {
		ArrayList<WhItem> whItems = new ArrayList<WhItem>();
		
		Box ibox = new Box("");
		ibox.put("param01", rcvNo);
		RsWrapper rsWp = commDBService.execList("PR_DOCTB_FOLD01_LIST", "LIST001", ibox);
		for(int i=0; i < rsWp.getLength(); i++) {
			if(rsWp.get("fd_gbn", i).equals("F")) {
				whItems.add(new WhFile(this));
			}
		}
		return whItems;
	}
}