/************************************************************************************************/
/* Class Name    : OtherController                                                         		*/
/* Description   : 그 밖의 컨트롤러																	*/ 
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company       Author     Description                                     */
/* --    ----------    ---------     --------   ------------------------------------------------*/
/* 01    2013/10/02      신진IT컨설팅  	  정 진 수   	Initial Release									*/ 
/*																								*/
/************************************************************************************************/	
package egovframework.ubiz.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;

import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.crypto.SeedCipher;
import egovframework.ubiz.mapper.ent.SesUserEntity; 

@Controller
public class OtherController extends abstractController {

	/********************************************************************************************/
	/* Method Name  : acctCodeSearch															*/
	/* Description  : 계정과목 찾기                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/acctCodeSearch.do")
	public String acctCodeSearch(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	box.get("acct_class"));
		box.put("param02", 	FormatUtil.nvl2(box.get("use_flag"),"A"));	// 사용가능 코드(일반계정)
		box.put("param03", 	box.get("edit_yn"));	// 일반전표 선택가능여부
		box.put("param05", 	box.get("search_key"));
		box.put("param06", 	box.get("search_val"));
		commDBService.execList("PR_ACCTB_CODE01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/acctCodeSearch";		
	}

	/********************************************************************************************/
	/* Method Name  : remarkCodeSearch															*/
	/* Description  : 적요코드 찾기                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/remarkCodeSearch.do")
	public String remarkCodeSearch(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		box.put("param01", 	box.get("acct_cd"));
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		commDBService.execList("PR_ACCTB_REMK01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/remarkCodeSearch";		
	}
	@RequestMapping(value = "/popup/**/remarkCode_insert.do")
	public void remarkCode_insert(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.execBox("PR_ACCTB_REMK01", "INSERT", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	@RequestMapping(value = "/popup/**/remarkCode_delete.do")
	public void remarkCode_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			commDBService.exec("PR_ACCTB_REMK01", "DELETE", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}

	/********************************************************************************************/
	/* Method Name  : custCodeSearch															*/
	/* Description  : 거래처 찾기                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/custCodeSearch.do")
	public String custCodeSearch(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		box.put("param01", box.get("cust_flag"));
		box.put("param02", box.get("search_key"));
		box.put("param03", box.get("search_val"));
		commDBService.execList("PR_ACCTB_CUST01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/custCodeSearch";		
	}

	/********************************************************************************************/
	/* Method Name  : custCodePop																*/
	/* Description  : 거래처 1건 조회                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/custCodePop.do")
	public String custCodePop(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		commDBService.execBox("PR_ACCTB_CUST01", "SELECT", box, "obox", request);
		return "com/popup/custCodePop";
	} 	

	/********************************************************************************************/
	/* Method Name  : emplNoSearch																*/
	/* Description  : 사원 찾기                                            												*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/emplNoSearch.do")
	public String emplNoSearch(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		box.put("param01",	box.get("empl_class"));
		box.put("param02",	box.get("dept_cd"));
		box.put("param03",	box.get("search_key"));
		box.put("param04",	box.get("search_val"));
		box.put("param05",	box.get("retire_flag"));
		box.put("unit_count",	"30");
		commDBService.execList("PR_INSTB_EMPL01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/emplNoSearch";
	} 	

	/********************************************************************************************/
	/* Method Name  : employeePop																*/
	/* Description  : 사원 1명 조회                                            													*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/employeePop.do")
	public String employeePop(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		commDBService.execBox("PR_INSTB_EMPL01", "SELECT", box, "obox", request);
		return "com/popup/employeePop";		
	} 	

	/********************************************************************************************/
	/* Method Name  : slipView																	*/
	/* Description  : 전표 상세조회                                           													*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/slipView.do")
	public String slipView(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	

		Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
		
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST002", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			if(!rbox.get("msg_no").equals("")) {
				box.put("msg_no", rbox.get("msg_no"));
				commDBService.execBox("PR_COMTB_MESG02", "SELECT_SIGNLINE", box, "sbox", request);
			}
			return "account/report/slipDetail_excel";
		}else {
			return "com/popup/slipView";
		}
	} 	

	/********************************************************************************************/
	/* Method Name  : deptCodeSearch															*/
	/* Description  : 부서 찾기                                            												*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/deptCodeSearch.do")
	public String deptCodeSearch(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		box.put("param01", 		box.get("saupjang_cd"));
		box.put("param02", 		box.get("search_key"));
		box.put("param03", 		box.get("search_val"));
		commDBService.execList("PR_INSTB_DEPT01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/deptCodeSearch";		
	} 	

	/********************************************************************************************/
	/* Method Name  : zipFinder																	*/
	/* Description  : 우편번호 찾기                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/zipFinder.do")
	public String zipFinder(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		if(box.get("addr_flag").equals("")) { box.put("addr_flag", "2"); }
		if(box.get("addr_flag").equals("1")) { // 지번주소
			if(!box.get("dong").equals("")) {
				box.put("param01", box.get("dong"));
				commDBService.execList("PR_COMTB_ZIPS01_LIST", "LIST001", box, "rsWp", request);
			}
		}else if(box.get("addr_flag").equals("2")) { // 도로명주소
			if(!box.get("road_nm").equals("")) {
				box.put("param01", box.get("road_nm"));
				box.put("param02", box.get("sido"));
				box.put("param03", box.get("gugun"));
				commDBService.execList("PR_COMTB_ZIPS01_LIST", "LIST002", box, "rsWp", request);
			}
		}
		return "com/popup/zipFinder";		
	} 	

	/********************************************************************************************/
	/* Method Name  : fileAttachPop																*/
	/* Description  : 파일첨부  공통화면                                          										*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/fileAttachPop.do")
	public String fileAttachPop(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		box.put("param01", box.get("ref_table"));
		box.put("param02", box.get("ref_pk"));
		commDBService.execList("PR_COMTB_FILE01_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/fileAttachPop";		
	} 	

	public String fileAttach_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
        Box ibox = (Box)box.clone();
		for(int i=0; i < box.getInt("input_cnt"); i++) {
			if(!box.getSourceFileNm("file_path"+i).equals("")) {
				String cli_file_nm = box.getSourceFileNm("file_path"+i);
				String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
				String svr_file_nm = DateUtil.toString("yyyyMMddHHmmssS") + "_" + StringUtil.replace(box.get("ref_pk"),"|","_")+"."+file_type;
				if(box.get("subDir").equals("")) {
					//box.springMoveFileToService("file_path"+i, box.get("pathKey"), svr_file_nm);
					box.springMoveFileToService("file_path"+i, CustomProperty.upload_dir, "/", svr_file_nm);
				}else {
					//box.springMoveFileToService("file_path"+i, box.get("pathKey"), box.get("subDir"), "", svr_file_nm);
					box.springMoveFileToService("file_path"+i, CustomProperty.upload_dir, "/", svr_file_nm);
				}
				ibox.put("file_nm", cli_file_nm);
				ibox.put("file_path", svr_file_nm);
				ibox.put("file_desc", box.get("file_desc"+i));
				ibox.put("file_type", file_type);
				ibox.put("file_size", box.getStoredFileSize("file_path"+i));
				commDBService.execBox("PR_COMTB_FILE01", "INSERT", ibox);
			}
		}
		String script = "alert('저장되었습니다.'); try{opener.file_upload_post();}catch(e){} self.close();";
		return scriptOnly(script, request);
	} 	

	public String fileAttach_delete(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		String file_path = CustomProperty.upload_dir + "/" + box.get("pathKey");
		if(!box.get("subDir").equals("")) { file_path += "/" + box.get("subDir"); }
		file_path += "/" + box.get("file_path");
		FileUtil.doDeleteFile(file_path);
		
		commDBService.exec("PR_COMTB_FILE01", "DELETE", box);
        return Redirect("other.do?method=fileAttachPop", "pathKey, subDir, ref_table, ref_pk, insOk, delOk, maxRow", request);
	} 	

	/********************************************************************************************/
	/* Method Name  : slipDetailView															*/
	/* Description  : 전표 상세조회 팝업															*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/slipDetailView.do")
	public String slipDetailView(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_ACCTB_SLIP01", "SELECT_DETAIL", box, "obox", request);
		
		box.put("param01", box.get("slip_no"));
		commDBService.execList("PR_ACCTB_SLIP02_LIST", "LIST002", box, "rsWp", request);
		if(box.get("excel_yn").equals("Y")) {
			if(!rbox.get("msg_no").equals("")) {
				box.put("msg_no", rbox.get("msg_no"));
				commDBService.execBox("PR_COMTB_MESG02", "SELECT_SIGNLINE", box, "sbox", request);
			}
			return "account/report/slipDetail_excel";
		}else {
			return "com/popup/slipDetailView";
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : signLineView															    */
	/* Description  : 결재라인 조회																*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/signLineView.do")
	public String signLineView(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_COMTB_MESG01", "SELECT", box, "obox", request);
		
		box.put("param01", rbox.get("msg_no"));
		commDBService.execList("PR_COMTB_MESG02_LIST", "LIST001", box, "rsWp", request);
		return "com/popup/signLineView";
	}
	
	/********************************************************************************************/
	/* Method Name  : idDupCheck																*/
	/* Description  : 아이디 중복확인                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/idDupCheck.do")
	public String idDupCheck(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		commDBService.execBox("PR_INSTB_EMPL01", "ID_DUP_CHECK", box, "obox", request);
		return "com/popup/idDupCheck";		
	} 	

	/********************************************************************************************/
	/* Method Name  : pswdChange																*/
	/* Description  : 비밀번호 변경                                            											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/pswdChange.do")
	public String pswdChange(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		commDBService.execBox("PR_INSTB_EMPL01", "SELECT_LOGIN", box, "obox", request);
		return new String("com/popup/pswdChange");		
	} 	

	@RequestMapping(value = "/popup/**/pswdChange_update.do")
	public void pswdChange_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {	
		try {
			Box rbox = commDBService.execBox("PR_INSTB_EMPL01", "SELECT_LOGIN", box);
			if(!rbox.get("pswd").equals(SeedCipher.encode(box.get("old_pswd")).trim())) { 
				returnFailJsonResult("현재 비밀번호가 맞지 않습니다.", request, response); 
				return;
			}

			box.put("pswd", SeedCipher.encode(box.get("new_pswd")).trim());
			commDBService.exec("PR_INSTB_EMPL01", "UPDATE_PSWD", box);
			returnOkJsonResult(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	} 

	/********************************************************************************************/
	/* Method Name  : siteMap															    	*/
	/* Description  : 사이트맵																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/com/**/siteMap.do")
	public String siteMap(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", uSesEnt.empl_no);
		commDBService.execList("PR_SYSTB_MENU01_LIST", "LIST001", box, "menuWp", request);
        return "com/sitemap";
	}
	
	/********************************************************************************************/
	/* Method Name  : imgPopup																	*/
	/* Description  : 이미지 팝업 뷰어																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/imgPopup.do")
	public String imgPopup(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "/com/popup/imgPopup";
	}
	
	/********************************************************************************************/
	/* Method Name  : sabokHelp															    	*/
	/* Description  : 도움말																		*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/**/sabokHelpAll.do")
	public String sabokHelpAll(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		box.put("param01", 	uSesEnt.use_auth);
		box.put("param02", 	box.get("search_key"));
		box.put("param03", 	box.get("search_val"));
		commDBService.execList("PR_COMTB_HELP01_LIST", "LIST002", box, "rsWp", request);
        return "com/help/hlp01001";
	}
    
	@RequestMapping(value = "/popup/**/sabokHelp.do")
	public String sabokHelp(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		commDBService.execBox("PR_COMTB_HELP01", "SELECT", box, "obox", request);
        return "com/help/hlp01002";
	}
	
	/********************************************************************************************/
	/* Method Name  : htmlEditorImage															*/
	/* Description  : HTML 에디터 이미지파일 등록                                          											*/
	/********************************************************************************************/
	@RequestMapping(value = "/popup/htmlEditorImage.do")
	public String htmlEditorImage(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		return "/com/popup/htmlEditorImage";
	}	
	
	@RequestMapping(value = "/popup/htmlEditorImage_update.do")
	public void htmlEditorImage_update(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			String cli_file_nm = box.getSourceFileNm("attach_doc");
			String file_type = cli_file_nm.substring(cli_file_nm.lastIndexOf(".")+1);
			String svr_file_nm = CD.getNewID()+"."+file_type;
			box.springMoveFileToService("attach_doc", CustomProperty.upload_dir, "editor", svr_file_nm);
			
			Box obox = new Box("");
			obox.put("file_path", svr_file_nm);
			request.setAttribute("obox", obox);
			returnOkJsonResult(obox, request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : fileDownload															    */
	/* Description  : 파일 다운로드																	*/
	/********************************************************************************************/
	@RequestMapping(value="/com/fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		String filePath = (box.get("pathGbn").equals("") ? CustomProperty.upload_dir : "") + box.get("pathKey") + "/" + box.get("file_path");
		String fileName = box.getNvl("file_nm", box.get("file_path"));
		File file = new File(filePath);
		if(!file.exists()) {
			filePath = new String(filePath.getBytes("UTF-8"),"8859_1");
			file = new File(filePath);
			if(!file.exists()) {
				PrintWriter out;
				response.setContentType("text/html");
				response.setCharacterEncoding("euc-kr");
				out = response.getWriter();
				out.println("<script>alert('서버에서 파일을 찾을 수 없습니다.');history.back();</script>");
				out.close();
				return;
			}
		}
		downloadFile(response, filePath, fileName, file);
	}
	
	public static void downloadFile(HttpServletResponse response, String filePath, String fileRealName, File file) throws UnsupportedEncodingException, FileNotFoundException, IOException {
		BufferedInputStream Bfin = null;
		BufferedOutputStream outs = null;
		
		try {
			response.setContentType("application/octet-stream"); 
			response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileRealName, "UTF-8").replaceAll("\\+", " ").replaceAll("%28","(").replaceAll("%29",")")); 
			
			int fileSize = (int)file.length();  //파일 크기
			response.setHeader("Content-Length", ""+fileSize);  
	
			// 파일 스트림을 저장하기 위한 바이트 배열 생성.  
			byte bytestream[] = new byte[2048]; 
	
			// 파일 객체를 스트림으로 불러온다.
			Bfin = new BufferedInputStream(new FileInputStream(file)); 
			outs = new BufferedOutputStream(response.getOutputStream()); 
	
			int read = 0; 
			while((read = Bfin.read(bytestream)) != -1) { 
				outs.write(bytestream,0,read);
			} 
	
		} catch (Exception ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
		} finally {
			if (outs != null) { try {outs.close(); } catch (Exception ex) {}} 
			if (Bfin != null) { try {Bfin.close(); } catch (Exception ex) {}}
		}
	}
	
	/********************************************************************************************/
	/* Method Name  : codeList															    	*/
	/* Description  : 코드목록 조회																	*/
	/********************************************************************************************/
	@RequestMapping(value="/com/codeList.do")
	public void codeList(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		JsonObject jsonObj = new JsonObject();
		RsWrapper rsWp = commDBService.execList(box.get("pr_action_nm").split("@")[0], box.get("pr_action_nm").split("@")[1], box);
		jsonObj.add("codeList", getJson(rsWp));
		returnJsonResult(jsonObj, request, response);
	}
	
	/********************************************************************************************/
	/* Method Name : commonProcResult															*/
	/* Description : 프로시저 실행결과  															  		*/
	/********************************************************************************************/
	@RequestMapping(value="/com/commonProcBox.do")
	public void commonProcBox(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		Box obox = commDBService.execBox(box.get("proc_nm"), box.get("action_type"), box);
		returnJsonResult(getJsonObj(obox), request, response);
	}

	@RequestMapping(value="/com/commonProcList.do")
	public void commonProcList(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		RsWrapper rsWp = commDBService.execList(box.get("proc_nm"), box.get("action_type"), box);
		JsonObject jsonObj = new JsonObject();
    	jsonObj.add("data", getJson(rsWp));
		returnJsonResult(jsonObj, request, response);
	}

	@RequestMapping(value="/com/commonProcUpdate.do")
	public void commonProcUpdate(HttpServletRequest request, HttpServletResponse response, Model model, SesUserEntity uSesEnt, Box box) throws Exception {
		try {
			Box rbox = new Box("");
			if(box.get("rtn_box").equals("Y")) {
				rbox = commDBService.execBox(box.get("proc_nm"), box.get("action_type"), box);
			}else {
				commDBService.exec(box.get("proc_nm"), box.get("action_type"), box);
			}
			returnOkJsonResult(rbox, request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			CD.logger.error(ExceptionUtils.getMessage(ex));
			returnFailJsonResult(isProcUserEx(ex) ? getProcUserExMsg(ex) : getUserExMsg(ex.toString()), request, response);
		}
	}
}


