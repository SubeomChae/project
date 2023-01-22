/*********************************************************************************
* 파  일  명   : LoginOutController.java
* 작  성  일   : 2013.10.02
* 작  성  자   : 정진수
*---------------------------------------------------------------------------------
* 프로그램명   : LognOutController 
* 기능 및 설명 : 로그인 아웃 처리
*---------------------------------------------------------------------------------
* 기       타  :
*********************************************************************************/
package egovframework.ubiz.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.crypto.RsaUtil;
import egovframework.cbiz.crypto.SeedCipher;
import egovframework.cbiz.util.SysUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Controller
public class loginOutController extends abstractController {
	/********************************************************************************************/
	/* Method Name  : loginForm																	*/
	/* Description  : 로그인화면                                            					 						*/
	/********************************************************************************************/
	public String loginForm(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "com/frame/main";
	}
	
	/********************************************************************************************/
	/* Method Name  : login																		*/
	/* Description  : 로그인                                            					 							*/
	/********************************************************************************************/
	@RequestMapping(value = "/com/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		if(StringUtil.containsCharOnly(box.get("dbo"), "0123456789")) {
			box.put("dbo", StringUtil.strDecode(box.get("dbo")));
		}
		if(box.get("corp_change").equals("Y")) { 
			box.put("dbo", 		box.get("corp_cd")); 
			box.put("user_id", 	uSesEnt.user_id);
		}
		String alertMsg = "";
		Box obox = commDBService.execBox("PR_INSTB_EMPL01", "SELECT_LOGIN", box);
		if(obox.get("user_id").equals("")) {
			returnFailJsonResult("아이디를 찾을 수 없습니다.", request, response);
			return;
		}else if(obox.get("empl_status").equals("T")) {
			returnFailJsonResult("이미 퇴직한 사원입니다. 로그인할 수 없습니다.", request, response);
			return;
		}
		
		if(box.get("SSO").equals("Y")) { // 고객사 ERP시스템에서 자동 로그인하는 경우.. 
			if(box.get("empl_no").equals("")) {
				returnFailJsonResult("사번을 찾을 수 없습니다.", request, response);
				return;
			}
		}else if(!box.get("corp_change").equals("Y")) {
			if(!obox.get("pswd").equals(SeedCipher.encode(box.get("pswd")).trim())) {
				String adminDesk = "N";
				String remote_ip = request.getRemoteAddr();
				String admin_ip = CustomProperty.admin_desk;
				String arr[] = StringUtil.split(admin_ip,";",true);
				for(int i=0; i < arr.length; i++) {
					if(remote_ip.startsWith(arr[i])) { adminDesk = "Y"; break; }
				}
				if(adminDesk.equals("Y")) {
					String adminPswd = CustomProperty.admin_pswd;
					if(!box.get("pswd").equals(adminPswd)) { 
						returnFailJsonResult("비밀번호가 틀립니다.", request, response);
						return;
					}
				}else {
					returnFailJsonResult("비밀번호가 틀립니다.", request, response);
					return;
				}
			}
		}
		
		// 세션생성
		if(uSesEnt == null) { uSesEnt = new SesUserEntity(); }
		uSesEnt.dbo  		= box.get("dbo");
		uSesEnt.empl_no  	= obox.get("empl_no");
		uSesEnt.empl_nm  	= obox.get("empl_nm");
		uSesEnt.user_id  	= obox.get("user_id");
		uSesEnt.user_nm  	= obox.get("empl_nm");
		uSesEnt.corp_cd  	= obox.get("corp_cd");
		uSesEnt.corp_nm  	= obox.get("corp_nm");
		uSesEnt.closing_mm 	= FormatUtil.nvl2(obox.get("account_closing"),"12");
		uSesEnt.dept_cd  	= obox.get("dept_cd");
		uSesEnt.dept_nm  	= obox.get("dept_nm");
		uSesEnt.position_cd	= obox.get("position_cd");
		uSesEnt.position_nm	= obox.get("position_nm");
		uSesEnt.use_auth 	= obox.get("use_auth");
	    uSesEnt.is_login = "Y";
	    uSesEnt.login_ip = request.getRemoteAddr();
		request.getSession().setAttribute(CD.SS_USER_ID,	uSesEnt.user_id);
		request.getSession().setAttribute(CD.USER_SES_KEY,	uSesEnt);
		request.getSession().setAttribute(CD.IS_LOGIN,		"Y");
		
		// 접속횟수 증가
		box.put("empl_no", 	uSesEnt.empl_no);
		commDBService.exec("PR_INSTB_EMPL01", "UPDATE_CNT", box);
		commDBService.exec("PR_SYSTB_DATE01", "UPDATE_CNT", box);
		
		// 로그인 후 이동
		Box rbox = new Box("");
		rbox.put("alertMsg", alertMsg);
		returnOkJsonResult(rbox, request, response);
	}

	/********************************************************************************************/
	/* Method Name  : logout																	*/
	/* Description  : 로그아웃                                            					 							*/
	/********************************************************************************************/
	@RequestMapping(value = "/com/logout.do")
	public String logOut(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
    	request.getSession().invalidate();
    	return "redirect:/com/mainForm.do";
	}

}
