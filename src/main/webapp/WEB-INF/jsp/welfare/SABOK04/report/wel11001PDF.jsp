<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>선물지급결제</title>
</head>
<body>
<%	String std_yy = StringUtil.arrayCol(box.get("params"), 1, "|");
	String bugt_cd = StringUtil.arrayCol(box.get("params"), 2, "|");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "WEL11001", std_yy, bugt_cd, "", "", "", request);
	
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BOKTB_PRES11_LIST", "LIST001", "", std_yy, bugt_cd, "", "", "", "", request);
	
	Document document = new Document(PageSize.A4, 20, 20, 60, 30);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_wel11001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("선물지급결제", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	if(obox.get("sign_status").compareTo("2") >= 0) {
		// 결재선
		String search_key = "ACCTB_SLIP01|"+obox.get("slip_no")+"|"+std_yy+"|"+bugt_cd;
		Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", "SLP005", search_key, "","","",request);
		paragraph.add(esignLine(msgBox));
		paragraph.setSpacingAfter(10);
	}

	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 3f, 2f, 2f, 3f, 3f, 2f});
	Font font_head = new Font(baseFont, 11, Font.BOLD);
	Font font_data = new Font(baseFont, 10, Font.NORMAL);
	
	if(!obox.get("opinion").equals("")) {
		PdfPTable table2 = new PdfPTable(1);
		table2.addCell(PdfUtil.cellFormat(obox.get("opinion"), font_data, "LEFT", "TOP", "", "m100", "10,10,10,10"));
		
		paragraph.add(table2);
	}
	
	table.addCell(PdfUtil.cellFormat("No", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("사번", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("성명", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("부서", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("직위", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("주민번호", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("지급액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	
	for(int i=0; i < rsWp.getLength(); i++) {
		table.addCell(PdfUtil.cellFormat(String.valueOf(i+1), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_no",i), font_data, "", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_nm",i), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("dept_nm",i), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("position_nm",i), font_data, "", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(FormatUtil.juminNo(rsWp.get("reside_no",i),"x"), font_data, "", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("pay_amt",i,Box.THOUSAND_COMMA), font_data, "", "", "", "m25", ""));
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