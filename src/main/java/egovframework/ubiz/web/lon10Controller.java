/************************************************************************************************/
/* Class Name    : lon10Controller                                                         		*/
/* Description   : 대부사업																			*/
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
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.log.SysoLogger;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.ExcelUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

@Controller
public class lon10Controller extends abstractController {
	
	/********************************************************************************************/
	/* Method Name  : lon01001_list														    	*/
	/* Description  : 대부사업 신청서 메인																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon01001_list.do")
	public String lon01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("empl_no", uSesEnt.empl_no); }
		 
		box.put("param01", 		box.get("start_ymd"));
		box.put("param02", 		box.get("end_ymd"));
		box.put("param03", 		box.get("search_key")); 
		box.put("param04", 		box.get("search_val"));
		box.put("param05", 		box.get("bugt_cd"));
		box.put("param06", 		box.get("empl_no"));
		box.put("param07", 		box.get("pro_status"));
		box.put("param09", 		box.get("sort_order"));
		commDBService.execList("PR_BOKTB_LOAN01_LIST", "LIST001", box, "rsWp", request);
    	return "loan/lon01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : lon01002_select												    		*/
	/* Description  : 대부사업 신청서 조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon01002_select.do")
	public String lon01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_BOKTB_LOAN01", "SELECT", box, "obox", request);
		if(rbox.get("loan_no").equals("")) { 
			return alertNRedirect("삭제된 문서입니다.", "/com/redirect.do?reqUrl=com/blank", "", request); 
		}
		box.put("bugt_cd", rbox.get("bugt_cd"));
		Box ibox = commDBService.execBox("PR_BUDTB_CODE01", "SELECT", box);
		box.put("param01", 	box.get("loan_no"));
		box.put("param02",  box.get("bugt_cd"));
		commDBService.execList("PR_BOKTB_LOAN11_LIST", "LIST001", box, "rsWp", request);
		if(rbox.get("sign_status").equals("3") && !rbox.get("finish_flag").equals("2")){
			if(ibox.get("refund_method").equals("10")){ 
				commDBService.execList("PR_BOKTB_LOAN11_LIST", "LIST003", box, "calcWp", request);
			}else if(ibox.get("refund_method").equals("20")){
				commDBService.execList("PR_BOKTB_LOAN11_LIST", "LIST004", box, "calcWp", request);
			}
		}
		return "loan/lon01002";
	}
	
	/********************************************************************************************/
	/* Method Name  : lon01002_delete														    */
	/* Description  : 대부사업 신청서 삭제                                                    											*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon01002_delete.do")
	public void lon01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_BOKTB_LOAN01", "DELETE", box);
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
	/* Method Name  : lon01003_edit												    			*/
	/* Description  : 대부사업 신청서 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon01003_edit.do")
	public String lon01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("loan_no").equals("")) {
			if(box.get("empl_no").equals("")) {
				box.put("empl_no", uSesEnt.empl_no); 
			}
			commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		}else {
			commDBService.execBox("PR_BOKTB_LOAN01", "SELECT", box, "obox", request);
		}
		return "loan/lon01003";
	}

	/********************************************************************************************/
	/* Method Name  : lon01003_update												    		*/
	/* Description  : 대부사업 신청서 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon01003_update.do")
	public void lon01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			if(box.get("loan_no").equals("")) {
				Box rbox = commDBService.execBox("PR_BOKTB_LOAN01", "INSERT", box);
				box.put("loan_no", rbox.get("loan_no"));
			}else {
				commDBService.exec("PR_BOKTB_LOAN01", "UPDATE", box);
			}

			if(!box.get("slip_status").equals("2") && !box.get("slip_status").equals("3")) {
				box.put("search_key",	box.get("loan_no"));
				commDBService.execBox("PR_AUTO_SLIP", "BOKTB_LOAN01", box);
			}
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
	/* Method Name  : lon11001_list														    	*/
	/* Description  : 대부금 월별상환 																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon11001_list.do")
	public String lon11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.toString("yyyy")); }
		if(box.get("std_mm").equals("")) { box.put("std_mm", DateUtil.toString("MM")); }

		// 월별 상환기준
		box.put("std_ym", box.get("std_yy")+box.get("std_mm"));
		Box obox = commDBService.execBox("PR_BOKTB_LOAN12", "SELECT", box, "obox", request);
		if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("3")) {
			box.put("param01", 	box.get("std_yy")+box.get("std_mm"));
			box.put("param02", 	box.get("bugt_cd"));
			box.put("param03", 	box.get("search_key"));
			box.put("param04", 	box.get("search_val"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	box.get("excel_yn"));
			commDBService.execList("PR_BOKTB_LOAN11_LIST", "LIST002", box, "rsWp", request);
	    	return new String("loan/lon11002");
		}else {
			box.put("param01", 	obox.get("refund_ymd"));
			box.put("param02", 	obox.get("start_ymd"));
			box.put("param03", 	obox.get("end_ymd"));
			box.put("param04", 	box.get("bugt_cd"));
			box.put("param05", 	box.get("search_key"));
			box.put("param06", 	box.get("search_val"));
			box.put("param10", 	box.get("excel_yn"));
			commDBService.execList("PR_BOKTB_LOAN01_LIST", "LIST004", box, "rsWp", request);
	    	return "loan/lon11001";
		}
	}

	/********************************************************************************************/
	/* Method Name  : lon11001_calculate													    */
	/* Description  : 대부금 월별상환 이자계산															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon11001_calculate.do")
	public String lon11001_calculate(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("std_ym", box.get("std_yy")+box.get("std_mm"));
		Box obox = commDBService.execBox("PR_BOKTB_LOAN12", "SELECT", box);

		box.put("pay_key",		box.get("std_ym"));
		box.put("refund_ymd", 	obox.get("refund_ymd"));
		box.put("start_ymd", 	obox.get("start_ymd"));
		box.put("end_ymd", 		obox.get("end_ymd"));
		commDBService.exec("PR_BOKTB_LOAN11", "CALCULATE", box);

		return alertNRedirect("계산되었습니다.", "lon11001_list.do", "std_yy, std_mm", request);
	}

	/********************************************************************************************/
	/* Method Name  : lon11001_create_slip														*/
	/* Description  : 대부금 월별상환 전표분개															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon11001_create_slip.do")
	public String lon11001_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("search_key",	box.get("std_yy")+box.get("std_mm"));
		box.put("account_no",	box.get("account_no1")+"|"+box.get("account_no2"));
		commDBService.execBox("PR_AUTO_SLIP", "BOKTB_LOAN12", box);
		return alertNRedirect("전표가 생성되었습니다.", "lon11001_list.do", "std_yy, std_mm", request);
	}

	/********************************************************************************************/
	/* Method Name  : lon11001_delete															*/
	/* Description  : 대부금 월별상환 전체삭제															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon11001_delete.do")
	public String lon11001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("pay_key",	box.get("std_yy")+box.get("std_mm"));
		commDBService.exec("PR_BOKTB_LOAN11", "DELETE_MONTHLY", box);
		return alertNRedirect("삭제되었습니다.", "lon11001_list.do", "std_yy, std_mm", request);
	}

	/********************************************************************************************/
	/* Method Name  : lon11001_upload												    		*/
	/* Description  : 대부금 엑셀 업로드 등록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon11001_upload.do")
	public void lon11001_upload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			String cliFileNm = box.getSourceFileNm("uploadFile");
			String file_type = cliFileNm.substring(cliFileNm.lastIndexOf(".")+1);
			String svrFileNm = DateUtil.toString("yyyyMMddHHmmssS") + "." + file_type;
			box.springMoveFileToService("uploadFile", CustomProperty.upload_dir, "/", svrFileNm);
			
			String excelPath = (CustomProperty.upload_dir + "/" + svrFileNm);
			RsWrapper excelWp = ExcelUtil.getRsWp(excelPath, 0, 1, 0, 6);
			if(excelWp.getLength() < 3) { returnFailJsonResult("템플릿 입력형식 오류입니다.", request, response); transactionManager.rollback(tranStat); return; }
			
			box.put("std_ym", 	box.get("pay_key"));
			Box obox = commDBService.execBox("PR_BOKTB_LOAN12", "SELECT", box);
			if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("3")) {
				returnFailJsonResult("당월 대부금 상환전표가 승인 또는 승인대기 중이므로 업로드할 수 없습니다.", request, response); transactionManager.rollback(tranStat); return; 
			}else if(obox.get("start_ymd").equals("") || obox.get("end_ymd").equals("") || obox.getInt("gongje_cnt") == 0) {
				returnFailJsonResult("당월 대부금 상환기준정보가 등록되지 않았습니다.", request, response); transactionManager.rollback(tranStat); return;
			}
			box.put("param01", 	obox.get("refund_ymd"));
			box.put("param02", 	obox.get("start_ymd"));
			box.put("param03", 	obox.get("end_ymd"));
			box.put("param10", 	"Y");
			RsWrapper loanWp = commDBService.execList("PR_BOKTB_LOAN01_LIST", "LIST004", box);

			RsWrapper rsWp = new RsWrapper();
			for(int i=2; i < excelWp.getLength(); i++) {
				Box ibox = new Box("");
				for(int j=0; j < 6; j++) { ibox.put(excelWp.get("col"+j,1).trim(), StringUtil.replace(StringUtil.replace(StringUtil.replace(excelWp.get("col"+j,i).trim(), "-", ""), ".0", ""),".","")); }
				ibox.put("refund_ymd", 	obox.get("refund_ymd"));
				ibox.put("pay_key", 	box.get("pay_key"));
				for(int k=0; k < loanWp.getLength(); k++) {
					if(loanWp.get("empl_no",k).equals(ibox.get("empl_no")) && loanWp.get("loan_ymd",k).equals(ibox.get("loan_ymd")) && 
					   (loanWp.get("bugt_cd",k).equals(ibox.get("bugt_cd")) || ibox.get("bugt_cd").equals(""))) { 
						ibox.put("loan_no", 	loanWp.get("loan_no",k));
						ibox.put("start_ymd", 	loanWp.get("start_ymd",k));
						ibox.put("end_ymd", 	loanWp.get("end_ymd",k));
						ibox.put("intr_ilsu", 	loanWp.get("intr_ilsu",k));
						ibox.put("gongje_cnt", 	loanWp.get("gongje_cnt",k));
						ibox.put("remain_amt", 	loanWp.get("remain_amt",k));
						break;
					}
				}
				if(ibox.get("loan_no").equals("")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : "+ibox.get("empl_nm")+"님의 상환대상 대부금이 존재하지 않습니다.", request, response); transactionManager.rollback(tranStat); return; }

				ibox.put("refund_amt", 	StringUtil.replace(ibox.get("refund_amt"),",",""));
				ibox.put("intr_amt", 	StringUtil.replace(ibox.get("intr_amt"),",",""));
				if(!StringUtil.containsCharOnly(ibox.get("refund_amt"),"0123456789")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 원금 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(!StringUtil.containsCharOnly(ibox.get("intr_amt"),"0123456789")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : 이자 오류!!!", request, response); transactionManager.rollback(tranStat); return; }
				if(ibox.getLong("refund_amt") > ibox.getLong("remain_amt")) { returnFailJsonResult(String.valueOf(i+1)+"번째 라인 : "+ibox.get("empl_nm")+"님의 상환금액이 대부금 잔액을 초과합니다.", request, response); transactionManager.rollback(tranStat); return; }
					
				rsWp.appendRs(ibox);
			}
			
			box.put("slip_no", 	obox.get("slip_no"));
			commDBService.exec("PR_BOKTB_LOAN11", "DELETE_MONTHLY", box);

			for(int i=0; i < rsWp.getLength(); i++) {
				Box sbox = rsWp.getRsBoxAt(i);
				sbox.put("dbo", 		box.get("dbo"));
				sbox.put("sys_reg_id", 	box.get("sys_reg_id"));
				commDBService.exec("PR_BOKTB_LOAN11", "UPLOAD", sbox);
			}
			box.put("pro_status", 	"1");
			commDBService.exec("PR_BOKTB_LOAN12", "UPDATE_STATUS", box);
			
			transactionManager.commit(tranStat);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : lon12001_list														    	*/
	/* Description  : 대부금 일시상환 - 대부금 선택															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon12001_list.do")
	public String lon12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("finish_flag").equals("")) { box.put("finish_flag","1"); }
		
		box.put("param01", box.get("bugt_cd"));
		box.put("param02", box.get("search_key"));
		box.put("param03", box.get("search_val"));
		box.put("param04", box.get("finish_flag"));
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("param05", uSesEnt.empl_no); }
		commDBService.execList("PR_BOKTB_LOAN01_LIST", "LIST003", box, "rsWp", request);
		
    	return "loan/lon12001";
	}

	/********************************************************************************************/
	/* Method Name  : lon12002_list															    */
	/* Description  : 대부금 일시상환 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon12002_list.do")
	public String lon12002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_BOKTB_LOAN01", "SELECT", box, "obox", request);
		if(rbox.get("loan_no").equals("")) { 
			return alertNRedirect("삭제된 문서입니다.", "/com/redirect.do?reqUrl=com/blank", "", request); 
		}
		box.put("param01", box.get("loan_no"));
		commDBService.execList("PR_BOKTB_LOAN11_LIST", "LIST001", box, "rsWp", request);
		
    	return "loan/lon12002";
	}
	
	/********************************************************************************************/
	/* Method Name  : lon12002_update														    */
	/* Description  : 대부금 일시상환 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon12002_update.do")
	public void lon12002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		Box rbox = commDBService.execBox("PR_BOKTB_LOAN01", "SELECT", box);
		try {
			if(!rbox.get("sign_status").equals("3")) { 
				returnFailJsonResult("승인되지 않은 대부금입니다.", request, response); 
				transactionManager.rollback(tranStat);
				return;
			}
			if(box.get("refund_seq").equals("")) {
				rbox = commDBService.execBox("PR_BOKTB_LOAN11", "INSERT", box);
				box.put("refund_seq", rbox.get("refund_seq"));
			}else {
				commDBService.exec("PR_BOKTB_LOAN11", "UPDATE", box);
			}
			
			box.put("search_key",	box.get("loan_no")+"|"+box.get("refund_seq"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_LOAN11", box);
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
	/* Method Name  : lon12002_delete														    */
	/* Description  : 대부금 일시상환 삭제                                                    											*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon12002_delete.do")
	public void lon12002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_BOKTB_LOAN11", "DELETE", box);
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
	/* Method Name  : lon13001_list															    */
	/* Description  : 대부금 상환기준 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon13001_list.do")
	public String lon13001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.toString("yyyy")); }

		box.put("param01", box.get("std_yy"));
		commDBService.execList("PR_BOKTB_LOAN12_LIST", "LIST001", box, "rsWp", request);

		return "loan/lon13001";
	}
	
	/********************************************************************************************/
	/* Method Name  : lon13001_update														    */
	/* Description  : 대부금 상환기준 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon13001_update.do")
	public void lon13001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = new Box("");
			ibox.put("dbo", 		box.get("dbo"));
			ibox.put("sys_reg_id", 	box.get("sys_reg_id"));
	        for(int i=0; i < 12; i++) {
				ibox.put("std_ym",		box.get("std_yy")+box.get("refund_mm"+i));
				ibox.put("refund_ymd",	box.get("refund_ymd"+i));
				ibox.put("start_ymd",	box.get("start_ymd"+i));
				ibox.put("end_ymd",		box.get("end_ymd"+i));
				ibox.put("intr_ilsu",	box.get("intr_ilsu"+i));
				ibox.put("gongje_cnt",	box.get("gongje_cnt"+i));
				ibox.put("slip_no",		box.get("slip_no"+i));
				ibox.put("pro_status",	box.get("pro_status"+i));
				commDBService.exec("PR_BOKTB_LOAN12", "UPDATE", ibox);
	        }
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
	/* Method Name  : lon21001_list															    */
	/* Description  : 대부금현황 조회																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/loan/**/lon21001_list.do")
	public String lon21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("start_ymd"));
		box.put("param02", 	box.get("end_ymd"));
		box.put("param03", 	box.get("search_key"));
		box.put("param04", 	box.get("search_val"));
		box.put("param05", 	box.get("bugt_cd"));
		if(!uSesEnt.use_auth.startsWith("S")) {
			box.put("param06", uSesEnt.empl_no);
		}
		box.put("param07", 	box.get("pro_status"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		if(box.get("excel_yn").equals("P")) {
			Box ebox = commDBService.execXls("PR_BOKTB_LOAN01_LIST", "LIST002", box);
			returnOkJsonResult(ebox, request, response);
			return null;
		}else {
			commDBService.execList("PR_BOKTB_LOAN01_LIST", "LIST002", box, "rsWp", request);
			return "/loan/lon21001";
		}
	}
	
}
