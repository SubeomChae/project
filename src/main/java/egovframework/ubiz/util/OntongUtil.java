package egovframework.ubiz.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.jdom2.Document;
import org.jdom2.Element;

import com.google.gson.JsonObject;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.XMLUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;

public class OntongUtil {
	
	// FMS에서 설계도서시스템 특정 메쏘드 호출
	public static String callOntong(String url, NameValuePair[] prm) throws Exception {
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(url);
		for(int i=0; i < prm.length; i++) {
			method.addParameter(prm[i].getName(), new String(prm[i].getValue().getBytes(),"EUC-KR")); 
		}
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,  new DefaultHttpMethodRetryHandler(3, false));
		try {
			int statusCode = client.executeMethod(method);
			if(statusCode != HttpStatus.SC_OK) {
				System.out.println("[OntongUtil.callOntong.statusCode] " + statusCode);	
				return "ERR";
			}
	  
			byte[] responseBody = method.getResponseBody();
			String res = new String(responseBody, "EUC-KR");
			System.out.println("[OntongUtil.callOntong.res] " + res);	
			return res;
		}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("[OntongUtil.callOntong.Exception] " + ex.toString());	
			return "ERR"; 
		}finally {
			method.releaseConnection();
		}
	}
	
	// 설계도서 열람/검수/사본발급 도구에서 로그인
	public static JsonObject login(CommDBService commDBService, HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		JsonObject jsonObj = new JsonObject();
		String input_pswd = box.get("pswd");
		box.put("pswd", StringUtil.strEncode(input_pswd));
		Box obox = commDBService.execBox("PR_COMTB_USER01", "SELECT_LOGIN", box);
		if(obox.get("user_id").equals("")) {
			jsonObj.addProperty("isOk", "N");
			jsonObj.addProperty("errMsg", "아이디를 찾을 수 없습니다.");
		}else if(box.get("admin").equals("Y") && "U,S".indexOf(obox.get("group_type")) < 0) {
			jsonObj.addProperty("isOk", "N");
			jsonObj.addProperty("errMsg", "사용권한이 없습니다.");
		}else if(!obox.get("input_pswd").equals(obox.get("encode_pswd"))) {
			jsonObj.addProperty("isOk", "N");
			jsonObj.addProperty("errMsg", "비밀번호가 틀립니다.");
		}else if(obox.get("sign_status").equals("3")) {
			if(obox.get("user_id").equals(input_pswd)) {
				jsonObj.addProperty("isOk", "N");
				jsonObj.addProperty("errMsg", "비밀번호가 초기화되었습니다. NEWLINE비밀번호를 변경 후, 로그인할 수 있습니다. NEWLINENEWLINEhttp://www.fms.or.kr에서 초기화 하여 주십시오.");
			}else {
				// login ok
				jsonObj.addProperty("isOk", "Y");
			}
		}else if(obox.get("sign_status").equals("4")) {
			jsonObj.addProperty("isOk", "N");
			jsonObj.addProperty("errMsg", "반려된 아이디입니다. NEWLINE회원가입정보를 수정 후, 다시 승인요청할 수 있습니다. NEWLINENEWLINEhttp://www.fms.or.kr에서 수정하여 주십시오.");
		}else {
			jsonObj.addProperty("isOk", "N");
			jsonObj.addProperty("errMsg", "승인되지 않은 사용자입니다. 로그인할 수 없습니다.");
		} 
		return jsonObj;
	}
	
	// 로그인  검사
	public static String login_chk(CommDBService commDBService, HttpServletRequest request, SesUserEntity uSesEnt, Box box) throws Exception {
		if(uSesEnt != null && uSesEnt.isLogin() && box.get("user_id").equals(uSesEnt.user_id)) {
			return "";
		}
			
	    Box rbox = commDBService.execBox("PR_COMTB_USER01", "SELECT_LOGIN", box);
		if(rbox.get("user_id").equals("")) {
			return "아이디를 찾을 수 없습니다.";
		}else if(!box.get("fms_login").equals("Y")) {
			if(!rbox.get("pswd").equals(StringUtil.strEncode(box.get("pswd")))) {
				return "비밀번호가 틀립니다.";
			}
		}
		
		// 세션 생성
	    SesUserEntity userEnt = new SesUserEntity();
		userEnt.user_id  	= rbox.get("user_id");
	    userEnt.user_nm  	= rbox.get("user_nm");
	    //userEnt.group_cd  	= rbox.get("group_cd");
	    //userEnt.group_nm  	= rbox.get("group_nm");
	    //userEnt.group_type  = rbox.get("group_type");
	    //userEnt.upper_cd  	= rbox.get("upper_cd");
	    //userEnt.upper_nm  	= rbox.get("upper_nm");
	    //userEnt.ref_key 	= rbox.get("irems_auth");
		userEnt.login_ip 	= request.getRemoteAddr();
		userEnt.is_login 	= "Y";

		request.getSession().setAttribute(CD.SS_USER_ID,userEnt.user_id);
		request.getSession().setAttribute(CD.USER_SES_KEY,userEnt);
		request.getSession().setAttribute(CD.IS_LOGIN,"Y");
        return "";
	}	

	// 현재 접속자정보 권한 체크
	public static boolean sessionUserChk(CommDBService commDBService, Box box) throws Exception {
		Box rbox = commDBService.execBox("PR_COMTB_USER01", "SELECT", box);
		String DocAllowed = OntongUtil.getDocAuth(rbox.get("group_type"));
		if(rbox.get("user_id").equals("") || DocAllowed.indexOf(box.get("doc_class")) < 0) { 
			return false;
		}
		return true;
	}
	
	public static String getDocRcvNo(String rcvNo) {
		if(rcvNo == null || rcvNo.equals("")) {
			return "";
		}else if(rcvNo.startsWith("A")) { 
			return "준공-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("B")) { 
			return "보수-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("C")) { 
			return "감리-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("D")) { 
			return "점검-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("E")) { 
			return "결과-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("Y")) { 
			return "일반-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("Z")) { 
			return "기타-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}else if(rcvNo.startsWith("T")) { 
			return "임시-" + rcvNo.substring(1,5) + "-" + rcvNo.substring(5);
		}
		return "";
	}
	
	public static String getFmsRcvNo(String rcvNo) {
		String[] rcvNoArr = rcvNo.split("-");
		if(rcvNo == null || rcvNo.equals("") || rcvNoArr.length < 3) {
			return "";
		}else {
			String headChar = "";
			if(rcvNoArr[0].equals("준공")) { headChar = "A"; }
			else if(rcvNoArr[0].equals("보수")) { headChar = "B"; }
			else if(rcvNoArr[0].equals("감리")) { headChar = "C"; }
			else if(rcvNoArr[0].equals("점검")) { headChar = "D"; }
			else if(rcvNoArr[0].equals("결과")) { headChar = "E"; }
			else if(rcvNoArr[0].equals("일반")) { headChar = "Y"; }
			else if(rcvNoArr[0].equals("기타")) { headChar = "Z"; }
			else if(rcvNoArr[0].equals("임시")) { headChar = "T"; }

			return headChar + rcvNoArr[1] + rcvNoArr[2];
		}
	}
	
	public static String getStorageDir(String rcvNo) {
		if(rcvNo.indexOf("/") > 0) { rcvNo = rcvNo.substring(0,rcvNo.indexOf("/")); }
		if("A,B,C,D,E,T,Y,Z".indexOf(rcvNo.substring(0,1)) < 0) { rcvNo = getFmsRcvNo(rcvNo); }
		
		String docGbn = rcvNo.substring(0,1);
		if(docGbn.equals("E")) { 
			return CustomProperty.storage_home + "eReport/"; 
		}else {
			boolean useSecondDisk = false;
			if(docGbn.equals("A") && rcvNo.compareTo("A201801708") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("B") && rcvNo.compareTo("B201800034") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("C") && rcvNo.compareTo("C201800612") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("D") && rcvNo.compareTo("D201800607") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("T") && rcvNo.compareTo("T201807715") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("Y") && rcvNo.compareTo("Y201500003") > 0) { useSecondDisk = true; }
			else if(docGbn.equals("Z") && rcvNo.compareTo("Z100000006") > 0) { useSecondDisk = true; }
			
			if(useSecondDisk) {
				return CustomProperty.storage_home + "ontong/";
			}else {
				return CustomProperty.storage_home + "ontong/";
			}
		}
	}
	
	public static String getStorageDirByPath(String filePath) {
		String[] arrPath = filePath.split("/");
		String rcvNo = arrPath[3];
		if("A,B,C,D,E,Y,Z,T".indexOf(rcvNo.substring(0,1)) < 0) {
			rcvNo = getFmsRcvNo(rcvNo);
		}
		return getStorageDir(rcvNo);
	}
	
	public static String getRcvNoYear(String rcvNo) {
		if(rcvNo.indexOf("-") > 0) {
			return rcvNo.split("-")[1];
		} else {
			return rcvNo.substring(1,5);
		}
	}
	
	public static String getDocAuth(String group_type) {
		String DocAllowed = "";
		if("U,S".indexOf(group_type) >= 0) { DocAllowed = "A,B,C,D,Z,"; }
		else if("A,I".indexOf(group_type) >= 0) { DocAllowed = "A,B,C,D,"; }
		else if("L,M".indexOf(group_type) >= 0) { DocAllowed = "A,C,D,"; }
		else if(group_type.equals("P")) { DocAllowed = "D,"; }
		
		return DocAllowed;
	}
	
	// edoc.info 파싱
	public static Hashtable parseEdocInfo(String txtPath) throws Exception {
		Hashtable ht = new Hashtable();
		Box obox = new Box("");
		RsWrapper reportWp = new RsWrapper();

		try {
			File fileDir = new File(txtPath);
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir), "UTF8"));
			String lineTxt;
			while((lineTxt = in.readLine()) != null) {
				if(lineTxt.startsWith("submit_type")) {
					obox.put("submit_type", FormatUtil.nvl2(StringUtil.arrayCol(lineTxt,2,":"),"tif"));
				}else if(lineTxt.startsWith("doc_class") || lineTxt.startsWith("edoc_type")) {
					obox.put("doc_class", StringUtil.arrayCol(lineTxt,2,":"));
				}else if(lineTxt.startsWith("DOCCD") || lineTxt.startsWith("DWGCD")) {
					Box ibox = new Box("");
					ibox.put("cd_no", lineTxt.substring(0,7));
					String column[] = StringUtil.split(lineTxt+":::", ":", true);
					ibox.put("report_nm", 	column[0]);
					ibox.put("file_size", 	column[1]);
					ibox.put("page_cnt", 	column[2]);
					if(ibox.get("cd_no").startsWith("DOC")) {
						if(obox.get("doc_class").equals("A") || obox.get("doc_class").equals("B")) {
							String report_nm = StringUtil.replace(ibox.get("report_nm")," ",""); 
							if(report_nm.indexOf("준공내역서") >= 0) 	{ ibox.put("report_gbn", "A"); }
							else if(report_nm.indexOf("시방서") >= 0) 	{ ibox.put("report_gbn", "B"); }
							else if(report_nm.indexOf("계산서") >= 0) 	{ ibox.put("report_gbn", "C"); }
							else if(report_nm.indexOf("토질") >= 0) 	{ ibox.put("report_gbn", "D"); }
							else if(report_nm.indexOf("지반") >= 0) 	{ ibox.put("report_gbn", "D"); }
							else { ibox.put("report_gbn", "Z"); }
						}else if(obox.get("doc_class").equals("C")) {
							ibox.put("report_gbn", "R");
						}else if(obox.get("doc_class").equals("D")) {
							ibox.put("report_gbn", "S");
						}else if(obox.get("doc_class").equals("Z")) {
							ibox.put("report_gbn", "Z");
						}
					}else if(ibox.get("cd_no").startsWith("DWG")) {
						ibox.put("report_gbn", "X");
					}
					reportWp.appendRs(ibox);
				}
			}
			in.close();
			System.out.println(obox.toString());
			ht.put("obox", obox);
			ht.put("reportWp", reportWp);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ht;
	}
	
	// master.xml 파싱
	public static Hashtable parseMasterXml(String xmlPath) throws Exception {
		Hashtable ht = new Hashtable();
		
		Document xdoc = XMLUtil.getXmlDocEUC_UTF8(xmlPath);
		List<Element> constList =  XMLUtil.getMultiElements("/master/const_info", xdoc);
		List<Element> facilList =  XMLUtil.getMultiElements("/master/facil_info", xdoc);
		
		// 공사 정보
		Box obox = new Box("");
		for(Element elm : constList) {
			obox.put("const_nm", elm.getChildText("const_nm"));
			obox.put("const_order_nm", elm.getChildText("req_nm"));
			obox.put("const_ymd_from", elm.getChildText("const_ymd_from"));
			obox.put("const_ymd_to", elm.getChildText("const_ymd_to"));
			obox.put("cpl_ymd", elm.getChildText("cpl_ymd"));
		}
		ht.put("obox", obox);

		// 대상시설물 정보
		RsWrapper facilWp = new RsWrapper();
		for(Element elm : facilList) {
			Box ibox = new Box("");
			ibox.put("facil_no", elm.getChildText("facil_no"));
			ibox.put("facil_nm", elm.getChildText("facil_nm"));
			facilWp.appendRs(ibox);
		}
		ht.put("facilWp", facilWp);
		return ht;
	}
	
	public static void main(String[] args) {
		try {
			//String rtn = OntongUtil.callOntong("http://localhost:8380/fms_files/ontong/ontong10.do?method=signRequestPost&rcv_no=sss");
			//String rtn = OntongUtil.callOntong("http://localhost:8380/fms_files/ontong/ontong10.do?method=signProcessPost&rcv_no=sss");
			NameValuePair[] param = {
			          new NameValuePair("rcv_no", "T201602783"),
			          new NameValuePair("user_id", "bloggs")
			        };
			String rtn = OntongUtil.callOntong("http://localhost:8380/fms_files/ontong/ontong10.do?method=deletePost", param);
			
			System.out.println(rtn);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
