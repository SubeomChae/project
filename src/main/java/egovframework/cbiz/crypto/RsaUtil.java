/*******************************************************************/
/* Class Name  : RsaUtil               			           			*/
/* Description : HttpRequest 값을 다루기 위한 Class                  	*/
/*******************************************************************/
/* Modification Log	                                           		*/
/* No  DATE  	    Company     Author 	Description                */
/*******************************************************************/

package egovframework.cbiz.crypto;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.security.Security;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class RsaUtil {
	
    /**
     * You can't call the constructor.
     */
    private RsaUtil() {}

    public static String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
    	Cipher cipher = Cipher.getInstance("RSA");
    	//Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
    	//Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding","BC");
        
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }
    
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }

    public static byte[] hexToByteArrayBI(String hexString) {
        return new BigInteger(hexString, 16).toByteArray();
    }

        public static String base64Encode(byte[] data) throws Exception {
        BASE64Encoder encoder = new BASE64Encoder();
        String encoded = encoder.encode(data);
        return encoded;
    }

    public static byte[] base64Decode(String encryptedData) throws Exception {
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] decoded = decoder.decodeBuffer(encryptedData);
        return decoded;
    }
    
    
    /**
     * <pre>
     * RSA 인코딩 환경설정
     * </pre>
     *
     * @param req HttpServletRequest
     * @return 
     */
	public static void setRSAEncoding(HttpServletRequest req) throws Exception {
        KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
        generator.initialize(1024);
        
        KeyPair keyPair = generator.genKeyPair();
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyPair.getPublic();
        PrivateKey privateKey = keyPair.getPrivate();

        // 세션에 공개키 문자열을 Key로 개인키 저장
        req.getSession().setAttribute("__rsaPrivateKey__", privateKey);

        // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 전송
        RSAPublicKeySpec publicSpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
        req.getSession().setAttribute("publicKeyModulus", publicSpec.getModulus().toString(16));
        req.getSession().setAttribute("publicKeyExponent", publicSpec.getPublicExponent().toString(16));
	}

}