/************************************************************************************************/
/* Class Name    : ins10Controller                                                         		*/
/* Description   : 인사관리																			*/
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company         Author     Description                                   */
/* --    ----------    ---------       --------   ----------------------------------------------*/
/* 01    2014/03/28  신진아이티컨설팅  정 진 수   Initial Release						        				*/
/*																								*/
/************************************************************************************************/
package egovframework.ubiz.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cbiz.CD;
import egovframework.cbiz.Box;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.ExcelUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity; 
import egovframework.cbiz.crypto.SeedCipher;

@Controller
public class ins10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : ins01001_list														    	*/
	/* Description  : 임직원정보					 												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01001_list.do")
	public String ins01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01",	box.get("empl_class"));
		box.put("param02",	box.get("dept_cd"));
		box.put("param03",	box.get("search_key"));
		box.put("param04",	box.get("search_val"));
		box.put("param05",	box.get("retire_flag"));
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("param06", uSesEnt.empl_no); }
		box.put("param09",	box.get("sort_order"));
		commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST001", box, "rsWp", request);
		return "insa/ins01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : ins01001_upload												    		*/
	/* Description  : 임직원정보 업로드																*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01001_upload.do")
	public void ins01001_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			String cliFileNm = box.getSourceFileNm("uploadFile");
			String file_type = cliFileNm.substring(cliFileNm.lastIndexOf(".")+1);
			String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "." + file_type;
			box.springMoveFileToService("uploadFile", CustomProperty.upload_dir, "/", svrFileNm);
			
			String excelPath = (CustomProperty.upload_dir + "/" + svrFileNm);
			RsWrapper excelWp = ExcelUtil.getRsWp(excelPath, 0, 1, 0, 22);
			if(excelWp.getLength() < 2) { returnFailJsonResult("템플릿 입력형식 오류입니다.", request, response); transactionManager.rollback(tranStat); return; }
				
			box.put("param01",	"position_cd@"+box.get("dbo")+"|grade_cd@"+box.get("dbo")+"|bojik_cd|empl_class@"+box.get("dbo")+"|tel_no|hp_no|bank_cd|");
			RsWrapper codeWp = commDBService.execList("PR_COMTB_CODE02_LIST", "MULTCODE", box);
			
			box.put("param01", "");	box.put("param03", "ALL"); box.put("param10", "Y");
			RsWrapper deptWp = commDBService.execList("PR_INSTB_DEPT01_LIST", "LIST001", box);
			
			box.put("param03", "");	box.put("param05", "ALL"); box.put("param10", "Y");
			RsWrapper emplWp = commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST001", box);
			
			RsWrapper rsWp = new RsWrapper();
			for(int i=2; i < excelWp.getLength(); i++) {
				Box ibox = new Box("");
				for(int j=0; j < 22; j++) { ibox.put(excelWp.get("col"+j,1).trim(), excelWp.get("col"+j,i).trim()); }
				
				if(ibox.get("empl_no").equals("") || ibox.get("empl_no").length() < 4) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 사원번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("empl_nm").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 성명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				if(ibox.get("reside_no").equals("") || ibox.get("reside_no").length() < 7 || !StringUtil.containsCharOnly(ibox.get("reside_no"),"0123456789")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 주민번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("reside_no").substring(2,4).compareTo("01") < 0 || ibox.get("reside_no").substring(2,4).compareTo("13") > 0) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 주민번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("reside_no").substring(6,7),"12345678")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 주민번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				String birthYmd = (StringUtil.containsCharOnly(ibox.get("reside_no").substring(6,7),"1256") ? "19" : "20") + ibox.get("reside_no").substring(0,6);
				if(!DateUtil.isDate(birthYmd,"yyyyMMdd")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 주민번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("reside_no").length() != 13) { ibox.put("reside_no", ibox.get("reside_no").substring(0,7)+"xxxxxx"); }

				if(!ibox.get("birth_ymd").equals("") && !DateUtil.isDate(ibox.get("birth_ymd"),"yyyyMMdd")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 생년월일 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("solar_lunar").equals("양") || ibox.get("solar_lunar").equals("양력")) { ibox.put("solar_lunar", "S"); }
				else if(ibox.get("solar_lunar").equals("음") || ibox.get("solar_lunar").equals("음력")) { ibox.put("solar_lunar", "L"); }
				else if(ibox.get("solar_lunar").equals("")) { ibox.put("solar_lunar", ""); }
				else { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 양력/음력구분 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				if(ibox.get("dept_nm").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 부서명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				for(int k=0; k < deptWp.getLength(); k++) {
					if(deptWp.get("dept_nm",k).equals(ibox.get("dept_nm")) || deptWp.get("abbr_nm",k).equals(ibox.get("dept_nm"))) { 
						ibox.put("dept_cd", deptWp.get("dept_cd",k));
						break;
					}
				}
				if(ibox.get("dept_cd").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 부서명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				ibox.put("position_cd", codeFind(codeWp, "position_cd", ibox.get("position_nm")));
				if(ibox.get("position_cd").equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 직위명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				ibox.put("grade_cd", codeFind(codeWp, "grade_cd", ibox.get("grade_nm")));
				if(ibox.get("grade_cd").equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 직급명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				ibox.put("bojik_cd", codeFind(codeWp, "bojik_cd", ibox.get("bojik_nm")));
				if(ibox.get("bojik_cd").equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 보직명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				if(ibox.get("entry_ymd").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 입사일자 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				if(ibox.get("empl_status_nm").equals("재직")) { ibox.put("empl_status", "S"); }
				else if(ibox.get("empl_status_nm").equals("휴직")) { ibox.put("empl_status", "H"); }
				else if(ibox.get("empl_status_nm").equals("퇴직")) { ibox.put("empl_status", "T"); }
				else { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 재직상태 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				if(!ibox.get("hyutoi_ymd").equals("") && !DateUtil.isDate(ibox.get("hyutoi_ymd"),"yyyyMMdd")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴퇴일자 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				ibox.put("empl_class", codeFind(codeWp, "empl_class", ibox.get("empl_class_nm")));
				if(ibox.get("empl_class").equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 사원구분 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				if(!ibox.get("zip_no").equals("") && (ibox.get("zip_no").length() != 5 || !StringUtil.containsCharOnly(ibox.get("zip_no"),"0123456789"))) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 우편번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				if(ibox.get("tel_no").equals("")) { ibox.put("tel_no","--"); }
				String arr[] = StringUtil.split(ibox.get("tel_no"),"-",true);
				if(arr.length != 3) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 전화번호 형식 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("tel_no").length() > 2) { 
					if(!StringUtil.containsCharOnly(arr[0]+arr[1]+arr[2],"0123456789"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 전화번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(codeFind(codeWp, "tel_no", arr[0]).equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 전화번호(지역번호) 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(arr[1].length() < 3 || arr[1].length() > 4) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 전화번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(arr[2].length() != 4) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 전화번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				}
				
				if(ibox.get("hp_no").equals("")) { ibox.put("hp_no","--"); }
				arr = StringUtil.split(ibox.get("hp_no"),"-",true);
				if(arr.length != 3) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴대폰번호 형식 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("hp_no").length() > 2) { 
					if(!StringUtil.containsCharOnly(arr[0]+arr[1]+arr[2],"0123456789"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴대폰번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(codeFind(codeWp, "hp_no", arr[0]).equals("ERROR"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴대폰번호(통신사번호) 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(arr[1].length() < 3 || arr[1].length() > 4) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴대폰번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
					if(arr[2].length() != 4) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 휴대폰번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				}
				
				arr = StringUtil.split(ibox.get("email_id"),"@",true);
				if(arr.length != 2) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 이메일 형식 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				if(!StringUtil.containsCharOnly(ibox.get("nojo_yn"),"YN"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 노조가입여부 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				ibox.put("bank_cd", codeFind(codeWp, "bank_cd", ibox.get("bank_nm")));
				if(ibox.get("bank_cd").equals("ERROR")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 은행명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!ibox.get("account_no").equals("") && !StringUtil.containsCharOnly(ibox.get("account_no"),"0123456789-"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 계좌번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }

				ibox.put("action_type", "INSERT");
				ibox.put("use_auth", 	"G");
				for(int k=0; k < emplWp.getLength(); k++) {
					if(emplWp.get("empl_no",k).equals(ibox.get("empl_no"))) { 
						ibox.put("action_type", "UPDATE");
						ibox.put("user_id", 	emplWp.get("user_id",k));
						ibox.put("use_auth", 	emplWp.get("use_auth",k));
						break;
					}
				}
				if(ibox.get("action_type").equals("INSERT")) { ibox.put("pswd", SeedCipher.encode(ibox.get("empl_no"))); }
				rsWp.appendRs(ibox);
			}
			
			for(int i=0; i < rsWp.getLength(); i++) {
				Box sbox = rsWp.getRsBoxAt(i);
				sbox.put("dbo", 		box.get("dbo"));
				sbox.put("sys_reg_id", 	box.get("sys_reg_id"));
				commDBService.exec("PR_INSTB_EMPL01", rsWp.get("action_type",i), sbox);
			}
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	public String codeFind(RsWrapper codeWp, String code_group, String checkVal) {
		if(checkVal.equals("")) { return ""; }
		for(int i=0; i < codeWp.getLength(); i++) {
			if(codeWp.get("code_group",i).equals(code_group) && codeWp.get("data",i).equals(checkVal)) { return codeWp.get("code",i); }
		}
		return "ERROR";
	}

	/********************************************************************************************/
	/* Method Name  : ins01002_select												    		*/
	/* Description  : 임직원정보 상세조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01002_select.do")
	public String ins01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("empl_no", uSesEnt.empl_no); }
		commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		return "insa/ins01002";
	}

	/********************************************************************************************/
	/* Method Name  : ins01002_delete														    */
	/* Description  : 임직원정보 삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01002_delete.do")
	public void ins01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			Box ibox = new Box("");
			ibox.put("param01", box.get("dbo")+".INSTB_EMPL01");
	        ibox.put("param02", box.get("empl_no"));  
	        RsWrapper rsWp = commDBService.execList("PR_COMTB_FILE01_LIST", "LIST002", ibox);
	        if(rsWp.getLength() > 0) {
		        for(int i=0; i < rsWp.getLength(); i++) {
		    		String file_path = CustomProperty.upload_dir + "/" + rsWp.get("file_path",i);
		    		FileUtil.doDeleteFile(file_path);
		        }
		        ibox.put("ref_table", 	ibox.get("param01"));  
		        ibox.put("ref_pk", 	 	ibox.get("param02"));  
				commDBService.exec("PR_COMTB_FILE01", "DELETEALL", ibox);
	        }
			
			commDBService.exec("PR_INSTB_EMPL01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins01002_pswd_init														*/
	/* Description  : 비밀번호 초기화                                               												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01002_pswd_init.do")
	public void ins01002_pswd_init(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("pswd", SeedCipher.encode(box.get("empl_no")));
			commDBService.exec("PR_INSTB_EMPL01", "UPDATE_PSWD", box); 
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : ins01003_edit													    		*/
	/* Description  : 임직원정보 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01003_edit.do")
	public String ins01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("empl_no").equals("")) {
			if(!uSesEnt.use_auth.startsWith("S")) { box.put("empl_no", uSesEnt.empl_no); }
			commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		}
    	return "insa/ins01003";
	}

	/********************************************************************************************/
	/* Method Name  : ins01003_update														    */
	/* Description  : 임직원정보 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins01003_update.do")
	public void ins01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("reside_no", 	box.get("reside_no1")+box.get("reside_no2"));
			box.put("tel_no", 		box.get("tel_no1")+"-"+box.get("tel_no2")+"-"+box.get("tel_no3"));
			box.put("hp_no",		box.get("hp_no1")+"-"+box.get("hp_no2")+"-"+box.get("hp_no3"));
			
			if(box.get("action_type").equals("INSERT")) {
				box.put("pswd", SeedCipher.encode(box.get("empl_no")));
				commDBService.exec("PR_INSTB_EMPL01", box.get("action_type"), box);
			}else {
				commDBService.exec("PR_INSTB_EMPL01", box.get("action_type"), box);
			}
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	// 아이디 변경
	@RequestMapping(value = "/insa/**/ins01003_change_userid.do")
	public void ins01003_change_userid(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_INSTB_EMPL01", "UPDATE_ID", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	// 사진파일/서명파일 등록
	@RequestMapping(value = "/insa/**/ins01003_upload.do")
	public void ins01003_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("ref_table", 	box.get("dbo")+".INSTB_EMPL01");
			box.put("ref_pk", 		box.get("empl_no")+"|"+box.get("upload_type"));
			
			String upload_file = box.get("upload_type")+"_file";
			String cli_file_nm = box.getSourceFileNm(upload_file);
			String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
			String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + StringUtil.replace(box.get("ref_pk"),"|","_")+"."+file_type;
			box.springMoveFileToService(upload_file, CustomProperty.upload_dir, "photo", svr_file_nm);
			
			box.put("file_nm", 	 	cli_file_nm);
			box.put("file_path", 	svr_file_nm);
			box.put("file_type", 	file_type);
			box.put("file_size", 	box.getStoredFileSize(upload_file));
			if(box.get("old_"+upload_file).equals("")) {
				commDBService.execBox("PR_COMTB_FILE01", "INSERT", box);
			}else {
				String file_path = CustomProperty.upload_dir + "/" + box.get("old_"+upload_file);
				FileUtil.doDeleteFile(file_path);
				commDBService.exec("PR_COMTB_FILE01", "UPDATE_DOWNLOAD", box);
			}
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins02001_list															    */
	/* Description  : 학력사항 목록																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins02001_list.do")
	public String ins02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("empl_no"));
		commDBService.execList("PR_INSTB_EMPL11_LIST", "LIST001", box, "rsWp", request);
		return "insa/ins02001";
	}
	
	/********************************************************************************************/
	/* Method Name  : ins02002_edit																*/
	/* Description  : 학력사항 등록화면																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins02002_edit.do")
	public String ins02002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_INSTB_EMPL11", "SELECT", box, "obox", request);
		return "/insa/ins02002";
	}
	
	/********************************************************************************************/
	/* Method Name  : ins02002_update														    */
	/* Description  : 학력사항 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins02002_update.do")
	public void ins02002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_INSTB_EMPL11", box.get("actionType"), box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins02002_delete														    */
	/* Description  : 학력사항 삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins02002_delete.do")
	public void ins02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_INSTB_EMPL11", "DELETE", box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins03001_list															    */
	/* Description  : 가족사항 목록																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins03001_list.do")
	public String ins03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("empl_no"));
		commDBService.execList("PR_INSTB_EMPL12_LIST", "LIST001", box, "rsWp", request);
		return "insa/ins03001";
	}
	
	/********************************************************************************************/
	/* Method Name  : ins03002_edit																*/
	/* Description  : 가족사항 등록화면																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins03002_edit.do")
	public String ins03002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_INSTB_EMPL12", "SELECT", box, "obox", request);
		return "/insa/ins03002";
	}
	
	/********************************************************************************************/
	/* Method Name  : ins03002_update														    */
	/* Description  : 가족사항 등록/수정																*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins03002_update.do")
	public void ins03002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("reside_no", box.get("reside_no1")+box.get("reside_no2"));
			commDBService.exec("PR_INSTB_EMPL12", box.get("actionType"), box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins03002_delete														    */
	/* Description  : 가족사항 삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins03002_delete.do")
	public void ins03002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_INSTB_EMPL12", "DELETE", box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins11001_list															    */
	/* Description  : 사원명부 조회																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins11001_list.do")
	public String ins11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01",	box.get("empl_class"));  
		box.put("param02",	box.get("dept_cd"));  
		box.put("param03",	box.get("search_key"));
		box.put("param04",	box.get("search_val"));  
		box.put("param05",	box.get("retire_flag"));
		box.put("param09",	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		if(box.get("excel_yn").equals("P")) {
			Box ebox = commDBService.execXls("PR_INSTB_EMPL01_LIST", "LIST002", box);
			returnOkJsonResult(ebox, request, response);
			return null;
		}else {
			commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST002", box, "rsWp", request);
			return "/insa/ins11001";
		}
	}

	/********************************************************************************************/
	/* Method Name  : ins21001_list														    	*/
	/* Description  : 부서정보																		*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21001_list.do")
	public String ins21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01",	box.get("search_key"));
		box.put("param02",	box.get("search_val"));
		box.put("param03",	box.get("use_yn"));
		box.put("param09",	box.get("sort_order"));
		commDBService.execList("PR_INSTB_DEPT01_LIST", "LIST001", box, "rsWp", request);
		return "insa/ins21001";
	}

	/********************************************************************************************/
	/* Method Name  : ins21001_upload														    */
	/* Description  : 부서코드 업로드																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21001_upload.do")
	public void ins21001_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			String cliFileNm = box.getSourceFileNm("uploadFile");
			String file_type = cliFileNm.substring(cliFileNm.lastIndexOf(".")+1);
			String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "." + file_type;
			box.springMoveFileToService("uploadFile", CustomProperty.upload_dir, "/", svrFileNm);
			
			String excelPath = (CustomProperty.upload_dir + "/" + svrFileNm);
			RsWrapper excelWp = ExcelUtil.getRsWp(excelPath, 0, 1, 0, 5);
			if(excelWp.getLength() < 2) { returnFailJsonResult("템플릿 입력형식 오류입니다.", request, response); transactionManager.rollback(tranStat); return; }
				
			box.put("param03", "ALL"); box.put("param10", "Y");
			RsWrapper deptWp = commDBService.execList("PR_INSTB_DEPT01_LIST", "LIST001", box);
			RsWrapper rsWp = new RsWrapper();
			for(int i=2; i < excelWp.getLength(); i++) {
				Box ibox = new Box("");
				for(int j=0; j < 5; j++) { ibox.put(excelWp.get("col"+j,1).trim(), excelWp.get("col"+j,i).trim()); }
				
				int oldRow = -1;
				if(ibox.get("dept_cd").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 부서코드 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.get("dept_nm").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 부서명 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!ibox.get("open_ymd").equals("") && !DateUtil.isDate(ibox.get("open_ymd"),"yyyyMMdd")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 개설일자 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!ibox.get("close_ymd").equals("") && !DateUtil.isDate(ibox.get("close_ymd"),"yyyyMMdd")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 폐지일자 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				ibox.put("use_yn", 	ibox.get("close_ymd").equals("") ? "Y" : "N");
				
				for(int j=0; j < deptWp.getLength(); j++) {
					if(deptWp.get("dept_cd",j).equals(ibox.get("dept_cd"))) { oldRow = j; break; }
				}
				
				if(oldRow < 0) {
					ibox.put("action_type", "INSERT");
					ibox.put("inner_cd", 	ibox.get("dept_cd"));
					ibox.put("tel_no", 		"--");
					ibox.put("fax_no", 		"--");
				}else {
					ibox.put("action_type", "UPDATE");
					ibox.put("dept_desc", 	deptWp.get("dept_desc",oldRow));
					ibox.put("tel_no", 		deptWp.get("tel_no",oldRow));
					ibox.put("fax_no", 		deptWp.get("fax_no",oldRow));
					ibox.put("upper_cd", 	deptWp.get("upper_cd",oldRow));
					ibox.put("inner_cd", 	deptWp.get("inner_cd",oldRow));
					ibox.put("dept_lvl", 	deptWp.get("dept_lvl",oldRow));
					ibox.put("sort_order", 	deptWp.get("sort_order",oldRow));
				}
				rsWp.appendRs(ibox);
			}

			for(int i=0; i < rsWp.getLength(); i++) {
				Box sbox = rsWp.getRsBoxAt(i);
				sbox.put("dbo", 		box.get("dbo"));
				sbox.put("sys_reg_id", 	box.get("sys_reg_id"));
				commDBService.exec("PR_INSTB_DEPT01", rsWp.get("action_type",i), sbox);
			}
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : ins21002_select												    		*/
	/* Description  : 부서코드 상세조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21002_select.do")
	public String ins21002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_INSTB_DEPT01", "SELECT", box, "obox", request);
		return "insa/ins21002";
	}

	/********************************************************************************************/
	/* Method Name  : ins21002_delete														    */
	/* Description  : 부서코드 삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21002_delete.do")
	public void ins21002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_INSTB_DEPT01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : ins21003_edit													    		*/
	/* Description  : 부서코드 등록/수정화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21003_edit.do")
	public String ins21003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("dept_cd").equals("")) {
			commDBService.execBox("PR_INSTB_DEPT01", "SELECT", box, "obox", request);
		}
    	return "insa/ins21003";
	}

	/********************************************************************************************/
	/* Method Name  : ins21003_update														    */
	/* Description  : 부서코드 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/insa/**/ins21003_update.do")
	public void ins21003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("region_cd", FormatUtil.nvl2(box.get("region_cd2"),box.get("region_cd1")));
			box.put("tel_no", 	 box.get("tel_no1")+"-"+box.get("tel_no2")+"-"+box.get("tel_no3"));
			box.put("fax_no", 	 box.get("fax_no1")+"-"+box.get("fax_no2")+"-"+box.get("fax_no3"));
			
			commDBService.exec("PR_INSTB_DEPT01", box.get("action_type"), box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
}
