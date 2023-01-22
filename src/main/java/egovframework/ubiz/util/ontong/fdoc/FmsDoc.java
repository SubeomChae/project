package egovframework.ubiz.util.ontong.fdoc;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;

import egovframework.ubiz.util.OntongUtil;
import egovframework.ubiz.util.ontong.EDocUtil;
import egovframework.ubiz.util.ontong.Wh;
import egovframework.ubiz.util.ontong.WhCD;
import egovframework.ubiz.util.ontong.WhDir;
import egovframework.ubiz.util.ontong.batch.DoctbFileEnt;
import egovframework.ubiz.util.ontong.batch.DoctbFoldEnt;
import egovframework.ubiz.util.ontong.batch.DoctbIndxEnt;
import egovframework.ubiz.util.ontong.batch.DoctbReptEnt;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.CD;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.XMLUtil;


public class FmsDoc {
	public boolean isFmsDocFld = false;
	public String rcvNo = "";
	public String rootDirPath = "";
	public Document xMstDoc = null;
	public ArrayList<CdInfo> alCdDocList = new ArrayList<CdInfo>();
	public ArrayList<CdInfo> alCdDwgList = new ArrayList<CdInfo>();
	public String docCdCnt = "";
	public String dwgCdCnt = "";
	
	public ArrayList<FacilInfo> alFacil = new ArrayList<FacilInfo>();
	
	public String masterXmlPath = "";
	public ArrayList<String> alDocList = new ArrayList<String>();
	public ArrayList<String> alDwgList = new ArrayList<String>();
	
	public String getConstNm() throws Exception {
		String rtn = "";
		if(isFmsDoc()) {
			rtn = XMLUtil.getSingleElement("/master/const_info/const_nm", xMstDoc).getText();
		}
		return rtn;
	}
	
	public String getReqNm() throws Exception {
		String rtn = "";
		if(isFmsDoc()) {
			rtn = XMLUtil.getSingleElement("/master/const_info/req_nm", xMstDoc).getText();
		}
		return rtn;
	}
	
	public String getConstYmdFrom() throws Exception {
		String rtn = "";
		if(isFmsDoc()) {
			rtn = XMLUtil.getSingleElement("/master/const_info/const_ymd_from", xMstDoc).getText();
		}
		return rtn;
	}
	
	public String getConstYmdTo() throws Exception {
		String rtn = "";
		if(isFmsDoc()) {
			rtn = XMLUtil.getSingleElement("/master/const_info/const_ymd_to", xMstDoc).getText();
		}
		return rtn;
	}
	
	public String getCplYmd() throws Exception {
		String rtn = "";
		if(isFmsDoc()) {
			rtn = XMLUtil.getSingleElement("/master/const_info/cpl_ymd", xMstDoc).getText();
		}
		return rtn;
	}
	
	public List getFacilList() throws Exception {
		List list = null;
		if(isFmsDoc()) {
			list = XMLUtil.getMultiElements("/master/facil_info", xMstDoc);
		}
		return list;
	}
	
