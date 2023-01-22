/************************************************************************************************/
/* Class Name    :cmu10Controller                                                         		*/
/* Description   : 커뮤니티 																		*/ 
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company       Author     Description                                     */
/* --    ----------    ---------     --------   ------------------------------------------------*/
/* 01    2013/10/02      신진IT컨설팅  	  정 진 수   	Initial Release									*/ 
/*																								*/
/************************************************************************************************/
package egovframework.ubiz.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;




import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.MailUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Controller
public class cmu10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : inf01001_list																*/
	/* Description  : 공지사항 목록                                            					 						*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/inf01001_list.do")
	public String inf01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
        box.put("param01", 	box.get("search_key"));  
        box.put("param02", 	box.get("search_val"));  
        commDBService.execList("PR_COMTB_NOTI01_LIST", "LIST001", box, "rsWp", request);
        return "community/inf01001";
	}

	/********************************************************************************************/
	/* Method Name  : inf01002_select														    */
	/* Description  : 공지사항 상세 조회                                               										*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/inf01002_select.do")
	public String inf01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
    	commDBService.execBox("PR_COMTB_NOTI01", "SELECT", box, "obox", request);
		commDBService.exec("PR_COMTB_NOTI01", "UPDATE_CNT", box);
		
		box.put("param01", "COMTB_NOTI01");
        box.put("param02", box.get("inform_no"));  
        commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);

        return "/community/inf01002";
	}
	
	@RequestMapping(value = "/popup/inf01004_select.do")
	public String inf01004_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_NOTI01", "SELECT", box, "obox", request);
		commDBService.exec("PR_COMTB_NOTI01", "UPDATE_CNT", box);
		
		box.put("param01", "COMTB_NOTI01");
		box.put("param02", box.get("inform_no"));
		commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
		
		return "/community/inf01004";
	}
	
	/********************************************************************************************/
	/* Method Name  : inf01002_delete														    */
	/* Description  : 공지사항 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/inf01002_delete.do")
	public void inf01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try { 
			Box ibox = new Box("");
			ibox.put("param01", "COMTB_NOTI01");
	        ibox.put("param02", box.get("inform_no"));  
	        RsWrapper rsWp = commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", ibox);
	        if(rsWp.getLength() > 0) {
		        for(int i=0; i < rsWp.getLength(); i++) {
		        	String file_path = CustomProperty.upload_dir + "community/" + rsWp.get("file_path",i);
					FileUtil.doDeleteFile(file_path);
		        }
		        ibox.put("ref_table", 	ibox.get("param01"));  
		        ibox.put("ref_pk", 	 	ibox.get("param02"));  
				commDBService.exec("PR_COMTB_FILE01", "DELETEALL", ibox);
	        }
			commDBService.exec("PR_COMTB_NOTI01", "DELETE", box);
			returnOkJsonResult(request, response);
		} catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	} 

	/********************************************************************************************/
	/* Method Name  : inf01003_edit																*/
	/* Description  : 공지사항 수정화면                                                 									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/inf01003_edit.do")
	public String inf01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("inform_no").equals("")) {
			commDBService.execBox("PR_COMTB_NOTI01", "SELECT", box, "obox", request);

			box.put("param01", "COMTB_NOTI01");
	        box.put("param02", box.get("inform_no"));  
	        commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
		}
    	return "community/inf01003";
	}

	/********************************************************************************************/
	/* Method Name  : inf01003_update														    */
	/* Description  : 공지사항 저장                                               											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/inf01003_update.do")
	public void inf01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			if(box.get("inform_no").equals("")) {
				Box rbox = commDBService.execBox("PR_COMTB_NOTI01", "INSERT", box);
				box.put("inform_no",	rbox.get("inform_no"));
			}else {
				commDBService.exec("PR_COMTB_NOTI01", "UPDATE", box);
			}
			Box ibox = new Box("");
			ibox.put("ref_table",	"COMTB_NOTI01");
			ibox.put("ref_pk",		box.get("inform_no"));
			ibox.put("sys_reg_id",	box.get("sys_reg_id"));
	        for(int i=0; i <= box.getInt("input_cnt"); i++) {
	        	if(!box.getSourceFileNm("attach_doc"+i).equals("")) { 
	        		String cli_file_nm = box.getSourceFileNm("attach_doc"+i);
	        		String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
	        		String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + StringUtil.replace(box.get("ref_pk"),"|","_")+"."+file_type;
	        		box.springMoveFileToService("attach_doc"+i, CustomProperty.upload_dir ,"community", svr_file_nm);
	        		
	        		ibox.put("file_nm", 	cli_file_nm);
	        		ibox.put("file_path", 	svr_file_nm);
	        		ibox.put("file_type", 	file_type);
	        		ibox.put("file_size", 	box.getStoredFileSize("attach_doc"+i));
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
		
	@RequestMapping(value = "/community/inf01003_delete_file.do")
	public void inf01003_delete_file(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String file_path = CustomProperty.upload_dir + "community/" + box.get("file_path");
			FileUtil.doDeleteFile(file_path);
			commDBService.exec("PR_COMTB_FILE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : pds01001_list																*/
	/* Description  : 자료실 목록                                          												*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/pds01001_list.do")
	public String pds01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("file_category").equals("")) { box.put("file_category","01"); }
		box.put("param01", 	box.get("file_category"));
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		commDBService.execList("PR_COMTB_DATA01_LIST", "LIST001", box, "rsWp", request);
		return "community/pds01001";
	}

	/********************************************************************************************/
	/* Method Name  : pds01001_delete															*/
	/* Description  : 자료실 삭제                                                 											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/pds01001_delete.do")
	public String pds01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		String file_path = CustomProperty.upload_dir + "community/" + box.get("file_path");
		FileUtil.doDeleteFile(file_path);
		
		commDBService.exec("PR_COMTB_DATA01", "DELETE", box);
        return alertNRedirect("삭제되었습니다.", "pds01001_list.do", "file_category", request);
	}

	/********************************************************************************************/
	/* Method Name  : pds01002_edit																*/
	/* Description  : 자료실 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/pds01002_edit.do")
	public String pds01002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("file_no").equals("")) {
			commDBService.execBox("PR_COMTB_DATA01", "SELECT", box, "obox", request);
		}
    	return "community/pds01002";
	}

	/********************************************************************************************/
	/* Method Name  : pds01002_update															*/
	/* Description  : 자료실 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/pds01002_update.do")
	public void pds01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			String cli_file_nm = box.getSourceFileNm("file_path");
			String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + box.get("file_no")+"."+file_type;
			box.springMoveFileToService("file_path", CustomProperty.upload_dir, "community",svr_file_nm);
			
			box.put("file_nm", 		cli_file_nm);
			box.put("file_path", 	svr_file_nm);
			box.put("file_type", 	file_type);
			box.put("file_size", 	box.getStoredFileSize("file_path"));
			
			if(box.get("file_no").equals("")) {
				Box rbox = commDBService.execBox("PR_COMTB_DATA01", "INSERT", box);
				box.put("file_no", rbox.get("file_no"));
			}else {
				commDBService.exec("PR_COMTB_DATA01", "UPDATE", box);
				if(!box.get("old_file_path").equals("")) {
					String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
					FileUtil.doDeleteFile(file_path);
				}
			}
			returnOkJsonResult(request, response);
		} catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : law02001_list														    	*/
	/* Description  : 자료실 연혁																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02001_list.do")
	public String law02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("law_id"));
		box.put("param09", box.get("sort_order"));
		box.put("param10", box.get("excel_yn"));
		commDBService.execList("PR_LAWTB_CHNG01_LIST", "LIST001", box, "rsWp", request);
		return "community/law02001";
	}

	/********************************************************************************************/
	/* Method Name  : law02002_select													    	*/
	/* Description  : 자료실 연혁 상세조회															*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02002_select.do")
	public String law02002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_LAWTB_CHNG01", "SELECT", box, "obox", request);
		return "community/law02002";
	}
	
	/********************************************************************************************/
	/* Method Name  : law02002_delete														    */
	/* Description  : 자료실 연혁 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02002_delete.do")
	public void law02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			Box rbox = commDBService.execBox("PR_LAWTB_CHNG01", "SELECT", box);
			if(!rbox.get("whole_file").equals("")) {
				String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
				
			}
			if(!rbox.get("comp3_file").equals("")) {
				String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
			}
			commDBService.exec("PR_LAWTB_CHNG01", "DELETE", box);	
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
		
	/********************************************************************************************/
	/* Method Name  : law02003_write													    	*/
	/* Description  : 자료실 연혁 등록화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02003_write.do")
	public String law02003_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "community/law02003";
	}
	
	/********************************************************************************************/
	/* Method Name  : law02003_insert															*/
	/* Description  : 자료실 연혁 등록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02003_insert.do")
	public String law02003_insert(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.getSourceFileNm("whole_file").equals("")) {
			String cli_file_nm = box.getSourceFileNm("whole_file");
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + cli_file_nm;
			box.springMoveFileToService("whole_file", "kisteclaw.pds.dir", "",svr_file_nm);
			box.put("whole_file", svr_file_nm);
		}
		if(!box.getSourceFileNm("comp3_file").equals("")) {
			String cli_file_nm = box.getSourceFileNm("comp3_file");
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + cli_file_nm;
			box.springMoveFileToService("comp3_file", "kisteclaw.pds.dir", "",svr_file_nm);
			box.put("comp3_file", svr_file_nm);
		}
		commDBService.exec("PR_LAWTB_CHNG01", "INSERT", box);
		String script = "";
		script = "alert('등록되었습니다.'); opener.goSearch(); self.close();";
		return scriptOnly(script, request);
	}

	/********************************************************************************************/
	/* Method Name  : law02003_edit													    		*/
	/* Description  : 자료실 연혁 수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02003_edit.do")
	public String law02003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_LAWTB_CHNG01", "SELECT", box, "obox", request);
		return "community/law02003";
	}
	
	/********************************************************************************************/
	/* Method Name  : law02003_update															*/
	/* Description  : 자료실 연혁 수정                                           											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/law02003_update.do")
	public String law02003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_LAWTB_CHNG01", "SELECT", box);
		box.put("whole_file", rbox.get("whole_file"));
		box.put("comp3_file", rbox.get("comp3_file"));
		if(!box.getSourceFileNm("whole_file").equals("")) {
			if(!rbox.get("whole_file").equals("")) {
				String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
			}
			String cli_file_nm = box.getSourceFileNm("whole_file");
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + cli_file_nm;
			box.springMoveFileToService("whole_file", "kisteclaw.pds.dir", "",svr_file_nm);
			box.put("whole_file", svr_file_nm);
		}
		if(!box.getSourceFileNm("comp3_file").equals("")) {
			if(!rbox.get("comp3_file").equals("")) {
				String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
			}
			String cli_file_nm = box.getSourceFileNm("comp3_file");
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + cli_file_nm;
			box.springMoveFileToService("comp3_file", "kisteclaw.pds.dir", "",svr_file_nm);
			box.put("comp3_file", svr_file_nm);
		}
		commDBService.exec("PR_LAWTB_CHNG01", "UPDATE", box);
		return alertNRedirect("수정되었습니다.", "law02002_select.do", "law_id, chg_seq", request);
	}

	/********************************************************************************************/
	/* Method Name  : boa01001_list																*/
	/* Description  : 시스템문의사항 목록                                            										*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01001_list.do")
	public String boa01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
        box.put("param01", 	box.get("start_ymd"));  
        box.put("param02", 	box.get("end_ymd"));  
        box.put("param03", 	box.get("answer_yn"));  
        box.put("param04", 	box.get("search_key"));  
        box.put("param05", 	box.get("search_val"));  
        box.put("param09", 	box.get("sort_order"));  
        box.put("param10", 	box.get("excel_yn"));  
        commDBService.execList("PR_COMTB_BOAD01_LIST", "LIST001", box, "rsWp", request);
        return "community/boa01001";
	}

	/********************************************************************************************/
	/* Method Name  : boa01002_select														    */
	/* Description  : 시스템문의사항 상세조회                                               									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01002_select.do")
	public String boa01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
    	commDBService.execBox("PR_COMTB_BOAD01", "SELECT", box, "obox", request);

    	box.put("param01", "COMTB_BOAD01");
        box.put("param02", box.get("board_no"));  
        commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
        
    	if(box.get("search_flag").equals("ans")) {
    		commDBService.exec("PR_COMTB_BOAD01", "UPDATE_ANS_CNT", box);
    	}else {	
    		commDBService.exec("PR_COMTB_BOAD01", "UPDATE_REQ_CNT", box);
    	}
        return "community/boa01002";
	}

	/********************************************************************************************/
	/* Method Name  : boa01002_delete														    */
	/* Description  : 시스템문의사항 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01002_delete.do")	
	public String boa01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box ibox = new Box("");
		ibox.put("param01", "COMTB_BOAD01");
        ibox.put("param02", box.get("board_no"));  
        RsWrapper rsWp = commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", ibox);
        if(rsWp.getLength() > 0) {
	        for(int i=0; i < rsWp.getLength(); i++) {
	        	String file_path = CustomProperty.upload_dir + "community/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
	        }
	        ibox.put("ref_table", 	ibox.get("param01"));  
	        ibox.put("ref_pk", 	 	ibox.get("param02"));  
			commDBService.exec("PR_COMTB_FILE01", "DELETEALL", ibox);
        }
		commDBService.exec("PR_COMTB_BOAD01", "DELETE", box);
        return alertNRedirect("삭제되었습니다.", "boa01001_list.do", "", request);
	}

	/********************************************************************************************/
	/* Method Name  : boa01003_edit																*/
	/* Description  : 시스템문의사항 등록/수정화면                                                 							*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01003_edit.do")
	public String boa01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("board_no").equals("")) {
			commDBService.execBox("PR_COMTB_BOAD01", "SELECT", box, "obox", request);

	    	box.put("param01", "COMTB_BOAD01");
	        box.put("param02", box.get("board_no"));  
	        commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
		}else {
			Box obox = new Box("");
			obox.put("req_empl_no", uSesEnt.empl_no);
			obox.put("req_empl_nm", uSesEnt.empl_nm);
			request.setAttribute("obox", obox);
		}
    	return "community/boa01003";
	}

	/********************************************************************************************/
	/* Method Name  : boa01003_update														    */
	/* Description  : 시스템문의사항 저장                                               									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01003_update.do")
	public void boa01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String fromUser = "sinjinitc@gmail.com|"+uSesEnt.corp_nm+" "+uSesEnt.empl_nm+"|";
			if(box.get("board_no").equals("")) {
				Box rbox = commDBService.execBox("PR_COMTB_BOAD01", "INSERT", box);
		        MailUtil.sendMail(propertiesService, box.get("req_head"), fromUser, box.get("req_body"), box.get("file_path"), box.get("file_nm"));
				box.put("board_no",	rbox.get("board_no"));
			}else {
				commDBService.exec("PR_COMTB_BOAD01", "UPDATE", box);
			}
			Box ibox = new Box("");
			ibox.put("ref_table",	"COMTB_BOAD01");
			ibox.put("ref_pk",		box.get("board_no"));
			ibox.put("sys_reg_id",	box.get("sys_reg_id"));
	        for(int i=0; i <= box.getInt("input_cnt"); i++) {
	        	if(!box.getSourceFileNm("attach_doc"+i).equals("")) { 
	        		String cli_file_nm = box.getSourceFileNm("attach_doc"+i);
	        		String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
	        		String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + StringUtil.replace(box.get("ref_pk"),"|","_")+"."+file_type;
					box.springMoveFileToService("attach_doc"+i, CustomProperty.upload_dir ,"community", svr_file_nm);
	        		
	        		ibox.put("file_nm", 	cli_file_nm);
	        		ibox.put("file_path", 	svr_file_nm);
	        		ibox.put("file_type", 	file_type);
	        		ibox.put("file_size", 	box.getStoredFileSize("attach_doc"+i));
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
	
	@RequestMapping(value = "/community/boa01003_delete_file.do")
	public void boa01003_delete_file(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String file_path = CustomProperty.upload_dir + "community/" + box.get("file_path");
			FileUtil.doDeleteFile(file_path);
			commDBService.exec("PR_COMTB_FILE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	/********************************************************************************************/
	/* Method Name  : boa01004_edit														    	*/
	/* Description  : 시스템문의사항 답변 등록/수정화면                                                						*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01004_edit.do")
	public String boa01004_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_BOAD01", "SELECT", box, "obox", request);

    	box.put("param01", "COMTB_BOAD01");
        box.put("param02", box.get("board_no"));  
        commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "fileWp", request);
		return "community/boa01004";
	}

	/********************************************************************************************/
	/* Method Name  : boa01004_update														    */
	/* Description  : 시스템문의사항 답변 등록                                                    								*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/boa01004_update.do")
	public void boa01004_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_BOAD01", "UPDATE_ANSWER", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : faq01001_list																*/
	/* Description  : FAQ 목록                                          												*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/faq01001_list.do")
	public String faq01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("faq_category").equals("")) { box.put("faq_category","A"); }
        box.put("param01", 	box.get("faq_category").equals("B") ? box.get("faq_category")+box.get("faq_sub_category") : box.get("faq_category"));  
        box.put("param02", 	box.get("search_key"));  
        box.put("param03", 	box.get("search_val"));  
		commDBService.execList("PR_COMTB_FAQS01_LIST", "LIST001", box, "rsWp", request);
        return "community/faq01001";
	}

	/********************************************************************************************/
	/* Method Name  : faq01001_update															*/
	/* Description  : FAQ 저장                                           												*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/faq01001_update.do")
	public void faq01001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("faq_category", box.get("faq_category").equals("B") ? box.get("faq_category")+box.get("faq_sub_category") : box.get("faq_category"));
			commDBService.exec("PR_COMTB_FAQS01", box.get("action_type"), box);
		
			box.put("faq_category", StringUtil.substr(box.get("faq_category"),0,1));
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : faq01001_delete															*/
	/* Description  : FAQ 삭제                                                 											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/faq01001_delete.do")
	public void faq01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			commDBService.exec("PR_COMTB_FAQS01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : not01001_list																*/
	/* Description  : 쪽지 목록                                          												*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/not01001_list.do")
	public String not01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		
		if(box.get("search_flag").equals("")) { 
			box.put("search_flag", "1"); 
		}
		
		box.put("param01", uSesEnt.empl_no);
		box.put("param02", box.get("search_key"));
		box.put("param03", box.get("search_val"));
		box.put("param04", box.get("talk_ymd_from"));
		box.put("param05", box.get("talk_ymd_to"));
		if(box.get("search_flag").equals("1")) {
			commDBService.execList("PR_COMTB_TALK11_LIST", "LIST001", box, "rsWp", request);
		}else {
			System.out.println("search_flag2222 ============ " + box.get("search_flag"));
			commDBService.execList("PR_COMTB_TALK01_LIST", "LIST001", box, "rsWp", request);
			System.out.println("search_flag3333 ============ " + box.get("search_flag"));
		}
        return "community/not01001";
	}

	/********************************************************************************************/
	/* Method Name  : not01001_delete														    */
	/* Description  : 쪽지 삭제                                                    											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/not01001_delete.do")
	public void not01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			commDBService.exec("PR_COMTB_TALK11", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : not01002_write															*/
	/* Description  : 쪽지 등록화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/not01002_write.do")
	public String not01002_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("receive_id").equals("")) {
			box.put("empl_no", box.get("receive_id"));
			commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		}
		return "community/not01002";
	}

	/********************************************************************************************/
	/* Method Name  : not01002_insert															*/
	/* Description  : 쪽지 등록																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/not01002_insert.do")
	public String not01002_insert(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_COMTB_TALK01", "INSERT", box);
			
		String[] receive_id = StringUtil.split(box.get("receive_id"), ";", true);
		Box ibox = (Box)box.clone();
		ibox.put("talk_no", rbox.get("talk_no"));
		for(int i=0; i < receive_id.length; i++) {
			if(!receive_id[i].equals("")) {
				ibox.put("receive_id", receive_id[i]);
				commDBService.exec("PR_COMTB_TALK11", "INSERT", ibox);
			}
		}
		return "community/not01002";
	}
	/********************************************************************************************/
	/* Method Name  : dia11001_list																*/
	/* Description  : 일정목록                                         												*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11001_list.do")
	public String dia11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("year").equals("") || box.get("month").equals("")) { 
			box.put("year", 	DateUtil.getYear());
			box.put("month", 	DateUtil.getMonth());
			box.put("day", 		DateUtil.getDay());
		}
		
		if(box.get("view_type").equals("")) { box.put("view_type", "2"); }
		
        box.put("param01", 	uSesEnt.user_id);  
        box.put("param02", 	uSesEnt.dept_cd);  
        box.put("param03", 	box.get("year")+box.get("month")+"01");
        box.put("param04", 	box.get("year")+box.get("month")+"31");
        box.put("param05", 	box.get("plan_class"));
		commDBService.execList("PR_COMTB_PLAN01_LIST", "LIST001", box, "rsWp", request);
		if(box.get("popup_yn").equals("Y")) {
	        return "com/frame/home_child";
		}else {
	        return "community/dia11001";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : dia11002_delete														    */
	/* Description  : 일정 삭제																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11002_delete.do")
	public String dia11002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.exec("PR_COMTB_PLAN01", "DELETE", box);
		if(box.get("popup_yn").equals("Y")) {
			return alertNClose("삭제되었습니다.", request);
		}else {
			return alertNRedirect("삭제되었습니다.", "dia11001_list.do", "year, month, view_type", request);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : dia11002_select												    		*/
	/* Description  : 일정 조회화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11002_select.do")
	public String dia11002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
        System.out.println("1111111111111111111111");
		box.put("param01", uSesEnt.user_id);  
        box.put("param02", uSesEnt.dept_cd);  
        box.put("param03", box.get("year")+box.get("month")+"01");
        box.put("param04", box.get("year")+box.get("month")+"31");
        box.put("param05", box.get("plan_class"));
        box.put("param07", box.get("plan_no"));
		commDBService.execBox("PR_COMTB_PLAN01_LIST", "LIST001", box, "obox", request);
    	return "community/dia11002";
	}
	
	/********************************************************************************************/
	/* Method Name  : dia11003_edit													    		*/
	/* Description  : 일정 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11003_edit.do")
	public String dia11003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("plan_no").equals("")) {
	        box.put("param01", uSesEnt.user_id);  
	        box.put("param02", uSesEnt.dept_cd);  
	        box.put("param03", box.get("year")+box.get("month")+"01");
	        box.put("param04", box.get("year")+box.get("month")+"31");
	        box.put("param05", box.get("plan_class"));
			box.put("param07", box.get("plan_no"));
			commDBService.execBox("PR_COMTB_PLAN01_LIST", "LIST001", box, "obox", request);
		}else {
			Box obox = new Box("");
			obox.put("plan_class", 	 "1");
			obox.put("public_scope", "1");
			request.setAttribute("obox", obox);
		}
    	return "community/dia11003";
	}
	
	/********************************************************************************************/
	/* Method Name  : dia11003_update														    */
	/* Description  : 일정 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11003_update.do")
	public String dia11003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("plan_no").equals("")) {
			Box rbox = commDBService.execBox("PR_COMTB_PLAN01", "INSERT", box);
			box.put("plan_no",	rbox.get("plan_no"));
		}else {
			commDBService.exec("PR_COMTB_PLAN01", "UPDATE", box);
			commDBService.exec("PR_COMTB_PLAN11", "DELETEALL", box);
		}
		
		Box ibox = new Box("");
		ibox.put("plan_no", 	box.get("plan_no"));
		ibox.put("sys_reg_id", 	box.get("sys_reg_id"));
		for(int i=0; i < box.getInt("input_cnt"); i++) {
			if(!box.get("shr_user_id"+i).equals("")) {
				ibox.put("shr_user_id", box.get("shr_user_id"+i));
				commDBService.exec("PR_COMTB_PLAN11", "INSERT", ibox);
			}
		}
		if(box.get("popup_yn").equals("Y")) {
			return alertNClose("저장되었습니다.", request);
		}else {
			return alertNRedirect("저장되었습니다.", "cmu10.do?method=dia11001_list", "plan_no", request);			
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : dia11004_list																*/
	/* Description  : 초기화면 주간일정                                         										*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11004_list.do")
	public String dia11004_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("sys_ymd").equals("")) { box.put("sys_ymd", 	DateUtil.toString("yyyyMMdd")); }
		Box obox = commDBService.execBox("PR_SYSTB_DATE01", "SELECT_WEEKLY", box);
		request.setAttribute("obox", obox);
		
        box.put("param01", 	uSesEnt.user_id);  
        box.put("param02", 	uSesEnt.dept_cd);  
        box.put("param03", 	obox.get("start_ymd"));  
        box.put("param04", 	obox.get("end_ymd"));  
		commDBService.execList("PR_COMTB_PLAN01_LIST", "LIST001", box, "rsWp", request);
		return "community/dia11004";
	}

	/********************************************************************************************/
	/* Method Name  : dia11011_edit																*/
	/* Description  : 공휴일관리 수정화면                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11011_edit.do")
	public String dia11011_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("sys_ymd").equals("")) { box.put("sys_ymd", DateUtil.toString("yyyyMMdd")); }
		commDBService.execBox("PR_SYSTB_DATE01", "SELECT", box, "obox", request);
    	return "community/dia11011";
	}

	/********************************************************************************************/
	/* Method Name  : dia11011_update															*/
	/* Description  : 공휴일관리 수정                                          											*/
	/********************************************************************************************/
	@RequestMapping(value = "/community/**/dia11011_update.do")
	public String dia11011_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("workday_yn", box.get("holiday_yn").equals("Y")?"N":"Y");
		commDBService.exec("PR_SYSTB_DATE01", "UPDATE", box);
		String script = "top.opener.go_search(); self.close();";
		//return alert("저장되었습니다.", script, request);
		return alertNRedirect("저장되었습니다.", script, "", request);
		
	}
	
}
