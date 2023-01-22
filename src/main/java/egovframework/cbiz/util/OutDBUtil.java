/*********************************************************************************
* 파  일  명   : OutDBUtil.java
* 작  성  일   : 2012. 8. 25
* 작  성  자   : 정진수
*---------------------------------------------------------------------------------
* 프로그램명   : OutDBService 
* 기능 및 설명 : 외부시스템 DB 접속
*---------------------------------------------------------------------------------
* 기       타  :
*********************************************************************************/
package egovframework.cbiz.util;

import java.sql.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;

public class OutDBUtil {
	
    /**
     * 목록추출 쿼리
     * @param dbKey
     * @param sql
     * @return
     */
	public static RsWrapper execList(EgovPropertyService propertiesService, String dbKey, String sql) throws Exception {
		Connection conn = null;
		Statement  stmt = null;
		RsWrapper  rsWp = new RsWrapper();
		try {
			Class.forName(propertiesService.getString(dbKey+".db.driver"));
			conn = DriverManager.getConnection(propertiesService.getString(dbKey+".db.url"), 
					propertiesService.getString(dbKey+".db.owner"), propertiesService.getString(dbKey+".db.pswd"));
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rsWp = egovframework.cbiz.service.impl.RsUtilOracle.getRsWrapper(rs);
		}catch(Exception ex) {
			return null;
		}finally {			
			if (stmt != null) { try {stmt.close();} catch(Exception ex) {} }
			if (conn != null) { try {conn.close();} catch(Exception ex) {} }
		}	
        return rsWp;
	}

    /**
     * 1건추출 쿼리
     * @param dbKey
     * @param sql
     * @return
     */
	public static Box execBox(EgovPropertyService propertiesService, String dbKey, String sql) throws Exception {
		Box  rsBox = new Box("");
		RsWrapper rsWp = execList(propertiesService, dbKey, sql);
		if(rsWp.getLength() > 0) {
			rsBox = rsWp.getRsBoxAt(0);
		}
        return rsBox;
	}

    /**
     * 업데이트 수행
     * @param dbKey
     * @param sql
     * @return
     */
	public static int exec(EgovPropertyService propertiesService, String dbKey, String sql) throws Exception {
		Connection conn = null;
		Statement  stmt = null;
		int rtn = 0;
		try {
			Class.forName(propertiesService.getString(dbKey+".db.driver"));
			conn = DriverManager.getConnection(propertiesService.getString(dbKey+".db.url"), 
					propertiesService.getString(dbKey+".db.owner"), propertiesService.getString(dbKey+".db.pswd"));
			stmt = conn.createStatement();
			rtn = stmt.executeUpdate(sql);
		}catch(Exception ex) {
			return -1;
		}finally {			
			if (stmt != null) { try {stmt.close();} catch(Exception ex) {} }
			if (conn != null) { try {conn.close();} catch(Exception ex) {} }
		}	
        return rtn;
	}

    /**
     * SMS 문자메시지 전송
     * @param box
     * @param ex
     * @return
     */
	public static int sms_service(EgovPropertyService propertiesService, Box box) throws Exception {
		java.sql.Connection conn = null;
		java.sql.Statement  stmt = null;
		int rtn = 0;
		try {
			Class.forName(propertiesService.getString("kistecsms.db.driver"));
			conn = DriverManager.getConnection(propertiesService.getString("kistecsms.db.url"), 
					propertiesService.getString("kistecsms.db.owner"), propertiesService.getString("kistecsms.db.pswd"));
			stmt = conn.createStatement();
			if(box.get("actionType").equals("DELETE")) {
				String sql = " delete from SC_TRAN "
	    	   	   	   	   + "  where tr_etc5 = '"+box.get("ref_table")+"' "
	    	   	   	   	   + "    and tr_etc6 = '"+box.get("ref_pk")+"' "
	    	   	   	   	   + "    and tr_sendstat = '1' ";
				rtn += stmt.executeUpdate(sql);
			}else {
				String[] receive_hp = StringUtil.split(box.get("receive_hp"), ";", true);
				String[] receive_id = StringUtil.split(box.get("receive_id"), ";", true);
				String[] receive_nm = StringUtil.split(box.get("receive_nm"), ";", true);
				String subject = box.getNvl("subject", box.get("remote_msg").substring(0,20));

				for(int i=0; i < receive_hp.length; i++) {
					if(!receive_hp[i].equals("")) {
						String send_date = "sysdate";
						if(!box.get("reserve_dt").equals("")) { send_date = "to_date('"+box.get("reserve_dt")+"','yyyymmddhh24mi')"; }
						String sql = "";
						if(box.get("msg_type").equals("MMS")) {
							sql = " insert into MMS_MSG(msgkey, reqdate, phone, callback, subject, msg, etc1, id, etc2, etc3) "
					    		+ " values (mms_msg_seq.nextval, "+send_date+", '"+receive_hp[i]+"', '"+box.get("send_hp")+"', '"+subject+"', "
					    	   	+ "		   '"+box.get("remote_msg")+"', 'FMS', '"+box.get("send_id")+"', '"+receive_id[i]+"', '"+receive_nm[i]+"') ";
						}else {
							sql = " insert into SC_TRAN(tr_num, tr_senddate, tr_phone, tr_callback, tr_msg, tr_etc1, tr_etc2, tr_etc3, tr_etc4, tr_etc5, tr_etc6) "
					    		+ " values (sc_sequence.nextval, "+send_date+", '"+receive_hp[i]+"', '"+box.get("send_hp")+"', '"+box.get("remote_msg")+"', 'FMS', "
					    	   	+ "		   '"+box.get("send_id")+"', '"+receive_id[i]+"', '"+receive_nm[i]+"', '"+box.get("ref_table")+"', '"+box.get("ref_pk")+"') ";
						}
						//System.out.println(sql);
						rtn += stmt.executeUpdate(sql);
					}
				}	
			}
		}catch(Exception ex) {
			return -1;
		}finally {			
			if (stmt != null) { try {stmt.close();} catch(Exception ex) {} }
			if (conn != null) { try {conn.close();} catch(Exception ex) {} }
		}	
		return rtn;
	}

}
