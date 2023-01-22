/************************************************************************************************/
/* Class Name    : tax20Controller                                                         		*/
/* Description   : 국세청신고 전산매체																	*/ 
/************************************************************************************************/
/*																								*/
/*                                     Modification Log                                         */
/*																								*/
/* No     Date         Company       Author     Description                                     */
/* --    ----------    ---------     --------   ------------------------------------------------*/
/* 01    2011/02/18  신진IT컨설팅  정 진 수   Initial Release												*/ 
/*																								*/
/************************************************************************************************/	
package egovframework.ubiz.web;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;

@Controller
public class tax20Controller extends abstractController {

	/********************************************************************************************/
	/* Method Name  : ntx13001													    			*/
	/* Description  : 세금계산서 합계표																*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/ntx13001.do")
	public String ntx13001(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try	{
			File file = new File("temp.pds.dir" + "/" + box.get("file_nm"));
			FileOutputStream fos = new FileOutputStream(file.toString(), false);
			DataOutputStream dos = new DataOutputStream(fos);
			String lineTxt = "";
			Box kbox = commDBService.execBox("PR_ACCTB_VATX01", "SELECT_TAX", box);
			
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			
			Box rbox = new Box("");
			RsWrapper rsWp = new RsWrapper();
			
			String start_ymd = ""; String end_ymd = ""; String tax_gisu = ""; String tax_chasu = "";
			if(box.get("tax_gisu").equals("0103")) {
				start_ymd = box.get("tax_year")+"0101"; end_ymd = box.get("tax_year")+"0331"; tax_gisu = "11"; tax_chasu = "3";
			}else if(box.get("tax_gisu").equals("0406")) {
				start_ymd = box.get("tax_year")+"0401"; end_ymd = box.get("tax_year")+"0630"; tax_gisu = "12"; tax_chasu = "6";
			}else if(box.get("tax_gisu").equals("0709")) {
				start_ymd = box.get("tax_year")+"0701"; end_ymd = box.get("tax_year")+"0930"; tax_gisu = "21"; tax_chasu = "3";
			}else if(box.get("tax_gisu").equals("1012")) {
				start_ymd = box.get("tax_year")+"1001"; end_ymd = box.get("tax_year")+"1231"; tax_gisu = "22"; tax_chasu = "6";
			}
			
			// 세금계산서합계표
			// 표지
			lineTxt = "7" + kbox.get("saupja_no") + StringUtil.rpadKOR(kbox.get("corp_nm")," ",30) + StringUtil.rpadKOR(kbox.get("rep_person_nm")," ",15) + 
					  StringUtil.rpadKOR(kbox.get("addr")," ",45) + space(17) + space(25) + 
					  start_ymd.substring(2) + end_ymd.substring(2) + end_ymd.substring(2) + space(9);
		    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");

			// (전자세금계산서 이외분) 매입자료
			box.put("param03", "1");	// 세금계산서
			box.put("param06", "N");	// 전자신고 이외분
			box.put("param07", "FILE");
		    rsWp = commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST004A", box);
		    for(int i=0; i < rsWp.getLength(); i++) {
			    lineTxt = "2" + kbox.get("saupja_no") + StringUtil.lpad(rsWp.get("rn",i),"0",4) + rsWp.get("saupja_no",i) + StringUtil.rpadKOR(StringUtil.fixLength(rsWp.get("cust_nm",i),15,"")," ",30) +
			    		  space(17) + space(25) +
			    		  StringUtil.lpad(rsWp.get("slip_cnt",i),"0",7) + zero(2) + 
			    		  StringUtil.lpad(rsWp.get("gong_amt",i),"0",14) + StringUtil.lpad(rsWp.get("vat_amt",i),"0",13) +
			    		  "0" + "0" + "8501" + kbox.get("tax_office") + space(28);
			    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");
		    }

			// (전자세금계산서 이외분) 매입합계
			box.put("param06", "N");	// 전자신고 이외분
		    rbox = commDBService.execBox("PR_ACCTB_VATX01_LIST", "LIST004B", box);
		    lineTxt = "4" + kbox.get("saupja_no") + 
		    		  StringUtil.lpad(rbox.get("cust_cnt"),"0",7) + StringUtil.lpad(rbox.get("cust_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("cust_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("cust_vat_amt"),"0",14) +
		    		  StringUtil.lpad(rbox.get("saupja_cnt"),"0",7) + StringUtil.lpad(rbox.get("saupja_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("saupja_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("saupja_vat_amt"),"0",14) +
		    		  StringUtil.lpad(rbox.get("reside_cnt"),"0",7) + StringUtil.lpad(rbox.get("reside_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("reside_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("reside_vat_amt"),"0",14) +
		    		  space(30);
		    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");

		    // (전자세금계산서분) 매입합계
			box.put("param06", "Y");	// 전자신고분
		    rbox = commDBService.execBox("PR_ACCTB_VATX01_LIST", "LIST004B", box);
		    lineTxt = "6" + kbox.get("saupja_no") + 
		    		  StringUtil.lpad(rbox.get("cust_cnt"),"0",7) + StringUtil.lpad(rbox.get("cust_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("cust_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("cust_vat_amt"),"0",14) +
		    		  StringUtil.lpad(rbox.get("saupja_cnt"),"0",7) + StringUtil.lpad(rbox.get("saupja_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("saupja_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("saupja_vat_amt"),"0",14) +
		    		  StringUtil.lpad(rbox.get("reside_cnt"),"0",7) + StringUtil.lpad(rbox.get("reside_slip_cnt"),"0",7) + StringUtil.lpad(rbox.get("reside_gong_amt"),"0",15) + StringUtil.lpad(rbox.get("reside_vat_amt"),"0",14) +
		    		  space(30);
		    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");

			dos.close();
			fos.close();
		}catch (IOException e) {
			System.out.println("ntx13001 : " + e.toString());
			throwUserException("파일 생성에 실패하였습니다. 시스템관리자에게 문의하시기 바랍니다.", request);
		}finally {}
		
		box.put("tab_index", "3");
		return alertNRedirect("생성되었습니다.", "tax10.do?method=vatMain", "tax_year, tax_gisu, tab_index", request);
	}

	/********************************************************************************************/
	/* Method Name  : ntx14001													    			*/
	/* Description  : 계산서 합계표																	*/
	/********************************************************************************************/
	@RequestMapping(value = "/tax/**/ntx14001.do")
	public String ntx14001(HttpServletRequest request, HttpServletResponse response, Box box) throws Exception {
		try	{
			File file = new File("temp.pds.dir" + "/" + box.get("file_nm"));
			FileOutputStream fos = new FileOutputStream(file.toString(), false);
			DataOutputStream dos = new DataOutputStream(fos);
			String lineTxt = "";
			String submit_ymd = DateUtil.toString("yyyyMMdd");
			Box kbox = commDBService.execBox("PR_ACCTB_VATX01", "SELECT_TAX", box);
			
			box.put("param01", box.get("tax_year"));
			box.put("param02", box.get("tax_gisu"));
			
			Box rbox = new Box("");
			RsWrapper rsWp = new RsWrapper();
			
			String start_ymd = ""; String end_ymd = ""; String tax_gisu = ""; String tax_chasu = "";
			if(box.get("tax_gisu").equals("0103")) {
				start_ymd = box.get("tax_year")+"0101"; end_ymd = box.get("tax_year")+"0331"; tax_gisu = "11"; tax_chasu = "3";
			}else if(box.get("tax_gisu").equals("0406")) {
				start_ymd = box.get("tax_year")+"0401"; end_ymd = box.get("tax_year")+"0630"; tax_gisu = "12"; tax_chasu = "6";
			}else if(box.get("tax_gisu").equals("0709")) {
				start_ymd = box.get("tax_year")+"0701"; end_ymd = box.get("tax_year")+"0930"; tax_gisu = "21"; tax_chasu = "3";
			}else if(box.get("tax_gisu").equals("1012")) {
				start_ymd = box.get("tax_year")+"1001"; end_ymd = box.get("tax_year")+"1231"; tax_gisu = "22"; tax_chasu = "6";
			}

			// 계산서합계표
			// 제출자(대리인)
			lineTxt = "A" + kbox.get("tax_office") + submit_ymd + "2" + space(6) + 
					  kbox.get("saupja_no") + StringUtil.rpadKOR(kbox.get("corp_nm")," ",40) + kbox.get("corp_reg_no") + StringUtil.rpadKOR(kbox.get("rep_person_nm")," ",30) +
					  StringUtil.rpad(kbox.get("zip_no")," ",10) + StringUtil.rpadKOR(kbox.get("addr")," ",70);
			lineTxt += StringUtil.rpad(""," ",4) + StringUtil.rpad(""," ",4) + StringUtil.rpad(""," ",4) + space(3);
			lineTxt += "00001" + "101" + space(15);
			dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");
		    
			// 제출의무자 인적사항
			lineTxt = "B" + kbox.get("tax_office") + "000001" + kbox.get("saupja_no") + 
			  		  StringUtil.rpadKOR(kbox.get("corp_nm")," ",40) + StringUtil.rpadKOR(kbox.get("rep_person_nm")," ",30) +
			  		  StringUtil.rpad(kbox.get("zip_no")," ",10) + StringUtil.rpadKOR(kbox.get("addr")," ",70) + space(60);
			dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");

			// 제출의무자별 집계(매입, 전자계산서 외)
			box.put("param03", "B"); // 매입
			box.put("param04", "2"); // 계산서	
			box.put("param05", "");
			box.put("param06", "N");
		    rbox = commDBService.execBox("PR_ACCTB_VATX01_LIST", "LIST004B", box);
		    lineTxt = "C" + "18" + tax_gisu + kbox.get("tax_office") + "000001" + kbox.get("saupja_no") + 
		    		  box.get("tax_year") + start_ymd + end_ymd + submit_ymd +
		    		  StringUtil.lpad(rbox.get("cust_cnt"),"0",6) + StringUtil.lpad(rbox.get("cust_slip_cnt"),"0",6) + 
		    		  (rbox.getLong("cust_gong_amt") < 0 ? "1" : "0") + StringUtil.lpad(String.valueOf(Math.abs(rbox.getLong("cust_gong_amt"))),"0",14) + space(151);
		    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");
		    
			// 매입처별 거래명세
		    rsWp = commDBService.execList("PR_ACCTB_VATX01_LIST", "LIST004A", box);
		    for(int i=0; i < rsWp.getLength(); i++) {
			    lineTxt = "D" + "18" + tax_gisu + kbox.get("tax_office") + StringUtil.lpad(rsWp.get("rn",i),"0",6) + kbox.get("saupja_no") + 
			    		  rsWp.get("saupja_no",i) + StringUtil.rpadKOR(StringUtil.fixLength(rsWp.get("cust_nm",i),20,"")," ",40) +
			    		  StringUtil.lpad(rsWp.get("slip_cnt",i),"0",5) +  
			    		  (rsWp.getLong("gong_amt",i) < 0 ? "1" : "0") + StringUtil.lpad(String.valueOf(Math.abs(rsWp.getLong("gong_amt",i))),"0",14) + space(136);
			    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");
		    }

			// 제출의무자별 집계(매입, 전자계산서)
			box.put("param03", "B"); // 매입
			box.put("param04", "2"); // 계산서	
			box.put("param05", "");
			box.put("param06", "Y");
		    rbox = commDBService.execBox("PR_ACCTB_VATX01_LIST", "LIST004B", box);
		    lineTxt = "E" + "18" + tax_gisu + kbox.get("tax_office") + "000001" + kbox.get("saupja_no") + 
		    		  box.get("tax_year") + start_ymd + end_ymd + submit_ymd +
		    		  StringUtil.lpad(rbox.get("cust_cnt"),"0",6) + StringUtil.lpad(rbox.get("cust_slip_cnt"),"0",6) + 
		    		  (rbox.getLong("cust_gong_amt") < 0 ? "1" : "0") + StringUtil.lpad(String.valueOf(Math.abs(rbox.getLong("cust_gong_amt"))),"0",14) + space(151);
		    dos.writeBytes(new String(lineTxt.getBytes("KSC5601"), "8859_1") + "\n");

			dos.close();
			fos.close();
		}catch (IOException e) {
			System.out.println("ntx13002 : " + e.toString());
			throwUserException("파일 생성에 실패하였습니다. 시스템관리자에게 문의하시기 바랍니다.", request);
		}finally {}

		
		box.put("tab_index", "4");
		return alertNRedirect("생성되었습니다.", "tax10.do?method=vatMain", "tax_year, tax_gisu, tab_index", request);
	}
	
