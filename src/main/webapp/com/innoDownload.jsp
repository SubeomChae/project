<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.net.*, java.util.*, egovframework.cbiz.*, egovframework.cbiz.util.*, egovframework.ubiz.util.*, com.innorix.transfer.InnorixDownload" %>
<%
	String rcvNo = request.getParameter("rcv_no");
	String rcvNm = OntongUtil.getDocRcvNo(rcvNo);
	String serverDir = "";
	if(rcvNo.startsWith("E")) { // e보고서
		serverDir = OntongUtil.getStorageDir(rcvNo) + "/" + OntongUtil.getRcvNoYear(rcvNo) + "/" + rcvNm;
	}else { // 설계도서
		serverDir = OntongUtil.getStorageDir(rcvNo) + "/" + rcvNo.substring(0,1) + "/" + OntongUtil.getRcvNoYear(rcvNo) + "/" + rcvNm;
	}
	
	String filePath = request.getParameter("file_path");
	String fileRealName = java.net.URLEncoder.encode(filePath, "UTF-8").replaceAll("\\+", "%20");

	File file = new File(serverDir+"/"+filePath);
	System.out.println("serverFilePath="+serverDir+"/"+filePath);

	response.setContentType("application/octet-stream");
	response.setHeader("Accept-Ranges", "bytes");
	response.setHeader("Content-Disposition", "attachment; filename=\""+fileRealName+"\"");

	// stream 설정시 자동 전달되는 GET Param 값
	String szStartOffset = request.getParameter("_StartOffset");
	String szEndOffset = request.getParameter("_EndOffset");
	
	long startOffset = 0;
	long endOffset = 0;
	if(szStartOffset != null) { startOffset = Long.parseLong(szStartOffset); }
	if(szEndOffset != null) { endOffset = Long.parseLong(szEndOffset); }

	long contentLength = 0;
	if(szStartOffset != null || szEndOffset != null) { // 컨트롤 다운로드 요청시
	    contentLength = endOffset - startOffset + 1;
	}else { // html 일반 다운로드 요청시
	    contentLength = file.length();
	}
	response.setHeader("Content-Length", "" + contentLength);

	// 파일 스트림을 저장하기 위한 바이트 배열 생성.  
	byte b[] = new byte[8192];
	BufferedInputStream input = null;
	BufferedOutputStream output = null;
	
	try {
		out.clear();
		out = pageContext.pushBody();

		input = new BufferedInputStream(new FileInputStream(file));
		output = new BufferedOutputStream(response.getOutputStream());
		int read = 0;
		if(startOffset != 0) {
			long n = input.skip(startOffset);
			if (n == -1) read = -1;
		}

		while(contentLength > 0) {
			if(contentLength < 8192) {
				b = new byte[(int)contentLength];
			}
			read = input.read(b);
			if(read == -1) { break; }

			output.write(b, 0, read);
			contentLength = contentLength - read;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(output != null) {
			output.flush();
			output.close();
		}

		if(input != null) {
			input.close();
		}
	}
%>