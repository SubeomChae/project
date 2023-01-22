package egovframework.cbiz.crypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.cbiz.util.ThumbImage;

/**
 * 원본파일을 ECI 포맷으로 변환하거나 ECI 포맷의 파일에서 원본파일을 복원하는 클래스
 * 
 * @author 곽정산
 *  
 */
public class ECIUtil {

	private static Log log = LogFactory.getLog(ECIUtil.class);

	/** 원본파일을 암호화 안함 */
	public static final short _ECI_CRYPT_NO 	= 1; 	
	/** 원본파일을 AES 알고리즘으로 암호화 */
	public static final short _ECI_CRYPT_AES 	= 2;	 
	/** 원본파일을 SEED 알고리즘으로 암호화 */
	public static final short _ECI_CRYPT_SEED 	= 3;	 
	/** 원본파일을 DES 알고리즘으로 암호화 */
	public static final short _ECI_CRYPT_DES 	= 4;	 
	/** 원본파일을 DESede 알고리즘으로 암호화  */
	public static final short _ECI_CRYPT_DES3 	= 5;	 

	/** 원본파일 데이터 블럭 */
	public static final long _ECI_BLOCK_DATA = 0;
	/** 원본파일 미리보기 이미지 블럭 */
	public static final long _ECI_BLOCK_THUM = 1;
	/** 원본파일 텍스트정보 블럭 */
	public static final long _ECI_BLOCK_TEXT = 2;
	/** 원본파일 해쉬정보 블럭 */
	public static final long _ECI_BLOCK_HASH = 3;
	/** 원본파일 서명정보 블럭 */
	public static final long _ECI_BLOCK_SIGN = 4;

	/** 원본파일을 압축하지 않음 */
	public static final short _ECI_COMPRESS_NO 	= 1;
	/** 원본파일을 ZIP방식으로 압축함 */
	public static final short _ECI_COMPRESS_ZIP 	= 2;

	/** ECI 2.0 파일의 해더 */
	private static final String _ECI_HEADER = "ECI20";

	/** ECI 파일내의 블럭수  */
	private long lBlockCount;
	/** 원본파일의 암호화 방식 */
	private short iCryptOpt;
	/** 원본파일의 압축방식 */
	private short iCompressOpt;
	
	/** 파일 해쉬값 */
	private String fileHash = null;
	
	public String getFileHash() {
		return fileHash;
	}

	/**
	 * ECI 파일스트림에서 부터 문자열을 읽어오는 함수
	 * 
	 * @param fis	데이터를 읽어올 입력스트림
	 * @param len	읽어올 문자열 길이 
	 * @return		읽어진 byte[len] 값을 String 으로 변환하여 반환한다.
	 * @throws IOException	
	 */
	private String readString(FileInputStream fis, int len) throws IOException {
		byte buffer[] = new byte[len];
		fis.read(buffer);
		return new String(buffer);
	}

	/**
	 * ECI 파일스트림에서 long 타입의 데이터를 읽어오는 함수
	 * 
	 * @param fis	데이터를 읽어올 입력스트림
	 * @return		읽어진 byte[4] 값을 long 으로 변환하여 반환한다. 
	 * @throws IOException
	 */
	private long readLong(FileInputStream fis) throws IOException {
		long i = 0;
		byte buffer[] = new byte[4];
		fis.read(buffer);

		for (int j = buffer.length - 1; j > -1; j--) {
			i += (buffer[j] & 0xFF) << (j * 8);
		}
		return i;
	}
	
	/**
	 * Long 타입의 데이터로 쓰는 방식
	 * @param fos 데이터를 쓸 스트림
	 * @param i 
	 * @throws IOException
	 */
	private void writeLong(RandomAccessFile raf, long i) throws IOException{
				
		byte buffer[] = new byte[4];

		for (int j = 0; j < buffer.length; j++) {
			buffer[j] =  (byte)((i >> (j * 8)) & 0xFF);
		}
			
		raf.write(buffer);
	}

