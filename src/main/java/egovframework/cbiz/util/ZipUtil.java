/*********************************************************************************
* 파  일  명   : ZipUtil.java
* 작  성  일   : 2005.02.16
* 작  성  자   : 
*---------------------------------------------------------------------------------
* 프로그램명   : ZipUtil
* 기능 및 설명 : ZIP유틸 
*---------------------------------------------------------------------------------
* 사용 Table   : 
*---------------------------------------------------------------------------------
* 기       타  :
*********************************************************************************/
package egovframework.cbiz.util;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Stack;
import java.util.ArrayList;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import net.sf.jazzlib.*;

public class ZipUtil {
	private static boolean debug = true;
	
	public static void unzip(File zippedFile) throws IOException {
		unzip(zippedFile, Charset.defaultCharset().name());
	}
	
	public static void unzip(File zippedFile, String charsetName ) throws IOException {
		unzip(zippedFile, zippedFile.getParentFile(), charsetName);
	}
	public static void unzip(File zippedFile, File destDir) throws IOException {
		unzip(new FileInputStream(zippedFile), destDir, Charset.defaultCharset().name());
	}
	
	public static void unzip(File zippedFile, File destDir, String charsetName) throws IOException {
		unzip(new FileInputStream(zippedFile), destDir, charsetName);
	}
	public static void unzip(InputStream is, File destDir) throws IOException{
		unzip(is, destDir, Charset.defaultCharset().name());
	}
	public static void unzip(InputStream is, File destDir, String charsetName) throws IOException {
		ZipArchiveInputStream zis ;
		ZipArchiveEntry entry ;
		BufferedOutputStream bos ;
		byte [] buf = new byte[1024 * 8];
		int nWritten = 0;
		zis = new ZipArchiveInputStream(is, charsetName, false);
		while((entry = zis.getNextZipEntry()) != null) {
			String entryName = entry.getName();
			File tempDir = destDir;
			String dmt = entryName.indexOf("\\") >= 0 ? "\\" : "/"; 
			String[] arr = StringUtil.split(entryName, dmt, true);
			for(int i=0; i < arr.length-1; i++) {
				File targetDir = new File(destDir, arr[0]);
				if(arr.length > 1) {
					String arrName = "";
					for(int j=0; j < i+1; j++){
						arrName = arrName + dmt + arr[j];
					}
					targetDir = new File(destDir, arrName);
					tempDir = targetDir;
				}
				if(!targetDir.exists()) { targetDir.mkdirs(); }
			}
			File fileName = new File(tempDir, arr.length > 0 ? arr[arr.length-1] : entryName);
			fileName.createNewFile();
			bos = new BufferedOutputStream(new FileOutputStream(fileName));
			while((nWritten = zis.read(buf)) >= 0) { bos.write(buf, 0, nWritten); }
			bos.close();
		}
		zis.close();
	}
	
	/**
	 * compresses the given file(or dir) and creates new file under the same directory.
	 * @param src file or directory
	 * @throws IOException
	 */
	public static void zip(File src) throws IOException{
		zip(src, Charset.defaultCharset().name(), true);
	}
	/**
	 * zips the given file(or dir) and create 
	 * @param src file or directory to compress
	 * @param includeSrc if true and src is directory, then src is not included in the compression. if false, src is included.
	 * @throws IOException
	 */
	public static void zip(File src, boolean includeSrc) throws IOException{
		zip(src, Charset.defaultCharset().name(), includeSrc);
	}
	/**
	 * compresses the given src file (or directory) with the given encoding
	 * @param src
	 * @param charSetName
	 * @param includeSrc
	 * @throws IOException
	 */
	public static void zip(File src, String charSetName, boolean includeSrc) throws IOException {
		zip( src, src.getParentFile(), charSetName, includeSrc);
	}
	/**
	 * compresses the given src file(or directory) and writes to the given output stream.
	 * @param src
	 * @param os
	 * @throws IOException
	 */
	public static void zip(File src, OutputStream os) throws IOException {
		zip(src, os, Charset.defaultCharset().name(), true);
	}
	/**
	 * compresses the given src file(or directory) and create the compressed file under the given destDir. 
	 * @param src
	 * @param destDir
	 * @param charSetName
	 * @param includeSrc
	 * @throws IOException
	 */
	public static void zip(File src, File destDir, String charSetName, boolean includeSrc) throws IOException {
		String fileName = src.getName();
		if ( !src.isDirectory() ){
			int pos = fileName.lastIndexOf(".");
			if ( pos >  0){
				fileName = fileName.substring(0, pos);
			}
		}
		fileName += ".zip";

		File zippedFile = new File ( destDir, fileName);
		if ( !zippedFile.exists() ) zippedFile.createNewFile();
		zip(src, new FileOutputStream(zippedFile), charSetName, includeSrc);
	}
	
