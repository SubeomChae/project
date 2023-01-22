<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>합계잔액시산표</title>
</head>
<body onload="">
<%
	String report_type = StringUtil.arrayCol(box.get("params"),1,"|");
	String summary_yn = StringUtil.arrayCol(box.get("params"),2,"|");
	String std_yy = StringUtil.arrayCol(box.get("params"),3,"|");
	String std_mm = StringUtil.arrayCol(box.get("params"),4,"|");
	String acc_unit = StringUtil.arrayCol(box.get("params"),5,"|");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "SELECT_CORP", std_yy, "", "", "", "", request);
	
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_ACCTB_SUMM02_LIST", "LIST003", "", report_type + summary_yn, std_yy + std_mm, acc_unit, "", "","", request);
	

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+report_type;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("합계잔액시산표", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 1f, 2f, 1f, 1f});
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	table.addCell(PdfUtil.cellFormat("차변", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
	table.addCell(PdfUtil.cellFormat("계정과목", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table.addCell(PdfUtil.cellFormat("대변", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
	table.addCell(PdfUtil.cellFormat("잔     액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("합     계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("합     계", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("잔     액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	for(int i=0; i < rsWp.getLength(); i++){
		String cellColor = "";
		if(rsWp.get("row_level",i).equals("1")){ cellColor = "LIGHT_GRAY"; }
		if(rsWp.get("row_level",i).equals("2")){ cellColor = "GRAY"; }
		table.addCell(PdfUtil.cellFormat(rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cha_amt1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cha_amt2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_nm",i),"^",""), font_data, "", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("dae_amt2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("dae_amt1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
	}
	
	table.setSpacingAfter(20);
	
	paragraph.add(table);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>