	/**
	 * ECI 파일스트림에서 암호화 방식 또는 압축방식 정보를 읽어오는 함수
	 * 
	 * @param fis	데이터를 읽어올 입력스트림
	 * @return		읽어진 byte[2] 값을 short 으로 변환하여 반환한다.
	 * @throws IOException
	 */
	private short readOption(FileInputStream fis) throws IOException {
		short i = 0;
		byte buffer[] = new byte[2];
		fis.read(buffer);
		i = Short.parseShort(new String(buffer));
		return i;
	}

	/**
	 * ECI 파일 스트림에서 모든 해더정보를 읽어오는 함수
	 * 파일의 해더 정보가 일치하는 검사하고, 
	 * 해더정보로 부터 암호화 방식, 압축방식, 블럭개수 정보를 불러온다. 
	 * 
	 * @param fis	데이터를 읽어올 입력스트림
	 * @return	모든 해더정보를 정상적으로 읽은경우 true, 
	 * 			예외상황이 발생한경우 false 값을 반환한다.
	 */
	private boolean readHeader(FileInputStream fis) {
		boolean bRetVal = false;
		String header = "";
		try {
			header = readString(fis, 5); // ECI 버전정보를 읽어와서 확인한다.

			if (!_ECI_HEADER.equals(header)) {
				log.error("ECI 버전정보가 일치하지 않습니다.");
				return bRetVal;
			}

			iCompressOpt = readOption(fis); // 압축방식을 읽어온다.
			iCryptOpt = readOption(fis); 	// 암호화 방식을 읽어온다.
			lBlockCount = readLong(fis); 	// ECI 파일내 전체 블럭의 갯수를 읽어온다.

			bRetVal = true;
		} catch (IOException ioe) {
			log.error("ECI 해더정보를 읽어 오는 과정에서 오류가 발생하였습니다.", ioe);
			return bRetVal;
		}
		
		return bRetVal;
	}
	
	/**
	 * 기본 헤더정보 쓰기(ECI 버전정보, 암호화방식, 압축여부)
	 * @param fos 기록할 파일
	 * @param encType 암호화 방식
	 * @param compType 압축여부
	 * @throws IOException
	 */
	private void writeHeader(RandomAccessFile raf, short encType, short compType) throws IOException{
		
		DecimalFormat dmf = new DecimalFormat("00");
		
		if(encType == _ECI_CRYPT_SEED){
			encType = _ECI_CRYPT_NO;
		}
		
		raf.write(_ECI_HEADER.getBytes());
		raf.write(dmf.format(compType).getBytes());
		raf.write(dmf.format(encType).getBytes());
	}

	/**
	 * ECI 파일 스트림에서 특정블럭의 내용을 파일로 저장하는 함수
	 * @param fis	데이터를 읽어올 입력스트림
	 * @param blockType	저장하고자 하는 데이터 타입 
	 *    _ECI_BLOCK_DATA, _ECI_BLOCK_THUM, _ECI_BLOCK_TEXT, _ECI_BLOCK_HASH, _ECI_BLOCK_SIGN 
	 * @param saveFile	데이터를 저장할 파일
	 * @return	정상적으로 처리되는 경우 true, 예외상황이 발생하면 false
	 */
	private boolean saveBlockData(FileInputStream fis, long blockType, File saveFile) {
		boolean bRetVal = false;
		long lCount = 0;
		long lBlockType = 0;
		long lBlockLength = 0;

		FileOutputStream fos = null;
		
		
		try {
			fos = new FileOutputStream(saveFile);
			
			while (lCount < lBlockCount) {
				lBlockType = readLong(fis);
				lBlockLength = readLong(fis);
				
				if (lBlockType == blockType) {
					FileChannel inChan = fis.getChannel();
					FileChannel outChan = fos.getChannel();
					
					// 리눅스 에서 오류 발생 하여 transferTo > transferFrom 변경.
					//inChan.transferTo(inChan.position(), lBlockLength, outChan);
					outChan.transferFrom(inChan, 0, lBlockLength);
					bRetVal = true;
				} else {
					fis.skip(lBlockLength);
				}
				lCount++;
			}
		} catch (IOException ioe) {
			log.error("블럭정보를 저장하는  과정에서 오류가 발생하였습니다.", ioe);
			return bRetVal;
		} finally {
			try {
				if (fos != null) fos.close();
			} catch (IOException ioe) {	}
		}	

		return bRetVal;
	}

