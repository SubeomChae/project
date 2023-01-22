package egovframework.ubiz.util.ontong;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;

import egovframework.ubiz.util.ontong.batch.DoctbIndxEnt;
import egovframework.ubiz.util.ontong.batch.DoctbReptEnt; 
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;

public class EDocChkDir {

	public String makeDir(String rcvNo, String dirPath, String userId, CommDBService commDBService) throws Exception {
		Box box = new Box();
		StringBuffer errSb = new StringBuffer();
		 
		HashMap<String, String> htFileCnt = new HashMap<String, String>();
		HashMap<String, String> htFileNo = new HashMap<String, String>();
		
		ArrayList<File> fileList = new ArrayList<File>();
		ArrayList<String> arrFileList = new ArrayList<String>();
		EDocUtil.listf(dirPath, fileList);
		
		// 폴더구조로 업로드 된 구조를 설계도서 제출 구조로 변경
		if(fileList.size() > 0) {
			for(int i=0; i < fileList.size(); i++) {
				String clientPath = fileList.get(i).getAbsolutePath().replaceAll("\\\\", "/");
				if(clientPath.indexOf("edoc.info") > 0 || clientPath.endsWith("zip") 
						|| clientPath.endsWith("master.xml")
						|| clientPath.endsWith("docindex.xml")
						|| clientPath.endsWith("dwgindex.xml")
						|| clientPath.endsWith("master.xml")
						|| clientPath.endsWith("err.txt")) {
					continue;
				}
				File file = fileList.get(i);
				if(clientPath.indexOf("DOCCD") > 0) {
					clientPath = clientPath.substring(clientPath.indexOf("DOCCD"), clientPath.length());
				}else if (clientPath.indexOf("DWGCD") > 0) {
					clientPath = clientPath.substring(clientPath.indexOf("DWGCD"), clientPath.length());
				}else {
					clientPath = "";
				}
				if(!FileUtil.getFileExt(fileList.get(i).getName()).toLowerCase().equals("tif") && !FileUtil.getFileExt(fileList.get(i).getName()).toLowerCase().equals("tiff")) {
					errSb.append(clientPath + " : 파일 확장자 오류(tif, tiff만 제출가능)\n");
				}else { 
					String[] cPathArr = clientPath.split("/");
					File rptDir = new File(dirPath + "/" + cPathArr[0] + "/" + cPathArr[1]);
					if(htFileCnt.get(rptDir.getAbsolutePath()) == null) { htFileCnt.put(rptDir.getAbsolutePath(), "0"); }
					int fileCnt= Integer.parseInt(htFileCnt.get(rptDir.getAbsolutePath()));
					fileCnt++;
					
					String parentPath = cPathArr[0] + "/" + cPathArr[1];
					for(int j=2; j < cPathArr.length -1; j++) {
						parentPath += "/" + cPathArr[j];
						if(htFileNo.get(parentPath) == null) { htFileNo.put(parentPath, fileCnt+""); }
					}
					
					String fileExt = FileUtil.getFileExt(fileList.get(i).getAbsolutePath()).toLowerCase();
					if(fileExt.equals("tiff")) { fileExt = "tif"; }
					File filePath = new File(rptDir.getAbsolutePath() + "/" + StringUtil.lpad(fileCnt+"", "0", 4) + "." + fileExt);
					file.renameTo(filePath);
					htFileCnt.put(rptDir.getAbsolutePath(), fileCnt+"");
					htFileCnt.put(cPathArr[0] + "/" + cPathArr[1], fileCnt+"");
					arrFileList.add(clientPath);
				}
			}
		}
		
		// REPT, INDX 테이블 정보 업데이트 
		Box ibox = new Box("");
		ibox.put("rcv_no", rcvNo); 
		commDBService.exec("PR_DOCTB_INDX01", "DELETE_RCV_NO", ibox);
		
		ArrayList<DoctbReptEnt> reptEntLst = new ArrayList<DoctbReptEnt>();
		ArrayList<DoctbIndxEnt> indxEntLst = new ArrayList<DoctbIndxEnt>();
		HashMap<String, DoctbReptEnt> htDocRpt = new HashMap<String, DoctbReptEnt>();
		HashMap<String, DoctbReptEnt> htDwgRpt = new HashMap<String, DoctbReptEnt>();
		HashMap<String, DoctbIndxEnt> htDocIdx = new HashMap<String, DoctbIndxEnt>();
		HashMap<String, DoctbIndxEnt> htDwgIdx = new HashMap<String, DoctbIndxEnt>();

		HashMap<String, String> htIdxNo = new HashMap<String, String>();
		for(int i=0; i < arrFileList.size(); i++) { 
			String[] cPathArr = arrFileList.get(i).split("/");
			String cdNm = cPathArr[0];
			String rptNm = cPathArr[1];
			String parentPath = cdNm + "/" + rptNm;
			String fileType = FileUtil.getFileExt(arrFileList.get(i));
			if(fileType.equals("tiff")) { fileType = "tif"; }
			if(cdNm.startsWith("DOC")) {
				if(htDocRpt.get(cdNm + "/" + rptNm) == null) { 
					DoctbReptEnt ent = new DoctbReptEnt();
					ibox.put("report_nm", rptNm);
					Box rbox = commDBService.execBox("PR_DOCTB_REPT01", "SELECT_BY_REPORT_NM", ibox);
					ent.rcvNo = rcvNo;
					ent.reportId = rbox.get("report_id");
					ent.reportNm = rptNm;
					ent.pageCnt = htFileCnt.get(cdNm + "/" + rptNm) + "";
					ent.cdNo = cdNm.substring(5, 7);
					ent.sysRegId = userId;
					reptEntLst.add(ent);
					htDocRpt.put(cdNm + "/" + rptNm, ent);
				}

				for(int j=2; j < cPathArr.length -1; j++) {
					parentPath += "/" + cPathArr[j];
					if(htDocIdx.get(parentPath) == null) { 
						if(htIdxNo.get(cdNm + "/" + rptNm) == null) { htIdxNo.put(cdNm + "/" + rptNm, "0"); }
						int indexSeq= Integer.parseInt(htIdxNo.get(cdNm + "/" + rptNm));
						indexSeq++;
						htIdxNo.put(cdNm + "/" + rptNm, indexSeq+"");
						DoctbReptEnt reptEnt = htDocRpt.get(cdNm + "/" + rptNm);
						DoctbIndxEnt ent = new DoctbIndxEnt();
						ent.rcvNo = rcvNo;
						ent.reportId = reptEnt.reportId;
						ent.indexSeq = (indexSeq)+"";
						ent.fileFrom = StringUtil.lpad(htFileNo.get(parentPath), "0", 4);
						ent.fileType = fileType;
						ent.contentLvl = (j-1)+"";
						ent.contentDesc = cPathArr[j];
						ent.sysRegId = userId; 
						indxEntLst.add(ent);
						htDocIdx.put(parentPath, ent);
					}
				}
			}else {
				if (htDwgRpt.get(cdNm + "/" + rptNm) == null) { 
					DoctbReptEnt ent = new DoctbReptEnt();
					ibox.put("report_nm", rptNm);
					Box rbox = commDBService.execBox("PR_DOCTB_REPT01", "SELECT_BY_REPORT_NM", ibox);
					ent.rcvNo = rcvNo;
					ent.reportId = rbox.get("report_id");
					ent.reportNm = rptNm;
					ent.pageCnt = htFileCnt.get(cdNm + "/" + rptNm) + "";
					ent.cdNo = cdNm.substring(5, 7);
					ent.sysRegId = userId;
					reptEntLst.add(ent);
					htDwgRpt.put(cdNm + "/" + rptNm, ent);
				}
				for(int j=2; j < cPathArr.length -1; j++) {
					parentPath += "/" + cPathArr[j];
					if(htDwgIdx.get(parentPath) == null) { 
						if(htIdxNo.get(cdNm + "/" + rptNm) == null) { htIdxNo.put(cdNm + "/" + rptNm, "0"); }
						int indexSeq= Integer.parseInt(htIdxNo.get(cdNm + "/" + rptNm));
						indexSeq++;
						htIdxNo.put(cdNm + "/" + rptNm, indexSeq+"");
						
						DoctbReptEnt reptEnt = htDwgRpt.get(cdNm + "/" + rptNm);
						DoctbIndxEnt ent = new DoctbIndxEnt();
						ent.rcvNo = rcvNo;
						ent.reportId = reptEnt.reportId;
						ent.indexSeq = (indexSeq)+"";
						ent.fileFrom = StringUtil.lpad(htFileNo.get(parentPath), "0", 4);
						ent.fileType = fileType;
						ent.contentLvl =  (j-1)+"";
						ent.contentDesc = cPathArr[j];
						ent.sysRegId = userId; 
						indxEntLst.add(ent);
						htDwgIdx.put(parentPath, ent);
					}
				}
			}
		}
		box.put("param01", rcvNo);
		RsWrapper rptWp = commDBService.execList("PR_DOCTB_REPT01_LIST", "LIST001", box);
		if(rptWp.getLength() == 0) {
			// 보고서 테이블은 이미 작성되어 있으므로 여기에서는 작성하지 않지만 테스트 개발에서 필요하기 떄문에 값이 없을 경우 insert
			EDocUtil.getEdocSql().batchDoctbRept(reptEntLst); 
		}
		EDocUtil.getEdocSql().batchDoctbIndx(indxEntLst);
		
		box.put("rcv_no", rcvNo);
		Box mbox = commDBService.execBox("PR_DOCTB_MAST01", "SELECT", box);
		
		box.put("param01", rcvNo);
		box.put("param10", "Y");
		RsWrapper facilWp = commDBService.execList("PR_DOCTB_FACL01_LIST", "LIST001", box);
		
		box.put("param01", rcvNo);
		rptWp = commDBService.execList("PR_DOCTB_REPT01_LIST", "LIST001", box);

		box.put("param01", rcvNo);
		RsWrapper ixWp = commDBService.execList("PR_DOCTB_INDX01_LIST", "LIST002", box);

		
		RsWrapper docRptWp = new RsWrapper();
		RsWrapper dwgRptWp = new RsWrapper();
		for(int i=0; i < rptWp.getLength(); i++) {
			Box rb = rptWp.getRsBoxAt(i);
			
			Box ibox2 = new Box("");
			ibox2.put("kind_nm", rb.get("report_nm"));
			ibox2.put("kind_cnt", rb.get("page_cnt"));
			if(rb.get("report_id").startsWith("DOC")) {
				docRptWp.appendRs(ibox2);
			}else {
				dwgRptWp.appendRs(ibox2);
			}
		}

		RsWrapper docRsWp = new RsWrapper();
		RsWrapper dwgRsWp = new RsWrapper();
		for(int i=0; i < ixWp.getLength(); i++) {
			Box rb = ixWp.getRsBoxAt(i);
			
			Box ibox2 = new Box("");
			ibox2.put("kind_nm", rb.get("report_nm"));
			ibox2.put("level", rb.get("content_lvl"));
			ibox2.put("title", rb.get("content_desc"));
			ibox2.put("file_from", rb.get("file_from"));
			if(rb.get("report_id").startsWith("DOC")) {
				docRsWp.appendRs(ibox2);
			}else {
				dwgRsWp.appendRs(ibox2);
			}
		}
		
		// xml 생성 처리
		String masterXml = EDocUtil.getMasterXml(mbox.get("doc_class_nm")
				, mbox.get("const_nm")
				, mbox.get("const_order_nm")
				, mbox.get("const_ymd_from")
				, mbox.get("const_ymd_to")
				, mbox.get("cpl_ymd")
				, facilWp
				, docRptWp
				, dwgRptWp);
		
		String docIndexXml = EDocUtil.getIndexXml("doc", docRsWp); 
		String dwgIndexXml = EDocUtil.getIndexXml("dwg", dwgRsWp);
		FileUtil.doDeleteFile(dirPath + "/master.xml");
		FileUtil.doDeleteFile(dirPath + "/docindex.xml");
		
		EDocUtil.writeEdocXml(dirPath + "/master.xml", masterXml, false);
		EDocUtil.writeEdocXml(dirPath + "/docindex.xml", docIndexXml, false);
		
		if(dwgRsWp.getLength() > 0) {
			FileUtil.doDeleteFile(dirPath + "/dwgindex.xml");
			EDocUtil.writeEdocXml(dirPath + "/dwgindex.xml", dwgIndexXml, false);
		}
		
		// 서브폴더 정리
		File directory = new File(dirPath);
		File[] fList = directory.listFiles();
		for(File file : fList) {
			if(file.isDirectory()) {
				File[] rptList = file.listFiles();
				for(File rptFile : rptList) {
					if(rptFile.isDirectory()) {
						File[] fldList = rptFile.listFiles();
						for(File fldFile : fldList) {
							if(fldFile.isDirectory()) {
								FileUtils.deleteDirectory(fldFile);
							}
						}
					}
				}
			}
		}
		return errSb.toString();
	}
}