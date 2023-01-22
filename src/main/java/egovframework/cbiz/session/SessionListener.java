package egovframework.cbiz.session;

import java.util.Enumeration;
import java.util.Hashtable;
 
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import egovframework.cbiz.CD; 
 
public class SessionListener implements HttpSessionListener {
	public static SessionListener sessionManager = null;
	public static Hashtable sessionMonitor;
	public static Hashtable loginSessionMonitor;
	public static int maxSessionValidCount;

	public SessionListener() {
		if (sessionMonitor == null) sessionMonitor = new Hashtable();
		if (loginSessionMonitor == null) loginSessionMonitor = new Hashtable();
		sessionManager = this;

		maxSessionValidCount = 10000;
		
		//SessionMonitor r = new SessionMonitor();
		//Thread t = new Thread(r);
		//t.start();
	}
 
	public static synchronized SessionListener getInstance() {
		if (sessionManager == null)
			sessionManager = new SessionListener();
		return sessionManager;
	}
 
	// 현재 활성화 된 session 수 반환
	public int getActiveSessionCount() {
		return sessionMonitor.size();
	}
 
	// 현재 등록된 session id 목록 반환
	public Enumeration getIds() {
		return sessionMonitor.keys();
	}
  
	// 전체 세션갯수를 측정하여 로그인(대기)상태 메세지 창 호출
	public boolean isMaxLoginSessions() {
		boolean retVal = false;

		if(maxSessionValidCount <= getActiveLoginSessionCount()) {
			retVal = true;
		}

		return retVal;
	}
  
	// 현재 활성화 된 session 수 반환
	public int getActiveLoginSessionCount() {
		return loginSessionMonitor.size();
	}
	
	public void printSessionInfo() {
//		System.out.println(" ############################################################################### ");
//		System.out.println(" # 접속자 (로그인 허용인원수) : " + maxSessionValidCount + " 명#");
//		System.out.println(" # 접속자 (사이트 접속자수) : " + getActiveSessionCount() + " 명#");
//		System.out.println(" # 접속자 (로그인 사용자수) : " + getActiveLoginSessionCount() + " 명#");
		Enumeration eNum = sessionMonitor.elements();
		while(eNum.hasMoreElements()) {
			HttpSession sh_session = null;
			try {
				sh_session = (HttpSession) eNum.nextElement();
			} catch (Exception e) {
				continue;
			}

			String sesUserId = (String)sh_session.getAttribute(CD.SS_USER_ID);
			if(sesUserId != null) {
				System.out.println(" # SESSION ["+sh_session.getId()+"]  SS_USER_ID ["+sesUserId+"]");
			}
		}
//		System.out.println(" ############################################################################### ");
	}
  
	// 로그인한 Session Put
	public void setLoginSession(HttpSession session) {
		synchronized (loginSessionMonitor) {
			loginSessionMonitor.put(session.getId(), session);

//			System.out.println(" ############################################################################### ");
//			System.out.println(" # 접속자 (로그인 허용인원수) : " + maxSessionValidCount + " 명#");
//			System.out.println(" # 접속자 (사이트 접속자수) : " + getActiveSessionCount() + " 명#");
//			System.out.println(" # 접속자 (로그인 사용자수) : " + getActiveLoginSessionCount() + " 명#");
//			System.out.println(" ############################################################################### ");
		}
	}
  
	// 로그아웃한 Session Remove
	public void setLogoutSession(HttpSession session) {
		synchronized (loginSessionMonitor) {
			loginSessionMonitor.remove(session.getId());
		}
	}
 
	// 현재 등록된 session중 현재 접속된 사용자정보와 중복접속이면 이전세션 소멸
	public boolean checkDuplicationLogin(String sessionId, String userId) {
		boolean bool = false;
		Enumeration eNum = sessionMonitor.elements();
		//System.out.println("####### NEW SESSION ["+sessionId+"]  SS_USER_ID ["+userId+"]  ACTIVE COUNT ["+getActiveSessionCount()+"]");
		while(eNum.hasMoreElements()) {
			HttpSession sh_session = null;
			try {
				sh_session = (HttpSession) eNum.nextElement();
			} catch (Exception e) {
				continue;
			}
			
			String sesUserId = (String)sh_session.getAttribute(CD.SS_USER_ID);
			if(sesUserId != null) {
				//System.out.println("####### OLD SESSION ["+sh_session.getId()+"]  SS_USER_ID ["+sesUserId+"]");
				if(userId.equals(sesUserId) && !sessionId.equals(sh_session.getId())) {
					sh_session.invalidate();
					bool = true;
					break;
				}
			}
		}
		return bool;
	}

	// 세션 생성시 이벤트 처리
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.put(session.getId(), session);

			//System.out.println(" ############################################################################### ");
			//System.out.println(" # 접속자 (로그인 허용인원수) : " + maxSessionValidCount + " 명#");
			//System.out.println(" # 접속자 (사이트 접속자수) : " + getActiveSessionCount() + " 명#");
			//System.out.println(" # 접속자 (로그인 사용자수) : " + getActiveLoginSessionCount() + " 명#");
			//System.out.println(" ############################################################################### ");
		}
	}
 
	// 세션 소멸(종료)시 이벤트 처리
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		synchronized (sessionMonitor) {
			sessionMonitor.remove(session.getId());
			loginSessionMonitor.remove(session.getId());

//			System.out.println(" ############################################################################### ");
//			System.out.println(" # 접속자 (로그인 허용인원수) : " + maxSessionValidCount + " 명#");
//			System.out.println(" # 접속자 (사이트 접속자수) : " + getActiveSessionCount() + " 명#");
//			System.out.println(" # 접속자 (로그인 사용자수) : " + getActiveLoginSessionCount() + " 명#");
//			System.out.println(" ############################################################################### ");
		}
	}
}