/************************************************************************************************/
/* Class Name    : fileController                                                      			*/
/* Description   : 파일처리  컨트롤러																*/
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company       Author     Description                                     */
/* --    ----------    ---------     --------   ------------------------------------------------*/
/* 01    2013/10/02      신진IT컨설팅  	  정 진 수   	Initial Release									*/ 
/*																								*/
/************************************************************************************************/
package egovframework.ubiz.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.util.FormatUtil;

public class fileController extends abstractController{

	/********************************************************************************************/
	/* Method Name  : downFile																	*/
	/* Description  : 파일 다운로드                               													*/
	/********************************************************************************************/
	@RequestMapping(value = "/com/**/downFile.do")
	public String downFile(HttpServletRequest request, HttpServletResponse response, Box box) {
		String pathKey = box.get("pathKey");
		String cliPath = box.get("file_nm");
		if(box.get("excelParam").endsWith("xls")) {
			pathKey = "temp.pds.dir";
			cliPath = box.get("excel_file_nm") + ".xls";
		}
		
		BufferedInputStream Bfin = null;
		BufferedOutputStream outs = null;
		File file = null;
		String path = null;
		int fileSize = 0;
		try {	
			cliPath = new String(cliPath.getBytes("EUC-KR"),"8859_1");
			String svrPath = box.get("file_path");
			svrPath.replaceAll("../", "???").replaceAll("./.\\.", "????");
//			path = FormatUtil.nvl2(box.get("file_dir"), Config.getInstance().getProperty(pathKey))+"/" + svrPath;
			file = new File(path);
			if(!file.exists()) {
				svrPath = new String(box.get("file_path").getBytes("EUC-KR"),"8859_1");
				svrPath.replaceAll("../", "???").replaceAll("./.\\.", "????");
//				path = FormatUtil.nvl2(box.get("file_dir"), Config.getInstance().getProperty(pathKey))+"/" + svrPath;
				file = new File(path);
				if(!file.exists()) {
					PrintWriter out;
					response.setContentType("text/html");
					response.setCharacterEncoding("euc-kr");
					out = response.getWriter();
					out.println("<script>alert('서버에서 파일을 찾을 수 없습니다.\\n\\n["+path+"]');history.back();</script>");
					out.close();
					return null;
				}
			}
				
			fileSize = (int)file.length();  //파일 크기
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename="+ cliPath +";");
			response.setHeader("Content-Length", ""+fileSize);
			
			//파일 스트림을 저장하기 위한 바이트 배열 생성.
			byte bytestream[] = new byte[2048];

			//파일 객체를 스트림으로 불러온다.
			Bfin = new BufferedInputStream(new FileInputStream(file));
			outs = new BufferedOutputStream(response.getOutputStream());

			int read = 0;
			while ((read = Bfin.read(bytestream)) != -1) {
				outs.write(bytestream,0,read);
			}

			if(!box.get("proc").equals("")) {
				commDBService.exec(box.get("proc"), "UPDATE_CNT", box); // 다운로드수 증가
			}
			
		} catch (FileNotFoundException fnfe) {
//			CD.liblogger.error(fnfe);
		} catch (IOException ioe) {
//			CD.liblogger.error(ioe);
		} catch (Exception e) {
//			CD.liblogger.error(e);
		} finally {
			if(file != null) file = null;
			try {
				if(outs != null) outs.close();
				if(Bfin != null) Bfin.close();
			} catch (IOException ioe) {
//				CD.liblogger.error(ioe);
			}
		}
		return null;
	}
}
