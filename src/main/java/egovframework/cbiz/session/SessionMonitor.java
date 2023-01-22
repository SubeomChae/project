package egovframework.cbiz.session;

import java.util.Enumeration;
import java.util.Hashtable;
 
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import egovframework.cbiz.CD; 
 
public class SessionMonitor implements Runnable {
	
	@Override
	public void run() {
		// SessionListener 모니터링
		while(true) {
			try {
				SessionListener.getInstance().printSessionInfo();
				Thread.sleep(5000);	// 5초마다 수행
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}