	public static void zip(File src, OutputStream os, String charsetName, boolean includeSrc) throws IOException {
		ZipArchiveOutputStream zos = new ZipArchiveOutputStream(os);
		zos.setEncoding(charsetName);
		FileInputStream fis ;
		
		int length ;
		ZipArchiveEntry ze ;
		byte [] buf = new byte[8 * 1024];
		String name ;
		
		Stack<File> stack = new Stack<File>();
		File root ;
		if ( src.isDirectory() ) {
			if( includeSrc ){
				stack.push(src);
				root = src.getParentFile();
			}
			else {
				File [] fs = src.listFiles();
				for (int i = 0; i < fs.length; i++) {
					stack.push(fs[i]);
				}
				root = src;
			}
		} else {
			stack.push(src);
			root = src.getParentFile();
		}
		
		while ( !stack.isEmpty() ){
			File f = stack.pop();
			name = toPath(root, f);
			if ( f.isDirectory()){
				debug ("dir  : " + name);
				File [] fs = f.listFiles();
				for (int i = 0; i < fs.length; i++) {
					if ( fs[i].isDirectory() ) stack.push(fs[i]);
					else stack.add(0, fs[i]);
				}
			} else {
				debug("file : " + name);
				ze = new ZipArchiveEntry(name);
				zos.putArchiveEntry(ze);
				fis = new FileInputStream(f);
				while ( (length = fis.read(buf, 0, buf.length)) >= 0 ){
					zos.write(buf, 0, length);
				}
				fis.close();
				zos.closeArchiveEntry();
			}
		}
		zos.close();
	}
	
	private static String toPath(File root, File dir){
		String path = dir.getAbsolutePath();
		path = path.substring(root.getAbsolutePath().length()).replace(File.separatorChar, '/');
		if ( path.startsWith("/")) path = path.substring(1);
		if ( dir.isDirectory() && !path.endsWith("/")) path += "/" ;
		return path ;
	}
	
	public static void makeZip(ArrayList filePaths, String targetZipPath, boolean fileNotExistsErr) throws Exception {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ZipOutputStream zos = null;

		try {
			fos = new FileOutputStream(targetZipPath); 
			bos = new BufferedOutputStream(fos); 
			zos = new ZipOutputStream(bos); 
			//zos.setLevel(COMPRESSION_LEVEL); // 압축 레벨 - 최대 압축률은 9, 디폴트 8
			for (int i=0 ; i<filePaths.size(); i++) {
				addFileToZip(filePaths.get(i).toString(), zos, fileNotExistsErr); 
			}
			zos.finish(); // ZipOutputStream finish
		} finally {
			if (zos != null) { zos.close(); }
			if (bos != null) { bos.close(); }
			if (fos != null) { fos.close(); }
		}		
	}
	
	public static void makeZip(String[] filePaths, String targetZipPath, boolean fileNotExistsErr) throws Exception {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ZipOutputStream zos = null;

		try {
			fos = new FileOutputStream(targetZipPath); 
			bos = new BufferedOutputStream(fos); 
			zos = new ZipOutputStream(bos); 
			//zos.setLevel(COMPRESSION_LEVEL); // 압축 레벨 - 최대 압축률은 9, 디폴트 8
			for (int i=0 ; i<filePaths.length; i++) {
				addFileToZip(filePaths[i], zos, fileNotExistsErr); 
			}
			zos.finish(); // ZipOutputStream finish
		} finally {
			if (zos != null) { zos.close(); }
			if (bos != null) { bos.close(); }
			if (fos != null) { fos.close(); }
		}		
	}

	
	private static void addFileToZip(String filePath, ZipOutputStream zos, boolean fileNotExistsErr) throws Exception {
		File f = new File(filePath);
		if(f.isDirectory()) 
			throw new Exception(filePath + "가 폴더입니다.");
		
		if(!f.exists() && fileNotExistsErr) {                  // 파일이 없을 경우 예외 발생
			throw new Exception(filePath + "가 존재하지 않습니다.");
		} else if (!f.exists() && fileNotExistsErr == false) { // 파일이 없을 경우 그냥 리턴
			return;
		}
		
		BufferedInputStream bis = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(f));
			String zipEntryName = filePath.substring(f.getParentFile().getPath().length(), filePath.length());
			ZipEntry zentry = new ZipEntry(zipEntryName);
			zentry.setTime(f.lastModified());
			zos.putNextEntry(zentry);
			byte[] buffer = new byte[2048];
            int cnt = 0;
            while ((cnt = bis.read(buffer, 0, 2048)) != -1) {
                zos.write(buffer, 0, cnt);
            }
            zos.closeEntry();
		} catch(Exception ex) {
			throw ex;
		} finally {
            if (bis != null) { bis.close(); }
        }
	}

	
	private static void debug(String msg){
		if( debug ) System.out.println(msg);
	}
	
}