	/**
	 * 파일의 정보를 추출하는 함수
	 * @param srcFile 암호화할 파일
	 * @return
	 */
	private byte[] infoFile(File srcFile){
		
		Date date = new Date(srcFile.lastModified());
		SimpleDateFormat smd = new SimpleDateFormat("yyyy-MM-dd");
		long fileSize = srcFile.length();
		String fileName = srcFile.getName();
		
		String infoFile = "";
		
		infoFile = "<xml>" +
				"<fileinfo>" +
				"<item name='file name' value='"+fileName+"'/>" +
				"<item name='file size' value='"+fileSize+"Byte'/>" +
				"<item name='create date' value='"+smd.format(date)+"'/>" +
				"<item name='modify date' value='"+smd.format(date)+"'/>" +
				"<item name='file title' value=''/>" +
				"<item name='file subject' value=''/>" +
				"</fileinfo>" +
				"</xml>";
		
		return infoFile.getBytes();
	}
	
	/**
	 * ECI 파일에서 원본파일을 추출하는 함수
	 * 
	 * @param srcFilePath	원본파일을 추출할 ECI 파일경로 
	 * @param desFilePath	추출된 원본파일을 저장할 경로
	 * @see #decrypt(File srcFile, File desFile)
	 * @return 정상적으로 처리되는 경우 true, 예외상황이 발생하면 false
	 */
	public boolean decrypt(String srcFilePath, String desFilePath) {
		return decrypt(new File(srcFilePath), new File(desFilePath));
	}
	public boolean decryptOnlyEnc(String srcFilePath, String desFilePath) {
		return decryptOnlyEnc(new File(srcFilePath), new File(desFilePath));
	}

	/**
	 * ECI 파일에서 원본파일을 추출하는 함수
	 * 
	 * @param srcFile	원본파일을 추출할 ECI 파일
	 * @param desFile	추출된 원본파일을 저장할 파일
	 * @see #decrypt(String srcFilePath, String desFilePath)
	 * @return 정상적으로 처리되는 경우 true, 예외상황이 발생하면 false
	 */
	public boolean decrypt(File srcFile, File desFile) {
		
		boolean bRetVal = false;		
		FileInputStream fis = null;
		File tmpFile1 = null;
		File tmpFile2 = null;
		
		
		try {
			fis = new FileInputStream(srcFile);
	
			// 해더정보를 읽어온다. 
			if (!readHeader(fis))
			{
				log.error("ECI 해더정보를 읽지 못했습니다.");
				return false;
			}
			
			// 암호화 되어있지 않는경우
			if (iCryptOpt == _ECI_CRYPT_NO) {
				
				// 압축이 되어있지 않는경우
				if (iCompressOpt == _ECI_COMPRESS_NO) {
					bRetVal = saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, desFile);
					
				// 압축이 되어 있는 경우 	
				} else {
				
					// 임시파일을 생성하여 압축된 원본파일을 저장한다.
					tmpFile1 = File.createTempFile("ECI_DATA_ZIP_", ".TMP");
					bRetVal = saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, tmpFile1);
					
					// 임시파일의 압축을 해제한다. 
					bRetVal = unZip(tmpFile1, desFile);							
				}
			} else { // 암호화 되어있는 경우 
					
				// 임시파일을 생성하여 암호화된 원본파일을  저장한다. 
				tmpFile1 = File.createTempFile("ECI_DATA_ENC_", ".TMP");
				bRetVal = saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, tmpFile1);	
					
