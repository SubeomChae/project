/************************************************************************************************/
/* Class Name    : tax10Controller                                                         		*/
/* Description   : 세무관리																			*/
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

@Controller
public class tax10Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : adj01001															    	*/
	/* Description  : 법인세과세표준신고 프레임															*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/adj01001.do")
	public String adj01001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", String.valueOf(Integer.parseInt(DateUtil.getYear())-1)); }
		box.put("param01", 	"tax_report");
		box.put("param05", 	"Y");
		commDBService.execList("PR_COMTB_CODE02_LIST", "LIST001", box, "rsWp", request);		
		return "/tax/adj01001";
	} 
	
	/********************************************************************************************/
	/* Method Name  : adj01002															    	*/
	/* Description  : 법인세과세표준신고 검색조건(공통)														*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/fd/adj01002.do")
	public String adj01002(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", String.valueOf(Integer.parseInt(DateUtil.getYear())-1)); }
		return "/tax/adj01002";
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02001_1															    */
	/* Description  : 법인세 과세표준 및 세액신고서															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02001_1.do", "/tax/fd/adj02001_1_excel.do"})
	public String adj02001_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02001_1_excel";
		}else {	
			return "/tax/adj02001_1";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : xmlUpdate															    	*/
	/* Description  : XML형태로 DB저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/xmlUpdate.do")
	public void xmlUpdate(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String xmlBuf = "";
			xmlBuf += "<?xml version=\"1.0\" encoding=\"euc-kr\" ?>" + "\n";
			xmlBuf += "<" +box.get("report_id")+ ">" + "\n";
			xmlBuf += box.get("xmlBuf");
			xmlBuf += "</" +box.get("report_id")+ ">";
			
			box.put("corp_cd",     box.get("dbo"));
			box.put("std_yy",      box.get("std_yy"));
			box.put("report_id",   box.get("report_id"));
			box.put("xml_body",    xmlBuf);
			commDBService.exec("PR_COMTB_REPT01", "UPDATE_XML", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	//	 2016.04.22 추가
	/********************************************************************************************/
	/* Method Name  : adj02001_2															    */
	/* Description  : 법인지방소득세 과세표준 및 세액신고서														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02001_2.do", "/tax/fd/adj02001_2_excel.do"})
	public String adj02001_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02001_2_excel";
		}else {	
			return "/tax/adj02001_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02003_1															    */
	/* Description  : 법인세 과세표준 및 세액조정계산서														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_1.do", "/tax/fd/adj02003_1_excel.do"})
	public String adj02003_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_1_excel";
		}else {	
			return "/tax/adj02003_1";
		}
	}
	
	//	 2016.04.22 추가
	/********************************************************************************************/
	/* Method Name  : adj02003_2															    */
	/* Description  : 법인지방소득세 과세표준 및 세액조정계산서													*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_2.do", "/tax/fd/adj02003_2_excel.do"})
	public String adj02003_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_2_excel";
		}else {	
			return "/tax/adj02003_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02003_2_1															    */
	/* Description  : 표준대차대조표(일반법인용)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_2_1.do", "/tax/fd/adj02003_2_1_excel.do"})
	public String adj02003_2_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("std_yy"));
		commDBService.execBox("PR_ACC_TAX_REPORT", "LIST005", box, "rbox", request);
		
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_2_1_excel";
		}else {	
			return "/tax/adj02003_2_1";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02003_2_3															    */
	/* Description  : 표준대차대조표(금융기관용)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_2_3.do", "/tax/fd/adj02003_2_3_excel.do"})
	public String adj02003_2_3(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("std_yy"));
		commDBService.execBox("PR_ACC_TAX_REPORT", "LIST005", box, "rbox", request);
		
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_2_3_excel";
		}else {	
			return "/tax/adj02003_2_3";
		}
	}

	/********************************************************************************************/
	/* Method Name  : adj02003_3_1															    */
	/* Description  : 표준손익계산서(일반법인용)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_3_1.do", "/tax/fd/adj02003_3_1_excel.do"})
	public String adj02003_3_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("std_yy"));
		commDBService.execBox("PR_ACC_TAX_REPORT", "LIST006", box, "rbox", request);
		
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_3_1_excel";
		}else {	
			return "/tax/adj02003_3_1";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02003_3_2															    */
	/* Description  : 표준손익계산서(금융기관용)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_3_2.do", "/tax/fd/adj02003_3_2_excel.do"})
	public String adj02003_3_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("std_yy"));
		commDBService.execBox("PR_ACC_TAX_REPORT", "LIST006", box, "rbox", request);
		
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_3_2_excel";
		}else {	
			return "/tax/adj02003_3_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02003_3_4														    	*/
	/* Description  : 이익잉여금처분(결손금처리)계산서														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02003_3_4.do", "/tax/fd/adj02003_3_4_excel.do"})
	public String adj02003_3_4(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02003_3_4_excel";
		}else {	
			return "/tax/adj02003_3_4";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02008															    	*/
	/* Description  : 사내근로복지기금운영상황보고															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02008.do", "/tax/fd/adj02008_excel.do"})
	public String adj02008(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", String.valueOf(Integer.parseInt(DateUtil.getYear())-1)); }
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		
		box.put("param01", box.get("std_yy"));
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST003", box, "rsWp", request);
		
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02008_excel";
		}else {	
			return "/tax/adj02008";
		}
	}

	/********************************************************************************************/
	/* Method Name  : adj02010_a															    */
	/* Description  : 원천납부세액명세서(갑)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02010_a.do", "/tax/fd/adj02010_a_excel.do"})
	public String adj02010_a(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		box.put("param01", box.get("std_yy"));
		box.put("param02", "1110901"); // 선급법인세
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001A", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02010_a_excel";
		}else {	
			return "/tax/adj02010_a";
		}
	}

	/********************************************************************************************/
	/* Method Name  : adj02010_b															    */
	/* Description  : 원천납부세액명세서(을)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02010_b.do", "/tax/fd/adj02010_b_excel.do"})
	public String adj02010_b(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		box.put("param01", box.get("std_yy"));
		box.put("param02", "1110901"); // 선급법인세
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02010_b_excel";
		}else {	
			return "/tax/adj02010_b";
		}
	}
	
	// 2016.04.22 추가
	/********************************************************************************************/
	/* Method Name  : adj02010_c															    */
	/* Description  : 법인지방소득세 특별징수세액명세서(갑)													*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02010_c.do", "/tax/fd/adj02010_c_excel.do"})
	public String adj02010_c(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		box.put("param01", box.get("std_yy"));
		box.put("param02", "1110901"); // 선급법인세+선급지방소득세
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02010_c_excel";
		}else {	
			return "/tax/adj02010_c";
		}
	}
	
	// 2016.04.22 추가
	/********************************************************************************************/
	/* Method Name  : adj02010_d															    */
	/* Description  : 법인지방소득세 특별징수세액명세서(을)													*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02010_d.do", "/tax/fd/adj02010_d_excel.do"})
	public String adj02010_d(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		box.put("param01", box.get("std_yy"));
		box.put("param02", "11109"); // 선급법인세+선급지방소득세
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02010_d_excel";
		}else {	
			return "/tax/adj02010_d";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02015															    	*/
	/* Description  : 소득금액조정합계표																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02015.do", "/tax/fd/adj02015_excel.do"})
	public String adj02015(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02015_excel";
		}else {	
			return "/tax/adj02015";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02015_1														    	*/
	/* Description  : 과목별소득금액조정명세서(1)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02015_1.do", "/tax/fd/adj02015_1_excel.do"})
	public String adj02015_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02015_1_excel";
		}else {	
			return "/tax/adj02015_1";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02015_2														    	*/
	/* Description  : 과목별소득금액조정명세서(2)															*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02015_2.do", "/tax/fd/adj02015_2_excel.do"})
	public String adj02015_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02015_2_excel";
		}else {	
			return "/tax/adj02015_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02016															    	*/
	/* Description  : 수입금액조정명세서																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02016.do", "/tax/fd/adj02016_excel.do"})
	public String adj02016(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02016_excel";
		}else {	
			return "/tax/adj02016";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02016_2														    	*/
	/* Description  : 수입금액조정명세서																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02016_2.do", "/tax/fd/adj02016_2_excel.do"})
	public String adj02016_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02016_2_excel";
		}else {	
			return "/tax/adj02016_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02017															    	*/
	/* Description  : 조정후수입금액명세서																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02017.do", "/tax/fd/adj02017_excel.do"})
	public String adj02017(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02017_excel";
		}else {	
			return "/tax/adj02017";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02027_a															    */
	/* Description  : 고유목적사업준비금조정명세서(갑)														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02027_a.do", "/tax/fd/adj02027_a_excel.do"})
	public String adj02027_a(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02027_a_excel";
		}else {	
			return "/tax/adj02027_a";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02027_b															    */
	/* Description  : 고유목적사업준비금조정명세서(을)														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02027_b.do", "/tax/fd/adj02027_b_excel.do"})
	public String adj02027_b(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);

		box.put("param01", box.get("std_yy"));
		box.put("param02", "74001"); // 고유목적사업준비금전입액
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001B", box, "rsWp1", request);

		box.put("param02", "71"); // 고유목적사업비
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001B", box, "rsWp2", request);

		box.put("param02", "72"); // 일반관리비
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001B", box, "rsWp3", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02027_b_excel";
		}else {	
			return "/tax/adj02027_b";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02047_a															    */
	/* Description  : 주요계정명세서(갑)																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02047_a.do", "/tax/fd/adj02047_a_excel.do"})
	public String adj02047_a(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02047_a_excel";
		}else {	
			return "/tax/adj02047_a";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02047_b															    */
	/* Description  : 주요계정명세서(을)																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02047_b.do", "/tax/fd/adj02047_b_excel.do"})
	public String adj02047_b(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02047_b_excel";
		}else {	
			return "/tax/adj02047_b";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02050_a															    */
	/* Description  : 자본금과 적립금 조정명세서(갑)														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02050_a.do", "/tax/fd/adj02050_a_excel.do"})
	public String adj02050_a(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02050_a_excel";
		}else {	
			return "/tax/adj02050_a";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02050_b															    */
	/* Description  : 자본금과 적립금 조정명세서(을)														*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02050_b.do", "/tax/fd/adj02050_b_excel.do"})
	public String adj02050_b(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02050_b_excel";
		}else {	
			return "/tax/adj02050_b";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02056																    */
	/* Description  : 법인세·농어촌특별세 과세표준(조정계산)및 세액신고서											*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02056.do", "/tax/fd/adj02056_excel.do"})
	public String adj02056(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02056_excel";
		}else {	
			return "/tax/adj02056";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02056_1															    */
	/* Description  : 가산세액계산서																	*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02056_1.do", "/tax/fd/adj02056_1_excel.do"})
	public String adj02056_1(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02056_1_excel";
		}else {	
			return "/tax/adj02056_1";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02056_2															    */
	/* Description  : 법인지방소득세 과세표준(조정계산)및 세액신고서												*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02056_2.do", "/tax/fd/adj02056_2_excel.do"})
	public String adj02056_2(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02056_2_excel";
		}else {	
			return "/tax/adj02056_2";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02999																    */
	/* Description  : 전산조직운용명세서																*/
	/********************************************************************************************/
	@RequestMapping(value = {"/tax/**/adj02999.do", "/tax/fd/adj02999_excel.do"})
	public String adj02999(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", box.get("dbo"));
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);
		if(box.get("excel_yn").equals("Y")) {
			return "/tax/report/adj02999_excel";
		}else {	
			return "/tax/adj02999";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj02999_update														    */
	/* Description  : 전산조직운용명세서 저장																*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/adj02999_update.do")
	public void adj02999_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			box.put("os_type", 		box.get("os_type")+"Ð"+box.get("os_type_etc"));
			box.put("pgm_language", box.get("pgm_language")+"Ð"+box.get("pgm_language_etc"));
			box.put("dbms", 		box.get("dbms")+"Ð"+box.get("dbms_etc"));
			box.put("erp", 			box.get("erp")+"Ð"+box.get("erp_etc"));
			box.put("acc_package", 	box.get("acc_package")+"Ð"+box.get("acc_package_etc"));
			box.put("etxn_type", 	box.get("etxn_type")+"Ð"+box.get("etxn_type_etc"));
			box.put("unit_system", 	box.get("unit_system")+"Ð"+box.get("unit_system_etc"));
			commDBService.exec("PR_COMTB_CORP01", "UPDATE_IT_MANAGE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : adj03001_list															    */
	/* Description  : 접대비지출명세서																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/adj03001_list.do")
	public String adj03001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("std_yy").equals("")) { box.put("std_yy", String.valueOf(Integer.parseInt(DateUtil.getYear())-1)); }
		
		box.put("param01", box.get("std_yy"));
		box.put("param02", "7220201");	// 접대비
		commDBService.execList("PR_ACC_TAX_REPORT", "LIST001", box, "rsWp", request);
		return "/tax/adj03001";
	}
	


	/********************************************************************************************/
	/* Method Name  : vat01001															    	*/
	/* Description  : 부가세 자료관리																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01001.do")
	public String vat01001(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("tax_year").equals("")) { box.put("tax_year", DateUtil.toString("yyyy")); }
		if(box.get("tax_gisu").equals("")) { 
			box.put("tax_year", DateUtil.toString("yyyy"));
			if(DateUtil.toString("MM").equals("01")) { box.put("tax_year", String.valueOf(Integer.parseInt(DateUtil.toString("yyyy"))-1)); }
			if(DateUtil.toString("MM").compareTo("02") >= 0 && DateUtil.toString("MM").compareTo("04") <= 0) {
				box.put("tax_gisu", "0103");
			}else if(DateUtil.toString("MM").compareTo("05") >= 0 && DateUtil.toString("MM").compareTo("07") <= 0) {
				box.put("tax_gisu", "0406");
			}else if(DateUtil.toString("MM").compareTo("08") >= 0 && DateUtil.toString("MM").compareTo("10") <= 0) {
				box.put("tax_gisu", "0709");
			}else if(DateUtil.toString("MM").compareTo("11") >= 0 || DateUtil.toString("MM").compareTo("01") <= 0) {
				box.put("tax_gisu", "1012");
			}
		}
		if(box.get("acct_flag").equals("")) { box.put("acct_flag", "B"); }

		box.put("param01", box.get("tax_year"));
		box.put("param02", box.get("tax_gisu"));
		box.put("param03", box.get("acct_flag"));
		box.put("param04", box.get("vat_cd"));
		box.put("param05", box.get("search_key"));
		box.put("param06", box.get("search_val"));
		box.put("param09", box.get("sort_order"));
		box.put("param10", box.get("excel_yn"));
		commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST001", box, "rsWp", request);

		return "/tax/vat01001";
	}
	
	/********************************************************************************************/
	/* Method Name  : vat01001_create														    */
	/* Description  : 부가세 자료생성																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01001_create.do")
	public String vat01001_create(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_ACCTB_VATX01", "CREATE", box);
		String msg = rbox.getInt("cnt") == 0 ? "생성할 자료가 없습니다." : rbox.get("cnt") + "건의 자료가 생성되었습니다.";
		return alertNRedirect(msg, "vat01001.do", "tax_year, tax_gisu", request);
	}

	/********************************************************************************************/
	/* Method Name  : vat01002_edit													    		*/
	/* Description  : 부가세 수정화면																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01002_edit.do")
	public String vat01002_edit(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_ACCTB_VATX01", "SELECT", box, "obox", request);
    	return "/tax/vat01002";
	}

	/********************************************************************************************/
	/* Method Name  : vat01002_update														    */
	/* Description  : 부가세 저장																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01002_update.do")
	public void vat01002_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("saupja_no", box.get("saupja_no1")+box.get("saupja_no2")+box.get("saupja_no3"));
			box.put("proof_no", box.get("proof_no1")+StringUtil.lpad(box.get("proof_no2"),"0",4));
			commDBService.exec("PR_ACCTB_VATX01", "UPDATE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	} 

	/********************************************************************************************/
	/* Method Name  : vat01002_delete														    */
	/* Description  : 부가세 삭제																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01002_delete.do")
	public void vat01002_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			commDBService.exec("PR_ACCTB_VATX01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	} 

	/********************************************************************************************/
	/* Method Name  : vat01002_copy														    	*/
	/* Description  : 부가세 추가																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat01002_copy.do")
	public void vat01002_copy(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try{
			box.put("saupja_no", box.get("saupja_no1")+box.get("saupja_no2")+box.get("saupja_no3"));
			box.put("proof_no", box.get("proof_no1")+StringUtil.lpad(box.get("proof_no2"),"0",4));
			commDBService.exec("PR_ACCTB_VATX01", "INSERT_COPY", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	} 
		
//		String script = "alert('추가되었습니다'); parent.goSearch('N');";
//		return scriptOnly(script, request);
//	}	

	/********************************************************************************************/
	/* Method Name  : vatMain															    	*/
	/* Description  : 부가가세신고자료 메인화면															*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vatMain.do")
	public String vatMain(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(box.get("tax_year").equals("")) { box.put("tax_year", DateUtil.toString("yyyy")); }
		if(box.get("tax_gisu").equals("")) { 
			box.put("tax_year", DateUtil.toString("yyyy"));
			if(DateUtil.toString("MM").equals("01")) { box.put("tax_year", String.valueOf(Integer.parseInt(DateUtil.toString("yyyy"))-1)); }
			if(DateUtil.toString("MM").compareTo("02") >= 0 && DateUtil.toString("MM").compareTo("04") <= 0) {
				box.put("tax_gisu", "0103");
			}else if(DateUtil.toString("MM").compareTo("05") >= 0 && DateUtil.toString("MM").compareTo("07") <= 0) {
				box.put("tax_gisu", "0406");
			}else if(DateUtil.toString("MM").compareTo("08") >= 0 && DateUtil.toString("MM").compareTo("10") <= 0) {
				box.put("tax_gisu", "0709");
			}else if(DateUtil.toString("MM").compareTo("11") >= 0 || DateUtil.toString("MM").compareTo("01") <= 0) {
				box.put("tax_gisu", "1012");
			}
		}
		return "/tax/vatMain";
	}
	
	/********************************************************************************************/
	/* Method Name  : vat11001_list															    */
	/* Description  : 부가세명세서																    */
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat11001_list.do")
	public String vat11001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {		
		if(!box.get("tax_year").equals("") && !box.get("tax_gisu").equals("")) { 
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			box.put("param03", box.get("acct_flag"));
			box.put("param04", box.get("vat_cd"));
			box.put("param05", box.get("search_key"));
			box.put("param06", box.get("search_val"));
			box.put("param07", box.get("cust_cd"));
			box.put("param09", box.get("sort_order"));
			box.put("param10", box.get("excel_yn"));
			commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST002", box, "rsWp", request);
		}
		return "/tax/vat11001";
	}
	
	/********************************************************************************************/
	/* Method Name  : vat12001_list															    */
	/* Description  : 매입장																		*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat12001_list.do")
	public String vat12001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {		
		if(!box.get("tax_year").equals("") && !box.get("tax_gisu").equals("")) { 
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			box.put("param03", box.get("acct_flag"));
			box.put("param04", box.get("vat_cd"));
			box.put("param05", box.get("proof_ymd_from")+"|"+box.get("proof_ymd_to"));
			box.put("param06", box.get("cust_cd")+"|"+box.get("cust_nm"));
			box.put("param07", box.get("remark"));
			box.put("param09", box.get("sort_order"));
			box.put("param10", box.get("excel_yn"));
			commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST003", box, "rsWp", request);
		}
		return "/tax/vat12001";
	}
		
	/********************************************************************************************/
	/* Method Name  : vat13001_list															    */
	/* Description  : 매입처별 세금계산서 합계표															*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat13001_list.do")
	public String vat13001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		if(!box.get("tax_year").equals("") && !box.get("tax_gisu").equals("")) {
			commDBService.execBox("PR_ACCTB_VATX01", "SELECT_TAX", box, "obox", request);		
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			box.put("param03", "1");
			commDBService.execBox ("PR_ACCTB_VATX01_LIST", "LIST004B", box, "vbox", request);
			commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST004A", box, "rsWp", request);
		}
		return "/tax/vat13001";
	}
	
	/********************************************************************************************/
	/* Method Name  : vat14001_list															    */
	/* Description  : 매입처별 계산서 합계표																*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/vat14001_list.do")
	public String vat14001_list(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		if(!box.get("tax_year").equals("") && !box.get("tax_gisu").equals("")) {
			commDBService.execBox("PR_ACCTB_VATX01", "SELECT_TAX", box, "obox", request);		
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			box.put("param03", "2");
			commDBService.execBox ("PR_ACCTB_VATX01_LIST", "LIST004B", box, "vbox", request);
			commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST004A", box, "rsWp", request);
		}
		return "/tax/vat14001";
	}

}