	private String arrayCol(RsWrapper rsWp, String key, int inx) throws Exception {
		for(int i=0; i < rsWp.getLength(); i++) {
			if(rsWp.get("data_id",i).equals(key)) {
				String arr[] = StringUtil.split(rsWp.get("input_data",i),"Ð",true);
				if(arr.length >= inx) { return FormatUtil.nvl2(arr[inx-1],""); }
			}
		}
        return "";
	}
	
	private String partNum(String num, String flag) {
		int pos = num.indexOf(".");
		if(pos < 0) { return flag.equals("over") ? num : ""; }
		return flag.equals("over") ? num.substring(0,pos) : num.substring(pos+1); 
	}
	
	private String multiKey(String num) {
		if(num.indexOf("-") >= 0) {
			num = StringUtil.replace(num,"-","0");
			if(num.endsWith("0")) { num = num.substring(0, num.length()-1) + "}"; }
			else if(num.endsWith("1")) { num = num.substring(0, num.length()-1) + "J"; }
			else if(num.endsWith("2")) { num = num.substring(0, num.length()-1) + "K"; }
			else if(num.endsWith("3")) { num = num.substring(0, num.length()-1) + "L"; }
			else if(num.endsWith("4")) { num = num.substring(0, num.length()-1) + "M"; }
			else if(num.endsWith("5")) { num = num.substring(0, num.length()-1) + "N"; }
			else if(num.endsWith("6")) { num = num.substring(0, num.length()-1) + "O"; }
			else if(num.endsWith("7")) { num = num.substring(0, num.length()-1) + "P"; }
			else if(num.endsWith("8")) { num = num.substring(0, num.length()-1) + "Q"; }
			else if(num.endsWith("9")) { num = num.substring(0, num.length()-1) + "R"; }
		}
		return num; 
	}
	
	private String space(int num) {
		String rtn = "";
		for(int i=0; i < num; i++) { rtn += " "; }
		return rtn;
	}
	private String zero(int num) {
		String rtn = "";
		for(int i=0; i < num; i++) { rtn += "0"; }
		return rtn;
	}
	
}
