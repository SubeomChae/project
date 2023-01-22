/************************************************************************************************/
/* Class Name    : adm10Controller                                                         		*/
/* Description   : 기준정보																		*/
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
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
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
import egovframework.cbiz.crypto.SeedCipher;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Controller
public class adm10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : adm01001_list														    	*/
	/* Description  : 회사정보																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm01001_list.do")
	public String adm01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("search_key"));
		box.put("param02", 	box.get("search_val"));
		if(!uSesEnt.use_auth.equals("SA")) { box.put("param03", uSesEnt.corp_cd); }
		commDBService.execList("PR_COMTB_CORP01_LIST", "LIST001", box, "rsWp", request);
		return "admenu/adm01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : change_pswd														    	*/
	/* Description  : 비밀번호 migration			 												*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/change_pswd.do")
	public String change_pswd(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {

		RsWrapper rsWp = commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST005", box);
		
		for(int i=0; i < rsWp.getLength(); i++) {
			box.put("empl_no", rsWp.get("empl_no",i));
			box.put("pswd", SeedCipher.encode(StringUtil.strDecode(rsWp.get("pswd",i))).trim());
			
			commDBService.exec("PR_INSTB_EMPL01", "UPDATE_PSWD", box);
		}
		
		return "admenu/adm01001";
	}

	/********************************************************************************************/
	/* Method Name  : adm01002_select												    		*/
	/* Description  : 회사정보 상세조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm01002_select.do")
	public String adm01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!uSesEnt.use_auth.equals("SA")) { box.put("corp_cd", uSesEnt.corp_cd); }
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
    	return "admenu/adm01002";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm01002_delete														    */
	/* Description  : 회사정보 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm01002_delete.do")
	public String adm01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("old_logo_file").equals("")) {
			String file_path = CustomProperty.upload_dir + "admenu/" + box.get("old_logo_file");
			FileUtil.doDeleteFile(file_path);
    		
			box.put("ref_table", 	"COMTB_CORP01");
	        box.put("ref_pk", 		box.get("corp_cd")); 
			commDBService.exec("PR_COMTB_FILE01", "DELETEALL", box);
		}
		
		commDBService.exec("PR_COMTB_CORP01", "DELETE", box);
		return alertNRedirect("삭제되었습니다.", "adm01001_list.do", "", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : adm01003_edit													    		*/
	/* Description  : 회사정보 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm01003_edit.do")
	public String adm01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("corp_cd").equals("")) {
			if(!uSesEnt.use_auth.equals("SA")) { box.put("corp_cd", uSesEnt.corp_cd); }
			commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		}
    	return "admenu/adm01003";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm01003_update														    */	
	/* Description  : 회사정보 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm01003_update.do")
	public void adm01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("rep_reside_no", 	box.get("rep_reside_no1")+box.get("rep_reside_no2"));
			box.put("corp_reg_no", 		box.get("corp_reg_no1")+box.get("corp_reg_no2"));
			box.put("saupja_no", 		box.get("saupja_no1")+box.get("saupja_no2")+box.get("saupja_no3"));
			box.put("permit_ip", 		box.get("permit_ip1")+";"+box.get("permit_ip2")+";"+box.get("permit_ip3"));
			box.put("server_ip", 		box.get("server_ip1")+"|"+box.get("server_ip2"));
			if(box.get("action_type").equals("INSERT")) {
				Box rbox = commDBService.execBox("PR_COMTB_CORP01", "INSERT", box);
			}else {
				commDBService.exec("PR_COMTB_CORP01", "UPDATE", box);
				if(uSesEnt.use_auth.equals("SA")) { 
					commDBService.exec("PR_COMTB_CORP01", "UPDATE_SERVICE", box); 
				}
			}
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	// 로고파일 등록
	@RequestMapping(value = "/admenu/**/adm01003_upload.do")
	public void adm01003_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("ref_table", 	"COMTB_CORP01");
			box.put("ref_pk", 		box.get("corp_cd"));
			
			String cli_file_nm = box.getSourceFileNm("logo_file");
			String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + StringUtil.replace(box.get("ref_pk"),"|","_")+"."+file_type;
			box.springMoveFileToService("logo_file", CustomProperty.upload_dir, "photo", svr_file_nm);
			
			box.put("file_nm", 	 	cli_file_nm);
			box.put("file_path", 	svr_file_nm);
			box.put("file_type", 	file_type);
			box.put("file_size", 	box.getStoredFileSize("logo_file"));
			if(box.get("old_logo_file").equals("")) {
				commDBService.execBox("PR_COMTB_FILE01", "INSERT", box);
			}else {
				String file_path = CustomProperty.upload_dir + "admenu/" + box.get("old_logo_file");
				FileUtil.doDeleteFile(file_path);
				
				commDBService.exec("PR_COMTB_FILE01", "UPDATE_DOWNLOAD", box);
			}
			returnOkJsonResult(request, response);
		} catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adm02001_list															    */
	/* Description  : 공통코드 목록                                                    										*/ 
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm02001_list.do")	
	public String adm02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("search_key"));
		box.put("param02", 	box.get("search_val"));
		commDBService.execList("PR_COMTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "admenu/adm02001";
	}

	/********************************************************************************************/
	/* Method Name  : adm02002_edit													    		*/
	/* Description  : 공통코드 등록/수정화면                                                    								*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm02002_edit.do")
	public String adm02002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("code_group").equals("")) {
			commDBService.execBox("PR_COMTB_CODE01", "SELECT", box, "obox", request);
		}
    	return "admenu/adm02002";
	}

	/********************************************************************************************/
	/* Method Name  : adm02002_update														    */
	/* Description  : 공통코드 저장                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm02002_update.do")
	public void adm02002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			commDBService.exec("PR_COMTB_CODE01", box.get("action_type"), box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : adm02002_delete														    */
	/* Description  : 공통코드 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm02002_delete.do")
	public void adm02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_CODE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : adm02011_list																*/
	/* Description  : 공통코드 세부 목록                                                    									*/ 
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm02011_list.do")
	public String adm02011_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {		
		Box rbox = commDBService.execBox("PR_COMTB_CODE01", "SELECT", box, "obox", request);
		if(rbox.get("edit_flag").equals("X")) {
			box.put("param01", box.get("code_group")+"@"+uSesEnt.dbo); 
		}else {
			box.put("param01", box.get("code_group"));
		}
		commDBService.execList("PR_COMTB_CODE02_LIST", "LIST001", box, "rsWp", request);
		return "admenu/adm02011";
	}

	/********************************************************************************************/
	/* Method Name  : adm02012_edit																*/
	/* Description  : 공통코드 세부 등록/수정화면                                                    							*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm02012_edit.do")
	public String adm02012_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {				
		if(!box.get("code1").equals("")) {
			commDBService.execBox("PR_COMTB_CODE02", "SELECT", box, "obox", request);
		}
    	return "admenu/adm02012";
	}

	/********************************************************************************************/
	/* Method Name  : adm02012_update															*/
	/* Description  : 공통코드 세부 저장                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm02012_update.do")
	public void adm02012_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_CODE02", box.get("action_type"), box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : adm02012_delete												    		*/
	/* Description  : 공통코드 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm02012_delete.do")
	public void adm02012_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_CODE02", "DELETE" , box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : adm11001_list															    */
	/* Description  : 도움말 목록																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm11001_list.do")
	public String adm11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		box.put("param09", 	box.get("sort_order"));
		commDBService.execList("PR_COMTB_HELP01_LIST", "LIST001", box, "rsWp", request);
		return "admenu/adm11001";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm11002_edit																*/
	/* Description  : 도움말 등록/수정화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm11002_edit.do")
	public String adm11002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("menu_id").equals("")) {
			box.put("param01", box.get("menu_id"));
			commDBService.execBox("PR_COMTB_HELP01", "SELECT", box, "obox", request);
		}
		return "admenu/adm11002";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm11002_update														    */
	/* Description  : 도움말 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm11002_update.do")
	public void adm11002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_HELP01", "UPDATE", box);
	    	if(!box.getSourceFileNm("upload_file").equals("")) { 
	    		String cli_file_nm = box.getSourceFileNm("upload_file");
	    		String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
	    		String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + box.get("menu_id") + "." + file_type;
	    		box.springMoveFileToService("upload_file", CustomProperty.upload_dir, "userfile", svr_file_nm);
	    		
	    		box.put("ref_table",	"COMTB_HELP01");
	    		box.put("ref_pk",		box.get("menu_id"));
	    		box.put("file_nm",   	cli_file_nm);
	    		box.put("file_path", 	svr_file_nm);
	    		box.put("file_type", 	file_type);
	    		box.put("file_size", 	box.getStoredFileSize("upload_file"));
	    		if(box.get("file_path").equals("")) {
	    			commDBService.execBox("PR_COMTB_FILE01", "INSERT", box);
	    		}else {
	    			commDBService.exec("PR_COMTB_FILE01", "UPDATE_DOWNLOAD", box);
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
	/* Method Name  : adm21001_list															    */
	/* Description  : 월간주요일정																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm21001_list.do")
	public String adm21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception { 
		if(box.get("std_ym").equals(""))  { box.put("std_ym",  DateUtil.toString("yyyyMM")); }
		box.put("year", 	box.get("std_ym").substring(0,4));
		box.put("month", 	box.get("std_ym").substring(4));
	
		box.put("param01", box.get("std_ym"));
		commDBService.execList("PR_SYSTB_DATE01_LIST", "LIST001", box, "rsWp", request);
		return "admenu/adm21001";
		
	}
	/********************************************************************************************/
	/* Method Name  : adm21002_edit																*/
	/* Description  : 월간주요일정 수정화면                                                    								*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm21002_edit.do")
	public String adm21002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		System.out.println("sys_ymd =======" + box.get("sys_ymd"));
		commDBService.execBox("PR_SYSTB_DATE01", "SELECT", box, "obox", request);
    	return "admenu/adm21002";
	}

	/********************************************************************************************/
	/* Method Name  : adm21002_update															*/
	/* Description  : 월간주요일정 수정                                          										*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/**/adm21002_update.do")
	public void adm21002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("workday_yn", box.get("holiday_yn").equals("Y")?"N":"Y");
			commDBService.exec("PR_SYSTB_DATE01", "UPDATE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adm91001_list															    */
	/* Description  : 시스템접속현황																*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm91001_list.do")
	public String adm91001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		// 월별 접속추이
		box.put("sys_year", box.get("std_yy"));
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); box.put("sys_year", DateUtil.getYear()); }
		commDBService.execBox("PR_SYSTB_DATE01", "SELECT_MONTHLY", box, "obox", request);

		// 로그인 Top N
		if(box.get("connect_cnt").equals("")) { box.put("connect_cnt", "10"); }
		box.put("param01", 	box.get("connect_cnt"));
		commDBService.execList("PR_SYSTB_DATE01_LIST", "LIST002", box, "rsWp", request);

		return "admenu/adm91001";
	}

	/********************************************************************************************/
	/* Method Name  : adm92001_list															    */
	/* Description  : 시스템접속로그																*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm92001_list.do")
	public String adm92001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("corp_cd"));
		box.put("param02", box.get("start_ymd"));
		box.put("param03", box.get("end_ymd"));
		box.put("param04", box.get("search_key"));
		box.put("param05", box.get("search_val"));
		box.put("param09", box.get("sort_order"));
		box.put("param10", box.get("excel_yn"));
		commDBService.execList("PR_SYSTB_SLOG01_LIST", "LIST001", box, "rsWp", request);

		return "admenu/adm92001";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm94001_list															    */
	/* Description  : 회사별시스템접속통계															*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm94001_list.do")
	public String adm94001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		// 월별 접속추이
		box.put("sys_year", box.get("std_yy"));
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); box.put("sys_year", DateUtil.getYear()); }
		commDBService.execList("PR_SYSTB_SLOG01_LIST", "LIST002", box, "rsWp", request);		
		return "admenu/adm94001";
	}

	/********************************************************************************************/
	/* Method Name  : adm94002_list															    */
	/* Description  : 회사별 로그인 상세현황															*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm94002_list.do")
	public String adm94002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		// 로그인현황
		if(box.get("connect_cnt").equals("")) { box.put("connect_cnt", "1"); }
		box.put("param01", 	box.get("connect_cnt"));		
		box.put("param02", 	box.get("corp_cd"));		
		box.put("param03", 	"select_corp");
		commDBService.execList("PR_SYSTB_DATE01_LIST", "LIST002", box, "rsWp", request);		
		return "admenu/adm94002";
	}
	
	/********************************************************************************************/
	/* Method Name  : adm94003_select														    */
	/* Description  : 회사별 사원정보조회															*/
	/********************************************************************************************/
	@RequestMapping(value = "/admenu/adm94003_select.do")
	public String adm94003_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		// 사원정보조회
		commDBService.execBox("PR_INSTB_EMPL01", "SELECT_CORP_EMPL", box, "obox", request);
		return "/com/popup/employeePop";
	}	
}
