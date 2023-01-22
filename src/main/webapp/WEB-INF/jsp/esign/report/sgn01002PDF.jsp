<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>일반문서</title>
</head>
<body>
<%	String msg_no = box.get("params");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "SGN01002", msg_no, "", "", "", "", request);
	
	Document document = new Document(PageSize.A4, 20, 20, 60, 30);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+msg_no;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("일반문서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	
	// 결재선
	Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", obox.get("msg_type"), "", msg_no,"","",request);
	paragraph.add(esignLine(msgBox));
	paragraph.setSpacingAfter(10);
	

	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 4f});
	Font font_head = new Font(baseFont, 10, Font.BOLD);
	Font font_data = new Font(baseFont, 10, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat(obox.get("opinion"), font_data, "LEFT", "TOP", "", "m200", "10,10,10,10", "col2"));
	if(!obox.get("etc_remark").equals("")) {
		table.addCell(PdfUtil.cellFormat("비고", font_data, "", "", "LIGHT_GRAY", "m20", ""));
		table.addCell(PdfUtil.cellFormat(obox.get("etc_remark"), font_data, "LEFT", "", "", "m20", "10,10,10,10"));
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