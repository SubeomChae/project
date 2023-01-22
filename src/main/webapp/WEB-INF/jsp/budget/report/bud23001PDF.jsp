<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>기금운용계획서</title>
</head>
<body onload="">
<%
	String bugt_yy = box.get("params");
	Box obox = CodeHelper.getRsBox("PR_BUDTB_BUGT02_LIST", "LIST002", bugt_yy,"","","","", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_bud23001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("기금운용계획서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	PdfPTable table = new PdfPTable(new float[]{1f, 3f, 1f, 1f}); // 테이블의 열 수
	
	table.addCell(PdfUtil.cellFormat("구분", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("내역", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("비고", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	table.addCell(PdfUtil.cellFormat("조달", font_data, "", "", "", "m15", "", "row4"));
	table.addCell(PdfUtil.cellFormat("1. "+box.get("bugt_yy")+"년도 수입", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(obox.getLong("bugt_amt_61001")+obox.getLong("bugt_amt_61002"))), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("  이자수입 총액\n  대부이자수입총액", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_61001",Box.THOUSAND_COMMA) + "\n" + obox.get("bugt_amt_61002",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("2. "+box.get("bugt_yy")+"년 출연금 중 준비금 설정", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_64001",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("합계", font_data, "", "", "", "m15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_6",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("지출", font_data, "", "", "", "m15", "", "row4"));
	table.addCell(PdfUtil.cellFormat("1. 고유목적사업비용", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_71",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("2. 일반관리비", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_72",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("3. 예비비", font_data, "LEFT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_74002",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("합계", font_data, "", "", "", "m15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_amt_7",Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m15", ""));
	
	table.addCell(PdfUtil.cellFormat("과부족", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(obox.getLong("bugt_amt_6")-obox.getLong("bugt_amt_7"))), font_data, "RIGHT", "", "LIGHT_GRAY", "m15", "", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	
	table.setSpacingAfter(20);
	
	paragraph.add(table);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>