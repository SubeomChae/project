<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>대부금정기상환</title>
</head>
<body onload="">
<%
	String std_ym = box.get("params");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "LON11002", std_ym, "","","","",request);
	
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BOKTB_LOAN11_LIST", "LIST002", "", std_ym, "", "", "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_lon11001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("대부금정기상환", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	if(obox.get("sign_status").compareTo("2") >= 0) {
		// 결재선
		String search_key = "ACCTB_SLIP01|"+obox.get("slip_no")+"|L21|"+std_ym;
		Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", "SLP007", search_key, "","","",request);
		paragraph.add(esignLine(msgBox));
		paragraph.setSpacingAfter(10);
	}
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 3f, 2f, 3f, 3f, 3f, 3f, 3f, 2.5f, 2.5f, 2.5f, 3f}); // 테이블의 열 수
	table.setTotalWidth(500f);
	table.setLockedWidth(true);
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("No", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("사번", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("성명", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("부서", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("대부종류", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("대부일자", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("대부금액", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("공제전\n대부잔액", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("당월공제", font_head, "", "", "LIGHT_GRAY", "f15", "", "col3"));
	table.addCell(PdfUtil.cellFormat("공제후\n대부잔액", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("원금", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("이자", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	for(int i=0; i < rsWp.getLength(); i++) {
		table.addCell(PdfUtil.cellFormat(String.valueOf(i+1), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_no",i), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_nm",i), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("dept_nm",i), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_nm",i), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("loan_ymd",i,Box.DEF_DATE_FMT), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("loan_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("remain_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("refund_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("intr_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("tot_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(rsWp.getLong("remain_amt",i)-rsWp.getLong("refund_amt",i))), font_data, "RIGHT", "", "", "m15", ""));
	}	
	paragraph.add(table);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
<%@ include file="/esign/report/esignLine.jsp" %>
</body>
</html>