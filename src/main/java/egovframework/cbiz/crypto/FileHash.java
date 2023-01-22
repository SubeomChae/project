package egovframework.cbiz.crypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 파일내용에 대한 해쉬(HASH) 값을 생성하는 클래스
 * @author 곽정산
 *
 */
public class FileHash {

	/**
	 * 파일내용에 대한 해쉬(HASH) 값을 생성하는 함수
	 * @param file 해쉬(HASH) 값을 생성할 파일
	 * @return 해쉬값을 생성하는 과정에서 오류가 발생하면 null 값이 반환됨
	 */
	public static String makeFileHash(File file)
	{
		MessageDigest md = null;
		FileInputStream fis = null;
		String retVal = null;
		
		/* SHA-256 알고리즘을 이용하여 해쉬 값을 생성한다.*/
		try {
			md  = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException nsae) {
			/* SHA-256 알고리즘이 지원되지 않는 경우 SHA-1 알고리즘 사용함.*/
			try {
				md = MessageDigest.getInstance("SHA-1");
			} catch (NoSuchAlgorithmException nsae1) {
				return retVal;
			}
		}
		
		try 
		{
            fis = new FileInputStream(file); 
            
            byte[] buffer = new byte[8192]; 
             
            int length; 
             
            while((length = fis.read(buffer)) != -1) 
            { 
                md.update(buffer,0,length); 
            } 
            
            byte[] raw = md.digest(); 
            
            retVal = byteArrayToHex(raw);            

		} catch (IOException e) {
			return null;
		} finally {
			try {
				if (fis != null) fis.close();
			} catch (IOException ioe) {	}
		}		
		
		return retVal;
	}

	/**
	 * 16진수 문자열을 Byte Array 로 변경하는 함수 
	 * @param hex Byte Array 로 변경할 문자열
	 * @return 변환된 Byte Array
	 */
	public static byte[] hexToByteArray(String hex) { 
		
	    if (hex == null || hex.length() == 0) { 
	        return null; 
	    }
	    
	    byte[] ba = new byte[hex.length() / 2]; 
	    for (int i = 0; i < ba.length; i++) { 
	        ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16); 
	    } 
	    return ba; 
	}


	/**
	 * Byte Array 를 16진수 문자열로 변경하는 함수 
	 * @param ba 16진수 문자열로 변환할 Byte Array
	 * @return 변환된 16진수 문자열
	 */
	public static String byteArrayToHex(byte[] ba) { 
		
	    if (ba == null || ba.length == 0) { 
	        return null; 
	    }
	    
	    StringBuffer sb = new StringBuffer(ba.length * 2); 
	    String hexNumber; 
	    for (int x = 0; x < ba.length; x++) { 
	        hexNumber = "0" + Integer.toHexString(0xff & ba[x]);

	        sb.append(hexNumber.substring(hexNumber.length() - 2)); 
	    } 
	    return sb.toString(); 
	}
}
