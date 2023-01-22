package egovframework.cbiz;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.apache.commons.lang.exception.ExceptionUtils;
 
public class CustomEx extends Exception implements java.io.Serializable {

  /**
   * Exception 상수 정의
   */
   public static final int USER_EXCEPTION   = 0; // 사용자 Exception 일 경우.
   public static final int SYSTEM_EXCEPTION = 1; // 사용자 Exception 아 아닐경우.


   /**
    * SQL 관련 Exception 상수 정의
    */
   // 
   public static final int PK_REF_EX   = 2292; // 하위 fk 가 참조하고 있을 경우
   public static final int MISS_KEY_EX = 2291; // 상위 pk 가 없을 경우
   public static final int DUP_KEY_EX  = 1; // 키 중복
   
  /**
   * Stack 메세지를 저장
   */
    private String stackMessage = "";

  /**
   * error code를 저장
   */
    private int errorCode = 0;

    /**
     * Exception type 저장 USER_EXCEPTION, SYSTEM_EXCEPTION 구분
     */
    private int exception_type = 1;

    /**
     * 에러시 이동할 URL 저장
     */
    private String moveUrl = "";
    /**
     * <pre>
     * Constructor
     * </pre>
     */
    public CustomEx() {
        super();
    }

    /**
     * <pre>
     * Constructor
     * </pre>
     *
     * @param msg 예외 메세지
     */
    public CustomEx(String msg) {
        super(msg);
    }

    /**
     * <pre>
     * Constructor
     * </pre>
     *
     * @param msg 예외 메세지
     */
    public CustomEx(String msg, String moveurl) {
        super(msg);
        this.moveUrl = moveurl; 
    }

    /**
     * <pre>
     * Constructor
     * </pre>
     *
     * @param msg 예외 메세지
     */
    public CustomEx(String msg, int exception_type) {
        super(msg);
        this.exception_type = exception_type;
    }

    /**
     * <pre>
     * Constructor.
     * Exception e 의 stackTrace 결과를 얻어와 getPrintStackTrace()를 사용하여
     * 나중에 스택의 내용을 알 수 있다.
     * </pre>
     *
     * @param msg 예외 메세지
     * @param e   예외 Exception 개체
     */
    public CustomEx(String msg, Exception e) {
        super(msg);
        if ( e instanceof CustomEx) {
            this.exception_type = ((CustomEx)e).exception_type;
            this.stackMessage   = ((CustomEx)e).getPrintStackTrace();
        } else if ( e instanceof java.sql.SQLException) {
            this.errorCode    = ((java.sql.SQLException)e).getErrorCode();
            int ex_cnt = 0;
            do {
                ex_cnt++;
                this.stackMessage += "\n SQL Exception Num [" + ex_cnt + "]"
                                   + "\n ERROR CODE : [" + ((java.sql.SQLException)e).getErrorCode() + "] "       
                                   + "\n" + getPrintStackTrace(e);
                e = ((java.sql.SQLException)e).getNextException();
            } while ( e != null);    
        } else {
          this.stackMessage = getPrintStackTrace(e);
        }
    }

    /**
     * <pre>
     * errorCode를 얻어온다.
     * </pre>
     *
     * @return String CustomEx(String msg, Exception e) 로 생성되어 저장된 stackTrace 문자열 반환
     */
    public int getErrorCode() {
        return this.errorCode;
    }

    /**
     * <pre>
     * Exception의 stackTrace 결과를 얻어온다.
     * </pre>
     *
     * @return String CustomEx(String msg, Exception e) 로 생성되어 저장된 stackTrace 문자열 반환
     */
    public String getPrintStackTrace() {
        return this.stackMessage;
    }
    
    public String getMoveUrl() {
    	return this.moveUrl;
    }

    /**
     * <pre>
     * Exception 이 발생한 원인.
     * 사용자 EXCEPTION일 경우 ExceptionType = USER_EXCEPTION
     * 시스템 EXCEPTION일 경우 ExceptionType = SYSTEM_EXCEPTION
     * </pre>
     * @return int
     */
    public int getExceptionType() {
      return this.exception_type;
    }

    /**
     * <pre>
     * 스택정보를 얻는다.
     * 인자로 넘어온 Exception 객체의 StackTrace 문자열을 얻는다.
     * </pre>
     *
     * @param e   예외 Exception 개체
     * @return String StackTrace문자열
     */
    public static String getPrintStackTrace(Exception e) {
      StringWriter sw = null;
      PrintWriter  pw = null;
      String stackMsg = "";
      try {
          sw = new StringWriter();
          pw = new PrintWriter(sw,true);
          e.printStackTrace(pw);

          stackMsg = sw.getBuffer().toString();
      }
      catch(Exception ignore1) {
          CD.logger.error(ExceptionUtils.getMessage(ignore1));
      }
      finally {
          if(sw != null) try { sw.close(); } catch(Exception ignore2) {ignore2.printStackTrace();}
          if(pw != null) try { pw.close(); } catch(Exception ignore3) {ignore3.printStackTrace();}
      }
      return stackMsg;
    }

    /**
     * <pre>
     * 스택정보를 얻는다.
     * 인자로 넘어온 Throwable 객체의 StackTrace 문자열을 얻는다.
     * </pre>
     *
     * @param e   Throwable 개체
     * @return String StackTrace문자열
     */
    public static String getPrintStackTrace(Throwable t) {
      StringWriter sw = null;
      PrintWriter  pw = null;
      String stackMsg = "";
      try {
          sw = new StringWriter();
          pw = new PrintWriter(sw,true);
          t.printStackTrace(pw);

          stackMsg = sw.getBuffer().toString();
      }
      catch(Exception ignore1) {
    	  CD.logger.error(ExceptionUtils.getMessage(ignore1));
      }
      finally {
          if(sw != null) try { sw.close(); } catch(Exception ignore2) {ignore2.printStackTrace();}
          if(pw != null) try { pw.close(); } catch(Exception ignore3) {ignore3.printStackTrace();}
      }
      return stackMsg;
    }
    
}