				// 압축이 되어있지 않는경우 암호화 방식에 따라 복호화 한다. 
				if (iCompressOpt == _ECI_COMPRESS_NO) {					
					
					switch(iCryptOpt)
					{
						case _ECI_CRYPT_AES:	AES.decrypt(tmpFile1, desFile); 	
							break;	
						case _ECI_CRYPT_SEED:	SEED.decrypt(tmpFile1, desFile);
							break;
						case _ECI_CRYPT_DES:	DES.decrypt(tmpFile1, desFile); 
							break;								
						case _ECI_CRYPT_DES3:	DES3.decrypt(tmpFile1, desFile); 
							break;								
					}
					
				// 압축이 되어 있는 경우 	복화화 한다음 압축을 해제 한다. 
				} else {
					
					tmpFile2 = File.createTempFile("ECI_DATA_ZIP_", ".TMP");
					
					// 복호화 
					switch(iCryptOpt)
					{
						case _ECI_CRYPT_AES:	AES.decrypt(tmpFile1, tmpFile2); 
							break;				
						case _ECI_CRYPT_SEED:	SEED.decrypt(tmpFile1, tmpFile2);
							break;
						case _ECI_CRYPT_DES:	DES.decrypt(tmpFile1, tmpFile2); 
							break;								
						case _ECI_CRYPT_DES3:	DES3.decrypt(tmpFile1, tmpFile2); 
							break;								
					}	
					
					// 압축해제 
					bRetVal = unZip(tmpFile2, desFile);	
				}					
			}
		} catch (CryptoException ce) {
			log.error("파일을 복호하는 과정에서 오류가 발생했습니다.", ce);
			bRetVal = false;
		} catch (IOException ioe) {
			log.error("파일을 추출하는 과정에서 오류가 발생했습니다.", ioe);
			bRetVal = false;
		} finally {
			try {
				if (tmpFile1 != null) tmpFile1.delete();
				if (tmpFile2 != null) tmpFile2.delete();
				if (fis != null) fis.close();
			} catch (IOException ioe) {	}
		}
		return bRetVal;
	}
	

	public boolean decryptOnlyEnc(File srcFile, File desFile) {
		
		boolean bRetVal = false;		
		FileInputStream fis = null;
		File tmpFile1 = null;
		File tmpFile2 = null;
		
		
		try {
			fis = new FileInputStream(srcFile);
	
			// 해더정보를 읽어온다. 
			if (!readHeader(fis))
			{
				log.error("ECI 해더정보를 읽지 못했습니다.");
				return false;
			}
			
			// 암호화 되어있지 않는경우
			if (iCryptOpt == _ECI_CRYPT_NO) {
				
				// 압축이 되어있지 않는경우
				if (iCompressOpt == _ECI_COMPRESS_NO) {
					bRetVal =  false; //saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, desFile);
					
				// 압축이 되어 있는 경우 	
				} else {
				
					// 임시파일을 생성하여 압축된 원본파일을 저장한다.
					tmpFile1 = File.createTempFile("ECI_DATA_ZIP_", ".TMP");
					bRetVal = saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, tmpFile1);
					
					// 임시파일의 압축을 해제한다. 
					bRetVal = unZip(tmpFile1, desFile);							
				}
			} else { // 암호화 되어있는 경우 
					
				// 임시파일을 생성하여 암호화된 원본파일을  저장한다. 
				tmpFile1 = File.createTempFile("ECI_DATA_ENC_", ".TMP");
				bRetVal = saveBlockData(fis, ECIUtil._ECI_BLOCK_DATA, tmpFile1);	
					
				// 압축이 되어있지 않는경우 암호화 방식에 따라 복호화 한다. 
				if (iCompressOpt == _ECI_COMPRESS_NO) {					
					
					switch(iCryptOpt)
					{
						case _ECI_CRYPT_AES:	AES.decrypt(tmpFile1, desFile); 	
							break;	
						case _ECI_CRYPT_SEED:	SEED.decrypt(tmpFile1, desFile);
							break;
						case _ECI_CRYPT_DES:	DES.decrypt(tmpFile1, desFile); 
							break;								
						case _ECI_CRYPT_DES3:	DES3.decrypt(tmpFile1, desFile); 
							break;								
					}
					
				// 압축이 되어 있는 경우 	복화화 한다음 압축을 해제 한다. 
				} else {
					
					tmpFile2 = File.createTempFile("ECI_DATA_ZIP_", ".TMP");
					
					// 복호화 
					switch(iCryptOpt)
					{
						case _ECI_CRYPT_AES:	AES.decrypt(tmpFile1, tmpFile2); 
							break;				
						case _ECI_CRYPT_SEED:	SEED.decrypt(tmpFile1, tmpFile2);
							break;
						case _ECI_CRYPT_DES:	DES.decrypt(tmpFile1, tmpFile2); 
							break;								
						case _ECI_CRYPT_DES3:	DES3.decrypt(tmpFile1, tmpFile2); 
							break;								
					}	
					
					// 압축해제 
					bRetVal = unZip(tmpFile2, desFile);	
				}					
			}
		} catch (CryptoException ce) {
			log.error("파일을 복호하는 과정에서 오류가 발생했습니다.", ce);
			bRetVal = false;
		} catch (IOException ioe) {
			log.error("파일을 추출하는 과정에서 오류가 발생했습니다.", ioe);
			bRetVal = false;
		} finally {
			try {
				if (tmpFile1 != null) tmpFile1.delete();
				if (tmpFile2 != null) tmpFile2.delete();
				if (fis != null) fis.close();
			} catch (IOException ioe) {	}
		}
		return bRetVal;
	}
	
	/**
	 * 파일을 암호화 하는 함수
	 * @param srcFilePath 암호화할 파일 풀패스
	 * @param encFilePath 암호화 완료파일 풀패스
	 * @param encType 암호화 구분
	 * @param compType 압축 구분
	 * @return
	 */
	public File encrypt(String srcFilePath, String encFilePath, short encType, short compType){
		return encrypt(new File(srcFilePath), new File(encFilePath), encType, compType);
	}
	
	/**
	 * 파일을 암호화 하는 함수
	 * @param srcFile 암호화할 파일
	 * @param encFile 암호화 완료 파일
	 * @param encType 암호화 구분
	 * @param compType 압축 구분
	 * @return
	 */
	public File encrypt(File srcFile, File encFile, short encType, short compType){
		
		byte[] bThumb = null;
		long pos = 0;
		lBlockCount = 0L;		
		
		ThumbImage thumb = new ThumbImage();
		FileInputStream fis = null;
		RandomAccessFile raf = null;
		File tmpFile1 = null;
		File tmpFile2 = null;
		
		try{
			
			String fnm = new String(srcFile.getName());
			String ext = fnm.substring(fnm.lastIndexOf(".")+1, fnm.length());
			
			raf = new RandomAccessFile(encFile, "rw");
			byte[] fileInfo = infoFile(srcFile);
			
			writeHeader(raf, encType, compType);
			/* 위치정보 포인터 */
			pos = raf.getFilePointer();
			/* 블럭갯수 기록 */
			writeLong(raf, lBlockCount);
			
			if(ext.equalsIgnoreCase("tif") || ext.equalsIgnoreCase("bmp") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg")
					|| ext.equalsIgnoreCase("pic") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("psd")
					|| ext.equalsIgnoreCase("ras") || ext.equalsIgnoreCase("tga") || ext.equalsIgnoreCase("cur")
					|| ext.equalsIgnoreCase("xpm") || ext.equalsIgnoreCase("xbm") || ext.equalsIgnoreCase("ico")
					|| ext.equalsIgnoreCase("pcx") || ext.equalsIgnoreCase("tiff")){
				
				try{
					bThumb = thumb.getTumbFromImage(srcFile);
						
				}catch(ECIException ee){
					log.error(ee.getMessage());
				}
				
			}else if(ext.equalsIgnoreCase("dwg")){
				
				try{
					bThumb = thumb.getTumbFromDWG(srcFile);
					
				}catch(ECIException ee){
					log.error(ee.getMessage());
				}
				
			}
			
			if(compType == _ECI_COMPRESS_ZIP){
				
				/* 파일을 압축후 암호화 */
				tmpFile1 = File.createTempFile("COMP_DATA_", ".TMP");
				tmpFile2 = File.createTempFile("ECI_DATA_", ".TMP");
				srcFile = gZip(srcFile, tmpFile1);
							
				/* 암호화 방식 선택 */
				switch(encType){
					case _ECI_CRYPT_AES:		
						AES.encrypt(tmpFile1, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_DES:		
						DES.encrypt(tmpFile1, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_DES3:		
						DES3.encrypt(tmpFile1, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_NO:
						break;
				}
				
			}else{  // 파일을 압축하지 않는경우
				
				tmpFile2 = File.createTempFile("ECI_DATA_", ".TMP");
				
				/* 암호화 방식 선택 */
				switch(encType){
					case _ECI_CRYPT_AES:		
						AES.encrypt(srcFile, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_DES:		
						DES.encrypt(srcFile, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_DES3:		
						DES3.encrypt(srcFile, tmpFile2);
						srcFile = tmpFile2;
						break;
					case _ECI_CRYPT_NO:
						break;
				}
			}
			
			fileHash = FileHash.makeFileHash(srcFile);
			
			/* 파일해쉬 정보기록 */
			if(fileHash != null){
				
				byte[] hash = fileHash.getBytes();
							
				writeLong(raf, _ECI_BLOCK_HASH);
				writeLong(raf, hash.length+1);
				raf.write(hash);
				raf.writeByte(0x00); // 끝에 00 추가
				lBlockCount++;
			}
			/* 파일정보 기록 */
			writeLong(raf, _ECI_BLOCK_TEXT);
			writeLong(raf, fileInfo.length+1);
			raf.write(fileInfo);
			raf.writeByte(0x00); // 끝에 00 추가
			lBlockCount++;
			
			/* 썸네일 정보 기록 */
			if(bThumb != null){
				writeLong(raf, _ECI_BLOCK_THUM);
				writeLong(raf, bThumb.length);
				raf.write(bThumb);
				lBlockCount++;	
			}
			
			/* 파일 데이터 기록 */
			writeLong(raf, _ECI_BLOCK_DATA);
			writeLong(raf, srcFile.length());
			
			byte[] buffer = new byte[8192];
			int length;
			
			fis = new FileInputStream(srcFile);
			
			while((length=fis.read(buffer)) > 0){
				raf.write(buffer, 0, length);	
			}
			
			lBlockCount++;
			/* 포인터 저장된 블럭갯수기록 영역으로 이동 */
			raf.seek(pos);
			/* 최종 블럭갯수 기록 */
			writeLong(raf, lBlockCount);
			
		}catch(IOException ie){
			log.error("파일에 이상이 있습니다.", ie);
		}catch(CryptoException ce){
			log.error("파일을 암호화중 에러가 발생 했습니다.", ce);
		}finally{
			try{
				if(fis != null) fis.close();
				if(raf != null) raf.close();
				if(tmpFile1 != null) tmpFile1.delete();
				if(tmpFile2 != null) tmpFile2.delete();
			}catch(IOException ie){}
		}
		
		return encFile;
	}
	
	/**
	 * GZIP 방식으로 압축된 파일의 압축을 해제하는 함수
	 * 
	 * @param srcFile GZIP 압축된 파일
	 * @param desFile 앞축해제후 생성될 파일 
	 * @return 정상적으로 처리되는 경우 true, 예외상황이 발생하면 false
	 */
	private boolean unZip(File srcFile, File desFile) {
		
		boolean bRetVal = false;
		GZIPInputStream gzis = null;
		FileInputStream fis = null; 
		FileOutputStream fos = null;
		try {
			fis = new FileInputStream(srcFile);
			fos = new FileOutputStream(desFile);
			gzis = new GZIPInputStream(fis);
			
            byte[] buffer=new byte[8192];
            int length=0;
            while ((length=gzis.read(buffer))!=-1)
            	fos.write(buffer,0,length);
            
            fos.flush();
            bRetVal = true;
		} catch (IOException ioe) {
			log.error("ZIP 압축을 푸는 과정에서 오류가 발생하였습니다.", ioe);
			return bRetVal;
		} finally {
			try {
				if (gzis != null) gzis.close();				
				if (fis != null) fis.close();
				if (fos != null) fos.close();
			} catch (IOException ioe) {	}
		}

		return bRetVal;
	}
	
	/**
	 * GZip 방식으로 압축하는 함수
	 * @param srcFile 압축할 파일
	 * @param desFile 압축된 파일
	 * @return
	 */
	public File gZip(File srcFile, File desFile){
		
		GZIPOutputStream gzos = null;
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try{
			
			fis = new FileInputStream(srcFile);
			fos = new FileOutputStream(desFile);
			gzos = new GZIPOutputStream(fos);
			
			byte[] buffer = new byte[8192];
			int length = 0;
			
			while((length=fis.read(buffer)) != -1){
				gzos.write(buffer, 0, length);
			}
			
			gzos.flush();
			gzos.finish();
			
		}catch(IOException ie){
			log.error("파일을 압축하는 과정에서 에러가 발생 하였습니다.", ie);
		}finally{
			try{
				if(fis != null) fis.close();
				if(gzos != null) gzos.close();
				if(fos != null) fos.close();
			}catch(IOException ie){}
		}
		
		return desFile;
	}
	
	public static void main(String[] args) {
		ECIUtil eutil = new ECIUtil();
//		boolean rtn = eutil.decryptOnlyEnc("/Users/higreenday/Downloads/준공-2008-00850/DOCCD01/공사시방서/0001.tif", "/Users/higreenday/Downloads/준공-2008-00850/DOCCD01/공사시방서/0001.tif_xx");
//		System.out.println("rtn:" + rtn);
//		rtn = eutil.decryptOnlyEnc("/Users/higreenday/Downloads/준공-2008-00850/DOCCD01/공사시방서/0001.tifenc", "/Users/higreenday/Downloads/준공-2008-00850/DOCCD01/공사시방서/0001_xx.tif");
//		System.out.println("rtn:" + rtn);
		List<File> files = listf("/Users/higreenday/Downloads/준공-2016-0383/DOCCD01");
		for(int i=0; i < files.size(); i++) {
			if (files.get(i).isFile()) {
				System.out.println(files.get(i).getAbsolutePath());
				String origPath = files.get(i).getAbsolutePath();
				boolean rtn = eutil.decrypt(origPath, origPath + "dec");
				if (rtn) {
					files.get(i).renameTo(new File(origPath + "enc"));
					(new File(origPath + "dec")).renameTo(new File(origPath));
				}
			}
		}
		
		
		
		
		//short encType = 2;
		//short cmpType = 2;
		//eutil.encrypt("e:/SAH0120100601084742952_dec.xls", "e:/SAH0120100601084742952_enc",encType,cmpType);
	}	
	
	public static List<File> listf(String directoryName) {
        File directory = new File(directoryName);

        List<File> resultList = new ArrayList<File>();

        // get all the files from a directory
        File[] fList = directory.listFiles();
        resultList.addAll(Arrays.asList(fList));
        for (File file : fList) {
            if (file.isFile()) {
                System.out.println(file.getAbsolutePath());
            } else if (file.isDirectory()) {
                resultList.addAll(listf(file.getAbsolutePath()));
            }
        }
        //System.out.println(fList);
        return resultList;
    } 
}
