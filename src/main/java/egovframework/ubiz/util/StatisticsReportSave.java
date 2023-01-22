package egovframework.ubiz.util;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Service;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.web.abstractController;

@Service
public class StatisticsReportSave extends abstractController {
	public void saveReport(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		Box obox = new Box();
		try {
			obox = commDBService.execBox("PR_STATB_EBOK11", "SELECT_EBOOK", box);
			Box rbox = createDataText((anyMetaData) request.getAttribute("anyMetaData"), (RsWrapper) request.getAttribute("rsWp"));
			
			obox.put("svrFileNm", 	rbox.get("svrFileNm"));
			obox.put("bk_yymm", 	box.get("bk_yymm"));
			obox.put("report_nm",	box.get("report_nm"));
			obox.put("report_id",	box.get("report_id"));
			obox.put("form_id", 	box.get("form_id"));
			box.put("ebook_ym", 	box.get("bk_yymm"));
			box.put("file_path", 	box.get("report_id")+".pdf");
			box.put("action_type", 	box.get("file_yn").equals("Y") ? "UPDATE":"INSERT");
			
			String rtnMsg = sendPostURL(obox);
			if(rtnMsg.startsWith("0")) {
				commDBService.exec("PR_STATB_EBOK11", box.get("action_type"), box);
				obox.put("isOk", "Y");
				returnOkJsonResult(obox, request, response);
			}else if(rtnMsg.startsWith("invoke Error")) {
				returnFailJsonResult("문서 생성중 오류가 발생했습니다.\n"+rtnMsg, request, response);
			}else {
				returnFailJsonResult("문서 저장중 오류가 발생했습니다.", request, response);
			}
		}catch(Exception ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	public Box createDataText(anyMetaData anyData, RsWrapper rsWp) {
		RsWrapper dataWp = new RsWrapper();;
		if(rsWp != null) {
			dataWp = rsWp;
		}else {
			if(anyData != null) { dataWp = anyData.getDataRsWp(); }
		}
		
		// 텍스트파일 생성
		int column_cnt = 64;
		String destDir = CustomProperty.upload_dir + "statistics";
		String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + ".txt";
		
		File file = new File(destDir + "/" + svrFileNm);
	    PrintWriter writer = null;
	    
		try {
			writer = new PrintWriter(file, "UTF-8");
			for(int i=0; i < dataWp.getLength(); i++) { 
				Box rb = dataWp.getRsBoxAt(i);
				String contents = "";
				for(int j=0; j < column_cnt; j++) {
					if(j < rb.size()) {
						contents += rb.get(j) + "^";
					}else {
						contents += "^";
					}
				}
				writer.println(contents);
			}
		} catch (FileNotFoundException | UnsupportedEncodingException ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
		}finally {
			writer.close();
		}
		Box rbox = new Box();
		rbox.put("svrFileNm", svrFileNm);
				
		return rbox;
	}
	
	public String sendPostURL(Box box) throws Exception {
		String str = "";
		String server_domain = propertiesService.getString("fms.svr.url");
		String report_domain = propertiesService.getString("rpt.svr.url");
		try {
			String mrd_param = "/rp [" + box.get("bk_yymm") + "] "
					 + "/rv head01[" + box.get("head01") + "] "
					 + "head02[" + box.get("head02") + "] "
					 + "head03[" + box.get("head03") + "] "
					 + "head04[" + box.get("head04") + "] "
					 + "head05[" + box.get("head05") + "] "
					 + "unit_desc[" + box.get("unit_desc") + "] "
					 + "svr_domain[" + server_domain + "] "
					 + "/rfn ["+server_domain+"/upload_data/statistics/" + box.get("svrFileNm") + "]";
			String params = "report_id=" + box.get("report_id")
						  + "&form_id=" + box.get("form_id") 
						  + "&export_name=" + box.get("bk_yymm")+"/work/"+StringUtil.urlEncode(box.get("report_id")) 
						  + "&server_domain=" + server_domain
						  + "&mrd_param=" + StringUtil.urlEncode(mrd_param);
			
			URL url = new URL(report_domain + "/ReportingServer/invoker_fms_statistics.jsp");
			URLConnection conn = url.openConnection();
			
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
			
			DataOutputStream out = null;
			
			try {
				out = new DataOutputStream(conn.getOutputStream());
				out.writeUTF(params);
				//out.write(params.getBytes("euc-kr"));
				out.flush();
			}finally {
				if(out != null) out.close();
			}
			
			InputStream is = conn.getInputStream();
			Scanner scan = new Scanner(is);
			
			while (scan.hasNext()) {
				str += scan.nextLine();
			}
			scan.close();
		}catch (Exception ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
			ex.printStackTrace();
		}
		
		try {
			if(str.startsWith("invoke Error")) {
				return str;
			}else {
				int rtnCode = base64ToFile(CustomProperty.upload_dir + "statistics/ebook/" + box.get("bk_yymm") + "/work/" + box.get("report_id") + ".pdf", str);
				if(rtnCode == 1) {
					CD.logger.error("FileNotFoundException");
				}else if(rtnCode == 2) {
					CD.logger.error("IOException");
				}
				return String.valueOf(rtnCode);
			}
		}catch (Exception ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return "invoke Error : Exception";
		}
	}

	private int base64ToFile(String filePath, String base64) throws IOException {
		int rtnCode = 0;
		FileOutputStream outFile = null;
		try {
			outFile = new FileOutputStream(filePath);
			byte[] pdfByteArray = Base64.decodeBase64(base64);
			outFile.write(pdfByteArray);
		}catch(FileNotFoundException e) {
			rtnCode = 1;
		}catch(IOException e) {
			rtnCode = 2;
		}finally {
			if(outFile != null) outFile.close();
		}
		return rtnCode;
	}
}
