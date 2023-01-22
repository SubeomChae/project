/************************************************************************************************/
/* Class Name    : acc10Controller                                                         		*/
/* Description   : 회계관리																		*/
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

import com.google.gson.JsonObject;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cbiz.CD;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;
import egovframework.cbiz.util.FormatUtil;

@Controller
public class acc10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : slp01001															    	*/
	/* Description  : 일반전표																	    */
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp01001.do")
	public String slp01001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("start_ymd", 	DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -30, "yyyyMMdd", "D"));
		box.put("end_ymd", 		DateUtil.toString("yyyyMMdd"));
		if(!box.get("slip_no").equals("")) {
			commDBService.execBox("PR_ACCTB_SLIP01", "SELECT", box, "obox", request);
		}
		return "account/slp01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp01001_update													    	*/
	/* Description  : 일반전표 세부항목 저장/삭제															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp01001_update.do")
	public void slp01001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("summary_yn","Y");
		try {
			if(box.get("action_type").equals("INSERT")) {
				Box rbox = commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", box, "obox", request);
				box.put("slip_no",  rbox.get("slip_no"));
				box.put("slip_seq", rbox.get("slip_seq"));
			}else {
				commDBService.exec("PR_ACCTB_SLIP02", box.get("action_type"), box);
			}
			returnOkJsonResult(box, request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	// 회계단위 검사
	@RequestMapping(value = "/account/**/slp01001_acc_unit.do")
	public void slp01001_acc_unit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_ACCTB_SLIP01", "UPDATE_CHECK_UNIT", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : slp01001_delete														    */
	/* Description  : 일반전표 전체삭제                                                    												*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp01001_delete.do")
	public void slp01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("slip_no", StringUtil.replace(box.get("slip_no"),"-",""));
		try {
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : slp02001															    	*/
	/* Description  : 지출결의서 공통																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02001.do")
	public String slp02001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("slip_ymd_from").equals("")) { box.put("slip_ymd_from", 	DateUtil.addDate(DateUtil.toString("yyyyMMdd"), -30, "yyyyMMdd", "D")); }
		if(box.get("slip_ymd_to").equals("")) { box.put("slip_ymd_to", 	DateUtil.toString("yyyyMMdd")); }
		
		box.put("param01", "1|"+box.get("slip_ymd_from")+"|"+box.get("slip_ymd_to"));
		box.put("param03", box.get("biz_type"));
		box.put("param04", uSesEnt.dept_cd);
		box.put("param06", box.get("sign_status"));
		box.put("param07", box.get("search_key"));
		box.put("param08", box.get("search_val"));
		box.put("param09", box.get("sort_order"));
		commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST001", box, "rsWp", request);
		return "account/slp02001";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp02002_write														    */
	/* Description  : 지출결의서(일반) 등록화면														*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02002_write.do")
	public String slp02002_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "account/slp02002";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp02002_edit															    */
	/* Description  : 지출결의서(일반) 수정화면														*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02002_edit.do")
	public String slp02002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
		
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST001C", box, "rsWp", request);
		
		if(rbox.get("sign_status").equals("1") || rbox.get("sign_status").equals("4")) {
			return "account/slp02002";
		}else {
			return "account/slp02003";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : slp02002_update														    */
	/* Description  : 지출결의서(일반) 저장															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02002_update.do")
	public void slp02002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		Box ibox = new Box("");
		Box rbox = new Box("");
		ibox.put("dbo",  		box.get("dbo"));
		ibox.put("subject", 	box.get("subject"));
		ibox.put("etc_remark", 	box.get("subject"));
		ibox.put("acc_unit", 	"00");
		ibox.put("sys_reg_id", 	box.get("sys_reg_id"));
		
		try {
			if(box.get("slip_no").equals("")) { 
				ibox.put("slip_no", box.get("proof_ymd0")+"C"); 
				ibox.put("biz_type","C10"); 
				rbox = commDBService.execBox("PR_ACCTB_SLIP01", "INSERT", ibox);
				ibox.put("slip_no", rbox.get("slip_no"));
			}else {
				ibox.put("slip_no", box.get("slip_no"));
				commDBService.exec("PR_ACCTB_SLIP01", "UPDATE", ibox);
				commDBService.exec("PR_ACCTB_SLIP02", "DELETEALL", ibox);
			}

			for(int i=0; i < box.getInt("input_cnt"); i++) {
				if(!box.get("acct_cd"+i).equals("")) {
					// 지출내용
					long slip_amt = box.getLong("gong_amt"+i);
					long vat_amt = box.getLong("vat_amt"+i);
					if(box.get("vat_cd"+i).equals("11") || box.get("vat_cd"+i).equals("20")) { // 불공제, 계산서
						slip_amt += vat_amt;
						vat_amt = 0;
					}else if(box.get("vat_cd"+i).equals("40")) { // 현금영수증
						if((slip_amt+vat_amt) <= 30000) {
							slip_amt += vat_amt;
							vat_amt = 0;
						}
					}
					ibox.put("cd_flag", 	"1");
					ibox.put("acct_cd", 	box.get("acct_cd"+i));
					ibox.put("slip_amt", 	String.valueOf(slip_amt));
					ibox.put("cust_cd", 	box.get("cust_cd"+i));
					ibox.put("cust_nm", 	box.get("cust_nm"+i));
					ibox.put("cost_dept", 	box.get("cost_dept"+i));
					ibox.put("cost_proj", 	box.get("cost_proj"+i));
					ibox.put("bugt_cd", 	box.get("bugt_cd"+i));
					ibox.put("bugt_yy", 	box.get("bugt_yy"+i));
					ibox.put("vat_cd", 		box.get("vat_cd"+i));
					ibox.put("vat_amt", 	box.get("vat_amt"+i));
					ibox.put("proof_ymd", 	box.get("proof_ymd"+i));
					ibox.put("etc_cd", 		"");
					rbox = commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					
					// 부가세
					if(vat_amt != 0) {
						ibox.put("acct_cd", 	"1111101");
						ibox.put("slip_amt",	String.valueOf(vat_amt));
						ibox.put("empl_no", 	"");
						ibox.put("bugt_cd", 	"");
						ibox.put("bugt_yy", 	"");
						ibox.put("vat_cd", 		box.get("vat_cd"+i));
						ibox.put("etc_cd",		rbox.get("slip_seq"));
						commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
					}
				}
			}
			// 지급방법
			ibox.put("cd_flag", 	"2");
			ibox.put("acct_cd", 	box.get("dae_acct_cd"));
			ibox.put("slip_amt", 	box.get("slip_amt"));
			ibox.put("cust_cd", 	"");
			ibox.put("cust_nm", 	"");
			ibox.put("cost_dept", 	"");
			ibox.put("cost_proj", 	"");
			ibox.put("empl_no", 	box.get("empl_no"));
			ibox.put("rel_no_type", box.get("rel_no_type"));
			ibox.put("rel_no", 		box.get("rel_no"));
			ibox.put("vat_cd", 		"");
			ibox.put("vat_amt", 	"");
			ibox.put("bugt_cd", 	"");
			ibox.put("bugt_yy", 	"");
			ibox.put("etc_cd", 		"");
			ibox.put("summary_yn",	"Y");
			commDBService.execBox("PR_ACCTB_SLIP02", "INSERT", ibox);
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
	/* Method Name  : slp02002_delete														    */
	/* Description  : 지출결의서(일반) 삭제                                            				*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02002_delete.do")
	public void slp02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
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
	/* Method Name  : slp02003_select														    */
	/* Description  : 지출결의서(일반) 상세조회														*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp02003_select.do")
	public String slp02003_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
		
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST001C", box, "rsWp", request);
		
		return "/account/slp02003";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp11001_list															    */
	/* Description  : 전표현황조회																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp11001_list.do")
	public String slp11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("ymd_flag")+"|"+box.get("start_ymd")+"|"+box.get("end_ymd"));
		box.put("param02", box.get("slip_ymd")+box.get("slip_no"));
		box.put("param03", box.get("biz_type"));
		if(!uSesEnt.use_auth.startsWith("S") || box.get("dept_cd").equals("")) {
			box.put("dept_cd", uSesEnt.dept_cd); 
		}
		box.put("param04", box.get("dept_cd"));
		box.put("param05", box.get("empl_no"));
		box.put("param06", box.get("sign_status"));
		box.put("param07", box.get("search_key"));
		box.put("param08", box.get("search_val"));
		box.put("param09", box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		if(box.get("excel_yn").equals("P")) {
			Box ebox = commDBService.execXls("PR_ACCTB_SLIP01_LIST", "LIST001", box);
			returnOkJsonResult(ebox, request, response);
			return null;
		}else {
			commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST001", box, "rsWp", request);
			return "/account/slp11001";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : slp21001															    	*/
	/* Description  : 회계전표 수정																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp21001.do")
	public String slp21001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("p_slip_ymd").equals("")) { box.put("p_slip_ymd", DateUtil.toString("yyyyMMdd")); }
		if(!box.get("p_slip_no").equals("")) {
			box.put("slip_no", box.get("p_slip_ymd")+box.get("p_slip_no"));
			commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
			
			box.put("param01", box.get("slip_no"));
			commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST001", box, "rsWp", request);
		}
		return "account/slp21001";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp21001_update														    */
	/* Description  : 회계일자/회계단위 수정															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp21001_update.do")
	public void slp21001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box("");
		TransactionStatus tranStat = getTransactionStatus();
		try {
			box.put("slip_no", box.get("p_slip_ymd")+box.get("p_slip_no"));
			rbox = commDBService.execBox("PR_ACCTB_SLIP02", "DELETE_SUMMARY", box);
			if(!rbox.get("msg").equals("")) { 
				returnFailJsonResult("["+box.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;
			}
			box.put("acc_unit", box.get("p_acc_unit"));
			commDBService.exec("PR_ACCTB_SLIP01", "UPDATE_ACC_UNIT", box);

			box.put("sign_ymd", box.get("p_sign_ymd"));
			rbox = commDBService.execBox("PR_ACCTB_SLIP02", "INSERT_SUMMARY", box);
			if(!rbox.get("msg").equals("")) { 
				returnFailJsonResult("["+box.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;
			}
			transactionManager.commit(tranStat);
			returnOkJsonResult(box, request, response);
		}catch(Exception ex) {
			transactionManager.rollback(tranStat);
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : slp21002_edit															    */
	/* Description  : 회계전표수정 -전표세부 수정화면													*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp21002_edit.do")
	public String slp21002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_ACCTB_SLIP02", "SELECT", box, "obox", request);
		return "account/slp21002";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp21002_update														    */
	/* Description  : 회계전표수정 - 전표세부 저장													*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp21002_update.do")
	public void slp21002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box("");
		TransactionStatus tranStat = getTransactionStatus();
		try {
			// 재무제표 반영취소
			if(box.get("acc_summary").equals("Y")) {
				rbox = commDBService.execBox("PR_ACCTB_SLIP02", "DELETE_SUMMARY", box);
				if(!rbox.get("rtn_msg").equals("")) { 
					returnFailJsonResult("["+box.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;
				}
			}
			
			if(box.get("action_type").equals("vat")) { // 증빙유형 수정
				rbox = commDBService.execBox("PR_ACCTB_SLIP02", "UPDATE_VAT", box);
				if(!rbox.get("rtn_msg").equals("")) { 
					returnFailJsonResult("["+box.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;
				}
			}else {	
				commDBService.exec("PR_ACCTB_SLIP02", "UPDATE", box);
			}

			// 재무제표 반영
			if(box.get("acc_summary").equals("Y")) {
				rbox = commDBService.execBox("PR_ACCTB_SLIP02", "INSERT_SUMMARY", box);
				if(!rbox.get("rtn_msg").equals("")) { 
					returnFailJsonResult("["+box.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg"), request, response); transactionManager.rollback(tranStat); return;
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
	}

	/********************************************************************************************/
	/* Method Name  : slp31001_list															    */
	/* Description  : 회계전표승인/취소 대상																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp31001_list.do")
	public String slp31001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyyMMdd")); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("start_ymd"));
			box.put("param02", 	box.get("end_ymd"));
			box.put("param03", 	box.get("biz_type"));
			box.put("param04", 	box.get("search_key"));
			box.put("param05", 	box.get("search_val"));
			box.put("param06", 	box.get("slip_ymd")+box.get("slip_no"));
			box.put("param07", 	box.get("acct_cd")+"|"+box.get("acct_nm"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	box.get("excel_yn"));
			if(box.get("sign_yn").equals("N")) { 
				commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST003A", box, "rsWp", request);
			}else {
				commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST003B", box, "rsWp", request);
			}
		}
		return "account/slp31001";
	}
	
	/********************************************************************************************/
	/* Method Name  : slp31001_update														    */
	/* Description  : 회계전표승인/취소																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/slp31001_update.do")
	public String slp31001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box ibox = new Box("");
		ibox.put("dbo",  		box.get("dbo"));
		ibox.put("sys_reg_id",  box.get("sys_reg_id"));
		String msg = "정상적으로 처리되었습니다.";
		for(int i=0; i < box.getInt("input_cnt"); i++) {
			if(!box.get("slip_no"+i).equals("")) {
				ibox.put("slip_no", 	box.get("slip_no"+i));
				ibox.put("sign_ymd", 	box.get("sign_ymd"+i));
				Box rbox = commDBService.execBox("PR_ACCTB_SLIP02", box.get("sign_yn").equals("N") ? "INSERT_SUMMARY" : "DELETE_SUMMARY", ibox);
				if(!rbox.get("rtn_msg").equals("")) { 
					msg = "["+ibox.get("slip_no",Box.SLIP_NO)+"] " + rbox.get("rtn_msg");
					break; 
				}
			}
		}
		return alertNRedirect(msg, "slp31001_list.do", "sign_yn, start_ymd, end_ymd, biz_type, search_key, search_val, select_yn", request);
	}

	/********************************************************************************************/
	/* Method Name  : rpt01001_list															    */ 
	/* Description  : 보조부																		*/
	/********************************************************************************************/
	@RequestMapping(value = {"/account/**/rpt01001_list.do", "/account/fd/rpt01001_excel.do"})
	public String rpt01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("start_ymd"));
			box.put("param02", 	box.get("end_ymd"));
			box.put("param03", 	box.get("acct_cd")+"|"+box.get("acct_nm"));
			box.put("param04", 	box.get("cust_cd")+"|"+box.get("cust_nm"));
			box.put("param05", 	box.get("search_key"));
			box.put("param06", 	box.get("search_cd")+"|"+box.get("search_nm"));
			box.put("param07", 	box.get("rel_no"));
			box.put("param08", 	box.get("acc_unit"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	box.get("excelParam").equals("") ? "" : box.get("excelParam")+"@"+box.get("excel_file_nm"));
			if(box.get("report_yn").equals("Y")) {
				commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST003C", box, "rsWp", request);
				return "account/report/rpt01001_excel";
			}else if(box.get("excelParam").endsWith("xls")){
				RsWrapper rsWp = commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST003C", box);
				box.put("file_path", rsWp.get("excelPath", 0));
				request.setAttribute("rsWp", rsWp);
				return Redirect("/com/file.do?method=downFile&excelParam="+box.get("excelParam"), "excel_file_nm, file_path", request);
			}else {
				commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST003A", box, "rsWp", request);
				if(!box.get("acct_cd").equals("")) {
					commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST003B", box, "sumWp", request);
				}
			}
		}
		return "account/rpt01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt02001_list															    */
	/* Description  : 분개장																		*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt02001_list.do")
	public String rpt02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }
		
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("start_ymd"));
			box.put("param02", 	box.get("end_ymd"));
			box.put("param03", 	box.get("acct_cd")+"|"+box.get("acct_nm"));
			box.put("param04", 	box.get("cust_cd")+"|"+box.get("cust_nm"));
			box.put("param05", 	box.get("search_key"));
			box.put("param06", 	box.get("etc_remark"));
			box.put("param07", 	box.get("rel_no"));
			box.put("param08", 	box.get("acc_unit"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	box.get("excel_yn"));
			if(box.get("excel_yn").equals("P")) {
				Box ebox = commDBService.execXls("PR_ACCTB_SLIP02_LIST", "LIST005", box);
				returnOkJsonResult(ebox, request, response);
			}else {
				commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST005", box, "rsWp", request);
			}
		}
		if(box.get("excel_yn").equals("P")) {
			return null;
		}else {
			return "/account/rpt02001";
		}
	}

	/********************************************************************************************/
	/* Method Name  : rpt03001_list															    */
	/* Description  : 총계정원장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt03001_list.do")
	public String rpt03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("start_ymd").equals("")) { box.put("start_ymd", DateUtil.toString("yyyy")+"0101"); }
		if(box.get("end_ymd").equals("")) { box.put("end_ymd", DateUtil.toString("yyyyMMdd")); }

		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("start_ymd"));
			box.put("param02", 	box.get("end_ymd"));
			box.put("param03", 	box.get("acct_cd1"));
			box.put("param04", 	box.get("acct_cd2"));
			box.put("param05", 	box.get("acc_unit"));
			commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST004", box, "rsWp", request);
		}
		return "account/rpt03001";
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt11001_list															    */
	/* Description  : 계정명세서																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt11001_list.do")
	public String rpt11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", DateUtil.toString("yyyy")); }
		if(box.get("std_month").equals("")) { box.put("std_month", DateUtil.toString("MM")); }

		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("std_year")+box.get("std_month"));
			box.put("param02", 	box.get("acc_unit"));
			box.put("param03", 	box.get("acct_cd"));
			box.put("param04", 	box.get("acct_nm"));
			box.put("param05", 	box.get("search_key"));
			box.put("param06", 	box.get("search_cd"));
			box.put("param07", 	box.get("search_nm"));
			box.put("param08", 	box.get("rel_no"));
			box.put("param10", 	box.get("excel_yn"));
			commDBService.execList("PR_ACCTB_SUMM01_LIST", "LIST001", box, "rsWp", request);
		}
		return "account/rpt11001";
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt12001_list															    */
	/* Description  : 계정별잔액증감현황															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt12001_list.do")
	public String rpt12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", DateUtil.toString("yyyy")); }
		if(box.get("std_month").equals("")) { box.put("std_month", DateUtil.toString("MM")); }

		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("std_year")+box.get("std_month"));
			box.put("param02", 	box.get("acc_unit"));
			box.put("param03", 	box.get("acct_cd"));
			box.put("param04", 	box.get("acct_nm"));
			box.put("param05", 	box.get("acct_cd_arr"));
			commDBService.execList("PR_ACCTB_SUMM01_LIST", "LIST002", box, "rsWp", request);
		}
		return "account/rpt12001";
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt21001_list															   	*/
	/* Description  : 재무제표																	*/
	/********************************************************************************************/
	@RequestMapping(value = {"/account/**/rpt21001_list.do", "/account/fd/rpt21001_excel.do"})
	public String rpt21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("report_id").equals("")) { box.put("report_id", "ACC001"); }
		if(box.get("std_year").equals(""))  { box.put("std_year", DateUtil.toString("yyyy")); }
		if(box.get("std_month").equals("")) { box.put("std_month", DateUtil.toString("MM")); }

		String report_file_nm = box.get("report_id");	
		box.put("param01", box.get("report_id")+box.get("summary_yn"));
		box.put("param02", box.get("std_year")+box.get("std_month"));
		box.put("param03", box.get("acc_unit"));
		box.put("std_yy",  box.get("std_year"));
		if(box.get("report_id").equals("ACC001") || box.get("report_id").equals("ACC002")) { 
			box.put("param04", box.get("month_flag")); // 재무상태표, 손익계산서 월별조회
		}
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);	
		if(box.get("select_yn").equals("Y")) {
			if(box.get("accunit_yn").equals("G")) {	// 구분재무제표
				commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST005", box, "rsWp", request);
				report_file_nm += "G";
			}else {
				if(box.get("report_id").equals("ACC001")) {	// 재무상태표
					commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST001", box, "rsWp", request);
				}else if(box.get("report_id").equals("ACC002")) {	// 손익계산서
					commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST002", box, "rsWp", request);
				}else if(box.get("report_id").equals("ACC003")) {	// 합계잔액시산표
					commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST003", box, "rsWp", request);
				}else if(box.get("report_id").equals("ACC004")) {	// 고유목적사업명세서
					commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST004", box, "rsWp", request);
				}else if(box.get("report_id").equals("ACC005")) {	// 일반관리비명세서
					commDBService.execList("PR_ACCTB_SUMM02_LIST", "LIST004", box, "rsWp", request);
				}	
				report_file_nm += box.get("summary_yn");
			}
		}
		
		if(box.get("excel_yn").equals("Y")) {
			return "account/report/"+report_file_nm+"_excel";
		}else {
			return "account/rpt21001";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt21001_update 														    */
	/* Description  : 재무제표 재생성																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt21001_update.do")
	public String rpt21001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		String rtn_msg = "[재무제표 재생성 처리결과]\n\n";
		box.put("acc_ym", box.get("std_year")+box.get("std_month"));
		Box rbox = commDBService.execBox("PR_ACCTB_SUMM01", "CREATE_SUMMARY", box);
		rtn_msg += "계정별 잔액 테이블 재생성 : " + rbox.get("cnt") + "건\n\n";
		
		rbox = commDBService.execBox("PR_ACCTB_SUMM02", "CREATE_SUMMARY", box);
		rtn_msg += "결산 Summary 테이블 재생성 : " + rbox.get("cnt") + "건";
		
		return alertNRedirect(rtn_msg, "rpt21001_list.do", "std_year, std_month, acc_unit, report_id", request);
	}

	/********************************************************************************************/
	/* Method Name  : rpt22001_list															    */
	/* Description  : 재무제표 연이월 목록															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt22001_list.do")
	public String rpt22001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", String.valueOf(Integer.parseInt(DateUtil.getYear())-1)); }

		box.put("param01", box.get("std_year"));
		box.put("param02", box.get("acc_unit"));
		commDBService.execList("PR_ACCTB_SUMM01_LIST", "LIST003", box, "rsWp", request);
		return "account/rpt22001";
	}
	
	/********************************************************************************************/
	/* Method Name  : rpt22001_update 														    */
	/* Description  : 재무제표 연이월 생성																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/rpt22001_update.do")
	public String rpt22001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		String rtn_msg = "[재무제표 연이월 처리결과]\n\n";
		box.put("acc_ym", box.get("std_year"));
		Box rbox = commDBService.execBox("PR_ACCTB_SUMM01", "YEARLY_TRANSFER", box);
		rtn_msg += "계정별 잔액 테이블 연이월 : " + rbox.get("cnt") + "건\n\n";
		
		rbox = commDBService.execBox("PR_ACCTB_SUMM02", "YEARLY_TRANSFER", box);
		rtn_msg += "결산 Summary 테이블 연이월 : " + rbox.get("cnt") + "건";
		
		return alertNRedirect(rtn_msg, "rpt22001_list.do", "std_year", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : gls01001_list														    	*/
	/* Description  : 고유목적사업준비금 설정/전출입 목록												*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls01001_list.do")
	public String gls01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", DateUtil.toString("yyyy")); }

		box.put("param01", 	box.get("std_year"));
		box.put("param02", 	box.get("basis_law"));
		commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST004A", box, "rsWp", request);
		
		return "account/gls01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : gls01001_delete 														    */
	/* Description  : 고유목적사업준비금 설정/전출입 삭제	                                             		*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls01001_delete.do")
	public void gls01001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			if(box.get("search_key").startsWith("B")) { // 전출입 : 역분개전표 자동삭제
				Box ibox = new Box("");
				ibox.put("dbo", 	box.get("dbo"));
				ibox.put("slip_no", StringUtil.arrayCol(box.get("search_key"),2,"@"));
				commDBService.exec("PR_ACCTB_SLIP01", "DELETE", ibox);
			}
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : gls01002_write													    	*/
	/* Description  : 고유목적사업준비금 설정/전출입 등록화면													*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls01002_write.do")
	public String gls01002_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("basis_law").equals("")) { box.put("basis_law", "1"); }
		if(box.get("biz_flag").equals(""))  { box.put("biz_flag",  "A"); }
		box.put("search_key",  box.get("biz_flag")+box.get("basis_law"));
    	return "account/gls01002";
	}

	/********************************************************************************************/
	/* Method Name  : gls01002_update												    		*/
	/* Description  : 고유목적사업준비금 설정/전출입 전표분개											*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls01002_update.do")
	public void gls01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String param_arr = "";
			if(box.get("search_key").startsWith("A")) { // 준비금 설정
				param_arr = box.get("slip_amt") + "Ð" + box.get("etc_remark");
			}else if(box.get("search_key").startsWith("B")) { // 전출입
				param_arr = box.get("cha_slip_amt") + "Ð" + box.get("etc_remark") +  "Ð" + box.get("dae_acct_cd") + "Ð" + box.get("account_no") + "Ð"
						  + box.get("dae_slip_amt") + "Ð" + box.get("tax_slip_amt") + "Ð" + box.get("tax_rate") + "Ð"; 
			} 
			box.put("slip_no", 		box.get("slip_ymd"));
			box.put("param_arr",	param_arr);
			commDBService.execBox("PR_AUTO_SLIP", "ACCTB_SLIP01_Y10", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : gls02001_list														    	*/
	/* Description  : 고유목적사업준비금 수입대체  목록														*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls02001_list.do")
	public String gls02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_year").equals("")) { box.put("std_year", DateUtil.toString("yyyy")); }

		box.put("param01", 	box.get("std_year"));
		commDBService.execList("PR_ACCTB_SLIP01_LIST", "LIST004B", box, "rsWp", request);
		
		return"account/gls02001";
	}
	
	/********************************************************************************************/
	/* Method Name  : gls02001_execute												    		*/
	/* Description  : 고유목적사업준비금 수입대체 실행													*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls02001_execute.do")
	public String gls02001_execute(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		String amt_71_72 = box.get("cost_amt");
		
		// 고유목적사업준비금1 잔액
		box.put("param01", 	box.get("acc_ym"));
		box.put("param03", 	"2200801");
		Box rbox = commDBService.execBox("PR_ACC_TAX_REPORT", "LIST002", box);
		String amt_2200801 = rbox.get("cur_acum");
		
		String param_arr = FormatUtil.nvl2(amt_71_72,"0") + "Ð" + FormatUtil.nvl2(amt_2200801,"0");
		box.put("slip_no", 		FormatUtil.nvl2(box.get("slip_no"),box.get("acc_ym")));
		box.put("search_key",	"C0");
		box.put("param_arr",	param_arr);
		commDBService.execBox("PR_AUTO_SLIP", "ACCTB_SLIP01_Y10", box);

		return alertNRedirect("실행되었습니다.", "gls02001_list.do", "std_year", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : gls02001_delete												    		*/
	/* Description  : 고유목적사업준비금 수입대체전표 삭제												    */
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/gls02001_delete.do")
	public String gls02001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
		return alertNRedirect("삭제되었습니다.", "gls02001_list.do", "std_year", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : acc01001_list															    */
	/* Description  : 계정과목코드																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc01001_list.do")
	public String acc01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("acct_class"));
		box.put("param02", box.get("use_flag"));
		box.put("param05", box.get("search_key"));
		box.put("param06", box.get("search_val"));
		box.put("param10", box.get("excel_yn"));
		commDBService.execList("PR_ACCTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "account/acc01001";
	}

	/********************************************************************************************/
	/* Method Name  : acc01002_edit													    		*/
	/* Description  : 계정과목코드 등록/수정화면														*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc01002_edit.do")
	public String acc01002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("acct_cd").equals("")) {
			commDBService.execBox("PR_ACCTB_CODE01", "SELECT", box, "obox", request);
		}
    	return "account/acc01002";
	}

	/********************************************************************************************/
	/* Method Name  : acc01002_update														    */
	/* Description  : 계정과목코드 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc01002_update.do")
	public void acc01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try{
			commDBService.exec("PR_ACCTB_CODE01", box.get("action_type"), box);
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
	/* Method Name  : acc01002_delete														    */
	/* Description  : 계정과목코드 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc01002_delete.do")
	public void acc01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			commDBService.exec("PR_ACCTB_CODE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : acc01002_copy														    	*/
	/* Description  : 계정과목코드 복사                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc01002_copy.do")
	public void acc01002_copy(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("acct_cd", box.get("old_acct_cd"));
			Box rbox = commDBService.execBox("PR_ACCTB_CODE01", "SELECT", box);
			
			rbox.put("dbo", 	box.get("dbo"));
			rbox.put("acct_cd", box.get("new_acct_cd"));
			rbox.put("acct_nm", box.get("new_acct_nm"));
			rbox.put("abbr_nm", box.get("new_acct_nm"));
			
			commDBService.exec("PR_ACCTB_CODE01", "INSERT", rbox);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : acc02001_list														    	*/
	/* Description  : 거래처코드																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc02001_list.do")
	public String acc02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("cust_type"));
		box.put("param02", box.get("search_key"));
		box.put("param03", box.get("search_val"));
		box.put("param04", box.get("use_flag"));
		box.put("param09", box.get("sort_order"));
		box.put("param10", box.get("excel_yn")); 
		commDBService.execList("PR_ACCTB_CUST01_LIST", "LIST001", box, "rsWp", request);
		return"account/acc02001";
	}

	/********************************************************************************************/
	/* Method Name  : acc02002_edit													    		*/
	/* Description  : 거래처코드 등록/수정화면														    */
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc02002_edit.do")
	public String acc02002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_ACCTB_CUST01", "SELECT", box, "obox", request);
    	return "account/acc02002";
	}
	
	@RequestMapping(value = "/account/**/acc02002_write.do")
	public String acc02002_write(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "account/acc02002";
	}

	/********************************************************************************************/
	/* Method Name  : acc02002_update														    */
	/* Description  : 거래처코드 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc02002_update.do")
	public void acc02002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			if(box.get("cust_flag").equals("1")) {
				box.put("cust_reg_no", 	box.get("cust_reg_no1")+box.get("cust_reg_no2")+box.get("cust_reg_no3"));
			}else {
				box.put("cust_reg_no", 	box.get("reside_no1")+box.get("reside_no2"));	
			}
			box.put("tel_no", 			box.get("tel_no1") + "-" + box.get("tel_no2") + "-" + box.get("tel_no3"));  
			box.put("fax_no", 			box.get("fax_no1") + "-" + box.get("fax_no2") + "-" + box.get("fax_no3"));  
			box.put("charge_tel_no", 	box.get("charge_tel_no1") + "-" + box.get("charge_tel_no2") + "-" + box.get("charge_tel_no3"));
			box.put("charge_hp_no", 	box.get("charge_hp_no1") + "-" + box.get("charge_hp_no2") + "-" + box.get("charge_hp_no3"));
			box.put("use_flag",			box.get("del_ymd").equals("") ? "Y" : "N");
			
			if(box.get("cust_cd").equals("")) {
				Box rbox = commDBService.execBox("PR_ACCTB_CUST01", "INSERT", box);
				box.put("cust_cd", 	rbox.get("cust_cd"));	
			}else {
				commDBService.exec("PR_ACCTB_CUST01", "UPDATE", box);
			}
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : acc02002_delete														    */
	/* Description  : 거래처코드 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc02002_delete.do")
	public void acc02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_ACCTB_CUST01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : acc03001_list														    	*/
	/* Description  : 재무제표배열																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc03001_list.do")
	public String acc03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", "report_id");
		box.put("param02", "ACC");
		commDBService.execList("PR_COMTB_CODE02_LIST", "LIST001", box, "rsWp", request);
		return "account/acc03001";
	}

	/********************************************************************************************/
	/* Method Name  : acc03002_list															    */
	/* Description  : 재무제표배열 목록 조회															*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc03002_list.do")
	public String acc03002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("report_id"));
		commDBService.execList("PR_COMTB_FORM01_LIST", "LIST001", box, "rsWp", request);
		return "account/acc03002";
	}
	
	/********************************************************************************************/
	/* Method Name  : acc03003_edit														    */
	/* Description  : 재무제표배열 등록 화면																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc03003_edit.do")
	public String acc03003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_FORM01", "SELECT", box, "obox", request);
		return "/account/acc03003";
	}
	
	/********************************************************************************************/
	/* Method Name  : acc03003_update														    */
	/* Description  : 재무제표배열 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc03003_update.do")
	public void acc03003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_FORM01", box.get("actionType"), box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : acc03003_delete														    */
	/* Description  : 재무제표배열 삭제																*/
	/********************************************************************************************/
	@RequestMapping(value = "/account/**/acc03003_delete.do")
	public void acc03003_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_COMTB_FORM01", box.get("actionType"), box);
			returnOkJsonResult(box, request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

}
