<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>예산대비집행현황(총괄표)</title>
</head>
<body onload="">
<%
	String report_type = StringUtil.arrayCol(box.get("params"), 1, "|");
	String bugt_yy = StringUtil.arrayCol(box.get("params"), 2, "|");
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BUDTB_BUGT02_LIST", "LIST003", "", report_type, bugt_yy, "", "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_bud24001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("예산대비집행현황(총괄표)", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{5f, 2f, 2f, 2f, 2f, 1f}); // 테이블의 열 수
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("계정과목", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat(bugt_yy+"년 예산", font_head, "", "", "LIGHT_GRAY", "f15", "", "col3"));
	table.addCell(PdfUtil.cellFormat("집행실적", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("비율(%)", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("목적사업회계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("기금관리회계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	String cellColor = "";
	for(int i=0; i < rsWp.getLength(); i++) {
		cellColor = rsWp.get("row_level",i).equals("1")?"LIGHT_GRAY":"";
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_nm",i),"^","  "), font_data, "LEFT", "", cellColor, "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt3",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("real_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("exec_rate",i).equals("") ? "N/A" : rsWp.get("exec_rate",i), font_data, "RIGHT", "", cellColor, "m15", "0,5,0,5"));
	}
	
	paragraph.add(table);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>