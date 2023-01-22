package egovframework.cbiz.crypto;

/**
 * 암호화/복호화하는 과정에서 발생하는 예외 클래스 
 * 
 * @author 곽정산
 *
 */

public class CryptoException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4446303925062319903L;

	/**
	 * CryptoException 생성자
	 * @param msg 예외사항 메시지 
	 */
	public CryptoException(String msg) {
		super(msg);
	}

}
