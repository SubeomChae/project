/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2019-09-20 09:00:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import egovframework.cbiz.*;
import egovframework.cbiz.util.*;

public final class slp02002_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("egovframework.cbiz");
    _jspx_imports_packages.add("egovframework.cbiz.util");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      egovframework.cbiz.Box box = null;
      box = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("box", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (box == null){
        box = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("box", box, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.Box obox = null;
      obox = (egovframework.cbiz.Box) _jspx_page_context.getAttribute("obox", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (obox == null){
        obox = new egovframework.cbiz.Box();
        _jspx_page_context.setAttribute("obox", obox, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.cbiz.RsWrapper rsWp = null;
      rsWp = (egovframework.cbiz.RsWrapper) _jspx_page_context.getAttribute("rsWp", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (rsWp == null){
        rsWp = new egovframework.cbiz.RsWrapper();
        _jspx_page_context.setAttribute("rsWp", rsWp, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      egovframework.ubiz.mapper.ent.SesUserEntity uSesEnt = null;
      synchronized (session) {
        uSesEnt = (egovframework.ubiz.mapper.ent.SesUserEntity) _jspx_page_context.getAttribute("uSesEnt", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (uSesEnt == null){
          uSesEnt = new egovframework.ubiz.mapper.ent.SesUserEntity();
          _jspx_page_context.setAttribute("uSesEnt", uSesEnt, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
 	int cha_cnt = 0;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(rsWp.get("cd_flag",i).equals("1")) { cha_cnt++; } 
	}
	obox.put("cha_cnt", String.valueOf(cha_cnt));	

      out.write("\r\n");
      out.write("<!-- 지출결의서 -->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tvar rownum = ");
      out.print(rsWp.getLength());
      out.write(";\r\n");
      out.write("\tfunction goAddTr() {\r\n");
      out.write("\t\t\r\n");
	String vatCdOpt = "<option value=''></option>";
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "", "vat_cd","","","","",uSesEnt.dbo);
	RsWrapper vatCdWp = new RsWrapper();
	for(int i=0; i < codeWp.getLength(); i++) {
		if(codeWp.get("code",i).startsWith("3")) { continue; } // 신용카드 제외
		vatCdOpt += "<option value='"+codeWp.get("code",i)+"'>"+codeWp.get("data",i)+"</option>";
		vatCdWp.appendRs(codeWp.getRsBoxAt(i));
	}

	String acctCdOpt = "<option value=''>선택</option>";
	RsWrapper accWp = CodeUtil.getRsWrapper("PR_ACCTB_CODE01_LIST","LISTCODE", "", "722","A","","","",uSesEnt.dbo);
	for(int i=0; i < accWp.getLength(); i++) {
		acctCdOpt += "<option value='"+accWp.get("code",i)+"'>"+accWp.get("data",i)+"</option>";
	}

      out.write("\r\n");
      out.write("\t\tvar cHtml = \"<tr id='cha_tr_\"+rownum+\"'>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"   \t<select name='acct_cd\"+rownum+\"' title='계정과목' class='bs-select required form-control' style='width:95%'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t\t");
      out.print(acctCdOpt);
      out.write("\"\r\n");
      out.write("\t\t\t\t  + \"\t\t</select>\"\r\n");
      out.write("\t\t\t\t  + \"   </td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<input type='text' name='gong_amt\"+rownum+\"' value='' maxlength='13' title='공급가액' class='form-control required tMONEY' style='width:95%;ime-mode:active' onBlur=\\\"formatMaskElm(document.all['vat_amt\"+rownum+\"']); summarySlipAmt();\\\">\"\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<select name='vat_cd\"+rownum+\"' title='증빙구분' class='bs-select form-control' style='width:95%' onChange=\\\"changeVatCd('\"+rownum+\"',this.value);\\\">\"\r\n");
      out.write("\t\t\t\t  + \"\t\t\t");
      out.print(vatCdOpt);
      out.write("\"\r\n");
      out.write("\t\t\t\t  + \"\t \t</select>\"\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<input type='text' name='vat_amt\"+rownum+\"' value='' maxlength='13' title='부가세' class='form-control tMONEY' style='width:95%' readOnly onBlur=\\\"formatMaskElm(document.all['vat_amt\"+rownum+\"']); summarySlipAmt();\\\">\"\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \" \t\t<div class='input-group'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t\t<input type='text' name='cust_nm\"+rownum+\"' value='' title='거래처' class='form-control' style='width:160px' readOnly>\"\r\n");
      out.write("\t\t\t\t  + \"   \t\t<button type='button' class='btn dark' onClick=\\\"javascript:findCustCode('&object_id=\"+rownum+\"');\\\"><i class='fa fa-search'></i></button>\"\r\n");
      out.write("\t\t\t\t  + \"   \t\t<input type='hidden' name='cust_cd\"+rownum+\"' value=''>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t</div>\"\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<div class='input-group input-medium date date-picker' data-date='' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t\t<input type='text' name='proof_ymd\"+rownum+\"' value='");
      out.print(DateUtil.toString("yyyyMMdd"));
      out.write("' maxlength='8' title='증빙일자' class='form-control required tYMD'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t\t<span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t</div>\"\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"\t<td class='t-center'>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<button type='button' class='btn btn-primary btn-table' onClick=\\\"$('#cha_tr_\"+rownum+\"').remove();summarySlipAmt()\\\">삭제</button>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<input type='hidden' name='slip_seq\"+rownum+\"'\tvalue=''>\"\r\n");
      out.write("\t\t\t\t  + \"\t\t<input type='hidden' name='cd_flag\"+rownum+\"' \tvalue='1'>\";\r\n");
      out.write("\t\t\t\t  + \"\t</td>\"\r\n");
      out.write("\t\t\t\t  + \"</tr>\";\r\n");
      out.write("\t\t$(\"#chaTable\").append(cHtml);\r\n");
      out.write("\t\tappendHtmlAfterWork(\"#cha_tr_\"+rownum);\r\n");
      out.write("\t\trownum++;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goSave() {\r\n");
      out.write("\t\tif(formValidate(\"#saveForm\")) {\r\n");
      out.write("\t\t\tvar cnt = 0;\r\n");
      out.write("\t\t\tfor(var i=0; i < rownum; i++) {\r\n");
      out.write("\t\t\t\tif(isObject('slip_seq'+i)) {\r\n");
      out.write("\t\t\t\t\tif(document.all['cd_flag'+i].value == '1' && formatMaskElm(document.all['gong_amt'+i]) == 0) {\r\n");
      out.write("\t\t\t\t\t\talert('공급가액은 0원을 입력할 수 없습니다.');\r\n");
      out.write("\t\t\t\t\t\tdocument.all['gong_amt'+i].focus();\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}else if(isEmpty(document.all['cust_cd'+i])) {\r\n");
      out.write("\t\t\t\t\t\talert('거래처가 입력되지 않았습니다.');\r\n");
      out.write("\t\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\tcnt++; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(cnt == 0) {\r\n");
      out.write("\t\t\t\talert('지출내용이 입력되지 않았습니다.');\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(confirm(\"저장하시겠습니까?\")) {\r\n");
      out.write("\t\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\t\tdocument.saveForm.input_cnt.value = rownum;\r\n");
      out.write("\t\t\t\tajaxSubmitForm(\"slp02002_update.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\t\ttoastPop1('저장되었습니다.');\r\n");
      out.write("\t\t\t\t\t\tgoSearch(document.saveForm.slip_no.value);\r\n");
      out.write("\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goDeleteAll() {\r\n");
      out.write("\t\tif(confirm(\"지출결의서를 삭제하시겠습니까?\")) {\r\n");
      out.write("\t\t\tremoveMask(\"#saveForm\");\r\n");
      out.write("\t\t\tajaxSubmitForm(\"slp02002_delete.do\",\"#saveForm\", function(rtn) {\r\n");
      out.write("\t\t\t\tif(rtn.isOk == \"Y\") {\r\n");
      out.write("\t\t\t\t\ttoastPop1('삭제되었습니다.');\r\n");
      out.write("\t\t\t\t\tgoSearch('');\r\n");
      out.write("\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\talert(rtn.errMsg);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goSign(sign_status) {\r\n");
      out.write("\t\tif(");
      out.print(obox.getLong("cha_amt"));
      out.write(" != ");
      out.print(obox.getLong("dae_amt"));
      out.write(") {\r\n");
      out.write("\t\t\talert('차변합계와 대변합계가 불일치하므로 승인요청할 수 없습니다.'); \r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdocument.signForm.subject.value = document.saveForm.subject.value;\r\n");
      out.write("\t\tdocument.signForm.msg_type.value = 'SLP009';\r\n");
      out.write("\t\tdocument.signForm.search_key.value = 'ACCTB_SLIP01|' + document.saveForm.slip_no.value;\r\n");
      out.write("\t");
 	String cust_nm = ""; String acct_nm = "";
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("cd_flag",i).equals("1")) { continue; }
			if(!rsWp.get("cust_nm",i).equals("")) { cust_nm = rsWp.get("cust_nm",i); }
			if(!rsWp.get("acct_nm",i).equals("")) { acct_nm = rsWp.get("acct_nm",i); }
			if(!cust_nm.equals("") && !acct_nm.equals("")) { break; }
		}
	
      out.write("\t\r\n");
      out.write("\t\tvar opinion = document.saveForm.subject.value+\"을(를) 위해 다음과 같이 지출하고자 합니다.\\n\"\r\n");
      out.write("\t\t\t\t\t + \" - 금액 : ");
      out.print(obox.get("cha_amt",Box.THOUSAND_COMMA));
      out.write("\\n\"\r\n");
      out.write("\t\t\t\t\t ");
if(!cust_nm.equals("")){
      out.write("+ \" - 거래처 : ");
      out.print(cust_nm);
      out.write('\\');
      out.write('n');
      out.write('"');
}
      out.write("\r\n");
      out.write("\t\t\t\t\t ");
if(!acct_nm.equals("")){
      out.write("+ \" - 계정과목 : ");
      out.print(acct_nm);
      out.write('"');
}
      out.write(";\r\n");
      out.write("\t\tdocument.signForm.opinion.value = opinion;\r\n");
      out.write("\t\tdocument.signForm.send_empl_no.value = '");
      out.print(uSesEnt.empl_no);
      out.write("';\r\n");
      out.write("\t\tgoSignRequest(document.signForm);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction signRequestPost() { goSearch(document.saveForm.slip_no.value); }\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeAcctCd(acct_cd) {\r\n");
      out.write("\t\tif(acct_cd == '2100101') { // 미지급금\r\n");
      out.write("\t\t\tchangeObjectProperty(document.saveForm.rel_no, 'disabled');\r\n");
      out.write("\t\t\tdocument.saveForm.rel_no.value = '';\r\n");
      out.write("\t\t\tdocument.saveForm.rel_no_type.value = '';\r\n");
      out.write("\t\t\t$(\"select[name='rel_no']\").removeClass('required');\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tchangeObjectProperty(document.saveForm.rel_no, 'required');\r\n");
      out.write("\t\t\tdocument.saveForm.rel_no_type.value = '11';\r\n");
      out.write("\t\t\tdocument.saveForm.rel_no.options.length=0;\r\n");
      out.write("\t\t\tsetOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.saveForm.rel_no, '', acct_cd, '', '', '', '', '선택');\r\n");
      out.write("\t\t\t$(\"select[name='rel_no']\").addClass('required');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction changeVatCd(inx, vat_cd) {\r\n");
      out.write("\t\tif(vat_cd == '10' || vat_cd == '11' || vat_cd == '12') { // 세금계산서\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['vat_amt'+inx], 'required');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['cust_nm'+inx], 'requiredOnly');\r\n");
      out.write("\t\t\tdocument.all['proof_ymd'+inx].value = '';\r\n");
      out.write("\t\t}else if(vat_cd == '40') { // 현금영수증\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['vat_amt'+inx], 'required');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);\r\n");
      out.write("\t\t\tdocument.all['proof_ymd'+inx].value = '';\r\n");
      out.write("\t\t}else if(vat_cd == '' || vat_cd == '20' || vat_cd == '99') { // 계산서, 간이영수증\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['vat_amt'+inx], 'readonly', false);\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);\r\n");
      out.write("\t\t\tdocument.all['vat_amt'+inx].value = '';\r\n");
      out.write("\t\t\tsummarySlipAmt();\r\n");
      out.write("\t\t}else {\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['vat_amt'+inx], 'enabled');\r\n");
      out.write("\t\t\tchangeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);\r\n");
      out.write("\t\t\tdocument.all['proof_ymd'+inx].value = '';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction summarySlipAmt() {\r\n");
      out.write("\t\tvar cha_cnt = 0; var cha_amt = 0;\r\n");
      out.write("\t\tfor(var i=0; i < rownum; i++) {\r\n");
      out.write("\t\t\tif(!isObject('slip_seq'+i)) { continue; }\r\n");
      out.write("\t\t\tcha_cnt++;\r\n");
      out.write("\t\t\tcha_amt += parseInt(document.all['gong_amt'+i].value.replace(/,/g,\"\"));\r\n");
      out.write("\t\t\tif(!isEmpty(document.all['vat_amt'+i])) {\r\n");
      out.write("\t\t\t\tcha_cnt++;\r\n");
      out.write("\t\t\t\tcha_amt += parseInt(document.all['vat_amt'+i].value.replace(/,/g,\"\"));\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}    \r\n");
      out.write("\t\tif(isNaN(cha_amt)) { cha_amt = 0; }\r\n");
      out.write("\t\tdocument.saveForm.cha_cnt.value = cha_cnt;\r\n");
      out.write("\t\tdocument.saveForm.cha_amt.value = cha_amt;\r\n");
      out.write("\t\tdocument.saveForm.slip_amt.value = cha_amt;\r\n");
      out.write("\t\tformatMaskElm(document.saveForm.cha_amt);\r\n");
      out.write("\t\tformatMaskElm(document.saveForm.slip_amt);\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\t");
 if(box.get("method").endsWith("write")) { 
      out.write("\r\n");
      out.write("\t\tgoAddTr();\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form id=\"saveForm\" name=\"saveForm\" method=\"post\" class=\"fType\" action=\"\" style=\"margin:0px\">\r\n");
      out.write("<input type=\"hidden\" name=\"slip_no\"\t\tvalue=\"");
      out.print(obox.get("slip_no"));
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"input_cnt\" \tvalue=\"\">\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("\t\t<table class=\"table table-view table-bordered\">\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"17%\">사용목적</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><input type=\"text\" name=\"subject\" value=\"");
      out.print(obox.get("subject"));
      out.write("\" maxlength=\"100\" title=\"사용목적\" class=\"form-control required\" style=\"width:400px;ime-mode:active;\"></td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t");
 if(box.get("method").endsWith("edit")) { 
      out.write("\r\n");
      out.write("\t  \t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"17%\">결재상태</th>\r\n");
      out.write("\t\t\t\t<td width=\"35%\" nowrap><b><font color=red>");
      out.print(obox.get("sign_status_nm"));
      out.write("</font></b>&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t");
 if(obox.get("sign_status").equals("1")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSign('2');\">기안문작성</button>\r\n");
      out.write("\t\t\t\t");
 }else if(obox.get("sign_status").compareTo("2") > 0) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goSignLine('','SLP009','ACCTB_SLIP01|");
      out.print(obox.get("slip_no"));
      out.write("');\">결재라인</button>\r\n");
      out.write("\t\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th width=\"17%\">전표번호</th>\r\n");
      out.write("\t\t\t\t<td width=\"31%\" nowrap>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:goSlipViewer('&slip_no=");
      out.print(obox.get("slip_no"));
      out.write("');\">");
      out.print(obox.get("slip_no",Box.SLIP_NO));
      out.write("</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t  \t\t</tr>\r\n");
      out.write("\t  \t");
 } 
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<h2 class=\"page-title-2depth form-inline\">\r\n");
      out.write("\t\t지출내용\r\n");
      out.write("\t\t<span id=\"cha_summary\" class=\"marB5\">\r\n");
      out.write("\t\t\t[<input type=\"text\" id=\"cha_cnt\" name=\"cha_cnt\" value=\"");
      out.print(obox.get("cha_cnt"));
      out.write("\" class=\"form-control acc-border tNUM\" style=\"width:27px;height:16px;\" readOnly>건],&nbsp;&nbsp;\r\n");
      out.write("\t\t\t[<input type=\"text\" id=\"cha_amt\" name=\"cha_amt\" value=\"");
      out.print(obox.get("cha_amt"));
      out.write("\" class=\"form-control acc-border tMONEY\" style=\"width:120px;height:16px;\" readOnly>원]\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</h2>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-scrollable scrollOptionY\" style=\"height:calc(200px)\">\r\n");
      out.write("\t\t<table id=\"chaTable\" class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:20%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:12%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:16%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:10%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:25%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:11%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:6%;\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>계정과목</th>\r\n");
      out.write("\t\t\t\t\t<th>공급가액</th>\r\n");
      out.write("\t\t\t\t\t<th>증빙구분</th>\r\n");
      out.write("\t\t\t\t\t<th>부가세</th>\r\n");
      out.write("\t\t\t\t\t<th>거래처</th>\r\n");
      out.write("\t\t\t\t\t<th>증빙일자</th>\r\n");
      out.write("\t\t\t\t\t<th><button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"goAddTr()\">추가</button></th>\r\n");
      out.write("\t         \t</tr>\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t\t<tbody>\r\n");
      out.write("\t         ");
 for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("1")) { continue; } 
      out.write("\r\n");
      out.write("\t\t\t\t<tr id=\"cha_tr_");
      out.print(i);
      out.write("\" class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\" nowrap>\r\n");
      out.write("\t\t\t\t\t\t<select name=\"acct_cd");
      out.print(i);
      out.write("\" title=\"계정과목\" class=\"bs-select form-control required\" style=\"width:95%\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList(accWp,rsWp.get("acct_cd",i)));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"gong_amt");
      out.print(i);
      out.write("\" value=\"");
      out.print(rsWp.get("slip_amt",i));
      out.write("\" maxlength=\"13\" title=\"공급가액\" class=\"form-control required tMONEY\" style=\"width:95%;\" onBlur=\"summarySlipAmt()\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t\t<select name=\"vat_cd");
      out.print(i);
      out.write("\" title=\"증빙구분\" class=\"bs-select form-control\" style=\"width:95%\" onChange=\"changeVatCd('");
      out.print(i);
      out.write("',this.value)\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList(vatCdWp,rsWp.get("vat_cd",i)));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name=\"vat_amt");
      out.print(i);
      out.write("\" value=\"");
      out.print(rsWp.get("vat_amt",i));
      out.write("\" maxlength=\"13\" title=\"부가세\" class=\"form-control tMONEY ");
      out.print(rsWp.get("vat_cd",i).startsWith("1")||rsWp.get("vat_cd",i).startsWith("2")?"required ":"");
      out.write("\" style=\"width:95%;\" onBlur=\"summarySlipAmt()\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"cust_nm");
      out.print(i);
      out.write("\" value=\"");
      out.print(rsWp.get("cust_nm",i));
      out.write("\" maxlength=\"50\" title=\"거래처\" class=\"form-control ");
      out.print(rsWp.get("vat_cd",i).startsWith("1")||rsWp.get("vat_cd",i).startsWith("2")?"required":"");
      out.write("\"  style=\"width:160px\" readOnly>\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"javascript:findCustCode('&object_id=");
      out.print(i);
      out.write("')\"><i class=\"fa fa-search\"></i></button>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"cust_cd");
      out.print(i);
      out.write("\" value=\"");
      out.print(rsWp.get("cust_cd",i));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\" nowrap>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group input-medium date date-picker\" data-date=\"\" data-date-format=\"yyyy-mm-dd\" data-date-viewmode=\"years\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"proof_ymd");
      out.print(i);
      out.write("\" value=\"");
      out.print(rsWp.get("proof_ymd",i));
      out.write("\" maxlength=\"8\" title=\"증빙일자\" class=\"form-control required tYMD\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"input-group-btn\"><button class=\"btn dark\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"t-center\"><button type=\"button\" class=\"btn btn-primary btn-table\" onClick=\"$('#cha_tr_");
      out.print(i);
      out.write("').remove(); summarySlipAmt()\">삭제</button></td>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"slip_seq");
      out.print(i);
      out.write("\" \tvalue=\"");
      out.print(rsWp.get("slip_seq",i));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"cd_flag");
      out.print(i);
      out.write("\" \tvalue=\"1\">\r\n");
      out.write("\t         \t</tr> \r\n");
      out.write("\t         ");
 } 
      out.write("\r\n");
      out.write("         \t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<h2 class=\"page-title-2depth form-inline\">결제방법</h2>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-scrollable\">\r\n");
      out.write("       \t");
 Box daeBox = new Box("");
       	   for(int i=0; i < rsWp.getLength(); i++) { 
       			if(rsWp.get("cd_flag",i).equals("2")) { 
       				daeBox = rsWp.getRsBoxAt(i);
       				break; 
       			}
       	   } 
       	   // 보통예금(1110103)
       	   String dae_acct_cd = FormatUtil.nvl2(daeBox.get("acct_cd"),"1110103");
       	   String dae_rel_no  = FormatUtil.nvl2(daeBox.get("rel_no"), "io_account_no");
       	   /* String dae_rel_no  = FormatUtil.nvl2(daeBox.get("rel_no"), wsfw.lib.config.Config.getInstance().getProperty("io_account_no")); */
       	
      out.write("\r\n");
      out.write("\t\t<table id=\"daeTable\" class=\"table table-view table-bordered\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col style=\"width:40%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:40%;\">\r\n");
      out.write("\t\t\t\t<col style=\"width:20%;\">\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>계정과목</th>\r\n");
      out.write("\t\t\t\t\t<th>계좌번호</th>\r\n");
      out.write("\t\t\t\t\t<th>결제금액</th>\r\n");
      out.write("\t         \t</tr> \r\n");
      out.write("\t        </thead>\r\n");
      out.write("\t        <tbody>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select name=\"dae_acct_cd\" title=\"계정과목\" class=\"bs-select form-control required\" style=\"width:100%\" onChange=\"changeAcctCd(this.value)\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t");
	RsWrapper acctWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "","sign_acct_cd","","","","",uSesEnt.dbo);
							for(int i=0; i < acctWp.getLength(); i++) {
								if(acctWp.get("code",i).equals("2100401")) { continue; } // 미지급금(법인카드) 제외 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<option value='");
      out.print(acctWp.get("code",i));
      out.write('\'');
      out.write(' ');
      out.print(acctWp.get("code",i).equals(dae_acct_cd)?"selected":"");
      out.write('>');
      out.print(acctWp.get("data",i));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t");
  } 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select name=\"rel_no\" title=\"계좌번호\" class=\"bs-select form-control ");
      out.print(!dae_acct_cd.equals("2100101")?"required":"");
      out.write("\" style=\"width:100%\" ");
      out.print(!dae_acct_cd.equals("2100101")?"":"disabled");
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=''>선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.print(CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",dae_rel_no, dae_acct_cd,"","","","",uSesEnt.dbo));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"rel_no_type\" value=\"");
      out.print(FormatUtil.nvl2(daeBox.get("rel_no_type"),"11"));
      out.write("\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" id=\"slip_amt\" name=\"slip_amt\" value=\"");
      out.print(daeBox.get("slip_amt"));
      out.write("\" maxlength=\"13\" class=\"form-control required tMONEY\" title=\"결제\" style=\"width:100%; border:1 solid gray;\" readOnly>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t         \t</tr> \r\n");
      out.write("         \t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"table-bottom-control\">\r\n");
      out.write("\t\t<span style=\"width:100%;\">\r\n");
      out.write("\t\t\t<span style=\"float:right;\">\r\n");
      out.write("\t\t\t");
 if(box.get("method").endsWith("write") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goSave()\"><img src=\"/com/img/ico_btn_save.png\">저장</button>\r\n");
      out.write("\t  \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t");
 if(obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goDeleteAll()\"><img src=\"/com/img/ico_btn_delete.png\">전체삭제</button>\r\n");
      out.write("\t  \t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t");
 if(box.get("method").endsWith("edit")) { 
      out.write("\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn dark\" onClick=\"goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!SLP009,");
      out.print(obox.get("slip_no"));
      out.write("!P_PARAM02!,ACCTB_SLIP01|");
      out.print(obox.get("slip_no"));
      out.write("!')\"><img src=\"/com/img/ico_btn_print.png\">인쇄</button>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t</span>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<form name=\"signForm\" method=\"post\" action=\"\" style=\"display:none\">\r\n");
      out.write("<input type=\"hidden\" name=\"send_empl_no\" \tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"subject\" \t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"msg_type\" \t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"search_key\" \t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"opinion\" \t\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"nextUrl\" \t\tvalue=\"\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<form name=\"report\" method=\"post\" action=\"/com/redirect.do?reqUrl=report/report\" style=\"display:none\">\r\n");
      out.write("<input type=\"hidden\" name=\"report_head\"\tvalue=\"\">\r\n");
      out.write("<input type=\"hidden\" name=\"report_id\"\tvalue=\"slp01001R\">\r\n");
      out.write("<input type=\"hidden\" name=\"param01\"\t\tvalue=\"\">\r\n");
      out.write("</form>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
