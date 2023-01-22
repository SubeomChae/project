/********************************************************************/
/* Class Name  : FileUtil											*/
/* Description : File 관련 util class									*/
/********************************************************************/
/* Modification Log													*/
/* No  DATE  			Company		Author 	Description				*/
/* 01  2002/06/01	IRAM				Initial Release				*/
/********************************************************************/

package egovframework.cbiz.util;

import java.io.*;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.*;

public class FileUtil {
	public FileUtil() {} 
	public static boolean doDeleteFile(String filePath) throws Exception {
		File file = new File(filePath);
		if(file.exists()) {
			if(!file.delete()) { return false; }
		}
		return true;
	}

	// 특정file의 FullPath에서 파일이름만만 가져오는 메소드
	public static String getFileName(String str){
		Properties p = new Properties();
		str = StringUtil.replace(str, "\\","/");
		StringTokenizer  strTokens  =  new  StringTokenizer(str,"/");
		while(strTokens.hasMoreTokens()){
			String token  =  strTokens.nextToken();
			p.setProperty("token",token);
		}
		return p.getProperty("token");
	}

	// 파일의 확장자명을 가져온다.
	public static String getFileExt(String filenm) {
		if(filenm.lastIndexOf(".") >= 0) {
			return filenm.substring(filenm.lastIndexOf(".")+1, filenm.length());
		}else {
			return "";
		}
	}

	// fileName에 content를 기록한다.
	public static void writeToTextFile(String fileName, String content, boolean isAppend) {
		String str;
		FileOutputStream outFile = null;
		try {
			outFile = new FileOutputStream(fileName,isAppend);
			str = content;
			outFile.write(str.getBytes());
			if(outFile != null) outFile.close();
		}catch (FileNotFoundException fnfe) {
			System.out.println("FileNotFound:" + fileName);
		}catch (IOException ioe) {
			System.out.println("IOException:" + fileName);
		}
	}

	// OS에 따른 file Separator를 리턴한다.
	public static String fileSeparator() {
		return System.getProperty("file.separator", "/");
	}

	// 웹상에서 링크가 가능한 파일이름으로 파일이름을 변환한다.
	public static String getValidFileName(String fileName) {
		String validFileName;
		validFileName = fileName;
		if(validFileName==null) return "";
		if(validFileName.equals("")) return "";

		validFileName = StringUtil.replace(validFileName,"%","_");
		validFileName = StringUtil.replace(validFileName,"#","_");
		validFileName = StringUtil.replace(validFileName," ","_");

		return validFileName;
	}

	public static boolean isFileLock(File file) throws Exception {
		boolean isLock = true;
		if(file.exists()) {
			RandomAccessFile rf = new RandomAccessFile(file, "rw");
			FileChannel fileChannel = rf.getChannel();
			FileLock lock = null;
			try {
				lock = fileChannel.tryLock();
				if(lock != null) { isLock = false; }
			}catch (Exception ex) {
				ex.printStackTrace();
			}finally {
				if(lock != null) { lock.release(); }
				if(fileChannel != null) { fileChannel.close(); }
				if(rf != null) { rf.close(); }
			}
		}else {
			throw new Exception("File is not exist : " + file.getAbsolutePath());
		}
		return isLock;
	}
	
	// 특정 파일이 위치하는 디렉토리를 리턴한다.
	public static String getCanonicalPath(String fileName) {
		if( fileName==null ) return null;
		File f = new File(fileName);
		try {
			return  f.getCanonicalPath();
		}catch (IOException ioe) {
			ioe.printStackTrace();
			return fileName; // oh well, we tried...
		}
	}

	// Text File의 내용을 읽어 리턴한다.
	public static String readFromTextFile(String fileName) throws Exception {
		FileInputStream fis = null;
		byte buf[] = null;
		try {
			int len = (int)(new File(fileName).length());
			fis		= new FileInputStream(fileName);
			buf		= new byte[len];
			fis.read(buf);
			fis.close();
		}finally {
			try {
				if(fis != null) fis.close();
			}catch ( IOException e) {}
			return new String(buf);
		}
	}

	public static String readFromTextFileUtf8(String fileName) throws Exception {
		String rtn = "";
		try {
			File fileDir = new File(fileName);
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir), "UTF8"));
			String str;
			while ((str = in.readLine()) != null) {
				rtn += str + "\n";
			}
			in.close();
		}catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {}

		return rtn;
	}

	// 이미지 File의 내용을 읽어 리턴한다.
	public static byte[] readFromImgFile(String fileName) {
		Long fileLen = new Long(getFilelength(fileName));
		byte buffer[] = new byte[fileLen.intValue()];
		FileInputStream fln = null;
		try {
			fln = new FileInputStream(fileName);
			fln.read(buffer);
		}catch(Exception ignore) {
		}finally {
			try {
				if(fln != null) fln.close();
			}catch (Exception e) {}
			return buffer;
		}
	}

	// 파일의 크기를 리턴한다.
	public static long getFilelength(String fileName) {
		long rtn = 0;
		try {
			File fp = new File(fileName);
			rtn = fp.length();
		}catch (Exception e) {
		}finally {
			return rtn;
		}
	}

	// 파일의 존재여부를 확인한다.
	public static boolean isExistFile(String fileName) {
		File file = new File(fileName);
		return file.exists();
	}

	// 파일을 복사한다.
	public static void copyfile(String src, String dest) throws IOException { 
		File inputFile = new File(src);
		if(inputFile.isFile()){
			File outputFile = new File(dest);
			if(outputFile.exists()){
				outputFile = new File(dest+"_1");
			}
			FileInputStream in = null;
			FileOutputStream out = null;
			try {
				in = new FileInputStream(inputFile); 
				out = new FileOutputStream(outputFile); 
				int c; 
				while ((c = in.read()) != -1){ 
					out.write(c); 
				} 
			}catch(Exception e) {
			}finally {
				in.close(); 
				out.close(); 
			}
		}
	} 

	public static void fileMove(String src, String dest) throws IOException {
		File inputFile = new File(src);
		File outFile = new File(dest);
		if(outFile.exists()) { outFile.delete(); }
		else {
			String path = getFilePath(dest);
			(new File(path)).mkdirs();
		}
		inputFile.renameTo(outFile);
	}

	// 특정file의 FullPath에서 패스경로만 가져오는 메소드
	public static String getFilePath(String str){
		Properties p = new Properties();
		str = StringUtil.replace(str, "\\","/");
		int pos = str.lastIndexOf("/");
		if(pos >0) {
			return str.substring(0,pos);
		}else { return str;}
	}

	// window runtime 을 이용한 파일복사
	public static void copyfileRuntimeWin(String src, String dest) throws Exception { 
		String cmd = "cmd /c \"copy "+src+" " +dest+" \" ";
		System.out.println(cmd);
		Runtime rt = Runtime.getRuntime();
		Process p = rt.exec( cmd );
		p.waitFor();
		p.destroy();
	}

	// 디렉토리 생성
	public static void mkDir(String dest) throws Exception {
		File f = new File(dest);
		f.mkdir();
	}

	public static void mkDirs(String dest) throws Exception {
		File f = new File(dest);
		f.mkdirs();
	}

	// 디렉토리 삭제
	public static void delDir(String dest) throws Exception {
		File directory = new File(dest);
		File[] file_list = null;
		if(directory.exists() && directory.isDirectory()) {
			file_list = directory.listFiles();
			if( file_list!=null && directory.exists() ) {
				for( int inx=0; inx<file_list.length; inx++ ) {
					file_list[inx].delete();
				}
				directory.delete();
			}
		}
	}

}