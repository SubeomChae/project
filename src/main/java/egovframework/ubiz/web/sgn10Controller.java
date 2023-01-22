/************************************************************************************************/
/* Class Name    : sgn10Controller                                                         		*/
/* Description   : 전자결재																		*/
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company         Author     Description                                   */
/* --    ----------    ---------       --------   ----------------------------------------------*/
/* 01    2014/03/28  신진아이티컨설팅  정 진 수   Initial Release						        */
/*																								*/
/************************************************************************************************/
package egovframework.ubiz.web;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Controller
public class sgn10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : sgn01001															    	*/
	/* Description  : 기안문 작성화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/pd/sgn01001.do")
	public String sgn01001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("msg_type").equals("SLP001")) { // 일반전표 : 회계단위 검사
			box.put("slip_no", 	StringUtil.arrayCol(box.get("search_key"),2,"|"));
			Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "UPDATE_CHECK_UNIT", box);
			if(rbox.get("acc_unit").equals("XX")) { 
				returnFailJsonResult("목적사업회계 계정과목과 수익사업회계 계정과목을 동시에 작성할 수 없습니다.", request, response);
			}	
		}
		
		if(!box.get("msg_no").equals("")) {
			commDBService.execBox("PR_COMTB_MESG01", "SELECT", box, "obox", request);

			box.put("param01", 	box.get("dbo")+".COMTB_MESG01");
			box.put("param02", 	box.get("msg_no"));
			commDBService.execList("PR_COMTB_FILE01_LIST", "LIST002", box, "fileWp", request);
		}else {
			Box obox = (Box)box.clone();
			obox.put("send_empl_no", uSesEnt.empl_no);
			request.setAttribute("obox", obox);
		}
		return "esign/sgn01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn01001_preview															*/
	/* Description  : 기안문 인쇄 미리보기															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn01001_preview.do")
	public void sgn01001_preview(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			box.put("send_dept_cd", uSesEnt.dept_cd);
			Box rbox = new Box("");
			if(box.get("wait_no").equals("")) {
				rbox = commDBService.execBox("PR_COMTB_MESG11", "INSERT", box);
			}else {
				commDBService.exec("PR_COMTB_MESG11", "UPDATE", box);
				rbox.put("wait_no", box.get("wait_no"));
			}
			transactionManager.commit(tranStat);
			rbox.put("isOk", "Y");
			returnOkJsonResult(rbox, request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn01001_update															*/
	/* Description  : 기안문 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn01001_update.do")
	public void sgn01001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Box rbox = new Box("");
			if(box.get("save_flag").equals("tempSave")) { // 임시저장
				rbox = commDBService.execBox("PR_COMTB_MESG01", "UPDATE_TEMP", box);
			}else if(box.get("save_flag").equals("saveOnly")) { // 접수대기 수정
				rbox = commDBService.execBox("PR_COMTB_MESG01", "UPDATE", box);
				if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); return; }
			}else { // 전자결재 생성
				rbox = commDBService.execBox("PR_COMTB_MESG01", "SIGN_REQUEST", box);
				if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); return; }
			}
			
			Class.forName("core.log.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@1.224.163.98:1521:orcl", "SABOWNER", "$u9o3767");
			String sql = " update " + box.get("dbo") +".COMTB_MESG01 set opinion = ? where msg_no = '"+rbox.get("msg_no")+"'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, box.get("opinion"));
			int rtn = pstmt.executeUpdate();
			pstmt.close();
			conn.commit();
			if (pstmt != null) { try {pstmt.close();} catch(Exception ex) {} }
			if (conn != null) { try {conn.close();} catch(Exception ex) {} }
			
			// 붙임문서 저장
			rbox.put("ref_table", 	box.get("dbo")+".COMTB_MESG01");
			rbox.put("ref_pk", 		rbox.get("msg_no"));
			rbox.put("sys_reg_id", 	box.get("sys_reg_id"));
			for(int i=0; i < box.getInt("file_cnt"); i++) {
				if(box.get("file_no"+i).equals("") && !box.get("file_path"+i).equals("")) {
					String svrDir = CustomProperty.upload_dir + "/groupware/" + box.get("dbo");
					String tmpFileNm = box.get("file_path"+i);
					String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + i + "_" + rbox.get("ref_pk") + "." + box.get("file_type"+i);
					FileUtil.fileMove(CustomProperty.upload_dir+"/temp/"+tmpFileNm, svrDir+"/"+svrFileNm);
					
					rbox.put("file_nm", 	box.get("file_nm"+i));
					rbox.put("file_path", 	svrFileNm);
					rbox.put("file_type", 	box.get("file_type"+i));
					rbox.put("file_size", 	box.get("file_size"+i));
					commDBService.execBox("PR_COMTB_FILE01", "INSERT", rbox);
				}
			}

			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	// 파일 업로드
	@RequestMapping(value = "/esign/**/sgn01001_upload_file.do")
	public void sgn01001_upload_file(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box obox = new Box("");
			if(!box.getSourceFileNm("upload_file").equals("")) {
				String cli_file_nm = box.getSourceFileNm("upload_file");
				String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
				String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + box.get("send_empl_no") + "." + file_type;
				box.springMoveFileToService("upload_file", "groupware", box.get("dbo"), svr_file_nm);
				
				obox.put("file_nm", 	cli_file_nm);
				obox.put("file_path", 	box.getStoredFileNm("upload_file"));
				obox.put("file_type", 	file_type);
				obox.put("file_size", 	box.getStoredFileSize("upload_file"));
				obox.put("sys_reg_id", 	uSesEnt.user_id);
			}
			transactionManager.commit(tranStat);
			obox.put("isOk", "Y");
			returnOkJsonResult(obox, request, response);
		}catch(ClassNotFoundException cnfe){
			transactionManager.rollback(tranStat);
			System.out.println("oracle.jdbc.driver.OracleDriver를 찾을 수 없습니다.");
		}catch(SQLException  sql){
			transactionManager.rollback(tranStat);
			System.out.println("Connection 실패!");
		}catch(Exception e){
			transactionManager.rollback(tranStat);
			System.out.println(e.toString());
		}
	}

	/********************************************************************************************/
	/* Method Name  : sgn01001_delete															*/
	/* Description  : 기안문(일반문서) 삭제															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn01001_delete.do")
	public void sgn01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = new Box("");
			ibox.put("param01", box.get("dbo")+".COMTB_MESG01");
	        ibox.put("param02", box.get("msg_no"));  
	        RsWrapper rsWp = commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", ibox);
	        if(rsWp.getLength() > 0) {
		        for(int i=0; i < rsWp.getLength(); i++) {
		    		String file_path = CustomProperty.upload_dir + "/groupware/" + box.get("dbo") + "/" + rsWp.get("file_path",i);
		    		FileUtil.doDeleteFile(file_path);
		        }
		        ibox.put("ref_table", 	ibox.get("param01"));  
		        ibox.put("ref_pk", 	 	ibox.get("param02"));  
				commDBService.exec("PR_COMTB_FILE01", "DELETEALL", ibox);
	        }
			commDBService.exec("PR_COMTB_MESG01", "DELETE", box);
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	// 붙임문서 삭제
	@RequestMapping(value = "/esign/**/sgn01001_delete_file.do")
	public void sgn01001_delete_file(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("file_no").equals("")) {
			String file_path = CustomProperty.upload_dir + "/groupware/" + box.get("dbo") + "/" + box.get("file_path");
			FileUtil.doDeleteFile(file_path);
			commDBService.exec("PR_COMTB_FILE01", "DELETE", box);
		}else {
			String file_path = CustomProperty.upload_dir + "/groupware/" + box.get("dbo") + "/temp/" + box.get("file_path");
			FileUtil.doDeleteFile(file_path);
		}
		returnOkJsonResult(request, response);
	}

	/********************************************************************************************/
	/* Method Name  : sgn01002_select															*/
	/* Description  : 전자결재 세부																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn01002_select.do")
	public String sgn01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_COMTB_MESG01", "SELECT", box, "obox", request);
		if(box.get("msg_no").equals("")) { box.put("msg_no", rbox.get("msg_no")); }
		if(!rbox.get("msg_no").equals("")) {
			box.put("param01", box.get("dbo")+".COMTB_MESG01");
			box.put("param02", box.get("msg_no"));
			commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
		}

		box.put("param01", box.get("msg_no"));
		box.put("param02", "");
		commDBService.execList("PR_COMTB_MESG02_LIST", "LIST001", box, "lineWp", request);
		
		// 참조문서 수신확인
		if(box.get("update").equals("Y")) {
			commDBService.exec("PR_COMTB_MESG02", "UPDATE_RECEIVE", box);
		}
		
		return "esign/sgn01002";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn01002_update														    */
	/* Description  : 전자결재 세부 저장                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn01002_update.do")
	public void sgn01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("core.log.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@1.224.163.98:1521:orcl", "SABOWNER", "$u9o3767");
			String sql = " update " + box.get("dbo") +".COMTB_MESG01 "
			   		   + "	  set subject = fn_param(?), "
			   		   + "	      opinion = ?, "
			   		   + "	      open_scope = ?, "
			   		   + "	      sys_upd_id = ?, "
			   		   + "	      sys_upd_date = sysdate "
			   		   + "  where msg_no = '"+box.get("msg_no")+"' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, box.get("subject"));
			pstmt.setString(2, box.get("opinion"));
			pstmt.setString(3, box.get("open_scope"));
			pstmt.setString(4, box.get("sys_reg_id"));

			int rtn = pstmt.executeUpdate();
			pstmt.close();
			conn.commit();
			if (pstmt != null) { try {pstmt.close();} catch(Exception ex) {} }
			if (conn != null) { try {conn.close();} catch(Exception ex) {} }
			
			// 붙임문서 저장
			Box ibox = new Box("");
			ibox.put("ref_table", 	box.get("dbo")+".COMTB_MESG01");
			ibox.put("ref_pk", 		box.get("msg_no"));
			ibox.put("sys_reg_id", 	box.get("sys_reg_id"));
			for(int i=0; i < box.getInt("file_cnt"); i++) {
				if(box.get("file_no"+i).equals("") && !box.get("file_path"+i).equals("")) {
					String svrDir = CustomProperty.upload_dir + "/groupware/" + box.get("dbo");
					String tmpFileNm = box.get("file_path"+i);
					String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + i + "_" + ibox.get("ref_pk") + "." + box.get("file_type"+i);
					FileUtil.fileMove(CustomProperty.upload_dir+"/temp/"+tmpFileNm, svrDir+"/"+svrFileNm);
					
//					box.springMoveFileToService(tmpFileNm, CustomProperty.upload_dir, "groupware", svrFileNm);
					
					ibox.put("file_nm", 	box.get("file_nm"+i));
					ibox.put("file_path", 	svrFileNm);
					ibox.put("file_type", 	box.get("file_type"+i));
					ibox.put("file_size", 	box.get("file_size"+i));
					commDBService.execBox("PR_COMTB_FILE01", "INSERT", ibox);
				}
			}

			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn02001_list															    */
	/* Description  : 접수대기 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn02001_list.do")
	public String sgn02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("sign_empl_no", uSesEnt.empl_no);
		Box rbox = commDBService.execBox("PR_COMTB_MESG02", "SELECT_RECEIVE_COUNT", box, "msgBox", request);
		if(rbox.getInt("wait_cnt") > 0) {
			box.put("param01", uSesEnt.empl_no);
			box.put("param02", box.get("msg_gbn"));
			box.put("param03", box.get("start_ymd"));
			box.put("param04", box.get("end_ymd"));
			box.put("param05", box.get("search_key"));
			box.put("param06", box.get("search_val"));
			box.put("param07", "1");
			commDBService.execList("PR_COMTB_MESG01_LIST", "LIST001", box, "rsWp", request);
		}
		return "esign/sgn02001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn02001_update															*/
	/* Description  : 접수대기(접수/반려 처리)														*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn02001_update.do")
	public void sgn02001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		Box ibox = new Box("");
		Box pbox = new Box("");
		
		if(box.get("sign_status").equals("recieve_all")) {
			try{
				ibox.put("dbo", 			box.get("dbo"));
				ibox.put("sys_reg_id", 		box.get("sys_reg_id"));
				ibox.put("real_empl_no", 	box.get("sys_reg_id"));
				String[] sign_step = StringUtil.split(box.get("new_sign_step"),"Ð",true);
				String[] sign_order = StringUtil.split(box.get("new_sign_order"),"Ð",true);
				String[] sign_empl_no = StringUtil.split(box.get("new_sign_empl_no"),"Ð",true);
				String arr[] = StringUtil.split(box.get("msg_entity"),"Ð",true);
				int input_cnt = StringUtil.getStrCnt(box.get("msg_entity"), "Ð");
				for(int i=0; i < input_cnt; i++){
					ibox.put("msg_no", 			arr[i]);
					if(box.get("new_line").equals("Y")) {
						for(int j=0; j < sign_step.length; j++) {
							if(!sign_empl_no[j].equals("")) {
								ibox.put("sign_step", 		sign_step[j]);
								ibox.put("sign_empl_no", 	sign_empl_no[j]);
								ibox.put("sign_order", 		sign_step[j].equals("40") ? "" : StringUtil.substr(sign_order[j], 1, 2));
								ibox.put("sign_status", 	sign_step[j].equals("40") ? "N" : "2");
								commDBService.exec("PR_COMTB_MESG02", "INSERT", ibox);
							}
						}
					}
					ibox.put("sign_seq", 		"1");
					ibox.put("sign_status", 	"3");
					ibox.put("sign_date", 		box.get("acc_sign_ymd"));
					ibox.put("opinion", 		box.get("opinion"));
					pbox = commDBService.execBox("PR_COMTB_MESG02", "SIGN_PROCESS", ibox);
					if(!pbox.get("rtn_msg").equals("")) { returnFailJsonResult(pbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return; }
				}
				transactionManager.commit(tranStat);
				returnOkJsonResult(request, response);
			}catch(Exception ex) {
				transactionManager.rollback(tranStat);
				ex.printStackTrace();
				CD.logger.error(ExceptionUtils.getMessage(ex));
				returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
			}
		}else if(box.get("sign_status").equals("sign_all")) {
			try{
				ibox.put("dbo", 			box.get("dbo"));
				ibox.put("real_empl_no", 	box.get("sys_reg_id"));
				ibox.put("sign_status", 	"3");
				ibox.put("sys_reg_id", 		box.get("sys_reg_id"));
				for(int i=0; i < box.getInt("input_cnt"); i++) {
					if(!box.get("msg_entity"+i).equals("")) {
						String arr[] = StringUtil.split(box.get("msg_entity"+i),"Ð",true);
						ibox.put("msg_no", 			arr[0]);
						ibox.put("sign_seq", 		arr[1]);
						ibox.put("sign_step", 		arr[2]);
						ibox.put("sign_order", 		arr[3]);
						pbox = commDBService.execBox("PR_COMTB_MESG02", "SIGN_PROCESS", ibox);
						if(!pbox.get("rtn_msg").equals("")) { returnFailJsonResult(pbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return; }
					}
				}
				
				transactionManager.commit(tranStat);
				returnOkJsonResult(request, response);
			}catch(Exception ex) {
				transactionManager.rollback(tranStat);
				ex.printStackTrace();
				CD.logger.error(ExceptionUtils.getMessage(ex));
				returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
			}
		}else {
			try {
				if(box.get("sign_status").equals("3") && box.get("new_line").equals("Y")) {
					ibox.put("dbo", 		box.get("dbo"));
					ibox.put("msg_no", 		box.get("msg_no"));
					ibox.put("sys_reg_id", 	box.get("sys_reg_id"));
					String[] sign_step = StringUtil.split(box.get("new_sign_step"),"Ð",true);
					String[] sign_order = StringUtil.split(box.get("new_sign_order"),"Ð",true);
					String[] sign_empl_no = StringUtil.split(box.get("new_sign_empl_no"),"Ð",true);
					for(int i=0; i < sign_step.length; i++) {
						if(!sign_empl_no[i].equals("")) {
							ibox.put("sign_step", 		sign_step[i]);
							ibox.put("sign_empl_no", 	sign_empl_no[i]);
							ibox.put("sign_order", 		sign_step[i].equals("40") ? "" : sign_order[i]);
							ibox.put("sign_status", 	sign_step[i].equals("40") ? "N" : "2");
							commDBService.exec("PR_COMTB_MESG02", "INSERT", ibox);
						}
					}
				}
				
				// 접수/반려처리
				box.put("sign_date", 	box.get("acc_sign_ymd"));
				Box rbox = commDBService.execBox("PR_COMTB_MESG02", "SIGN_PROCESS", box);
				if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return; }

				transactionManager.commit(tranStat);
				returnOkJsonResult(request, response);
			}catch(Exception ex) {
				transactionManager.rollback(tranStat);
				ex.printStackTrace();
				CD.logger.error(ExceptionUtils.getMessage(ex));
				returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
			}
		}
	}

	/********************************************************************************************/
	/* Method Name  : sgn03001_list															    */
	/* Description  : 결재대기 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn03001_list.do")
	public String sgn03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("sign_empl_no", uSesEnt.empl_no);
		Box rbox = commDBService.execBox("PR_COMTB_MESG02", "SELECT_RECEIVE_COUNT", box, "msgBox", request);
		if(rbox.getInt("sign_cnt") > 0) {
			box.put("param01", uSesEnt.empl_no);
			box.put("param02", box.get("msg_type"));
			box.put("param03", box.get("start_ymd"));
			box.put("param04", box.get("end_ymd"));
			box.put("param05", box.get("search_key"));
			box.put("param06", box.get("search_val"));
			box.put("param07", "2");
			commDBService.execList("PR_COMTB_MESG01_LIST", "LIST001", box, "rsWp", request);
		}
		return "esign/sgn03001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn03001_update															*/
	/* Description  : 결재대기(승인/반려 처리)														*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn03001_update.do")
	public void sgn03001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box rbox = commDBService.execBox("PR_COMTB_MESG02", "SIGN_PROCESS", box);
			if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return; }
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : sgn04001_list															    */
	/* Description  : 결재취소 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn04001_list.do")
	public String sgn04001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -1, "yyyyMMdd", "M")); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }

		box.put("param01", uSesEnt.empl_no);
		box.put("param02", box.get("msg_type"));
		box.put("param03", box.get("start_ymd"));
		box.put("param04", box.get("end_ymd"));
		box.put("param05", box.get("search_key"));
		box.put("param06", box.get("search_val"));
		commDBService.execList("PR_COMTB_MESG01_LIST", "LIST002", box, "rsWp", request);
		return "esign/sgn04001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn04001_update															*/
	/* Description  : 결재취소 처리																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn04001_update.do")
	public void sgn04001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box rbox = commDBService.execBox("PR_COMTB_MESG02", "CANCEL_PROCESS", box);
			if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;}

			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : sgn05001_list															    */
	/* Description  : 참조문서 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn05001_list.do")
	public String sgn05001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", uSesEnt.empl_no);
		box.put("param02", box.get("msg_type"));
		box.put("param03", box.get("start_ymd"));
		box.put("param04", box.get("end_ymd"));
		box.put("param05", box.get("search_key"));
		box.put("param06", box.get("search_val"));
		commDBService.execList("PR_COMTB_MESG01_LIST", "LIST004", box, "rsWp", request);
		return "esign/sgn05001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn11001_list															    */
	/* Description  : 결재진행(완료) 목록															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn11001_list.do")
	public String sgn11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -1, "yyyyMMdd", "M")); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		box.put("param01", uSesEnt.empl_no);
		box.put("param02", box.get("msg_type"));
		box.put("param03", box.get("start_ymd"));
		box.put("param04", box.get("end_ymd"));
		box.put("param05", box.get("search_key"));
		box.put("param06", box.get("search_val"));
		box.put("param07", box.get("biz_id"));
		commDBService.execList("PR_COMTB_MESG01_LIST", "LIST003", box, "rsWp", request);
		return "esign/sgn11001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn11001_update															*/
	/* Description  : 결재대기 중 작성중 회수															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn11001_update.do")
	public void sgn11001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box rbox = commDBService.execBox("PR_COMTB_MESG01", "SIGN_REMOVE", box);
			if(!rbox.get("rtn_msg").equals("")) { returnFailJsonResult(rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return; }

			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : sgn21001_list															    */
	/* Description  : 기록물등록대장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn21001_list.do")
	public String sgn21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", box.get("msg_type"));
			box.put("param02", box.get("subject"));
			
			if(!uSesEnt.use_auth.startsWith("S")) { box.put("dept_cd", uSesEnt.dept_cd); }
			box.put("param03", box.get("dept_cd")+"|"+box.get("dept_nm"));
			box.put("param04", box.get("start_ymd")+"|"+box.get("end_ymd"));
			box.put("param05", box.get("search_key")+"|"+box.get("search_val"));
			box.put("param06", box.get("sign_status"));
			box.put("param07", box.get("msg_no1")+box.get("msg_no2"));
			box.put("param09", box.get("sort_order"));
			box.put("param10", 	box.get("excel_yn"));
			if(box.get("excel_yn").equals("P")) {
				Box ebox = commDBService.execXls("PR_COMTB_MESG01_LIST", "LIST006", box);
				returnOkJsonResult(ebox, request, response);
			}else {
				commDBService.execList("PR_COMTB_MESG01_LIST", "LIST006", box, "rsWp", request);
			}
		}
		if(box.get("excel_yn").equals("P")) {
			return null;
		}else {
			return "/esign/sgn21001";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn31001_list															    */
	/* Description  : 결재권한자위임 목록															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn31001_list.do")
	public String sgn31001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", uSesEnt.empl_no);
		commDBService.execList("PR_COMTB_DLGT01_LIST", "LIST001", box, "rsWp", request);
		return "esign/sgn31001";
	}
	
	/********************************************************************************************/
	/* Method Name  : sgn31001_update														    */
	/* Description  : 결재권한자위임 저장															*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn31001_update.do")
	public String sgn31001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("start_dt", box.get("start_ymd")+box.get("start_hh")+box.get("start_mm"));
		box.put("end_dt", 	box.get("end_ymd")+box.get("end_hh")+box.get("end_mm"));
		if(box.get("dlgt_seq").equals("")) {
			commDBService.exec("PR_COMTB_DLGT01", "INSERT", box);
		}else {
			commDBService.exec("PR_COMTB_DLGT01", "UPDATE", box);
		}
		return Redirect("sgn31001_list.do", "", request);
	}

	/********************************************************************************************/
	/* Method Name  : sgn31001_delete														    */
	/* Description  : 결재권한자위임 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn31001_delete.do")
	public String sgn31001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.exec("PR_COMTB_DLGT01", "DELETE", box);
		return Redirect("sgn31001_list.do", "", request);
	}

	/********************************************************************************************/
	/* Method Name  : sgn41001_list																*/
	/* Description  : 일반문서 목록                                            					 						*/
	/********************************************************************************************/
	@RequestMapping(value = "/esign/**/sgn41001_list.do")
	public String sgn41001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		box.put("param01", 	box.get("start_ymd"));
		box.put("param02", 	box.get("end_ymd"));
		box.put("param03", 	box.get("search_key"));
		box.put("param04", 	box.get("search_val"));
		box.put("param05",  box.get("sign_status"));
        commDBService.execList("PR_COMTB_MESG01_LIST", "LIST005", box, "rsWp", request);
        
        return "esign/sgn41001";
	}

}
