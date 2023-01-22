package egovframework.ubiz.util.ontong;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.CustomEx;
import egovframework.cbiz.crypto.SeedCipher;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.ZipUtil;
import egovframework.ubiz.util.OntongUtil;
import egovframework.ubiz.util.ontong.fdoc.FmsDoc;

public class EDocTiffReqThread implements Runnable  {

	private Box box = null;
	private String rcvNo = "";
	private String uploadPath = "";
	private String userId = "";
	private CommDBService commDBService = null;
	
	public EDocTiffReqThread(Box box, CommDBService commDBService) throws Exception {
		this.box = box;
		this.rcvNo = box.get("rcv_no");
		this.userId = SeedCipher.decode(box.get("user_id"));
		this.uploadPath = OntongUtil.getStorageDir(this.rcvNo)+this.rcvNo.substring(0,1)+"/"+OntongUtil.getRcvNoYear(this.rcvNo)+"/"+OntongUtil.getDocRcvNo(this.rcvNo);
		this.commDBService = commDBService;
	}
	
	@Override
	public void run() {		
		StringBuffer errSb = new StringBuffer();
		try {
			System.out.println("start check");
			if(FileUtil.isExistFile(uploadPath+"/DOCCD01")) { 
				FileUtils.deleteDirectory(new File(uploadPath+"/DOCCD01"));
			}
			if(FileUtil.isExistFile(uploadPath+"/DWGCD01")) { 
				FileUtils.deleteDirectory(new File(uploadPath+"/DWGCD01"));
			}
			// 업로드 폴더에서 압축 파일 압축해제
			String zippedPath = uploadPath + "/zip";
			File[] files = (new File(zippedPath)).listFiles(new FilenameFilter() {
								@Override
								public boolean accept(File dir, String name) {
									return name.toLowerCase().endsWith(".zip");
								}
							});
			String unzipRootPath = uploadPath;
			for(File zipFile : files) {
				if(zipFile.getName().indexOf("_DEL") < 0){
					String fileName = zipFile.getName();
					String unzipPath = unzipRootPath + "/" + fileName.substring(0,7) + "/" + fileName.substring(8).replaceAll(".zip", "");
					if(!FileUtil.isExistFile(unzipPath)) { (new File(unzipPath)).mkdirs(); }
					System.out.println(fileName + " : " + unzipPath);
					ZipUtil.unzip(zipFile, new File(unzipPath), "UTF-8");
				}
			}
			box.put("send_status", "2"); // 압축해제
			commDBService.exec("PR_DOCTB_MAST01", "UPDATE_SEND_STATUS", box);
			System.out.println("unzip finished");

			Box ebox = getEdocInfo(uploadPath + "/edoc.info/edoc.txt");
			if(ebox.get("submit_type").toUpperCase().equals("XML")) {
				// xml파일을 edoc.info폴더에서 상위폴더로 이동  
				File[] xmlFiles = (new File(uploadPath + "/edoc.info")).listFiles(new FilenameFilter() {
										@Override
										public boolean accept(File dir, String name) {
											return name.toLowerCase().endsWith(".xml");
										}
									});
				for(File xml : xmlFiles) {
					String xmlPath = unzipRootPath + "/" + xml.getName();
					if(!FileUtil.isExistFile(xmlPath)) { FileUtil.doDeleteFile(xmlPath); }
					FileUtils.copyFile(xml, new File(unzipRootPath + "/" + xml.getName()));
				}
			}

			// 업로드 파일 제출형식에 따라 검사
			if(ebox.get("submit_type").toUpperCase().equals("XML")) { 
				EDocChkXml chkXml = new EDocChkXml(ebox.get("doc_class"));
				String errMsg = chkXml.chkXmlCont(unzipRootPath, null);
				errSb.append(errSb.length() > 0 && errSb.toString().endsWith("\n") ? "" : "\n").append(errMsg);
			}else {
				// xml이 없는 경우, xml생성 후,체크
				EDocChkDir chkDir = new EDocChkDir();
				String errMsg = chkDir.makeDir(rcvNo, unzipRootPath, userId, commDBService);
				errSb.append(errSb.length() > 0 && errSb.toString().endsWith("\n") ? "" : "\n").append(errMsg);
			}
			box.put("send_status", "3"); // 검사완료
			commDBService.exec("PR_DOCTB_MAST01", "UPDATE_SEND_STATUS", box);

			if(errSb.toString().trim().length() == 0) {
				// DOCTB_INDX01, DOCTB_FILE01, DOCTB_FOLD01 생성 
				FmsDoc fmsDoc = EDocUtil.getDocXml(box.get("rcv_no"), this.uploadPath);
				fmsDoc.debugXmlPath(); 
				fmsDoc.makeReportDir();
				fmsDoc.dbInsRptIdx(commDBService, userId);
				String rtnMsg = fmsDoc.docSubmitReq(commDBService, box.get("rcv_no"), userId, box);
				if(rtnMsg.equals("")) { 
					//commDBService.exec("PR_DOCTB_REPT01", "UPDATE_FILE_SIZE", box);
					box.put("send_status", "4"); // 제출완료
					commDBService.exec("PR_DOCTB_MAST01", "UPDATE_SEND_STATUS", box);
					FileUtil.doDeleteFile(uploadPath + "/err.txt");
				}else {
					errSb.append(rtnMsg); 
					FileUtil.writeToTextFile(uploadPath + "/err.txt", errSb.toString().trim(), false);
				}
			} 
		}catch (IOException e) {
			e.printStackTrace();
		}catch (Exception ex) {
			ex.printStackTrace();
			errSb.append(errSb.length() > 0 && errSb.toString().endsWith("\n") ? "" : "\n").append(CustomEx.getPrintStackTrace(ex));
		}
		
		System.out.println("ERR MSG : " + errSb.toString());
	}
	
	/**
	 * 해당 설계도서의 submit_type, doc_class 조회
	 */
	public Box getEdocInfo(String edocTxtPath) throws Exception {
		Box box = new Box();
		String edocTxt = FileUtil.readFromTextFileUtf8(edocTxtPath);
		String[] edocTxtLines = edocTxt.split("\n");
		
		for(String line : edocTxtLines) {
			if(line.split(":")[0].equals("submit_type")) {
				box.put("submit_type", line.split(":")[1]);
			}else if(line.split(":")[0].equals("doc_class")) {
				box.put("edoc_type", line.split(":")[1]);
			}else if(line.split(":")[0].equals("edoc_type")) {
				box.put("edoc_type", line.split(":")[1]);
			}
		}
		System.out.println(box.toString());
		return box;
	}
	
 }