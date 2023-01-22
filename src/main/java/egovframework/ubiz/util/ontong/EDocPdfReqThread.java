package egovframework.ubiz.util.ontong;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomEx;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.crypto.SeedCipher;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.ZipUtil;
import egovframework.ubiz.util.OntongUtil;
import egovframework.ubiz.util.ontong.fdoc.FmsDoc;

public class EDocPdfReqThread implements Runnable  {

	private Box box = null;
	private String rcvNo = "";
	private String uploadPath = "";
	private String userId = "";
	private CommDBService commDBService = null;
	
	public EDocPdfReqThread(Box box, CommDBService commDBService) throws Exception {
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
			
			box.put("dir_path", OntongUtil.getDocRcvNo(box.get("rcv_no")));
			commDBService.exec("PR_DOCTB_FOLD01", "DELETEALL", box);
			
			box.put("param01", box.get("rcv_no"));
			RsWrapper rsWp = commDBService.execList("PR_DOCTB_REPT01_LIST", "LIST001", box);
			Box ibox = new Box();
			for(int i=0; i < rsWp.getLength(); i++) { 
				String rptCd = (rsWp.get("report_id",i).startsWith("DWG") ? "DWGCD01" : "DOCCD01");
				// 1. 접수번호 폴더
				ibox.put("dir_path", "/" + OntongUtil.getDocRcvNo(box.get("rcv_no")) + "/");
				Box dbox = commDBService.execBox("PR_DOCTB_FOLD01", "SELECT_BY_PATH", ibox);
				if (dbox.get("dir_id").equals("")) {
					// 접수번호 폴더 생성
					dbox.put("dir_id", CD.getNewID());
					dbox.put("parent_dir_id", "ROOT");
					dbox.put("dir_nm", OntongUtil.getDocRcvNo(box.get("rcv_no")));
					dbox.put("dir_path", ibox.get("dir_path"));
					dbox.put("sys_reg_id", this.userId);
					commDBService.exec("PR_DOCTB_FOLD01", "INSERT", dbox);
				}
				// 2. DOCCD01, DWGCD01 폴더 
				ibox.put("dir_path", "/" + OntongUtil.getDocRcvNo(box.get("rcv_no")) + "/" + rptCd + "/");
				Box dbox2 = commDBService.execBox("PR_DOCTB_FOLD01", "SELECT_BY_PATH", ibox);
				if (dbox2.get("dir_id").equals("")) {
					// DOCCD01, DWGCD01 폴더  생성
					dbox2.put("dir_id", CD.getNewID());
					dbox2.put("parent_dir_id", dbox.get("dir_id"));
					dbox2.put("dir_nm", rptCd);
					dbox2.put("dir_path", ibox.get("dir_path"));
					dbox2.put("sys_reg_id", this.userId);
					commDBService.exec("PR_DOCTB_FOLD01", "INSERT", dbox2);
				}
				// 3. 보고서 폴더
				ibox.put("dir_path", String.format("/%s/%s/%s/", OntongUtil.getDocRcvNo(box.get("rcv_no"))
																, rptCd
																, rsWp.get("report_nm",i)));
				Box dbox3 = commDBService.execBox("PR_DOCTB_FOLD01", "SELECT_BY_PATH", ibox);
				if (dbox3.get("dir_id").equals("")) {
					// 보고서 폴더 생성
					dbox3.put("dir_id", CD.getNewID());
					dbox3.put("parent_dir_id", dbox2.get("dir_id"));
					dbox3.put("dir_nm", rsWp.get("report_nm",i));
					dbox3.put("dir_path", ibox.get("dir_path"));
					dbox3.put("sys_reg_id", this.userId);
					commDBService.exec("PR_DOCTB_FOLD01", "INSERT", dbox3);
				}
				
				// 4. 파일 생성 
				Box fbox = new Box();
				fbox.put("file_id", CD.getNewID());
				fbox.put("dir_id", dbox3.get("dir_id"));
				fbox.put("file_nm", rsWp.get("report_file",i));
				fbox.put("file_path", String.format("/%s/%s/%s/", box.get("rcv_no").substring(0,1)
																		, box.get("rcv_no").subSequence(1, 5)
																		, OntongUtil.getDocRcvNo(box.get("rcv_no"))));
				String filePath = this.uploadPath + "/" + rsWp.get("report_file", i);
				fbox.put("file_size", String.valueOf(FileUtil.getFilelength(filePath)));
				fbox.put("upload_yn", "Y");
				fbox.put("sys_reg_id", this.userId);
				commDBService.exec("PR_DOCTB_FILE01", "INSERT", fbox);
				box.put("send_status", "4"); // 제출완료
				commDBService.exec("PR_DOCTB_MAST01", "UPDATE_SEND_STATUS", box);
			} 
			
		}catch (Exception ex) {
			ex.printStackTrace();
			errSb.append(errSb.length() > 0 && errSb.toString().endsWith("\n") ? "" : "\n").append(CustomEx.getPrintStackTrace(ex));
		}
		
		System.out.println("ERR MSG : " + errSb.toString());
	}	
 }