/************************************************************************************************/
/* Class Name    : bud10Controller                                                         		*/
/* Description   : 사업계획																		*/
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

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.ubiz.mapper.ent.SesUserEntity;
import egovframework.cbiz.CD;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.ExcelUtil;
import egovframework.cbiz.util.FileUtil;

@Controller
public class bud10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : bud01001_list														    	*/
	/* Description  : 사업코드 목록																    */
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud01001_list.do")
	public String bud01001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_class").equals("")) { box.put("bugt_class", "S"); }
		box.put("param01", 	box.get("bugt_class"));
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		box.put("param04", 	box.get("use_flag"));
		commDBService.execList("PR_BUDTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "budget/bud01001";
	}

	/********************************************************************************************/
	/* Method Name  : bud01002_select												    		*/
	/* Description  : 사업코드 상세조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/fd/bud01002_select.do")
	public String bud01002_select(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_BUDTB_CODE01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("bugt_cd"));
		commDBService.execList("PR_BUDTB_CODE01_LIST", "LIST002", box, "rsWp", request);
	    return "budget/bud01002";
	}

	/********************************************************************************************/
	/* Method Name  : bud01002_delete														    */
	/* Description  : 사업코드 삭제                                                    									*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud01002_delete.do")
	public void bud01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BUDTB_CODE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud01003_edit													    		*/
	/* Description  : 사업코드 등록/수정화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/fd/bud01003_edit.do")
	public String bud01003_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(!box.get("bugt_cd").equals("")) {
			commDBService.execBox("PR_BUDTB_CODE01", "SELECT", box, "obox", request);

			box.put("param01", box.get("bugt_cd"));
			commDBService.execList("PR_BUDTB_CODE01_LIST", "LIST002", box, "rsWp", request);
		}
	    return "budget/bud01003";
	}

	/********************************************************************************************/
	/* Method Name  : bud01003_update														    */
	/* Description  : 사업코드 저장																    */
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud01003_update.do")
	public void bud01003_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String action_type = box.get("bugt_cd").equals("") ? "INSERT" : "UPDATE";
			box.put("pay_cond", box.get("refund_method")+"|"+box.get("calculation")+"|"+box.get("intr_rate")+"|"+box.get("defer_year")+"|"+box.get("refund_year")+"|"+box.get("refund_cnt"));
			if(action_type.equals("INSERT")) {
				box.put("bugt_cd",	box.get("bugt_class"));
				box.put("bugt_lvl",	"1");
				Box rbox = commDBService.execBox("PR_BUDTB_CODE01", "INSERT", box);
				box.put("bugt_cd",	rbox.get("bugt_cd"));
			}else {
				commDBService.exec("PR_BUDTB_CODE01", "UPDATE", box);
			}
			
			Box ibox = new Box("");
			ibox.put("dbo",			box.get("dbo"));
			ibox.put("bugt_lvl",	"2");
			ibox.put("acct_cd",		box.get("acct_cd"));
			ibox.put("sub_yn",		box.get("sub_yn"));
			ibox.put("sys_reg_id",	box.get("sys_reg_id"));
	        for(int i=0; i < box.getInt("input_cnt"); i++) {
	        	if(box.get("bugt_nm"+i).equals("")) { continue; }
				ibox.put("bugt_nm",			box.get("bugt_nm"+i));
				ibox.put("bugt_purpose",	box.get("bugt_purpose"+i));
				ibox.put("use_yn",			box.get("use_yn"+i));

	        	if(!box.get("bugt_cd"+i).equals("")) {
	    			ibox.put("bugt_cd",	box.get("bugt_cd"+i));
	    			commDBService.exec("PR_BUDTB_CODE01", "UPDATE", ibox);
	        	}else {
	    			ibox.put("bugt_cd",	box.get("bugt_cd"));
	    			commDBService.execBox("PR_BUDTB_CODE01", "INSERT", ibox);
	        	}
	        }
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	// 세부코드 삭제
	@RequestMapping(value = "/budget/**/bud01003_delete.do")
	public void bud01003_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BUDTB_CODE01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud11001_list														    	*/
	/* Description  : 사업계획 수립															     	*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud11001_list.do")
	public String bud11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		box.put("param01", box.get("bugt_yy"));
		commDBService.execList("PR_BUDTB_BUGT02_LIST", "LIST004", box, "rsWp", request);
		return "budget/bud11001";
	}

	/********************************************************************************************/
	/* Method Name  : bud11001_create													    	*/
	/* Description  : 사업계획 기초자료 생성															*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud11001_create.do")
	public String bud11001_create(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_BUDTB_BUGT02", "CREATE", box);
		String msg = rbox.getInt("cnt") > 0 ? rbox.get("cnt")+"건의 자료가 생성되었습니다." : "생성할 자료가 없습니다.";
		return alertNRedirect(msg, "bud11001_list.do", "bugt_yy", request);
	}

	/********************************************************************************************/
	/* Method Name  : bud11002_list															    */
	/* Description  : 사업계획 계정과목코드 목록														*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud11002_list.do")
	public String bud11002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param10", 	"Y");
		commDBService.execList("PR_ACCTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "budget/bud11002";
	}

	/********************************************************************************************/
	/* Method Name  : bud11002_update														    */
	/* Description  : 사업계획 계정과목코드 저장														*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud11002_update.do")
	public void bud11002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_ACCTB_CODE01", "UPDATE_PLAN_CODE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud12001_list													    		*/
	/* Description  : 수입예산/비용예산/자본예산 목록													*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud12001_list.do")
	public String bud12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("bugt_yy"));
		box.put("param02", box.get("acct_cd"));
		commDBService.execList("PR_BUDTB_BUGT02_LIST", "LIST001", box, "rsWp", request);
    	return "budget/bud12001";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud12001_update														    */
	/* Description  : 수입예산/비용예산/자본예산 저장													*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud12001_update.do")
	public void bud12001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			if(box.get("bugt_seq").equals("")) {
				commDBService.exec("PR_BUDTB_BUGT02", "INSERT", box);
			}else {
				commDBService.exec("PR_BUDTB_BUGT02", "UPDATE", box);
			}
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud12001_delete														    */
	/* Description  : 수입예산/비용예산/자본예산 삭제													*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud12001_delete.do")
	public void bud12001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BUDTB_BUGT02", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud12002_list													    		*/
	/* Description  : 대부이자수입 세부내역															*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud12002_list.do")
	public String bud12002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("bugt_yy"));
		box.put("param02", 	"61002");
		commDBService.execList("PR_BUDTB_BUGT02_LIST", "LIST001", box, "rsWp", request);
    	return "budget/bud12002";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud13001_list													    		*/
	/* Description  : 목적사업/대부사업예산 목록														*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud13001_list.do")
	public String bud13001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_BUDTB_CODE01", "SELECT", box, "obox", request);

		box.put("param01", 	box.get("bugt_yy"));
		box.put("param02", 	box.get("bugt_cd"));
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST001B", box, "rsWp", request);
    	return "budget/bud13001";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud13001_update														    */
	/* Description  : 목적사업/대부사업예산 저장														*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud13001_update.do")
	public void bud13001_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BUDTB_BUGT01", box.get("action_type"), box);
			box.put("bugt_cd", 	box.get("bugt_cd").substring(0,6));
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud13001_delete														    */
	/* Description  : 목적사업/대부사업예산 삭제														*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud13001_delete.do")
	public void bud13001_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_BUDTB_BUGT01", "DELETE", box);
			box.put("bugt_cd", 	box.get("bugt_cd").substring(0,6));
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : bud21001_list															    */
	/* Description  : 추정재무제표																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud21001_list.do")
	public String bud21001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		
		box.put("param01",	box.getNvl("report_id","ACC001P"));
		box.put("param02", 	box.get("bugt_yy"));
		commDBService.execList("PR_BUDTB_BUGT02_LIST", "LIST003", box, "rsWp", request);
		return "budget/bud21001";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud22001_list															    */
	/* Description  : 목적사업계획서																*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud22001_list.do")
	public String bud22001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		
		box.put("param01", box.get("bugt_yy"));
		box.put("param02", "S");
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST001", box, "rsWp", request);
		return "budget/bud22001";
	}

	// 메인화면
	@RequestMapping(value = "/budget/fd/bud22002_list.do")
	public String bud22002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
	    commDBService.execList("PR_BUDTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "budget/bud22002";
	}

	/********************************************************************************************/
	/* Method Name  : bud23001_list															    */
	/* Description  : 기금운용계획서																*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud23001_list.do")
	public String bud23001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		
		box.put("param01", 	box.get("bugt_yy"));
		commDBService.execBox("PR_BUDTB_BUGT02_LIST", "LIST002", box, "obox", request);
		return "budget/bud23001";	
	}

	/********************************************************************************************/
	/* Method Name  : bud24001_list															    */
	/* Description  : 예산대비집행현황(총괄표)														    */
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud24001_list.do")
	public String bud24001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		
		box.put("param01",	box.getNvl("report_id","ACC002P"));
		box.put("param02", 	box.get("bugt_yy"));
		box.put("param05", 	"Y"); // 실적포함
		commDBService.execList("PR_BUDTB_BUGT02_LIST", "LIST003", box, "rsWp", request);
		return "budget/bud24001";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud24002_list															    */
	/* Description  : 세부 예산집행실적																*/
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud24002_list.do")
	public String bud24002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("bugt_yy").equals("")) { box.put("bugt_yy", DateUtil.getYear()); }
		if(box.get("bugt_class").equals("")) { box.put("bugt_class", "S"); }
		
		if(box.get("select_yn").equals("Y")) {
			box.put("param01", 	box.get("bugt_yy"));
			box.put("param02", 	box.get("bugt_cd"));
			box.put("param03", 	box.get("search_key"));
			box.put("param04", 	box.get("search_val"));
			box.put("param09", 	box.get("sort_order"));
			box.put("param10", 	box.get("excel_yn"));
			if(box.get("excel_yn").equals("P")) {
				Box ebox = commDBService.execXls("PR_BUDTB_BUGT01_LIST", "LIST002A", box);
				returnOkJsonResult(ebox, request, response);
			}else {
				commDBService.execBox("PR_BUDTB_BUGT01_LIST", "LIST002B", box, "obox", request);
				commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST002A", box, "rsWp", request);
			}
		}
		if(box.get("excel_yn").equals("P")) {
			return null;
		}else {
			return "/budget/bud24002";
		}
	} 

	/********************************************************************************************/
	/* Method Name  : bud25001_list															    */
	/* Description  : 기금운용실적분석(기간별 분석)													    */
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud25001_list.do")
	public String bud25001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("column_key").equals("")) { box.put("column_key", "1"); }
		if(box.get("start_yy").equals("")) { box.put("start_yy", "2011"); }
		if(box.get("end_yy").equals("")) { box.put("end_yy", DateUtil.getYear()); }
		
		box.put("param01",  box.get("column_key"));
		box.put("param02",  box.get("start_yy"));
		box.put("param03",  box.get("column_key").equals("2") ? "":box.get("end_yy"));
		box.put("param09", 	box.get("sort_order"));
		box.put("param10", 	box.get("excel_yn"));
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST003A", box, "rsWp", request);		
		return "budget/bud25001";
	}
	
	/********************************************************************************************/
	/* Method Name  : bud25002_list															    */
	/* Description  : 기금운용실적분석(그래프 분석)													    */
	/********************************************************************************************/
	@RequestMapping(value = "/budget/**/bud25002_list.do")
	public String bud25002_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("column_key").equals("")) { box.put("column_key", "1"); }
		if(box.get("start_yy").equals("")) { box.put("start_yy", "2011"); }
		if(box.get("end_yy").equals("")) { box.put("end_yy", DateUtil.getYear()); }
		
		box.put("param01", box.get("column_key"));
		box.put("param02", box.get("column_key").equals("2") ? box.get("end_yy"):box.get("start_yy"));
		box.put("param03", box.get("end_yy"));
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST003B", box, "pieWp", request);
		return "budget/bud25002";
	}
	
	// 목적사업 집행추이
	@RequestMapping(value = "/budget/**/bud25002_listS.do")
	public String bud25002_listS(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("param01"));
		box.put("param02", box.get("param02"));
		box.put("param03", box.get("param03"));
		box.put("param04", box.get("param04").replaceAll("acute;", "|"));
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST003C", box, "lineWp", request);
		return "budget/bud25002S";
	}
	
	// 대부사업 집행추이
	@RequestMapping(value = "/budget/**/bud25002_listL.do")
	public String bud25002_listL(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", box.get("param01"));
		box.put("param02", box.get("param02"));
		box.put("param03", box.get("param03"));
		box.put("param04", box.get("param04").replaceAll("acute;", "|"));
		commDBService.execList("PR_BUDTB_BUGT01_LIST", "LIST003C", box, "lineWp", request);
		return "budget/bud25002L";
	}
	
}
