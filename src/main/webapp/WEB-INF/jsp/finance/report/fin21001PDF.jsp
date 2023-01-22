<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>미지급금결제</title>
</head>
<body>
<%	String slip_no = box.get("params");
	obox = CodeHelper.getRsBox("PR_REPORT_SQL", "SLIP_DETAIL", slip_no, "", "", "", "", request);
	
	rsWp = CodeHelper.getRsWrapper("PR_ACCTB_SLIP02_LIST", "LIST006", "", "1", "", "", slip_no, "", "", request);
	
	Document document = new Document(PageSize.A4, 20, 20, 60, 30);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+slip_no;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("미지급금결제", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	if(obox.get("sign_status").compareTo("2") >= 0) {
		// 결재선
		Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", obox.get("msg_type"), obox.get("search_key"), "","","",request);
		paragraph.add(esignLine(msgBox));
		paragraph.setSpacingAfter(10);
	}

	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 5f, 3f, 2f, 2f, 3f, 2f});
	Font font_head = new Font(baseFont, 11, Font.BOLD);
	Font font_data = new Font(baseFont, 9, Font.NORMAL);
	
	if(!obox.get("opinion").equals("")) {
		PdfPTable table2 = new PdfPTable(1);
		table2.addCell(PdfUtil.cellFormat(obox.get("opinion"), font_data, "LEFT", "TOP", "", "m100", "10,10,10,10"));
		
		paragraph.add(table2);
	}
	
	table.addCell(PdfUtil.cellFormat("No", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("적요", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("작성부서", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("작성자", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("금액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("지출거래처", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat("증빙일자", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	
	for(int i=0; i < rsWp.getLength(); i++) {
		table.addCell(PdfUtil.cellFormat(String.valueOf(i+1), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("etc_remark",i), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("wrt_dept_nm",i), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("wrt_empl_nm",i), font_data, "", "", "", "m25", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("slip_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(FormatUtil.nvl2(rsWp.get("cust_nm",i),rsWp.get("empl_nm",i)), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("proof_ymd",i,Box.DEF_DATE_FMT), font_data, "", "", "", "m25", ""));
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