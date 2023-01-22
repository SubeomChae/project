package egovframework.ubiz.util.ontong;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.jdom2.Element;

import egovframework.ubiz.util.ontong.batch.DoctbFileEnt;
import egovframework.ubiz.util.ontong.batch.DoctbFoldEnt;
import egovframework.ubiz.util.ontong.fdoc.CdInfo;
import egovframework.ubiz.util.ontong.fdoc.FmsDoc;
import egovframework.ubiz.util.ontong.fdoc.KindInfo;
import egovframework.ubiz.util.ontong.fdoc.TitleInfo;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;

public class EDocChkXml  {
	 
	private String edocType = ""; // 준공도서:A, 보수보강도서:B, 감리보고서:C, 안전점검종합보고서:D
	
	public EDocChkXml(String edocType) {
		this.edocType = edocType; 
	}
	
	public String chkXmlCont(String unzipRootPath, CommDBService commDBService) throws Exception, IOException {
		String masterXmlPath = unzipRootPath + "/master.xml";   
		String docXmlPath = unzipRootPath + "/docindex.xml";   
		String dwgXmlPath = unzipRootPath + "/dwgindex.xml";   
		
		StringBuffer errSb = new StringBuffer();
		FmsDoc fmsDoc = EDocUtil.getDocXml("CHK", masterXmlPath, docXmlPath, dwgXmlPath);
		fmsDoc.debugXmlPath();
		fmsDoc.makeReportDir(); 
		
		if(!FileUtil.isExistFile(masterXmlPath)) { errSb.append("master.xml 파일을 찾을 수 없습니다.\n"); }
		if(!FileUtil.isExistFile(docXmlPath)) { errSb.append("docindex.xml 파일을 찾을 수 없습니다.\n"); }
		if((edocType.equals("A") || edocType.equals("B")) && !FileUtil.isExistFile(dwgXmlPath)) { 
			errSb.append("dwgindex.xml 파일을 찾을 수 없습니다.\n"); 
		}
		if(fmsDoc.getConstYmdFrom().replaceAll("-", "").length() != 8 || !DateUtil.isDate(fmsDoc.getConstYmdFrom(),"yyyyMMdd")) {
			errSb.append("공사시작일 날짜 정보가 잘못되었습니다. ex:20120402\n");
		}
		if(fmsDoc.getConstYmdTo().replaceAll("-", "").length() != 8 || !DateUtil.isDate(fmsDoc.getConstYmdTo(),"yyyyMMdd")) {
			errSb.append("공사종료일 날짜 정보가 잘못되었습니다. ex:20120402\n");
		}
		if(fmsDoc.getCplYmd().replaceAll("-", "").length() != 8 || !DateUtil.isDate(fmsDoc.getCplYmd(),"yyyyMMdd")) {
			errSb.append("준공일 날짜 정보가 잘못되었습니다. ex:20120402\n");
		}
		
		List facilList = fmsDoc.getFacilList();
		Box box = new Box("");
		for(int i=0; i < facilList.size(); i++) {
			Element fInfo = (Element)facilList.get(i);
			box.put("facil_no", fInfo.getChildText("facil_no"));
		}
		
		ArrayList<DoctbFoldEnt> foldEntLst = new ArrayList<DoctbFoldEnt>();
		
		String rcvNo = "CHK";
		String ontongRcvNo = "CHK";
		String sendUserId = "CHK";
		
		Wh wh = new Wh(commDBService);
		WhDir rDir = wh.mkDir(rcvNo, ontongRcvNo, sendUserId, foldEntLst);
		
		int no = 1;
		for(CdInfo cdInfo : fmsDoc.alCdDocList) {
			WhDir cdDir = rDir.mkDir(rcvNo, "DOCCD" + StringUtil.lpad(no+"", "0", 2), sendUserId, foldEntLst);
			for (KindInfo kindInfo : cdInfo.alKindInfo) {
				WhDir kindDir = cdDir.mkDir(rcvNo, kindInfo.kindNm, sendUserId, foldEntLst);
				if(kindInfo.kindNm.indexOf("/") >= 0) { errSb.append("보고서명에 / 문자는 포함될 수 없습니다. [" + kindInfo.kindNm + "]\n"); }
				
				int kindCnt = 0;
				HashMap<String, WhDir> hmDir = new HashMap<String, WhDir>();
				hmDir.put("0", kindDir);
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.title.indexOf("/") >= 0) { errSb.append("폴더명에 / 문자는 포함될 수 없습니다. [" + kindInfo.kindNm + " , " + titleInfo.title + "]\n"); }
					if(!NumberUtils.isNumber(titleInfo.fileFrom)) { errSb.append("file_from값이 숫자가 아닙니다. [" + kindInfo.kindNm + " , "  + titleInfo.title + "]\n"); }
					if(!NumberUtils.isNumber(titleInfo.fileTo)) { errSb.append("index에 file_from에 문제가 있습니다. xml에서 다음의 위 아래 file_from을 확인하여 주십시오. [" + kindInfo.kindNm + " , "  + titleInfo.title + "]\n"); }
					if(Integer.parseInt(titleInfo.fileTo) < Integer.parseInt(titleInfo.fileFrom) - 1) { errSb.append("index에 file_from에 문제가 있습니다. xml에서 다음의 위 아래 file_from을 확인하여 주십시오. [" + kindInfo.kindNm + " , "  + titleInfo.title + "]\n"); } 
					WhDir pDir = hmDir.get((titleInfo.level-1)+"");
					if(pDir == null) {
						errSb.append("[" + kindInfo.kindNm + "] [" + titleInfo.title + "]" + " file_from["+titleInfo.fileFrom+"] index의 레벨이 잘못되었습니다.\n");
					}else {
						WhDir nDir = pDir.mkDir(rcvNo, titleInfo.title, sendUserId, foldEntLst);
						hmDir.put(titleInfo.level+"", nDir);
					}
					kindCnt++;
				}
				if(kindCnt == 0) { errSb.append("[" + kindInfo.kindNm + "]보고서에 해당하는 인덱스로 등록된 내용이 없습니다.\n"); }
			}
			no++;
		}
		
		no = 1;
		for(CdInfo cdInfo : fmsDoc.alCdDwgList) {
			// DWGCD
			WhDir cdDir = rDir.mkDir(rcvNo, "DWGCD" + StringUtil.lpad(no+"", "0", 2), sendUserId, foldEntLst);
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				WhDir kindDir = cdDir.mkDir(rcvNo, kindInfo.kindNm, sendUserId, foldEntLst);
				if(kindInfo.kindNm.indexOf("/") >= 0) { errSb.append("보고서명에 / 문자는 포함될 수 없습니다. [" + kindInfo.kindNm + "]\n"); }
				
				int kindCnt = 0;
				HashMap<String, WhDir> hmDir = new HashMap<String, WhDir>();
				hmDir.put("0", kindDir);
				for(TitleInfo titleInfo : kindInfo.titleList) {
					if(titleInfo.title.indexOf("/") >= 0) { errSb.append("폴더명에 / 문자는 포함될 수 없습니다. [" + kindInfo.kindNm + " , " + titleInfo.title + "]\n"); }
					if(!NumberUtils.isNumber(titleInfo.fileFrom)) { errSb.append("file_from값이 숫자가 아닙니다. [" + kindInfo.kindNm + " , " + titleInfo.title + "]\n"); }
					if(!NumberUtils.isNumber(titleInfo.fileTo)) { errSb.append("index에 file_from에 문제가 있습니다. xml에서 다음의 위 아래 file_from을 확인하여 주십시오. [" + kindInfo.kindNm + " , "  + titleInfo.title + "]\n"); }
					if(Integer.parseInt(titleInfo.fileTo) < Integer.parseInt(titleInfo.fileFrom) - 1) { errSb.append("index에 file_from에 문제가 있습니다. xml에서 다음의 위 아래 file_from을 확인하여 주십시오. [" + kindInfo.kindNm + " , "  + titleInfo.title + "]\n"); } 
					WhDir pDir = hmDir.get((titleInfo.level-1)+"");
					if(pDir == null) {
						errSb.append("[" + kindInfo.kindNm + "] [" + titleInfo.title + "]" + " file_from["+titleInfo.fileFrom+"] index의 레벨이 잘못되었습니다.\n");
					}else {
						WhDir nDir =  pDir.mkDir(rcvNo, titleInfo.title, sendUserId, foldEntLst);
						hmDir.put(titleInfo.level+"", nDir);
					}
					kindCnt++;
				}
				if(kindCnt == 0) { errSb.append("[" + kindInfo.kindNm + "]보고서에 해당하는 인덱스로 등록된 내용이 없습니다.\n"); }
			}
			no++;
		}
		
		String sysFilePath;
		int fileCnt = 0;
		no = 1;
		for(CdInfo cdInfo : fmsDoc.alCdDocList) {
			String cdDirNm = "DOCCD" + StringUtil.lpad(no+"", "0", 2);
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {				  
						sysFilePath = unzipRootPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
						String sysFilePathTiff = unzipRootPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tiff";
						if(FileUtil.isExistFile(sysFilePath) == false && FileUtil.isExistFile(sysFilePathTiff)) {
							try { FileUtil.fileMove(sysFilePathTiff, sysFilePath); } catch(Exception ex) {ex.printStackTrace();}
						}
						if(!FileUtil.isExistFile(sysFilePath)) {
							errSb.append(sysFilePath.replaceAll(unzipRootPath, "") + " 파일을 찾을 수 없습니다.\n");
						}else if(FileUtil.getFilelength(sysFilePath) == 0) {
							errSb.append(sysFilePath.replaceAll(unzipRootPath, "") + " 파일의 크기가 0입니다.\n");
						}
						fileCnt++;
					}
				}
			}
			no++;
		}
		no = 1;
		for(CdInfo cdInfo : fmsDoc.alCdDwgList) {
			String cdDirNm = "DWGCD" + StringUtil.lpad(no+"", "0", 2);
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				for(TitleInfo titleInfo : kindInfo.titleList) {
					for(int f = Integer.parseInt(titleInfo.fileFrom); f <= Integer.parseInt(titleInfo.fileTo); f++) {
						sysFilePath = unzipRootPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tif";
						String sysFilePathTiff = unzipRootPath + "/" + cdDirNm + "/" + kindInfo.kindNm + "/" + StringUtil.lpad(f+"", "0", 4) + ".tiff";
						if(!FileUtil.isExistFile(sysFilePath) && FileUtil.isExistFile(sysFilePathTiff)) {
							try { FileUtil.fileMove(sysFilePathTiff, sysFilePath); } catch(Exception ex) {ex.printStackTrace();}
						} 
						if(!FileUtil.isExistFile(sysFilePath)) {
							errSb.append(sysFilePath.replaceAll(unzipRootPath, "") + " 파일을 찾을 수 없습니다.\n");
						}else if(FileUtil.getFilelength(sysFilePath) == 0) {
							errSb.append(sysFilePath.replaceAll(unzipRootPath, "") + " 파일의 크기가 0입니다.\n");
						}
						fileCnt++;
					}
				}
			}
			no++;
		}
		if(fileCnt == 0) { errSb.append("첨부된 파일을 찾지 못하였습니다.\n"); }
		return errSb.toString();
	}
}