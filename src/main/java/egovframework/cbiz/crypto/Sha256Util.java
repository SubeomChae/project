package egovframework.cbiz.crypto;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

import egovframework.cbiz.CD;
import egovframework.cbiz.util.SysUtil;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Sha256Util {
	public static String encrypt(String planText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			return hexString.toString();
		} catch (Exception e) {
			CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(e));
			throw new RuntimeException();
		}
	}
}
