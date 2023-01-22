package egovframework.cbiz.crypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * ���ϳ��뿡 ���� �ؽ�(HASH) ���� �����ϴ� Ŭ����
 * @author ������
 *
 */
public class FileHash {

	/**
	 * ���ϳ��뿡 ���� �ؽ�(HASH) ���� �����ϴ� �Լ�
	 * @param file �ؽ�(HASH) ���� ������ ����
	 * @return �ؽ����� �����ϴ� �������� ������ �߻��ϸ� null ���� ��ȯ��
	 */
	public static String makeFileHash(File file)
	{
		MessageDigest md = null;
		FileInputStream fis = null;
		String retVal = null;
		
		/* SHA-256 �˰����� �̿��Ͽ� �ؽ� ���� �����Ѵ�.*/
		try {
			md  = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException nsae) {
			/* SHA-256 �˰����� �������� �ʴ� ��� SHA-1 �˰��� �����.*/
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
	 * 16���� ���ڿ��� Byte Array �� �����ϴ� �Լ� 
	 * @param hex Byte Array �� ������ ���ڿ�
	 * @return ��ȯ�� Byte Array
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
	 * Byte Array �� 16���� ���ڿ��� �����ϴ� �Լ� 
	 * @param ba 16���� ���ڿ��� ��ȯ�� Byte Array
	 * @return ��ȯ�� 16���� ���ڿ�
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
