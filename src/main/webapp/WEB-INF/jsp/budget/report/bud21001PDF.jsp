<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><%=box.get("report_id").equals("ACC001P")?"추정 재무제표":"추정 손익계산서"%></title>
</head>
<body onload="">
<%
	String report_type = StringUtil.arrayCol(box.get("params"),1,"|");
	String bugt_yy = StringUtil.arrayCol(box.get("params"),2,"|");
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BUDTB_BUGT02_LIST", "LIST003", "", report_type, bugt_yy, "", "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+report_type;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph(report_type.equals("ACC001P")?"추정 재무제표":"추정 손익계산서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{4f, 2f, 2f, 2f, 2f});
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("과목", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat(bugt_yy+"년 예산", font_head, "", "", "LIGHT_GRAY", "f15", "", "col3"));
	table.addCell(PdfUtil.cellFormat("비고", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("목적사업회계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("기금관리회계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	for(int i=0; i < rsWp.getLength(); i++){
		String bgColor = rsWp.get("row_level",i).compareTo("1") >= 0 ? "LIGHT_GRAY" : "";
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_nm",i),"^","    "), font_data, "LEFT", "", bgColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", bgColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", bgColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt3",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", bgColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat("", font_data, "", "", bgColor, "m15", ""));
	}
	
	paragraph.add(table);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>