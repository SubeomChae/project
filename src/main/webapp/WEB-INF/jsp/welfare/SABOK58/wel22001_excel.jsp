<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page import="egovframework.cbiz.service.*"%>
<jsp:useBean id="commDBService" class="egovframework.cbiz.service.impl.CommDBServiceImpl"  scope="request" />
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="colWp" 	class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% RsWrapper codeWp = CodeUtil.getRsWrapper("PR_BUDTB_CODE01_LIST","LIST001", "", "S","","","N","",uSesEnt.dbo); %>
<%

	String file_nm = "개인별목적사업지원현황";
	String code_arr = "";
	String code_txt = "";
	for(int i=0; i < codeWp.getLength(); i++) { 
		code_arr  += "amt_" + codeWp.get("bugt_cd",i).toLowerCase() + "@"; 
		code_txt  += codeWp.get("bugt_nm",i) + "@";
	}
	String[] column_arr = StringUtil.split("empl_no@empl_nm@dept_nm@"+ code_arr + "amt_tot","@",true);	
	String[] column_txt = StringUtil.split("사번@성명@부서명@" + code_txt + "합계","@",true);	
	String[] column_lth = StringUtil.split("100@70@200@","@",true);
	RsWrapper excelWp = new RsWrapper();
	for(int i=0; i < column_arr.length; i++) {
		Box rsBox = new Box("");
		String cell_key = column_arr[i];
		rsBox.put("cell_key", cell_key);
		rsBox.put("mark_hdr_nm", column_txt[i]);
		rsBox.put("cell_width", i < column_lth.length-1 ? column_lth[i] : "120");
		if(i > 2){
			rsBox.put("align_type", "R");
			rsBox.put("fmt_mask", "MONEY");
		}else {
			rsBox.put("align_type", "C");
		}
		excelWp.appendRs(rsBox);
	}
	
	String excelPath = "";
	String sql_stmt = obox.get("sql_stmt").replaceAll("&lt;","<").replaceAll("&gt;",">").replaceAll("&acute;", "'");
	System.out.println(sql_stmt);
	if(!sql_stmt.equals("")) {
		Box ibox = new Box("");
		ibox.put("sql_stmt", sql_stmt);
		ibox.put("excel_form_no", "wel22001");
		ibox.put("excel_file_nm", file_nm);
		Box rbox = commDBService.execSQLXls(excelWp, ibox); 
		excelPath = rbox.get("excelPath");
	}
%>
<script language='javascript'>
	$(function() {
		if(!isEmpty(document.main.file_path)) {
			fileDownload(document.main, document.main.file_path.value, document.main.file_nm.value);
		}
	});
</script>

<form id="main" name="main" method="post" action="" style="margin:0px">
<input type="hidden" name="pathKey" 	value="temp">
<input type="hidden" name="file_nm"     value="<%=file_nm%>.xls">
<input type="hidden" name="file_path"   value="<%=excelPath%>">
</form>