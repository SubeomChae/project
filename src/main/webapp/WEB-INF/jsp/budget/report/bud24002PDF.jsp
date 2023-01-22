<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>예산대비집행실적</title>
</head>
<body onload="">
<%
	String bugt_yy = StringUtil.arrayCol(box.get("params"), 1, "|");
	String bugt_cd = StringUtil.arrayCol(box.get("params"), 2, "|");
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BUDTB_BUGT01_LIST", "LIST002A", "", bugt_yy, bugt_cd, "", "", "", "", request);

	Box obox = CodeHelper.getRsBox("PR_BUDTB_BUGT01_LIST", "LIST002B", bugt_yy, bugt_cd, "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_bud24002";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("예산대비집행실적", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 2f, 4f, 2f, 2f, 2f, 4f, 2f, 3f}); // 테이블의 열 수
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("No", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("집행일자", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("적요", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("집행금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("원인행위", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("성명", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("부서", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("직위", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("전표번호", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	for(int i=0; i < rsWp.getLength(); i++) {
		table.addCell(PdfUtil.cellFormat(String.valueOf(i+1), font_data, "", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("sign_ymd",i).equals("") ? rsWp.get("wrt_ymd",i,Box.DEF_DATE_FMT) : rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT), font_data, "", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("etc_remark",i), font_data, "LEFT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("sign_status",i).equals("3") ? rsWp.get("slip_amt",i,Box.THOUSAND_COMMA) : "", font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("sign_status",i).equals("3") ? "" : rsWp.get("slip_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_nm",i), font_data, "", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("dept_nm",i), font_data, "", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("position_nm",i), font_data, "", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("slip_no",i,Box.SLIP_NO), font_data, "", "", "", "m15", "0,5,0,5"));
	}
	
	table.setSpacingAfter(10);
	paragraph.add(table);
	
	PdfPTable table2 = new PdfPTable(8); // 테이블의 열 수
	
	table2.addCell(PdfUtil.cellFormat("예산금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat(obox.get("bugt_amt",Box.THOUSAND_COMMA), font_head, "RIGHT", "", "", "f15", "0,5,0,5"));
	table2.addCell(PdfUtil.cellFormat("집행금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat(obox.get("exec_amt",Box.THOUSAND_COMMA), font_head, "RIGHT", "", "", "f15", "0,5,0,5"));
	table2.addCell(PdfUtil.cellFormat("원인행위", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat(obox.get("cause_amt",Box.THOUSAND_COMMA), font_head, "RIGHT", "", "", "f15", "0,5,0,5"));
	table2.addCell(PdfUtil.cellFormat("사용한도금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat(obox.get("remain_amt",Box.THOUSAND_COMMA), font_head, "RIGHT", "", "", "f15", "0,5,0,5"));
	
	paragraph.add(table2);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>