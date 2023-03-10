package egovframework.cbiz.crypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


/**
 * AES 방식으로 파일을 암호화/복호화하는 하는 클래스 
 * 
 * @author 곽정산
 *
 */
public class AES {	
	
	/**	CBC 모드 암호화를 위한 initialization vector (IV) */
	private static IvParameterSpec ivSpec = null;
	
	/** 암호화를 위한 비밀키 값 */
    private static Key secretKey =  null;	
 	
    static {
    	
	  byte AES_Key[] = {(byte)0x4A, (byte)0x82, (byte)0x1B, (byte)0xD8, (byte)0x59, (byte)0xCC, (byte)0x31, (byte)0x77, 
			  			(byte)0x9B, (byte)0xEA, (byte)0x2F, (byte)0xA3, (byte)0xFF, (byte)0x61, (byte)0x30, (byte)0xA9};
	  byte AES_IV[] =  {(byte)0x3F, (byte)0x41, (byte)0x8A, (byte)0x55, (byte)0x12, (byte)0x20, (byte)0x04, (byte)0xCE, 
			  			(byte)0xB1, (byte)0x3D, (byte)0x82, (byte)0x44, (byte)0xE2, (byte)0x06, (byte)0x64, (byte)0xD0};
	
	  secretKey = new SecretKeySpec(AES_Key, "AES");
	  ivSpec = new IvParameterSpec(AES_IV);
	}
		
    
    /**
     * AES 방식으로 파일을 암호화 하는 함수 
     * 
     * @param srcFilePath	암호화할 원본파일경로 
     * @param desFilePath	암호화된 내용을 저장할 파일경로 
     * @throws CryptoException 암호화 과정에서 오류가 발생하는 경우
     */
    public static void encrypt(String srcFilePath, String desFilePath)
    throws CryptoException
    {
    	encrypt(new File(srcFilePath), new File(desFilePath));	
    }
    
    /**
     * AES 방식으로 파일을 암호화 하는 함수
     * 
     * @param srcFile	암호화할 원본파일
     * @param desFile 	암호화된 내용을 저장할 파일
     * @throws CryptoException 암호화 과정에서 오류가 발생하는 경우
     */
    public static void encrypt(File srcFile, File desFile)
    throws CryptoException
    {
    	Cipher cipher = null;
		
		try{
			cipher=Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivSpec);
		}
        catch(NoSuchAlgorithmException nsae) {
        	throw new CryptoException (nsae.getMessage());
        }
        catch (NoSuchPaddingException nspe) {
        	throw new CryptoException (nspe.getMessage());
        }
        catch (InvalidKeyException ike){
        	throw new CryptoException (ike.getMessage());
        }
        catch (InvalidAlgorithmParameterException iape) {
        	throw new CryptoException (iape.getMessage());
        }		
     
        FileInputStream fInput=null;
        FileOutputStream fOutput = null;
    	CipherOutputStream cStr = null;
    	
	    try {    

	    	
	    	// 원본 파일을 입력 스트림으로 지정한다.
            fInput = new FileInputStream(srcFile);
            // 암호화된 내용을  저장할 파일 출력 스트림 지정 
            fOutput = new FileOutputStream(desFile);
            // 암호화 출력 스트림에 출력 스트림을 지정한다. 
            cStr = new CipherOutputStream(fOutput, cipher);

            // 입력 스트림으로 부터 데이터를 읽어서 암호화 출력 스트림으로 보낸다.  
            // 암호화 출력 스트림으로 기록하는 과정에서 암호화 된다.
            byte[] buffer = new byte[8192];
            int length=0;
            while ((length=fInput.read(buffer))!= -1)
                cStr.write(buffer, 0, length);
            
            // 암호화 처리후 PADDING 데이터를 기록한다.
            byte[] padding = null;
            padding = cipher.doFinal();
            fOutput.write(padding);

        }
        catch (FileNotFoundException fnfe) {
        	throw new CryptoException (fnfe.getMessage());
        }
        catch (IOException ioe) {
        	throw new CryptoException (ioe.getMessage());
    	}
        catch (IllegalBlockSizeException e) {
    		throw new CryptoException (e.getMessage());
    	}
        catch (BadPaddingException e) {
    		throw new CryptoException (e.getMessage());
        }  
      
        finally {
			try {
				if (fInput != null) fInput.close();
				if (fOutput != null) fOutput.close();
				if (cStr != null) cStr.close();
			} catch (IOException ioe) {	}        	
        }
    }
    
	/**
	 * AES 방식으로 파일을 복호화 하는 함수
	 * 
	 * @param srcFilePath 암호화된 원본파일경로
	 * @param desFilePath 복호화된 내용을 저장할 파일경로
	 * @throws CryptoException 복호화 과정에서 오류가 발생하는 경우
	 */
	public static void decrypt(String srcFilePath, String desFilePath) 
	throws CryptoException
	{
		decrypt(new File(srcFilePath), new File(desFilePath));		
	}
	
	/**
	 * AES 방식으로 파일을 복호화 하는 함수
	 * 
	 * @param srcFile	암호화된 원본파일
	 * @param desFile	복호화된 내용을 저장할 파일
	 * @throws CryptoException 복호화 과정에서 오류가 발생하는 경우
	 */
	public static void decrypt(File srcFile, File desFile) 
	throws CryptoException
	{
		Cipher cipher = null;
		
		try{
			cipher=Cipher.getInstance("AES/CBC/PKCS5Padding");							
			cipher.init(Cipher.DECRYPT_MODE, secretKey, ivSpec);
		}
        catch(NoSuchAlgorithmException nsae) {
        	throw new CryptoException (nsae.getMessage());
        }
        catch (NoSuchPaddingException nspe) {
        	throw new CryptoException (nspe.getMessage());
        }
        catch (InvalidKeyException ike){
        	throw new CryptoException (ike.getMessage());
        }
        catch (InvalidAlgorithmParameterException iape) {
        	throw new CryptoException (iape.getMessage());
        }		
     
        FileInputStream fInput=null;
        FileOutputStream fOutput = null;	       
        CipherInputStream ciStr=null;
        
	    try {    
        
	        // 암호된 파일을 열어서 입력 스트림으로 지정한다. 
	        fInput = new FileInputStream(srcFile);
	        // 암호화 입력 스트림에  입력 스트림을 지정한다. 
	        ciStr = new CipherInputStream(fInput,cipher);
	        // 복호화된 내용을 저장할 파일 출력 스트림 지정 
	        fOutput = new FileOutputStream(desFile);
	
	        // 암호화 입력 스트림으로 부터 데이터를 읽어서  출력 스트림으로 보낸다.
	        // 암호화 입력 스트림에서 데이터를 읽는 과정에서 복호화 된다. 
	        byte[] buffer=new byte[8192];
	        int length=0;
	        while ((length=ciStr.read(buffer))!=-1)
	            fOutput.write(buffer,0,length);	
        }
        catch (FileNotFoundException fnfe) {
        	throw new CryptoException (fnfe.getMessage());
        }
        catch (IOException ioe) {
        	throw new CryptoException (ioe.getMessage());
        }  
        finally {
			try {
				if (fInput != null) fInput.close();
				if (fOutput != null) fOutput.close();
				if (ciStr != null) ciStr.close();
			} catch (IOException ioe) {	}        	
        }        
	}
}
