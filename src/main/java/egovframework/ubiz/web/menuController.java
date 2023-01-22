/*********************************************************************************
* 파  일  명   : MenuController.java
* 작  성  일   : 2013.10.02
* 작  성  자   : 정진수
*---------------------------------------------------------------------------------
* 프로그램명   : MenuController 
* 기능 및 설명 : 메인페이지, 메뉴 처리
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
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.crypto.RsaUtil;
import egovframework.cbiz.util.SysUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Controller
public class menuController extends abstractController {
	@RequestMapping(value = "/com/mainForm.do")
	public String mainForm(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		RsWrapper rsWp = commDBService.execList("PR_COMTB_NOTI01_LIST", "LIST002", box);
		RsWrapper notiWp = new RsWrapper();
		RsWrapper dataWp = new RsWrapper();
		RsWrapper corpWp = new RsWrapper();
		for(int i=0; i < rsWp.getLength(); i++) {
			if(rsWp.get("ref_table",i).equals("NOTI")) { notiWp.appendRs(rsWp.getRsBoxAt(i)); }
			else if(rsWp.get("ref_table",i).equals("DATA")) { dataWp.appendRs(rsWp.getRsBoxAt(i)); }
			else if(rsWp.get("ref_table",i).equals("CORP")) { corpWp.appendRs(rsWp.getRsBoxAt(i)); }
		}
		request.setAttribute("notiWp", notiWp); // 공지사항
		request.setAttribute("dataWp", dataWp); // 자료실
		request.setAttribute("corpWp", corpWp); // 고객사
		
		return "com/frame/main";
	}

	// 메인프레임
	@RequestMapping(value = "/com/mainFrame.do")
	public String mainFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		RsWrapper menuWp = (RsWrapper)request.getSession().getAttribute("menuWp");
		if(menuWp == null || menuWp.getLength() == 0 || box.get("corp_change").equals("Y")) {
			box.put("param01", uSesEnt.empl_no);
			menuWp = commDBService.execList("PR_SYSTB_MENU01_LIST", "LIST001", box);
			request.getSession().setAttribute("menuWp", menuWp);
		}
		return "/com/frame/mainframe";
	}

	@RequestMapping(value = "/com/subFrame.do")
	public String subFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "com/frame/subframe";
	}
	
	// 상단메뉴
	@RequestMapping(value = "/com/topFrame.do")
	public String topFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		if(uSesEnt != null) {
			box.put("sign_empl_no", uSesEnt.empl_no);
			commDBService.execBox("PR_COMTB_MESG02", "SELECT_RECEIVE_COUNT", box, "msgBox", request);
		}
        return "com/frame/top_menu";
	}
	
	// 좌측메뉴
	@RequestMapping(value = "/com/leftFrame.do")
	public String leftFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
        return "com/frame/left_menu";
	}
	
	//우측메뉴
	@RequestMapping(value = "/com/rightFrame.do")
	public String rightFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("empl_no", uSesEnt.empl_no);
		commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request); // 개인정보
		
		RsWrapper rsWp = commDBService.execList("PR_COMTB_NOTI01_LIST", "LIST002", box);
		RsWrapper notiWp = new RsWrapper();
		RsWrapper boadWp = new RsWrapper();
		for(int i=0; i < rsWp.getLength(); i++) {
			if(rsWp.get("ref_table",i).equals("NOTI")) { notiWp.appendRs(rsWp.getRsBoxAt(i)); }
			else if(rsWp.get("ref_table",i).equals("BOAD")) { boadWp.appendRs(rsWp.getRsBoxAt(i)); }
		}
		request.setAttribute("notiWp", notiWp); // 공지사항
		request.setAttribute("boadWp", boadWp); // 게시판

		box.put("param01", uSesEnt.empl_no);
		box.put("param07", "1,2");
		commDBService.execList("PR_COMTB_MESG01_LIST", "LIST001", box, "mesgWp", request); // 도착메시지
		commDBService.execList("PR_BOKTB_MAST01_LIST", "LIST004", box, "bokWp", request); // 목적사업 신청내역

		if(box.get("sys_ymd").equals("")) { box.put("sys_ymd", 	DateUtil.toString("yyyyMMdd")); }
		if(box.get("year").equals("")) { box.put("year", DateUtil.getYear()); }
		if(box.get("month").equals("")) { box.put("month", StringUtil.lpad(DateUtil.getMonth(),"0",2)); }
		if(box.get("day").equals("")) { box.put("day", DateUtil.getDay()); }
		box.put("param02", box.get("year")+box.get("month"));
		commDBService.execList("PR_SYSTB_MEMO01_LIST", "LIST002", box, "memoWp", request); // 월간업무일정
		
		Box rbox = commDBService.execBox("PR_SYSTB_DATE01", "SELECT_WEEKLY", box);
		request.setAttribute("rbox", rbox);
		
		return "com/frame/home";		
	}
	
	@RequestMapping(value = "/com/bottomFrame.do")
	public String bottomFrame(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("corp_cd", uSesEnt.dbo);
		commDBService.execBox("PR_COMTB_CORP01", "SELECT", box, "obox", request);	
        return "com/frame/bottom";
	}

	// JSP Redirect
	@RequestMapping(value = {"/com/**/redirect.do", "/com/redirectEx.do"})
	public String redirectEx(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
        return box.get("reqUrl");
	}

}
