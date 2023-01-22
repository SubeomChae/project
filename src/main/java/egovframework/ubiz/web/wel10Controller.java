/************************************************************************************************/
/* Class Name    : wel10Controller                                                         		*/
/* Description   : 목적사업																			*/ 
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company       Author    Description                                      */
/* --    ----------    ---------     --------   ------------------------------------------------*/
/* 01    2014/03/28  신진아이티컨설팅  정 진 수   Initial Release												*/ 
/*																								*/
/************************************************************************************************/	
package egovframework.ubiz.web;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.cbiz.CD;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.crypto.RsaUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

@Controller
public class wel10Controller extends abstractController {
	
	/********************************************************************************************/
	/* Method Name  : wel01001_list														    	*/
	/* Description  : 고유목적사업 신청서 메인															*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01001_list.do")
	public String wel01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("empl_no", uSesEnt.empl_no); }
		 
		box.put("param01", 		box.get("bugt_cd"));
		box.put("param02", 		box.get("start_ymd"));
		box.put("param03", 		box.get("end_ymd"));
		box.put("param04", 		box.get("search_key")); 
		box.put("param05", 		box.get("search_val"));
		box.put("param06", 		box.get("empl_no"));
		box.put("param07", 		box.get("sign_status"));
		box.put("param09", 		box.get("sort_order"));
		commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST001", box, "rsWp", request);
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_list";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel01002_select												    		*/
	/* Description  : 고유목적사업 신청서 조회															*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01002_select.do")
	public String wel01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_BOKTB_MAST01", "SELECT", box, "obox", request);
		if(rbox.get("apply_no").equals("")) { 
			returnFailJsonResult("삭제된 문서입니다.", request, response);
		}
		if(box.get("bugt_cd").equals("")) { box.put("bugt_cd", rbox.get("bugt_cd")); }
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase().substring(0,6)+"_view";
	}

	/********************************************************************************************/
	/* Method Name  : wel01002_update												    		*/
	/* Description  : 고유목적사업 신청서 수정															*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01002_update.do")
	public void wel01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = (Box)box.clone();			
			commDBService.exec("PR_BOKTB_MAST01", "UPDATE_AMT", ibox);
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
	/* Method Name  : wel01002_delete														    */
	/* Description  : 고유목적사업 신청서 삭제                                                    										*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01002_delete.do")
	public void wel01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			commDBService.exec("PR_BOKTB_MAST01", "DELETE", box);
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
	/* Method Name  : wel01003_edit												    			*/
	/* Description  : 고유목적사업 신청서 등록/수정화면														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01003_edit.do")
	public String wel01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		 
		commDBService.execBox("PR_BUDTB_CODE01", "SELECT", box, "rbox", request);
		if(box.get("apply_no").equals("")) {
			if(box.get("empl_no").equals("")) {
				box.put("empl_no", uSesEnt.empl_no); 
			}
			commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		}else {
			commDBService.execBox("PR_BOKTB_MAST01", "SELECT", box, "obox", request);
		}
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_edit";
	}

	/********************************************************************************************/
	/* Method Name  : wel01003_update												    		*/
	/* Description  : 고유목적사업 신청서 저장															*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel01003_update.do")
	public void wel01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = (Box)box.clone();
			if(box.get("apply_no").equals("")) {
				if(!box.get("sub_cd").equals("")) { ibox.put("bugt_cd",	box.get("sub_cd")); }
				Box rbox = commDBService.execBox("PR_BOKTB_MAST01", "INSERT", ibox);
				box.put("apply_no", rbox.get("apply_no"));
			}else {
				commDBService.exec("PR_BOKTB_MAST01", "UPDATE", ibox);
			}

			ibox.put("search_key",	box.get("apply_no"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_MAST01", ibox);
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
	/* Method Name  : wel02001_list														    	*/
	/* Description  : 고유목적사업(정기) 신청서 메인														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02001_list.do")
	public String wel02001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		 
		if(!uSesEnt.use_auth.startsWith("S")) { box.put("empl_no", uSesEnt.empl_no); }
		 
		box.put("param01", 		box.get("bugt_cd"));
		box.put("param02", 		box.get("start_ymd"));
		box.put("param03", 		box.get("end_ymd"));
		box.put("param04", 		box.get("search_key")); 
		box.put("param05", 		box.get("search_val"));
		box.put("param06", 		box.get("empl_no"));
		box.put("param07", 		box.get("sign_status"));
		box.put("param09", 		box.get("sort_order"));
		commDBService.execList("PR_BOKTB_TERM01_LIST", "LIST001", box, "rsWp", request);
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_list";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel02002_select												    		*/
	/* Description  : 고유목적사업(정기) 신청서 조회														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02002_select.do")
	public String wel02002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_BOKTB_TERM01", "SELECT", box, "obox", request);
		if(rbox.get("apply_no").equals("")) { 
			returnFailJsonResult("삭제된 문서입니다.", request, response); 
		}
		if(box.get("bugt_cd").equals("")) { box.put("bugt_cd", rbox.get("bugt_cd")); }
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_view";
	}

	/********************************************************************************************/
	/* Method Name  : wel02002_update												    		*/
	/* Description  : 고유목적사업(정기) 종료일자 저장											    		*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02002_update.do")
	public void wel02002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = (Box)box.clone();
			if(ibox.get("action_type").equals("UPDATE_FINISH")) {
				ibox.put("finish_ym", box.get("finish_yy")+StringUtil.lpad(box.get("finish_mm"),"0",2));
				commDBService.exec("PR_BOKTB_TERM01", "UPDATE_FINISH", ibox);
			}else {
				commDBService.exec("PR_BOKTB_TERM01", "UPDATE_AMT", ibox);
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
	/* Method Name  : wel02002_delete														    */
	/* Description  : 고유목적사업(정기) 신청서 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02002_delete.do")
	public void wel02002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BOKTB_TERM01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : wel02003_edit												    			*/
	/* Description  : 고유목적사업(정기) 신청서 등록/수정화면													*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02003_edit.do")
	public String wel02003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		 
		if(box.get("apply_no").equals("")) {
			if(box.get("empl_no").equals("")) {
				box.put("empl_no", uSesEnt.empl_no); 
			}
			commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		}else {
			commDBService.execBox("PR_BOKTB_TERM01", "SELECT", box, "obox", request);
		}
    	return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_edit";
	}

	/********************************************************************************************/
	/* Method Name  : wel02003_update												    		*/
	/* Description  : 고유목적사업(정기) 신청서 저장														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel02003_update.do")
	public void wel02003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		TransactionStatus tranStat = getTransactionStatus();
		try {
			Box ibox = (Box)box.clone();
			ibox.put("sign_status",	"1");
			ibox.put("apply_amt", box.get("apply_amt").equals("")?box.get("support_amt"):box.get("apply_amt"));
			if(box.get("apply_no").equals("")) {
				if(!box.get("sub_cd").equals("")) { ibox.put("bugt_cd",	box.get("sub_cd")); }
				Box rbox = commDBService.execBox("PR_BOKTB_TERM01", "INSERT", ibox);
				box.put("apply_no", rbox.get("apply_no"));		
			}else {
				commDBService.exec("PR_BOKTB_TERM01", "UPDATE", ibox);					
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
	/* Method Name  : wel03001_list													    		*/
	/* Description  : 고유목적사업(정기) 일괄지급 목록 														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel03001_list.do")
	public String wel03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box obox = commDBService.execBox("PR_BOKTB_TERM11", "SELECT", box);
		if(!obox.get("slip_no").equals("")) {		
			box.put("param01", obox.get("bugt_cd"));
			box.put("param02", obox.get("pay_ymd"));
			box.put("param03", obox.get("pay_no"));
			box.put("param04", obox.get("support_item"));
			box.put("param05", box.get("search_key"));	
			box.put("param06", box.get("search_val"));
			commDBService.execList("PR_BOKTB_TERM12_LIST", "LIST001", box, "rsWp", request);
			box.put("action_type", "view");			
		}else {	
			box.put("param01", box.get("bugt_cd"));		
			box.put("param02", box.get("pay_ymd"));
			box.put("param03", box.get("pay_no"));
			box.put("param04", box.get("support_item"));	
			box.put("param05", box.get("search_key"));	
			box.put("param06", box.get("search_val"));
			if(box.get("bugt_cd").equals("S80000")){
				box.put("param07", box.get("start_ymd")+"|"+box.get("end_ymd"));
				commDBService.execList("PR_BOKTB_TERM12_LIST", "LIST002B", box, "rsWp", request);
			}else {
				commDBService.execList("PR_BOKTB_TERM12_LIST", "LIST002A", box, "rsWp", request);
			}
					
			box.put("action_type", "edit");			
		}
		request.setAttribute("obox", obox); 
		return "welfare/"+box.get("dbo")+"/"+box.get("bugt_cd").toLowerCase()+"_pay";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel03001_update											    			*/
	/* Description  : 고유목적사업(정기) 일괄지급 저장														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel03001_update.do")
	public String wel03001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box();
		try{
			rbox = commDBService.execBox("PR_BOKTB_TERM11", "CREATE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel03001_list.do?margin_yn=Y","bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
		}
		return alertNRedirect(rbox.get("cnt") + "명이 저장었습니다.", "wel03001_list.do?margin_yn=Y", "bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel03001_create_slip													*/
	/* Description  : 고유목적사업(정기) 일괄지급 전표분개													*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel03001_create_slip.do")
	public String wel03001_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("search_key",	box.get("bugt_cd")+"|"+box.get("pay_ymd")+"|"+box.get("pay_no")+"|"+box.get("support_item"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_TERM11", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel03001_list.do?margin_yn=Y","bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
		}
		return alertNRedirect("전표가 생성되었습니다.", "wel03001_list.do?margin_yn=Y", "bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
		
	}
	/********************************************************************************************/
	/* Method Name  : wel03001_delete											    			*/
	/* Description  : 고유목적사업(정기) 일괄지급 삭제														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel03001_delete.do")
	public String wel03001_delete(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{
			commDBService.exec("PR_BOKTB_TERM11", "DELETE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel03001_list.do?margin_yn=Y","bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel03001_list.do?margin_yn=Y", "bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
	}

	@RequestMapping(value = "/welfare/**/wel03001_delete_slip.do")
	public String wel03001_delete_slip(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
			box.put("slip_no",	"");
			commDBService.exec("PR_BOKTB_TERM11", "UPDATE_SLIP", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel03001_list.do?margin_yn=Y","bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel03001_list.do?margin_yn=Y", "bugt_cd, pay_yy, pay_term, pay_ymd, pay_no, support_item", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel11001_list														    	*/
	/* Description  : 선물 일괄지급 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11001_list.do")
	public String wel11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); }
		
		if(box.get("bugt_cd").length() > 6) { 
			box.put("bugt_yy", 	box.get("std_yy"));
			commDBService.execBox("PR_BUDTB_BUGT01", "SELECT", box, "pbox", request);
			Box obox = commDBService.execBox("PR_BOKTB_PRES01", "SELECT", box);
			if(!obox.get("slip_no").equals("")) {
				box.put("param01", 	box.get("std_yy"));
				box.put("param02", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST001", box, "rsWp", request);
				box.put("action_type", "view");
			}else if(obox.getInt("member_cnt") > 0) {
				String pay_cond[] = StringUtil.split(obox.get("pay_cond"), "|", true);
				for(int i=0; i < pay_cond.length; i++) { box.put("param0"+String.valueOf(i+1), pay_cond[i]); }
				box.put("param07", 	box.get("std_yy"));
				box.put("param08", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST002", box, "rsWp", request);
				box.put("action_type", "edit");
			}else if(!box.get("pay_cond").equals("")) {
				String pay_cond[] = StringUtil.split(box.get("pay_cond"), "|", true);
				for(int i=0; i < pay_cond.length; i++) { box.put("param0"+String.valueOf(i+1), pay_cond[i]); }
				box.put("param07", 	box.get("std_yy"));
				box.put("param08", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST002", box, "rsWp", request);
				box.put("action_type", "edit");
				obox.put("pay_cond", box.get("pay_cond"));
			}else {
				returnFailJsonResult("삭제된 문서입니다.", request, response);
			}
			request.setAttribute("obox", obox); 
		}
		return "welfare/"+box.get("dbo")+"/wel11001";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel11001_update											    			*/
	/* Description  : 선물 일괄지급 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11001_update.do")
	public String wel11001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box();
		try{
			rbox = commDBService.execBox("PR_BOKTB_PRES01", "CREATE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect(rbox.get("cnt") + "명이 저장었습니다.", "wel11001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	/********************************************************************************************/
	/* Method Name  : wel11001_create_slip														*/
	/* Description  : 선물 일괄지급 전표분개																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11001_create_slip.do")
	public String wel11001_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("search_key",	box.get("std_yy")+"|"+box.get("bugt_cd"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_PRES01", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("전표가 생성되었습니다.", "wel11001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel11001_delete											    			*/
	/* Description  : 선물 일괄지급 삭제																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11001_delete.do")
	public String wel11001_delete(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{
			commDBService.exec("PR_BOKTB_PRES01", "DELETE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel11001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}

	@RequestMapping(value = "/welfare/**/wel11001_delete_slip.do")
	public String wel11001_delete_slip(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{	
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
			box.put("slip_no",	"");
			commDBService.exec("PR_BOKTB_PRES01", "UPDATE_SLIP", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel11001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel11011_list														    	*/
	/* Description  : 기타 일괄지급 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11011_list.do")
	public String wel11011_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); }
		
		if(box.get("bugt_cd").length() > 6) { 
			box.put("bugt_yy", 	box.get("std_yy"));
			commDBService.execBox("PR_BUDTB_BUGT01", "SELECT", box, "pbox", request);
			Box obox = commDBService.execBox("PR_BOKTB_PRES01", "SELECT", box);
			if(obox.getInt("member_cnt") > 0) {
				box.put("param01", 	box.get("std_yy"));
				box.put("param02", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	"Y");
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST001", box, "rsWp", request);
				box.put("action_type", "view");
			}else if(!box.get("pay_cond").equals("")) {
				String pay_cond[] = StringUtil.split(box.get("pay_cond"), "|", true);
				for(int i=0; i < pay_cond.length; i++) { box.put("param0"+String.valueOf(i+1), pay_cond[i]); }
				box.put("param07", 	box.get("std_yy"));
				box.put("param08", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	"Y");
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST002", box, "rsWp", request);
				box.put("action_type", "edit");
				obox.put("pay_cond", box.get("pay_cond"));
			}else {
				returnFailJsonResult("삭제된 문서입니다.", request, response);
			}
			request.setAttribute("obox", obox); 
		}
		return "welfare/"+box.get("dbo")+"/wel11011";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel11011_update											    			*/
	/* Description  : 기타 일괄지급 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11011_update.do")
	public String wel11011_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box();
		try{
			rbox = commDBService.execBox("PR_BOKTB_PRES01", "CREATE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11011_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect(rbox.get("cnt") + "명이 저장었습니다.", "wel11011_list.do", "std_yy, bugt_cd, pay_cond", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel11011_create_slip														*/
	/* Description  : 기타 일괄지급 전표분개																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11011_create_slip.do")
	public String wel11011_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("search_key",	box.get("std_yy")+"|"+box.get("bugt_cd"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_PRES01", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11011_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		
		return alertNRedirect("전표가 생성되었습니다.", "wel11011_list.do", "std_yy, bugt_cd, pay_cond", request);
	}

	/********************************************************************************************/
	/* Method Name  : wel11011_delete											    			*/
	/* Description  : 기타 일괄지급 삭제																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel11011_delete.do")
	public String wel11011_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BOKTB_PRES01", "DELETE", box);
			if(!box.get("slip_no").equals("")) { commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box); }
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel11011_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		
		return alertNRedirect("삭제되었습니다.", "wel11011_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : wel12001_list														    	*/
	/* Description  : 워크샵 일괄지급 목록																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel12001_list.do")
	public String wel12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); }
		
		if(box.get("bugt_cd").length() > 6) { 
			box.put("bugt_yy", 	box.get("std_yy"));
			commDBService.execBox("PR_BUDTB_BUGT01", "SELECT", box, "pbox", request);
			Box obox = commDBService.execBox("PR_BOKTB_WSHP01", "SELECT", box);
			if(!obox.get("slip_no").equals("")) {
				box.put("param01", 	box.get("std_yy"));
				box.put("param02", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_WSHP11_LIST", "LIST001", box, "rsWp", request);
				box.put("action_type", "view");
			}else if(obox.getInt("member_cnt") > 0) {
				String pay_cond[] = StringUtil.split(obox.get("pay_cond"), "|", true);
				for(int i=0; i < pay_cond.length; i++) { box.put("param0"+String.valueOf(i+1), pay_cond[i]); }
				box.put("param07", 	box.get("std_yy"));
				box.put("param08", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_WSHP11_LIST", "LIST002", box, "rsWp", request);
				box.put("action_type", "edit");
			}else if(!box.get("pay_cond").equals("")) {
				String pay_cond[] = StringUtil.split(box.get("pay_cond"), "|", true);
				for(int i=0; i < pay_cond.length; i++) { box.put("param0"+String.valueOf(i+1), pay_cond[i]); }
				box.put("param07", 	box.get("std_yy"));
				box.put("param08", 	box.get("bugt_cd"));
				box.put("param09", 	box.get("sort_order"));
				box.put("param10", 	box.get("excel_yn"));
				commDBService.execList("PR_BOKTB_WSHP11_LIST", "LIST002", box, "rsWp", request);
				box.put("action_type", "edit");
				obox.put("pay_cond", box.get("pay_cond"));
			}else {
				returnFailJsonResult("삭제된 문서입니다.", request, response);
			}
			request.setAttribute("obox", obox); 
		}
		return "welfare/"+box.get("dbo")+"/wel12001";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel12001_update											    			*/
	/* Description  : 워크샵 일괄지급 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel12001_update.do")
	public String wel12001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = new Box();
		try{
			rbox = commDBService.execBox("PR_BOKTB_WSHP01", "CREATE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel12001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect(rbox.get("cnt") + "명이 저장었습니다.", "wel12001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	/********************************************************************************************/
	/* Method Name  : wel12001_create_slip														*/
	/* Description  : 워크샵 일괄지급 전표분개																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel12001_create_slip.do")
	public String wel12001_create_slip(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("search_key",	box.get("std_yy")+"|"+box.get("bugt_cd"));
			commDBService.execBox("PR_AUTO_SLIP", "BOKTB_WSHP01", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel12001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("전표가 생성되었습니다.", "wel12001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : wel12001_delete											    			*/
	/* Description  : 워크샵 일괄지급 삭제																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel12001_delete.do")
	public String wel12001_delete(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{
			commDBService.exec("PR_BOKTB_WSHP01", "DELETE", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel12001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel12001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	
	@RequestMapping(value = "/welfare/**/wel12001_delete_slip.do")
	public String wel12001_delete_slip(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try{	
			commDBService.exec("PR_ACCTB_SLIP01", "DELETE", box);
			box.put("slip_no",	"");
			commDBService.exec("PR_BOKTB_WSHP01", "UPDATE_SLIP", box);
		}catch (Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			return alertNRedirect(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), "wel12001_list.do","std_yy, bugt_cd, pay_cond", request);
		}
		return alertNRedirect("삭제되었습니다.", "wel12001_list.do", "std_yy, bugt_cd, pay_cond", request);
	}
	
	/********************************************************************************************/
	/* Method Name  : wel21001_list														    	*/
	/* Description  : 고유목적사업비 집행현황																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel21001_list.do")
	public String wel21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("select_yn").equals("Y")) {
			return "welfare/"+box.get("dbo")+"/wel21001";
		}else {
	    	box.put("param01", 	box.get("bugt_cd"));
	    	box.put("param02", 	StringUtil.replace(box.get("start_ymd"),"-","")+"|"+StringUtil.replace(box.get("end_ymd"),"-",""));
			box.put("param03", 	box.get("search_key")+"|"+box.get("search_val"));
	    	box.put("param04", 	box.get("sign_status"));  
			box.put("param05", 	box.get("detail_sel"));
			box.put("param06", 	box.get("detail_key")+"|"+box.get("detail_val"));
			box.put("param09", 	box.get("sort_order"));
			if(box.get("bugt_cd").equals("")) { // 전체
				commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST002_ALL", box, "rsWp", request);
			}else if(box.get("bugt_cd").equals("S70000")) { // 선물지급
				commDBService.execList("PR_BOKTB_PRES11_LIST", "LIST003", box, "rsWp", request);
			}else if(box.get("bugt_cd").equals("S80000")) { // 목적사업(주기별)
				commDBService.execList("PR_BOKTB_TERM12_LIST", "LIST003", box, "rsWp", request);
			}else if(box.get("bugt_cd").equals("S90000")) { // 복지카드
				commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST002_CARD", box, "rsWp", request);
			}else {
				commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST002", box, "rsWp", request);
			}
		}
		return "welfare/"+box.get("dbo")+"/wel21001";
	}
	
	/********************************************************************************************/
	/* Method Name  : wel21002_excel													    	*/
	/* Description  : 고유목적사업비 집행현황(엑셀)														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel21002_excel.do")
	public String wel21002_excel(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("bugt_cd"));
	    	box.put("param02", 	StringUtil.replace(box.get("start_ymd"),"-","")+"|"+StringUtil.replace(box.get("end_ymd"),"-",""));
			box.put("param03", 	box.get("search_key")+"|"+box.get("search_val"));
	    	box.put("param04", 	box.get("sign_status"));  
			box.put("param05", 	box.get("detail_sel"));
			box.put("param06", 	box.get("detail_key")+"|"+box.get("detail_val"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	"EXCEL");
			if(box.get("bugt_cd").equals("")) { // 전체
				commDBService.execBox("PR_BOKTB_MAST01_LIST", "LIST002_ALL", box, "obox", request);
			}else if(box.get("bugt_cd").equals("S70000")) { // 선물지급
				commDBService.execBox("PR_BOKTB_PRES11_LIST", "LIST003", box, "obox", request);
			}else if(box.get("bugt_cd").equals("S90000")) { //복지카드
				commDBService.execBox("PR_BOKTB_MAST01_LIST", "LIST002_CARD", box, "obox", request);
			}else {
				commDBService.execBox("PR_BOKTB_MAST01_LIST", "LIST002", box, "obox", request);
			}
		}
		request.setAttribute("commDBService", commDBService);
		return "welfare/"+box.get("dbo")+"/wel21002_excel";
	}

	/********************************************************************************************/
	/* Method Name  : wel22001_list														    	*/
	/* Description  : 개인별 목적사업지원현황																*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel22001_list.do")
	public String wel22001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); }
    	box.put("param01", 	box.get("std_yy"));
    	box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST003", box, "rsWp", request);
		return "welfare/"+box.get("dbo")+"/wel22001";
	}

	/********************************************************************************************/
	/* Method Name  : wel22001_excel													    	*/
	/* Description  : 개인별 목적사업지원현황(엑셀)														*/
	/********************************************************************************************/
	@RequestMapping(value = "/welfare/**/wel22001_excel.do")
	public String wel22001_excel(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", DateUtil.getYear()); }
    	box.put("param01", 	box.get("std_yy"));
    	box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	"EXCEL");
		commDBService.execBox("PR_BOKTB_MAST01_LIST", "LIST003", box, "obox", request);
		request.setAttribute("commDBService", commDBService);
		return "welfare/"+box.get("dbo")+"/wel22001_excel";
	}
}
