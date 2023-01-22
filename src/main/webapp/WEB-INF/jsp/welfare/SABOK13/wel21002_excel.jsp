<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	String bugt_cd = StringUtil.substr(box.get("bugt_cd"), 0, 4);
	String bugt_arr = "";
	String bugt_txt = "";
	String bugt_lth = "";
	if(bugt_cd.equals("")){
		bugt_arr += "bugt_nm@";
		bugt_txt += "구분@";
		bugt_lth += "100@";
	}
	bugt_arr += "empl_no@empl_nm@dept_nm@position_nm@";
	bugt_txt += "사번@성명@부서명@직위@";
	
	if(!bugt_cd.equals("S700") && !bugt_cd.equals("S008")) { 
		bugt_arr += "apply_ymd@apply_amt@";
		bugt_txt += "신청일자@신청금액@";			
	}
	if(bugt_cd.equals("S001")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@cong_class_nm@start_ymd@end_ymd@cong_place@";
		bugt_txt += "가족관계@성명@주민등록번호@경조구분@경조시작일@경조종료일@경조장소@";
	}else if(bugt_cd.equals("S002")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@disease_nm@medi_org_nm@inner_start_ymd@inner_end_ymd@";
		bugt_txt += "가족관계@성명@주민등록번호@질병명@의료기관명@입원시작일@입원종료일@";
	}else if(bugt_cd.equals("S003") || bugt_cd.equals("S024") || bugt_cd.equals("S025")) {
		bugt_arr += "family_rel_nm@family_nm@family_reside_no@school_nm@school_flag_nm@school_year@school_term@major_nm@";
		bugt_txt += "가족관계@성명@주민등록번호@학교명@학교구분@학년@학기@전공@";
	}else if(bugt_cd.equals("S004")) {
		bugt_arr += "course_nm@start_ymd@end_ymd@edu_org_nm@edu_org_tel@edu_org_addr@";
		bugt_txt += "교육명@교육시작일@교육종료일@교육기관@기관연락처@기관주소@";
	}else if(bugt_cd.equals("S005")) {
		bugt_arr += "condo_nm@start_ymd@end_ymd@";
		bugt_txt += "휴양시설명@시작일@종료일@";
	}else if(bugt_cd.equals("S006")) {
		bugt_arr += "sub_nm@start_ymd@end_ymd@event_place@event_content@";
		bugt_txt += "동호인회@행사시작일@행사종료일@장소@행사내용@";
	}else if(bugt_cd.equals("S700") || bugt_cd.equals("S008")) {
		bugt_arr += "entry_ymd@reside_no@empl_class_nm@empl_status_nm@pay_ymd@pay_amt@";
		bugt_txt += "입사일자@주민번호@사원구분@재직상태@지급일자@지급액@";
	}else if(bugt_cd.equals("S022") || bugt_cd.equals("S023")) {
		bugt_arr += "desease_nm@inner_start_ymd@inner_end_ymd@";
		bugt_txt += "질병명@입원기간@입원기간@";
	}
	if(bugt_cd.equals("")){
		bugt_arr += "etc_remark@";
		bugt_txt += "비고@";
	}
	
	String[] column_arr = StringUtil.split(bugt_arr + "sign_status_nm","@",true);	
	String[] column_txt = StringUtil.split(bugt_txt + "상태","@",true);	
	String[] column_lth = StringUtil.split(bugt_lth + "100@70@200@80@","@",true);
	RsWrapper excelWp = new RsWrapper();
	for(int i=0; i < column_arr.length; i++) {			
		Box rsBox = new Box("");
		String cell_key = column_arr[i];
		rsBox.put("cell_key", cell_key);
		rsBox.put("mark_hdr_nm", column_txt[i]);
		rsBox.put("cell_width", i < column_lth.length-1 ? column_lth[i] : "120");
		rsBox.put("align_type", "C");
		if(cell_key.endsWith("reside_no")) { rsBox.put("fmt_mask", "JUMIN_NO"); }
		if(cell_key.endsWith("_amt")) { rsBox.put("fmt_mask", "MONEY"); rsBox.put("align_type", "R"); }
		if(cell_key.endsWith("_ymd")) { rsBox.put("fmt_mask", "DATE"); }
		if(cell_key.endsWith("_content")) { rsBox.put("fmt_mask", "MULTILINE"); }
		
		excelWp.appendRs(rsBox);
	}
	
	String excelPath = "";
	SpHelperOracleDirect spDirect = new SpHelperOracleDirect();
	java.sql.ResultSet rs = null;
	try {		
		String sql_stmt = obox.get("sql_stmt").replaceAll("&lt;","<").replaceAll("&gt;",">");
		if(!sql_stmt.equals("")){
			rs = spDirect.execSQLRs(getServletContext(), sql_stmt);
			Box rbox = RsUtilOracle.createExcel(rs, excelWp, "wel21002", box.get("excel_file_nm"));
			excelPath = rbox.get("excelPath");
		}
		
	}catch(Exception ex) {
		throw ex;
	}finally {
		spDirect.close();
	}
	
%>
<html>
<head>
<title>목적사업비집행현황(엑셀)</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<% if(!box.get("excel_yn").equals("Y")) { %>
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<% } %>
<script language='javascript'>
	function page_init() {
		if(!isEmpty(document.main.file_path)) {
			file_download(document.main, document.main.file_path.value, document.main.file_nm.value);
		}
	}
</script>
</head>
<body>
<form name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="pathKey" 	value="temp">
<input type="hidden" name="file_nm"     value="<%=box.get("excel_file_nm") + ".xls"%>">
<input type="hidden" name="file_path"   value="<%=excelPath%>">
</form>