	public String getDirPath(String dirId) throws Exception {
		String dirPath = "";
		for(CdInfo cdInfo : alCdDocList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.dirId.equals(dirId)) {
						dirPath = titleInfo.dirPath;
					}
				}
			}
		}
		for(CdInfo cdInfo : alCdDwgList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.dirId.equals(dirId)) {
						dirPath = titleInfo.dirPath;
					}
				}
			}
		}
		return dirPath;
	}
	
	public File[] getDirFileList(String dirId) throws Exception {
		File[] fileList = null;
		String dirPath = getDirPath(dirId);
		File dir = new File(dirPath.equals("") ? "/xxxxx" : dirPath);
		
		return dir.listFiles();
	}
	
	public String getSysFilePath(String dirId, String fileNm) throws Exception  {
		String dirPath = getDirPath(dirId);
		String filePath = (dirPath.equals("") ? "/xxxxx" : dirPath) + "/" + fileNm;
		
		return filePath;
	}
	
	public String getTreeArray() throws Exception {
		StringBuffer sb = new StringBuffer();
		StringBuffer sbFile = new StringBuffer();
		Hashtable<String, TitleInfo> htTitleInfo = new Hashtable<String, TitleInfo>();
		sb.append(String.format("{id:'0', name:'%s', open:true},\n", OntongUtil.getDocRcvNo(rcvNo)));
		for(CdInfo cdInfo : alCdDocList) {
			sb.append(String.format("{id:'%s', pId:'0', name:'%s', isParent:true, open:true},\n", cdInfo.getCdId(), cdInfo.getPathName()));
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				String rptPath = rootDirPath + cdInfo.getPathName() + "/" + kindInfo.getPathName(); 
				sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", kindInfo.getKindId(), cdInfo.getCdId(), kindInfo.kindNm));
				File rpt = new File(rptPath);
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.level == 1) {
						sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", titleInfo.dirId, kindInfo.getKindId(), titleInfo.title));
						htTitleInfo.put("1", titleInfo);
						sbFile.append(titleInfo.getFilePathList(cdInfo.getPathName() + "/" + kindInfo.getPathName())+"\n");
					}else {
						String pId = htTitleInfo.get((titleInfo.level-1)+ "").dirId;
						sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", titleInfo.dirId, pId, titleInfo.title));						
						htTitleInfo.put(titleInfo.level+"", titleInfo);
						sbFile.append(titleInfo.getFilePathList(cdInfo.getPathName() + "/" + kindInfo.getPathName())+"\n");
					}
				}
			}
		}
		for(CdInfo cdInfo : alCdDwgList) {
			sb.append(String.format("{id:'%s', pId:'0', name:'%s', isParent:true, open:true},\n", cdInfo.getCdId(), cdInfo.getPathName()));
			for (KindInfo kindInfo : cdInfo.alKindInfo) {
				String rptPath = rootDirPath + cdInfo.getPathName() + "/" + kindInfo.getPathName(); 
				sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", kindInfo.getKindId(), cdInfo.getCdId(), kindInfo.kindNm));
				File rpt = new File(rptPath);
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.level == 1) {
						sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", titleInfo.dirId, kindInfo.getKindId(), titleInfo.title));
						htTitleInfo.put("1", titleInfo);
						sbFile.append(titleInfo.getFilePathList(cdInfo.getPathName() + "/" + kindInfo.getPathName())+"\n");
					}else {
						String pId = htTitleInfo.get((titleInfo.level-1)+ "").dirId;
						sb.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", titleInfo.dirId, pId, titleInfo.title));						
						htTitleInfo.put(titleInfo.level+"", titleInfo);
						sbFile.append(titleInfo.getFilePathList(cdInfo.getPathName() + "/" + kindInfo.getPathName())+"\n");
					}
				}
			}
		}
		return sb.toString() + "@@@" + sbFile.toString();
	}

	public String getTreeArrayByDirFile(String rootPath) throws Exception {
		StringBuffer sbDir = new StringBuffer();
		StringBuffer sbFile = new StringBuffer();
		Hashtable<String, TitleInfo> htTitleInfo = new Hashtable<String, TitleInfo>();
		
		sbDir.append(String.format("{id:'0', name:'%s', open:true},\n", OntongUtil.getDocRcvNo(rcvNo)));
		getDirFilesInfo(rootPath, "0", rootPath, sbDir, sbFile);
		
		return sbDir.toString() + "@@@" + sbFile.toString();
	}
	
	public void getDirFilesInfo(String rootPath, String pId, String path, StringBuffer sbDir, StringBuffer sbFile ) {
		File root = new File( path );
		File[] list = root.listFiles();

		if(list == null) return;
		for(File f : list) {
			if(f.isDirectory()) {
				String nId = CD.getNewID();
				sbDir.append(String.format("{id:'%s', pId:'%s', name:'%s', isParent:true, open:true},\n", nId, pId, f.getName()));
				getDirFilesInfo(rootPath,nId, f.getAbsolutePath(), sbDir, sbFile );
			}else {
				String upPath = path.replaceAll("\\\\", "/").replaceAll(rootPath.replaceAll("\\\\", "/"), "");
				sbFile.append(pId + "@" + upPath + "@" + f.getName() + "@" + f.getName() + "\n");
			}
		}
	}
	
	public void tempInsRpt(CommDBService commDBService, String rcvNo, Box box, String sysRegId) throws Exception {
		String dirInfo = box.get("dir_info");
		
		String[] dirs = dirInfo.split("\\|");
		Wh wh = new Wh(commDBService);

		box.put("rcv_no", rcvNo);
		commDBService.exec("PR_DOCTB_REPT01", "DELETE_RCV_NO", box);
		HashMap<String, String[]> rptHm = new HashMap<String, String[]>();
		HashMap<String, String[]> idxHm = new HashMap<String, String[]>();
		int rptId = 1;
		String prevDocGbn = "DOC";
		for(int i=0; i < dirs.length; i++) {
			String[] infos = dirs[i].split("@N@");
			if(infos[0].equals("ROOT")) { continue; }
			if(infos[1].equals("ROOT")) {
				rptHm.put(infos[0], infos);
			}else {
				if(rptHm.get(infos[1]) != null) {
					String[] cdInfos = rptHm.get(infos[1]);
					if(!cdInfos[3].startsWith(prevDocGbn)) {
						rptId = 1;
					}
					box.put("report_id", cdInfos[3].substring(0,3) + StringUtil.lpad(rptId+"", "0", 2));
					box.put("report_nm", infos[3]);
					box.put("page_cnt", "0");
					box.put("cd_no", cdInfos[3].replaceAll("DOCCD","").replaceAll("DWGCD",""));
					box.put("sys_reg_id", sysRegId);
					commDBService.exec("PR_DOCTB_REPT01", "INSUPD", box);
					
					rptId++;
					prevDocGbn = cdInfos[3].substring(0,3);
					idxHm.put(infos[0], infos);
				}else {
					if(idxHm.get(infos[1]) != null) {
						
					}
				}
			}
		}
	}
	
	public RsWrapper getRptInfo() throws Exception {
		RsWrapper rsWp = new RsWrapper();
		
		for(CdInfo cdInfo : alCdDocList) {
			int no=1;
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				Box rb = new Box("");
				rb.put("reportId", "DOC" + StringUtil.lpad(no+"", "0", 4));
				rb.put("reportNm", kindInfo.kindNm);
				rb.put("pageCnt", kindInfo.kindCnt+"");
				rb.put("cdNo", cdInfo.cdNo);
				rsWp.appendRs(rb);
				no++;
			}
		}
		for(CdInfo cdInfo : alCdDwgList) {
			int no=1;
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				Box rb = new Box("");
				rb.put("reportId", "DWG" + StringUtil.lpad(no+"", "0", 4));
				rb.put("reportNm", kindInfo.kindNm);
				rb.put("pageCnt", kindInfo.kindCnt+"");
				rb.put("cdNo", cdInfo.cdNo);
				rsWp.appendRs(rb);
				no++;
			}
		}
		return rsWp;
	}
	
	public void dbInsRpt(CommDBService commDBService, String sysRegId) throws Exception {
		Box ibox = new Box("");
		ibox.put("rcv_no", rcvNo);
		commDBService.exec("PR_DOCTB_REPT01", "DELETEALL", ibox);
		int no=1;
		ArrayList<DoctbReptEnt> reptEntLst = new ArrayList<DoctbReptEnt>();
		for(CdInfo cdInfo : alCdDocList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				DoctbReptEnt ent = new DoctbReptEnt();
				ent.rcvNo = rcvNo;
				ent.reportId = "DOC" + StringUtil.lpad(no+"", "0", 4);
				ent.reportNm = kindInfo.kindNm;
				ent.pageCnt = kindInfo.kindCnt + "";
				ent.cdNo = cdInfo.cdNo;
				ent.sysRegId = sysRegId;
				reptEntLst.add(ent);
				no++;
			}
		}
		no = 1;
		for(CdInfo cdInfo : alCdDwgList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				DoctbReptEnt ent = new DoctbReptEnt();
				ent.rcvNo = rcvNo;
				ent.reportId = "DWG" + StringUtil.lpad(no+"", "0", 4);
				ent.reportNm = kindInfo.kindNm;
				ent.pageCnt = kindInfo.kindCnt + "";
				ent.cdNo = cdInfo.cdNo;
				ent.sysRegId = sysRegId;
				reptEntLst.add(ent);
				no++;
			}
		}
		EDocUtil.getEdocSql().batchDoctbRept(reptEntLst);
	}

	public void dbInsRptIdx(CommDBService commDBService, String sysRegId) throws Exception {
		Box ibox = new Box("");
		ibox.put("rcv_no", rcvNo);
		commDBService.exec("PR_DOCTB_INDX01", "DELETE_RCV_NO", ibox);
		int no = 1;
		ArrayList<DoctbIndxEnt> indxEntLst = new ArrayList<DoctbIndxEnt>();
		for(CdInfo cdInfo : alCdDocList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				ibox.put("report_id", "DOC" + StringUtil.lpad(no+"", "0", 4));
				int seq = 1;
				for(TitleInfo titleInfo : kindInfo.titleList) {
					DoctbIndxEnt ent = new DoctbIndxEnt();
					ent.rcvNo = rcvNo;
					ent.reportId = "DOC" + StringUtil.lpad(no+"", "0", 4);
					ent.indexSeq = seq+"";
					ent.fileFrom = titleInfo.fileFrom;
					ent.fileType = "tif";
					ent.contentLvl = titleInfo.level+"";
					ent.contentDesc = titleInfo.title;
					ent.sysRegId = sysRegId;
					indxEntLst.add(ent);
					seq++;
				}
				no++;
			}
		}
		no = 1;
		for(CdInfo cdInfo : alCdDwgList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				ibox.put("report_id", "DWG" + StringUtil.lpad(no+"", "0", 4));
				int seq = 1;
				for(TitleInfo titleInfo : kindInfo.titleList) {
					DoctbIndxEnt ent = new DoctbIndxEnt();
					ent.rcvNo = rcvNo;
					ent.reportId = "DWG" + StringUtil.lpad(no+"", "0", 4);
					ent.indexSeq = seq+"";
					ent.fileFrom = titleInfo.fileFrom;
					ent.fileType = "tif";
					ent.contentLvl = titleInfo.level+"";
					ent.contentDesc = titleInfo.title;
					ent.sysRegId = sysRegId;
					indxEntLst.add(ent);
					seq++;
				}
				no++;
			}
		}
		EDocUtil.getEdocSql().batchDoctbIndx(indxEntLst);
	}
	
	public String docSubmitReq(CommDBService commDBService, String tmpRcvNo, String sysRegId, Box box) throws Exception {
		box.put("rcv_no", tmpRcvNo);
		Box dbox = commDBService.execBox("PR_DOCTB_MAST01", "SELECT", box);
		String strDocChk = docSubmitChk(tmpRcvNo, dbox.get("doc_class"));
		CD.logger.info("docSubmitReq strDocChk:" + strDocChk);
		if(strDocChk.equals("")) {
			String newRcvNo = tmpRcvNo;
			tmpRcvNo = OntongUtil.getDocRcvNo(tmpRcvNo);
			newRcvNo = OntongUtil.getDocRcvNo(newRcvNo);
			CD.logger.info("docSubmitReq tmpRcvNo:" + tmpRcvNo + " newRcvNo:" + newRcvNo);
			String yearDir = box.get("rcv_no").substring(1,5);
			String tmpPath = OntongUtil.getStorageDir(tmpRcvNo) + "/" + box.get("rcv_no").substring(0,1) + "/" + OntongUtil.getRcvNoYear(tmpRcvNo) + "/" + tmpRcvNo;
			String newPath = OntongUtil.getStorageDir(newRcvNo) + "/" + box.get("rcv_no").substring(0,1) + "/" + yearDir + "/" + newRcvNo;

			ArrayList<DoctbFoldEnt> foldEntLst = new ArrayList<DoctbFoldEnt>();
			ArrayList<DoctbFileEnt> fileEntLst = new ArrayList<DoctbFileEnt>();

			CD.logger.info("docSubmitReq step1");
			Wh wh = new Wh(commDBService);
			WhDir rDir = wh.mkDir(newRcvNo, newRcvNo, sysRegId, foldEntLst);

			CD.logger.info("docSubmitReq step2");
			int no = 1;
 
			String subPath = "/" + box.get("rcv_no").substring(0,1) + "/" + yearDir + "/" + newRcvNo;
			String sysFilePath = tmpPath + "/master.xml";   
			File xFile = new File(sysFilePath);
			if(xFile.exists()) {
				rDir.uploadFile(newRcvNo, xFile.getName(), subPath, xFile.length()+"", sysRegId, fileEntLst);
			}
			sysFilePath = tmpPath + "/docindex.xml";   
			xFile = new File(sysFilePath);
			if(xFile.exists()) {
				rDir.uploadFile(newRcvNo, xFile.getName(), subPath, xFile.length()+"", sysRegId, fileEntLst);
			}
			sysFilePath = tmpPath + "/dwgindex.xml";   
			xFile = new File(sysFilePath);
			if(xFile.exists()) {
				rDir.uploadFile(newRcvNo, xFile.getName(), subPath, xFile.length()+"", sysRegId, fileEntLst);
			}

			CD.logger.info("docSubmitReq step3");
			for(CdInfo cdInfo : alCdDocList) {
				WhDir cdDir = rDir.mkDir(newRcvNo, "DOCCD" + StringUtil.lpad(no+"", "0", 2), sysRegId, foldEntLst);
				for (KindInfo kindInfo : cdInfo.alKindInfo) {
					WhDir kindDir = cdDir.mkDir(newRcvNo, kindInfo.kindNm, sysRegId, foldEntLst);
					
					HashMap<String, WhDir> hmDir = new HashMap<String, WhDir>();
					hmDir.put("0", kindDir);
					for(TitleInfo titleInfo : kindInfo.titleList) {
						WhDir pDir = hmDir.get((titleInfo.level-1)+"");
						WhDir nDir =  pDir.mkDir(newRcvNo, titleInfo.title, sysRegId, foldEntLst);
						
						for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {
							String fileNm = StringUtil.lpad(f+"", "0", 4) + ".tif";
							String filePath = subPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/";					 
							sysFilePath = tmpPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
							File sFile = new File(sysFilePath);
							if(!sFile.exists()) {
								sFile = new File(tmpPath + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".TIF");
								fileNm = StringUtil.lpad(f+"", "0", 4) + ".TIF";
								if(!sFile.exists()) {
									sysFilePath = tmpPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".kos";
									sFile = new File(sysFilePath);
									fileNm = StringUtil.lpad(f+"", "0", 4) + ".kos";
								}
							}
							nDir.uploadFile(newRcvNo, fileNm, filePath, sFile.length()+"", sysRegId, fileEntLst);
						}
						hmDir.put(titleInfo.level+"", nDir); 
					}
				}
				no++;
			}
			no = 1;
			for(CdInfo cdInfo : alCdDwgList) {
				WhDir cdDir = rDir.mkDir(newRcvNo, "DWGCD" + StringUtil.lpad(no+"", "0", 2), sysRegId, foldEntLst);
				for(KindInfo kindInfo : cdInfo.alKindInfo) {
					WhDir kindDir = cdDir.mkDir(newRcvNo, kindInfo.kindNm, sysRegId, foldEntLst);
					HashMap<String, WhDir> hmDir = new HashMap<String, WhDir>();
					hmDir.put("0", kindDir);
					for(TitleInfo titleInfo : kindInfo.titleList) {
						WhDir pDir = hmDir.get((titleInfo.level-1)+"");
						WhDir nDir =  pDir.mkDir(newRcvNo, titleInfo.title, sysRegId, foldEntLst);
						
						for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {
							String fileNm = StringUtil.lpad(f+"", "0", 4) + ".tif";
							String filePath = subPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/";
							sysFilePath = tmpPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
							File sFile = new File(sysFilePath);
							if(!sFile.exists()) {
								sFile = new File(tmpPath + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".TIF");
								fileNm = StringUtil.lpad(f+"", "0", 4) + ".TIF";
								if(!sFile.exists()) {
									sysFilePath = tmpPath + "/" + cdDir.dirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".kos";
									sFile = new File(sysFilePath);
									fileNm = StringUtil.lpad(f+"", "0", 4) + ".kos";
								}
							}
							nDir.uploadFile(newRcvNo, fileNm, filePath, sFile.length()+"", sysRegId, fileEntLst);
						}
						hmDir.put(titleInfo.level+"", nDir); 
					}
				}
				no++;
			}

			CD.logger.info("docSubmitReq step4");
			EDocUtil.getEdocSql().batchDelDocFiles(tmpRcvNo);
			CD.logger.info("docSubmitReq step5");
			boolean bChk1 = EDocUtil.getEdocSql().batchDoctbFold(foldEntLst);
			CD.logger.info("docSubmitReq step6");
			boolean bChk2 = EDocUtil.getEdocSql().batchDoctbFile(fileEntLst);
			CD.logger.info("docSubmitReq step7");
			
			return "";
		} else {
			return strDocChk;
		}	
	}
	
	public String docSubmitChk(String tmpRcvNo, String docClass) {
		StringBuffer sb = new StringBuffer();
		String tmpPath = OntongUtil.getStorageDir(tmpRcvNo) + "/"+tmpRcvNo.substring(0,1)+"/" + OntongUtil.getRcvNoYear(tmpRcvNo) + "/" + OntongUtil.getDocRcvNo(tmpRcvNo);
		int no = 1;
		int fileCnt = 0;
		String sysFilePath = "";
		
		String masterPath = tmpPath + "/master.xml";
		if(!FileUtil.isExistFile(masterPath)) { sb.append("/master.xml 파일을 찾을 수 없습니다.\n"); }
		
		String docIndexPath = tmpPath + "/docindex.xml";
		if(!FileUtil.isExistFile(docIndexPath)) { sb.append("/docindex.xml 파일을 찾을 수 없습니다.\n"); }
		
		String dwgIndexPath = tmpPath + "/dwgindex.xml";
		if(!docClass.equals("C") && !docClass.equals("D")) {
			if(!FileUtil.isExistFile(dwgIndexPath) && alCdDwgList.size() > 0) {
				sb.append("/dwgindex.xml 파일을 찾을 수 없습니다.\n");
			}
		}
		
		for(CdInfo cdInfo : alCdDocList) {
			String cdDirNm = "DOCCD" + StringUtil.lpad(no+"", "0", 2);
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {				  
						sysFilePath = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
						String sysFilePathTiff = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tiff";
						if(FileUtil.isExistFile(sysFilePath) == false && FileUtil.isExistFile(sysFilePathTiff)) {
							try { FileUtil.fileMove(sysFilePathTiff, sysFilePath); } catch(Exception ex) {ex.printStackTrace();}
						}
						
						String sysFilePathKos = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".kos";
						if(!FileUtil.isExistFile(sysFilePath) && !FileUtil.isExistFile(sysFilePathKos)) {
							sb.append(sysFilePath.replaceAll(tmpPath, "") + " 파일을 찾을 수 없습니다.\n");
						}else if (FileUtil.getFilelength(sysFilePath) == 0 && FileUtil.getFilelength(sysFilePathKos) == 0) {
							sb.append(sysFilePath.replaceAll(tmpPath, "") + " 파일의 크기가 0입니다.\n");
						}
						fileCnt++;
					}
				}
			}
			no++;
		}
		no = 1;
		for(CdInfo cdInfo : alCdDwgList) {
			String cdDirNm = "DWGCD" + StringUtil.lpad(no+"", "0", 2);
			for (KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {
						sysFilePath = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
						String sysFilePathTiff = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tiff";
						if(FileUtil.isExistFile(sysFilePath) == false && FileUtil.isExistFile(sysFilePathTiff)) {
							try { FileUtil.fileMove(sysFilePathTiff, sysFilePath); } catch(Exception ex) {ex.printStackTrace();}
						}
						String sysFilePathKos = tmpPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".kos";
						if (FileUtil.isExistFile(sysFilePath) == false && FileUtil.isExistFile(sysFilePathKos) == false) {
							sb.append(sysFilePath.replaceAll(tmpPath, "") + " 파일을 찾을 수 없습니다.\n");
						} else if (FileUtil.getFilelength(sysFilePath) == 0 && FileUtil.getFilelength(sysFilePathKos) == 0) {
							sb.append(sysFilePath.replaceAll(tmpPath, "") + " 파일의 크기가 0입니다.\n");
						}
						fileCnt++;
					}
				}
			}
			no++;
		}
		if(fileCnt == 0) { sb.append("첨부된 파일을 찾지 못하였습니다.\n"); }
		return sb.toString();
	}
	
	public void makeReportDir() throws Exception {
		for(CdInfo cdInfo : alCdDocList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					titleInfo.dirId = WhCD.getNewID();
					String fldPath = rootDirPath + "/" + cdInfo.getPathName() + "/" + kindInfo.getPathName() + "/" + titleInfo.dirId;
					titleInfo.dirPath = fldPath;
				}
			}
		}
		for(CdInfo cdInfo : alCdDwgList) {
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					titleInfo.dirId = WhCD.getNewID();
					String fldPath = rootDirPath + "/" + cdInfo.getPathName() + "/" + kindInfo.getPathName() + "/" + titleInfo.dirId;
					titleInfo.dirPath = fldPath;
				}
			}
		}
	}
	
	public class FileFromToFilter implements FilenameFilter {
		private String from = "";
		private String to = "";

		public FileFromToFilter(String from, String to) {
			this.from = from;
			this.to = to;
		}

		public boolean accept(File dir, String name) {
			String nm = name;
			if(nm.lastIndexOf(".") >=0) {
				nm = nm.substring(0, nm.lastIndexOf("."));
				if(Integer.parseInt(nm) >= Integer.parseInt(from) && Integer.parseInt(nm) <= Integer.parseInt(to)) {
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
		}
	}
	
	public boolean parseFmsDoc() throws Exception {
		if(masterXmlPath.equals("") == false && (alDocList.size() > 0 || alDwgList.size() > 0)) {
			xMstDoc = XMLUtil.loadXmlDocumentUTF8(masterXmlPath);
			
			this.docCdCnt = (alDocList.size() > 0 ? XMLUtil.getSingleElement("/master/cd_info/doc_cd_cnt", xMstDoc).getText() : "0");
			this.dwgCdCnt = (alDwgList.size() > 0 ? XMLUtil.getSingleElement("/master/cd_info/dwg_cd_cnt", xMstDoc).getText() : "0");
			List docCdInfoList = XMLUtil.getMultiElements("/master/doc_cd_info", xMstDoc);
			List dwgCdInfoList = XMLUtil.getMultiElements("/master/dwg_cd_info", xMstDoc);
			
			for(int i=0; i < alDocList.size(); i++) {
				Element eInfo = (Element)docCdInfoList.get(i);
				alCdDocList.add(new CdInfo(alDocList.get(i), 
						"doc",
						eInfo.getChildText("doc_cd_no"), 
						eInfo.getChildText("doc_cd_file_cnt"),
						eInfo.getChildren("doc_kind_info")));
			}
			for(int i=0; i < alDwgList.size(); i++) {
				Element eInfo = (Element)dwgCdInfoList.get(i);
				alCdDwgList.add(new CdInfo(alDwgList.get(i), 
						"dwg",
						eInfo.getChildText("dwg_cd_no"), 
						eInfo.getChildText("dwg_cd_file_cnt"),
						eInfo.getChildren("dwg_kind_info")));
			}
			
			List facilList = XMLUtil.getMultiElements("/master/facil_info", xMstDoc);
			for(int i=0; i < facilList.size(); i++) {
				Element fInfo = (Element)facilList.get(i);
				alFacil.add(new FacilInfo(fInfo.getChildText("facil_no"), fInfo.getChildText("facil_nm")));
			}
			return true;
		}else {
			return false;
		}
	}
	
	public boolean isFmsDoc() throws Exception {
		if(xMstDoc != null) {
			return true;
		}else {
			return parseFmsDoc();
		}
	}
	
	public void debugXmlPath() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("masterXmlPath : " + masterXmlPath + "\n");
		for(int i=0; i< alDocList.size(); i++) {
			sb.append("doc path " + i + " : " + alDocList.get(i) + "\n");
		}
		for(int i=0; i< alDwgList.size(); i++) {
			sb.append("dwg path " + i + " : " + alDwgList.get(i) + "\n");
		}
		sb.append("constNm : " + getConstNm() + "\n");
		sb.append("reqNm : " + getReqNm() + "\n");
		sb.append("constYmdFrom : " + getConstYmdFrom() + "\n");
		sb.append("constYmdTo : " + getConstYmdTo() + "\n");
		sb.append("cplYmd : " + getCplYmd() + "\n");
		
		for(int i=0; i < alFacil.size(); i++) {
			sb.append("facilNo:" + alFacil.get(i).facilNo + " facilNm:" + alFacil.get(i).facilNm + "\n");
		}
		sb.append("docCdCnt : " + docCdCnt + "\n");
		sb.append("dwgCdCnt : " + dwgCdCnt + "\n");

		for(int i=0; i < alCdDocList.size(); i++) {
			sb.append(String.format("doc cdNo:%s, fileCnt:%s, kindInfo: %s\n", 
					alCdDocList.get(i).cdNo, 
					alCdDocList.get(i).fileCnt, 
					alCdDocList.get(i).getKindInfoDebug()));
		}
		
		for(int i=0; i < alCdDwgList.size(); i++) {
			sb.append(String.format("dwg cdNo:%s, fileCnt:%s, kindInfo: %s\n", 
					alCdDwgList.get(i).cdNo, 
					alCdDwgList.get(i).fileCnt, 
					alCdDwgList.get(i).getKindInfoDebug()));
		}
	}
}