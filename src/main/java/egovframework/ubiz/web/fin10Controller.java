/************************************************************************************************/
/* Class Name    : fin10Controller                                                         		*/
/* Description   : 자금관리																			*/
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

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.ExcelUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

@Controller
public class fin10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : crd01001_list															    */
	/* Description  : 법인(복지)카드 관리																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd01001_list.do")
	public String crd01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("card_type"));
        box.put("param02", 	box.get("search_key"));
        box.put("param03", 	box.get("search_val"));
        box.put("param04", 	box.get("use_yn"));
        box.put("param09", 	box.get("sort_order"));
        box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_FINTB_CARD01_LIST", "LIST001", box, "rsWp", request);
		return "finance/crd01001";
	}

	/********************************************************************************************/
	/* Method Name  : crd01002_edit													    		*/
	/* Description  : 법인(복지)카드 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd01002_edit.do")
	public String crd01002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("card_no").equals("")) {
			commDBService.execBox("PR_FINTB_CARD01", "SELECT", box, "obox", request);
		}
    	return "finance/crd01002";
	}

	/********************************************************************************************/
	/* Method Name  : crd01002_update														    */
	/* Description  : 법인(복지)카드 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd01002_update.do")
	public void crd01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			box.put("finish_ym", box.get("finish_yy")+box.get("finish_mm"));
			commDBService.exec("PR_FINTB_CARD01", box.get("action_type"), box);
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
	/* Method Name  : crd01002_delete														    */
	/* Description  : 복지법인(복지)카드 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd01002_delete.do")
	public void crd01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_FINTB_CARD01", "DELETE", box);
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
	/* Method Name  : crd11001_list															    */
	/* Description  : 복지카드 청구서 등록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd11001_list.do")
	public String crd11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("apply_yy").equals("")) { box.put("apply_yy", DateUtil.toString("yyyy")); }
		if(box.get("apply_mm").equals("")) { box.put("apply_mm", DateUtil.toString("MM")); }
		
		box.put("apply_ym", box.get("apply_yy")+box.get("apply_mm"));
		commDBService.execBox("PR_FINTB_CARD11", "SELECT", box, "obox", request);
		
		box.put("param01", 	box.get("apply_ym"));
        box.put("param09", 	box.get("sort_order"));  		
        box.put("param10", 	box.get("excel_yn"));  		
		commDBService.execList("PR_FINTB_CARD12_LIST", "LIST001", box, "rsWp", request);

		return "finance/crd11001";
	}

	/********************************************************************************************/
	/* Method Name  : crd11001_upload															*/
	/* Description  : 복지카드 청구서 파일 업로드                                                 										*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd11001_upload.do")
	public void crd11001_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			String cliFileNm = box.getSourceFileNm("uploadFile");
			String file_type = cliFileNm.substring(cliFileNm.lastIndexOf(".")+1);
			String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "." + file_type;
			box.springMoveFileToService("uploadFile", CustomProperty.upload_dir, "/", svrFileNm);
			
			String excelPath = (CustomProperty.upload_dir + "/" + svrFileNm);
			RsWrapper excelWp = ExcelUtil.getRsWp(excelPath, 0, 1, 0, 8);
			if(excelWp.getLength() < 2) { returnFailJsonResult("템플릿 입력형식 오류입니다.", request, response); transactionManager.rollback(tranStat); return; }
			
			box.put("param05", "ALL"); box.put("param10", "Y");
			RsWrapper emplWp = commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST001", box);
			
			RsWrapper rsWp = new RsWrapper();
			for(int i=1; i < excelWp.getLength(); i++) {		
				if(excelWp.get("col0",i).equals("")) { break; }
				
				Box ibox = new Box("");
				ibox.put("card_no", 	StringUtil.replace(StringUtil.replace(excelWp.get("col0",i),"-",""),"'","").trim());
				ibox.put("empl_no", 	StringUtil.replace(excelWp.get("col1",i),"'","").trim());
				ibox.put("empl_nm", 	StringUtil.replace(excelWp.get("col2",i),"'","").trim());
				ibox.put("apply_cnt", 	StringUtil.replace(excelWp.get("col3",i),",","").trim());
				ibox.put("apply_amt", 	StringUtil.replace(excelWp.get("col4",i),",","").trim());
				ibox.put("charge_amt", 	StringUtil.replace(excelWp.get("col5",i),",","").trim());
				ibox.put("etc_remark", 	excelWp.get("col7",i).trim());
				boolean isOk = false;	
				for(int k=0; k < emplWp.getLength(); k++) {
					if(emplWp.get("empl_no",k).equals(ibox.get("empl_no"))) { isOk = true; break; } 
				}
				if(!isOk) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : "+ibox.get("empl_nm")+"("+ibox.get("empl_no")+") 존재하지 않은 사번입니다.", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("card_no"),"0123456789*"))  { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 카드번호 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("apply_cnt"),"0123456789")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 청구건수 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("apply_amt"),"0123456789-")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 청구금액 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("charge_amt"),"0123456789")){ returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 수수료 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				
				rsWp.appendRs(ibox);
			}
			
			int card_cnt = 0;
			box.put("apply_ym", box.get("apply_yy")+box.get("apply_mm"));
			commDBService.exec("PR_FINTB_CARD11", "DELETE", box);
			commDBService.exec("PR_FINTB_CARD11", "INSERT", box);
			
			for(int i=0; i < rsWp.getLength(); i++) {
				Box sbox = rsWp.getRsBoxAt(i);
				sbox.put("dbo", 		box.get("dbo"));
				sbox.put("apply_ym", 	box.get("apply_ym"));
				sbox.put("sys_reg_id", 	box.get("sys_reg_id"));
				commDBService.exec("PR_FINTB_CARD12", "INSERT", sbox);
				card_cnt++;
			}
			if(card_cnt > 0) { commDBService.exec("PR_FINTB_CARD11", "UPDATE_SUMMARY", box); }
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : crd11001_create_slip												    	*/
	/* Description  : 복지카드 정산전표 분개																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd11001_create_slip.do")
	public String crd11001_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("search_key",	box.get("apply_yy")+box.get("apply_mm"));
		commDBService.execBox("PR_AUTO_SLIP", "FINTB_CARD11", box);
        return alertNRedirect("정산전표가 생성되었습니다.", "crd11001_list.do", "apply_yy, apply_mm", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : crd11001_delete_all												    	*/
	/* Description  : 복지카드 청구서 전체 삭제															*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd11001_delete_all.do")
	public String crd11001_delete_all(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("apply_ym", box.get("apply_yy")+box.get("apply_mm"));
		commDBService.exec("PR_FINTB_CARD11", "DELETE", box);
        return alertNRedirect("삭제되었습니다.", "crd11001_list.do", "apply_yy, apply_mm", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : crd21001_list															    */
	/* Description  : 복지카드 사용내역																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/crd21001_list.do")
	public String crd21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("apply_yy").equals("")) { box.put("apply_yy", DateUtil.toString("yyyy")); }
		
		box.put("param01", 	box.get("apply_yy")); 
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_FINTB_CARD12_LIST", "LIST002", box, "rsWp", request);
		return new String("finance/crd21001");
	}

	/********************************************************************************************/
	/* Method Name  : fin01001_list															    */
	/* Description  : 자금운용현황																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin01001_list.do")
	public String fin01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", DateUtil.toString("yyyy")); }
		if(box.get("std_month").equals("")) { box.put("std_month", DateUtil.toString("MM")); }

		box.put("param01", box.get("std_year")+box.get("std_month"));
		commDBService.execList("PR_ACCTB_SUMM01_LIST", "LIST004", box, "rsWp", request);
		return "finance/fin01001"; 
	}

	/********************************************************************************************/
	/* Method Name  : fin11001_list															    */
	/* Description  : 예적금관리																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin11001_list.do")
	public String fin11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("bank_cd"));
		box.put("param02", 	box.get("acct_cd"));
		box.put("param03", 	box.get("search_key"));
		box.put("param04", 	box.get("search_val"));
		box.put("param05", 	box.get("use_yn"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_FINTB_ACNO01_LIST", "LIST001", box, "rsWp", request);
		return "finance/fin11001";
	}

	/********************************************************************************************/
	/* Method Name  : fin11002_edit													    		*/
	/* Description  : 예적금계좌 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin11002_edit.do")
	public String fin11002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("account_no").equals("")) {
			commDBService.execBox("PR_FINTB_ACNO01", "SELECT", box, "obox", request);
		}
    	return "finance/fin11002";
	}

	/********************************************************************************************/
	/* Method Name  : fin11002_update														    */
	/* Description  : 예적금계좌 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin11002_update.do")
	public void fin11002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_FINTB_ACNO01", box.get("action_type"), box);
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
	/* Method Name  : fin11002_delete														    */
	/* Description  : 예적금계좌 삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin11002_delete.do")
	public void fin11002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_FINTB_ACNO01", "DELETE", box);
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
	/* Method Name  : fin12001_list															    */
	/* Description  : 예적금 거래내역 조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin12001_list.do")
	public String fin12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }

		box.put("param01", 	box.get("start_ymd"));
		box.put("param02", 	box.get("end_ymd"));
		box.put("param03", 	box.get("account_no"));
		box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_FINTB_ACNO01_LIST", "LIST002", box, "rsWp", request);
		return "finance/fin12001";
	}
	
	/********************************************************************************************/
	/* Method Name  : fin13001_list													    		*/
	/* Description  : 예적금 이체																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13001_list.do")
	public String fin13001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("slip_ymd_from").equals("")) { box.put("slip_ymd_from", 	DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -30, "yyyyMMdd", "D")); }
		if(box.get("slip_ymd_to").equals("")) { box.put("slip_ymd_to", 	DateUtil.toString("yyyyMMdd")); }
		
		box.put("param01", "1|"+box.get("slip_ymd_from")+"|"+box.get("slip_ymd_to"));
		box.put("param03", "B30");
		commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST001", box, "rsWp", request);
		return "finance/fin13001";
	}
	
	/********************************************************************************************/
	/* Method Name  : fin13002_write														    */
	/* Description  : 예적금 이체 등록화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13002_write.do")
	public String fin13002_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "finance/fin13002";
	}
	
	/********************************************************************************************/
	/* Method Name  : fin13002_edit															    */
	/* Description  : 예적금 이체 수정화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13002_edit.do")
	public String fin13002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);

		rbox.put("dbo", uSesEnt.dbo);
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST001B", box, "rsWp", request);
		
		if(rbox.get("sign_status").equals("1") || rbox.get("sign_status").equals("4")) {
			return "finance/fin13002";
		}else {
			return "finance/fin13003";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : fin13002_update															*/
	/* Description  : 예적금 이체 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13002_update.do")
	public void fin13002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box ibox = new Box("");
		Box rbox = new Box("");
		ibox.put("dbo", uSesEnt.dbo);
		ibox.put("subject", 	box.get("subject"));
		ibox.put("etc_remark", 	box.get("subject"));
		ibox.put("acc_unit", 	"20");
		ibox.put("proof_ymd", 	box.get("proof_ymd"));
		ibox.put("sys_reg_id", 	box.get("sys_reg_id"));

		TransactionStatus tranStat = getTransactionStatus();
		try {
			if(box.get("slip_no").equals("")) { 
				ibox.put("slip_no", DateUtil.toString("yyyyMMdd")+"B"); 
				ibox.put("biz_type","B30"); 
				rbox = commDBService.execBox("PR_ACCTB_SLIP01", "INSERT", ibox);
				ibox.put("slip_no", rbox.get("slip_no"));
			}else {
				ibox.put("slip_no", box.get("slip_no"));
				commDBService.exec("PR_ACCTB_SLIP01", "UPDATE", ibox);
				commDBService.exec("PR_ACCTB_SLIP02", "DELETEALL", ibox);
			}

			for(int i=0; i < box.getInt("input_cnt"); i++) {
				// 출금내역
				if(box.get("cd_flag"+i).equals("2")) {
					ibox.put("cd_flag", 	"2");
					ibox.put("acct_cd", 	box.get("acct_cd"+i));
					ibox.put("rel_no", 		box.get("rel_no"+i));
					ibox.put("rel_no_type", box.get("acct_cd"+i).startsWith("11105") ? "14" : "11");
					ibox.put("slip_amt", 	box.get("slip_amt"+i));
					ibox.put("cust_cd", 	box.get("cust_cd"+i));
					ibox.put("cust_nm", 	box.get("cust_nm"+i));
					commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					
					// 이자수익
					if(box.getLong("intr_amt"+i) != 0) {
						ibox.put("cd_flag", 	"2");
						ibox.put("acct_cd", 	box.get("acct_cd"+i).startsWith("11105") ? "6100401" : "6100101");
						ibox.put("slip_amt", 	box.get("intr_amt"+i));
						commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					}		

					// 선급법인세(법인세)
					if(box.getLong("ltax_amt"+i) != 0) {
						ibox.put("cd_flag", 	"1");
						ibox.put("acct_cd", 	"1110901");
						ibox.put("rel_amt", 	box.get("intr_amt"+i));
						ibox.put("tax_rate", 	box.get("tax_rate"+i));
						ibox.put("slip_amt", 	box.get("ltax_amt"+i));
						commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					}		

					// 선급법인세(지방세)
					if(box.getLong("ljum_amt"+i) != 0) {
						ibox.put("cd_flag", 	"1");
						ibox.put("acct_cd", 	"1110902");
						ibox.put("tax_rate", 	"");
						ibox.put("slip_amt", 	box.get("ljum_amt"+i));
						commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					}		

				// 입금내역
				}else if(box.get("cd_flag"+i).equals("1")) {
					ibox.put("cd_flag", 	"1");
					ibox.put("acct_cd", 	box.get("acct_cd"+i));
					ibox.put("rel_no", 		box.get("rel_no"+i));
					ibox.put("rel_no_type", box.get("acct_cd"+i).startsWith("11105") ? "14" : "11");
					ibox.put("rel_amt", 	"");
					ibox.put("tax_rate", 	"");
					ibox.put("slip_amt", 	box.get("slip_amt"+i));
					ibox.put("cust_cd", 	box.get("cust_cd"+i));
					ibox.put("cust_nm", 	box.get("cust_nm"+i));
					commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
				}
			}
			
			commDBService.exec("PR_ACCTB_SLIP01", "UPDATE_SUMMARY", ibox);
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
	/* Method Name  : fin13002_delete														    */
	/* Description  : 예적금 이체 삭제 	                                           					*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13002_delete.do")
	public void fin13002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
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
	/* Method Name  : fin13003_select														    */
	/* Description  : 예적금 이체 상세조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin13003_select.do")
	public String fin13003_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
		
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST001B", box, "rsWp", request);
		
		return "finance/fin13003";
	}
	
	/********************************************************************************************/
	/* Method Name  : fin21001_list															    */
	/* Description  : 미지급금 결제																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin21001_list.do")
	public String fin21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", 	DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -30, "yyyyMMdd", "D")); }
		if(box.get("end_ymd").equals(""))   { box.put("end_ymd", 	DateUtil.toString("yyyyMMdd")); }
		if(box.get("cd_flag").equals(""))   { box.put("cd_flag", "2"); }

		box.put("param01", box.get("cd_flag"));
		if(box.get("cd_flag").equals("1")) {
			box.put("slip_no", box.get("p_slip_ymd")+box.get("p_slip_no"));
			commDBService.execBox("PR_ACCTB_SLIP01", "SELECT", box, "obox", request);

			box.put("param04", box.get("slip_no"));
		}else {
			box.put("param02", box.get("start_ymd"));
			box.put("param03", box.get("end_ymd"));
			box.put("param05", box.get("search_key"));
			box.put("param06", box.get("search_val"));
		}
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST006", box, "rsWp", request);
		
		return "finance/fin21001";
	}
	
	/********************************************************************************************/
	/* Method Name  : fin21001_insert														    */
	/* Description  : 미지급금 결제 등록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin21001_insert.do")
	public String fin21001_insert(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("search_key", box.get("slip_key"));
		Box rbox = commDBService.execBox("PR_AUTO_SLIP", "FINTB_EPAY01", box);
		box.put("p_slip_ymd", 	StringUtil.substr(rbox.get("slip_no"),0,8));
		box.put("p_slip_no", 	StringUtil.substr(rbox.get("slip_no"),8));
		return alertNRedirect("저장되었습니다.", "fin21001_list.do?cd_flag=1", "p_slip_ymd, p_slip_no", request);
	}

	/********************************************************************************************/
	/* Method Name  : fin21001_delete														    */
	/* Description  : 미지급금 결제 삭제                                                    											*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin21001_delete.do")
	public String fin21001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("search_key", "21001");
		box.put("slip_no", box.get("p_slip_ymd")+box.get("p_slip_no"));
		commDBService.exec("PR_ACCTB_SLIP01", "DELETE_RSLIP", box);
		return alertNRedirect("삭제되었습니다.", "fin21001_list.do", "", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : fin21002_list															    */
	/* Description  : 미지급금 결제내역 조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/finance/**/fin21002_list.do")
	public String fin21002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "SELECT", box, "obox", request);
		if(rbox.get("slip_no").equals("")) { 
			return alertNRedirect("삭제된 문서입니다.", "/com/redirect.do?reqUrl=com/blank", "", request); 
		}
		box.put("param01", "1");
		box.put("param04", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST006", box, "rsWp", request);
		return "finance/fin21002";
	}
	
}
