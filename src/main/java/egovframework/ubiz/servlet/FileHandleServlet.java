package egovframework.ubiz.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;

public class FileHandleServlet extends HttpServlet {
	  
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html; charset=UTF-8");
    	
		JsonObject jObj = new JsonObject();
		JsonArray jsList = new JsonArray();
		
        DiskFileItemFactory factory = new DiskFileItemFactory(); 
        ServletContext servletContext = this.getServletConfig().getServletContext();
 
        try {
        	String serverDir = "";
            ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(req);
			for(FileItem item : items) {
				if(item.getFieldName().equals("pathKey")) {
					serverDir = java.net.URLDecoder.decode(item.getString());
		        	System.out.println("serverDir="+serverDir);
		            if(!FileUtil.isExistFile(serverDir)) { FileUtil.mkDir(serverDir); }
					break;
				}
			}
			
			if(!serverDir.equals("")) {
	            File repository = new File(serverDir);
	            factory.setRepository(repository);

				for(FileItem item : items) {
					if(item.isFormField() == false && item.getSize() > 0 ) {
						JsonObject jsono = new JsonObject();
						String fileExt = FileUtil.getFileExt(item.getName());
						String fileNm = CD.getNewID() + "." + fileExt;
						jsono.addProperty("input_nm", 	item.getFieldName());
			            jsono.addProperty("file_nm", 	fileNm);
			            jsono.addProperty("file_type", 	fileExt);
			            jsono.addProperty("file_size", 	item.getSize());
			            jsList.add(jsono);
						item.write(new File(serverDir + "/" + fileNm));
					}
				}
				jObj.add("files", jsList);
			}
			Gson gson = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();
			jsonDataSend(gson.toJson(jObj), req, res);
		}catch (FileUploadException e) {
			e.printStackTrace();
		}catch (Exception ex) {
			ex.printStackTrace();
		}
    }
	
	private void fileDownload(String sFilePath, String fileNm, HttpServletRequest request, HttpServletResponse response) {
		try {
			File file = new File(sFilePath);
	    	if(!file.exists()) {
	    		System.out.println("file not found :" + sFilePath);
	    	}else {
	        	response.setContentType("application/octet-stream"); 
	    		response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm,"MS949"));
	
	    		int fileSize = (int)file.length();  //파일 크기
		    	response.setHeader("Content-Length", ""+fileSize);  
	
				System.out.println("download fileSize :" + fileSize);
				
		    	//파일 스트림을 저장하기 위한 바이트 배열 생성.  
		    	byte bytestream[] = new byte[2048]; 
		
		    	//파일 객체를 스트림으로 불러온다.
		    	BufferedInputStream Bfin = new BufferedInputStream(new FileInputStream(file)); 
		    	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream()); 
		
		    	int read = 0; 
		    	while ((read = Bfin.read(bytestream)) != -1){ 
		    		outs.write(bytestream,0,read);
		    	} 
		
		    	outs.close(); 
		    	Bfin.close();
	    	}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
    public static void jsonDataSend(String str, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response.setContentType("text/html;charset=UTF-8"); 
    	response.setContentType("application/json"); 
    	PrintWriter pr = response.getWriter();
    	
    	System.out.println(str);
        pr.write(str);    	
    	pr.close();
    }
}
