package egovframework.ubiz.util.ontong.batch;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.annotation.Resource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomEx;

public class EDocSql  {
	
	String dbClass = "";
	String dbUrl = "";
	String dbId = "";
	String dbPw = "";

	public EDocSql() throws Exception {
		dbClass = "oracle.jdbc.driver.OracleDriver"; //propertiesService.getString("fms.db.driver");
		dbUrl = "jdbc:oracle:thin:@211.51.212.242:1521:ORCL2"; //propertiesService.getString("fms.db.url");
		dbId = "fmsys"; //propertiesService.getString("fms.db.owner");
		dbPw = "$admin1805"; //propertiesService.getString("fms.db.pswd");
		
		Class.forName(dbClass);
	}
	
	public JsonObject getFileListJson(String rcvNo) {
		JsonObject jsonObj = new JsonObject();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		JsonArray jsonList = new JsonArray();
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(" select t1.*, (select dir_id from DOCTB_FOLD01 where dir_path = t1.rpt_dir_path) as rpt_dir_id "
					+ "	 from (select /*+ ORDERED USE_NL(s1 s2) */ s1.dir_id, s1.dir_nm, s1.dir_path, "
					+ "				   case when instr(s1.dir_path,'/',1,4) > 0 then substr(s1.dir_path,1, instr(s1.dir_path,'/',1,4))  "
					+ "						else s1.dir_path  "
					+ "				   end as rpt_dir_path,  "
					+ "				   s2.file_id, s2.file_nm, s2.file_path, s2.file_size, s2.upload_yn, s1.sort_order "
					+ "			  from DOCTB_FOLD01 s1 "
					+ "				   inner join DOCTB_FILE01 s2 on s1.dir_id = s2.dir_id "
					+ "			 where s1.dir_path like ? || '%'"
					+ "			   and rownum < 1000000 "
					+ "		   ) t1 "
					+ "	order by nvl(sort_order, -1), t1.rpt_dir_path, length(t1.file_nm), t1.file_nm", ResultSet.FETCH_FORWARD);
			pstmt.setString(1, rcvNo);
			rs = pstmt.executeQuery();
			rs.setFetchSize(2000);
			int rcnt = 0;
			while(rs.next()) {
				JsonObject jobj  = new JsonObject();
				jobj.addProperty("dir_id", rs.getString("dir_id"));
				jobj.addProperty("dir_nm", rs.getString("dir_nm"));
				jobj.addProperty("dir_path", rs.getString("dir_path"));
				jobj.addProperty("rpt_dir_path", rs.getString("rpt_dir_path"));
				jobj.addProperty("file_id", rs.getString("file_id"));
				jobj.addProperty("file_nm", rs.getString("file_nm"));
				jobj.addProperty("upload_yn", rs.getString("upload_yn"));
				jobj.addProperty("rpt_dir_id", rs.getString("rpt_dir_id"));
				jobj.addProperty("sort_order", rs.getString("sort_order"));
				jsonList.add(jobj);
				rcnt++;
				
				if(rcnt % 2000 == 1) { System.out.println("f" + rcvNo + " : " + rcnt); }
			}
			
		} catch (Exception ex) {
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
			try { if (rs  != null) {rs.close();}} catch(Exception e) {}
		}
		jsonObj.add("fileList", jsonList);
		return jsonObj;
	}
	
	public synchronized boolean batchDoctbRept(ArrayList<DoctbReptEnt> sqlList) {
		boolean rtn = true;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(" insert into DOCTB_REPT01 (rcv_no, report_id, report_nm, page_cnt, file_size, cd_no, submit_user, sys_reg_id, sys_reg_date, sys_upd_id, sys_upd_date)  "
										+ " values  ( ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, sysdate)");
			for(int i=0; i < sqlList.size(); i++) {
				DoctbReptEnt ent = sqlList.get(i);
				pstmt.setString(1, ent.rcvNo);
				pstmt.setString(2, ent.reportId);
				pstmt.setString(3, ent.reportNm);
				pstmt.setString(4, ent.pageCnt);
				pstmt.setString(5, "0");
				pstmt.setString(6, ent.cdNo);
				pstmt.setString(7, ent.sysRegId);
				pstmt.setString(8, ent.sysRegId);
				pstmt.setString(9, ent.sysRegId);
				pstmt.addBatch();
			}
			
			pstmt.executeBatch();
			conn.commit();
		} catch (Exception ex) {
			rtn = false;
			try { conn.rollback(); } catch(Exception e) {}
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
			for(int i=0; i < sqlList.size(); i++) {
				CD.logger.error("i :" + i + " ::: " + sqlList.get(i).toString());
			}
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
		}
		return rtn;
	}

	public synchronized boolean batchDoctbIndx(ArrayList<DoctbIndxEnt> sqlList) {
		boolean rtn = true;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(" insert into DOCTB_INDX01 ( rcv_no, report_id, index_seq, file_from, file_type, content_lvl, content_desc,  sys_reg_id, sys_reg_date, sys_upd_id, sys_upd_date ) "
										+ " values ( ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, sysdate ) ");
			for(int i=0; i < sqlList.size(); i++) {
				DoctbIndxEnt ent = sqlList.get(i);
				pstmt.setString(1, ent.rcvNo);
				pstmt.setString(2, ent.reportId);
				pstmt.setString(3, ent.indexSeq);
				pstmt.setString(4, ent.fileFrom);
				pstmt.setString(5, ent.fileType);
				pstmt.setString(6, ent.contentLvl);
				pstmt.setString(7, ent.contentDesc);
				pstmt.setString(8, ent.sysRegId);
				pstmt.setString(9, ent.sysRegId);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
		} catch (Exception ex) {
			rtn = false;
			try { conn.rollback(); } catch(Exception e) {}
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
			for(int i=0; i < sqlList.size(); i++) {
				CD.logger.error("i :" + i + " ::: " + sqlList.get(i).toString());
			}
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
		}
		return rtn;
	}


	public synchronized boolean batchDelDocFiles(String rcvNo) {
		boolean rtn = true;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(" delete /*+INDEX (IX_DOCTB_FILE01_01 doctb_file01) */  "
										+ "  from doctb_file01 "
										+ " where dir_id in (select dir_id " 
										+ "					from  doctb_fold01 "
										+ "				   where dir_path like '/' || nvl('"+rcvNo+"','-------xxxx') || '/%' and rownum < 10000) and rownum < 10000000   ");
			
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(" delete from doctb_fold01 where dir_path like '/' || nvl('"+rcvNo+"','-------xxxx') || '/%' ");

			pstmt.executeUpdate();
			pstmt.close();
			
			conn.commit();
		} catch (Exception ex) {
			rtn = false;
			try { conn.rollback(); } catch(Exception e) {}
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
		}
		return rtn;
	}
	
	public synchronized boolean batchDoctbFold(ArrayList<DoctbFoldEnt> sqlList) {
		boolean rtn = true;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(" insert into DOCTB_FOLD01 ( dir_id, parent_dir_id, dir_nm, dir_path, sys_reg_id, sys_reg_date, sys_upd_id, sys_upd_date ) "
										+ " values ( ?, ?, ?, ?, ?, sysdate, ?, sysdate ) ");
			for(int i=0; i < sqlList.size(); i++) {
				DoctbFoldEnt ent = sqlList.get(i);
				pstmt.setString(1, ent.dirId);
				pstmt.setString(2, ent.parentDirId);
				pstmt.setString(3, ent.dirNm);
				pstmt.setString(4, ent.dirPath);
				pstmt.setString(5, ent.sysRegId);
				pstmt.setString(6, ent.sysRegId);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
		} catch (Exception ex) {
			rtn = false;
			try { conn.rollback(); } catch(Exception e) {}
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
			for(int i=0; i < sqlList.size(); i++) {
				CD.logger.error("i :" + i + " ::: " + sqlList.get(i).toString());
			}
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
		}
		return rtn;
	}
	
	public synchronized boolean batchDoctbFile(ArrayList<DoctbFileEnt> sqlList) {
		boolean rtn = true;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(" insert into DOCTB_FILE01 (file_id, dir_id, file_nm, file_path, file_size, upload_yn, sys_reg_id, sys_reg_date, sys_upd_id, sys_upd_date ) "
										+ " values ( ?, ?, ?, ?, ?, ?, ?, sysdate, ?, sysdate ) ");
			for(int i=0; i < sqlList.size(); i++) {
				DoctbFileEnt ent = sqlList.get(i);
				pstmt.setString(1, ent.fileId);
				pstmt.setString(2, ent.dirId);
				pstmt.setString(3, ent.fileNm);
				pstmt.setString(4, ent.filePath);
				pstmt.setString(5, ent.fileSize);
				pstmt.setString(6, ent.uploadYn);
				pstmt.setString(7, ent.sysRegId);
				pstmt.setString(8, ent.sysRegId);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
		} catch (Exception ex) {
			rtn = false;
			try { conn.rollback(); } catch(Exception e) {}
			CD.logger.error(CustomEx.getPrintStackTrace(ex));
			for(int i=0; i < sqlList.size(); i++) {
				CD.logger.error("i :" + i + " ::: " + sqlList.get(i).toString());
			}
		} finally {
			try { if (pstmt != null) {pstmt.close();}} catch(Exception e) {}
			try { if (conn  != null) {conn.close();}} catch(Exception e) {}
		}
		return rtn;
	}
	
	public Connection getConnection() throws Exception {
		return DriverManager.getConnection(dbUrl, dbId, dbPw);
	}
}