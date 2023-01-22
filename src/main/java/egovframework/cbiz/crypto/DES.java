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
 * DES ������� ������ ��ȣȭ/��ȣȭ�ϴ� �ϴ� Ŭ���� 
 * 
 * @author ������
 *
 */
public class DES {

	/**	CBC ��� ��ȣȭ�� ���� initialization vector (IV) */
	private static IvParameterSpec ivSpec = null;
	
	/** ��ȣȭ�� ���� ���Ű �� */
    private static Key secretKey =  null;
	
	static {
	
	  byte DES_Key[] = {(byte)0x07, (byte)0x0D, (byte)0x0A, (byte)0x01, (byte)0x05, (byte)0x02, (byte)0x0A, (byte)0x0B};
	  byte DES_IV[] =  {(byte)0x0F, (byte)0x01, (byte)0x0A, (byte)0x05, (byte)0x02, (byte)0x00, (byte)0x0A, (byte)0x0D};
	
	  secretKey = new SecretKeySpec(DES_Key, "DES");
	  ivSpec = new IvParameterSpec(DES_IV);
	}
	
	/**
	 * DES ������� ������ ��ȣȭ �ϴ� �Լ�
	 * 
	 * @param srcFilePath	��ȣȭ�� �������ϰ�� 
     * @param desFilePath	��ȣȭ�� ������ ������ ���ϰ�� 
     * @throws CryptoException ��ȣȭ �������� ������ �߻��ϴ� ���
	 */
	public static void encrypt(String srcFilePath, String desFilePath) 
	throws CryptoException
	{
		encrypt(new File(srcFilePath), new File(desFilePath));		
	}	
    
    /**
     * DES ������� ������ ��ȣȭ �ϴ� �Լ�
     * 
     * @param srcFile	��ȣȭ�� ��������
     * @param desFile 	��ȣȭ�� ������ ������ ����
     * @throws CryptoException ��ȣȭ �������� ������ �߻��ϴ� ���
     */
	public static void encrypt(File srcFile, File desFile) 
	throws CryptoException
	{
		
		Cipher cipher = null;
		
		try{
			cipher=Cipher.getInstance("DES/CBC/PKCS5Padding");
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
   	
	    	// ���� ������ �Է� ��Ʈ������ �����Ѵ�.
            fInput = new FileInputStream(srcFile);
            // ��ȣȭ�� ������  ������ ���� ��� ��Ʈ�� ���� 
            fOutput = new FileOutputStream(desFile);
            // ��ȣȭ ��� ��Ʈ���� ��� ��Ʈ���� �����Ѵ�. 
            cStr = new CipherOutputStream(fOutput, cipher);

            // �Է� ��Ʈ������ ���� �����͸� �о ��ȣȭ ��� ��Ʈ������ ������.  
            // ��ȣȭ ��� ��Ʈ������ ����ϴ� �������� ��ȣȭ �ȴ�.
            byte[] buffer = new byte[8192];
            int length=0;
            while ((length=fInput.read(buffer))!= -1)
                cStr.write(buffer, 0, length);  
            
            //��ȣȭ ó���� PADDING �����͸� ����Ѵ�.
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
	 * DES ������� ������ ��ȣȭ �ϴ� �Լ�
	 * 
	 * @param srcFilePath ��ȣȭ�� �������ϰ��
	 * @param desFilePath ��ȣȭ�� ������ ������ ���ϰ��
	 * @throws CryptoException ��ȣȭ �������� ������ �߻��ϴ� ���
	 */
	public static void decrypt(String srcFilePath, String desFilePath) 
	throws CryptoException
	{
		decrypt(new File(srcFilePath), new File(desFilePath));		
	}
	
	/**
	 * DES ������� ������ ��ȣȭ �ϴ� �Լ�
	 * 
	 * @param srcFile	��ȣȭ�� ��������
	 * @param desFile	��ȣȭ�� ������ ������ ����
	 * @throws CryptoException ��ȣȭ �������� ������ �߻��ϴ� ���
	 */
	public static void decrypt(File srcFile, File desFile) 
	throws CryptoException 
	{
		
		Cipher cipher = null;
		
		try{
			cipher=Cipher.getInstance("DES/CBC/PKCS5Padding");
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
	        // ��ȣ�� ������ ��� �Է� ��Ʈ������ �����Ѵ�. 
	        fInput = new FileInputStream(srcFile);
	        // ��ȣȭ �Է� ��Ʈ����  �Է� ��Ʈ���� �����Ѵ�. 
	        ciStr = new CipherInputStream(fInput,cipher);
	        // ��ȣȭ�� ������ ������ ���� ��� ��Ʈ�� ���� 
	        fOutput = new FileOutputStream(desFile);
	
	        // ��ȣȭ �Է� ��Ʈ������ ���� �����͸� �о  ��� ��Ʈ������ ������.
	        // ��ȣȭ �Է� ��Ʈ������ �����͸� �д� �������� ��ȣȭ �ȴ�. 
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
