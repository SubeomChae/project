<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><%=StringUtil.arrayCol(box.get("params"),1,"|").startsWith("ACC001")?"재무상태표":"손익계산서"%></title>
</head>
<body onload="">
<%
	String report_type = StringUtil.arrayCol(box.get("params"),1,"|");
	String summary_yn = StringUtil.arrayCol(box.get("params"),2,"|");
	String std_yy = StringUtil.arrayCol(box.get("params"),3,"|");
	String std_mm = StringUtil.arrayCol(box.get("params"),4,"|");
	String acc_unit = StringUtil.arrayCol(box.get("params"),5,"|");
	String month_flag = StringUtil.arrayCol(box.get("params"),6,"|");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "SELECT_CORP", std_yy, "", "", "", "", request);
	
	String action_type = "";
	if(report_type.startsWith("ACC001")) { action_type = "LIST001";}
	if(report_type.startsWith("ACC002")) { action_type = "LIST002";}
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_ACCTB_SUMM02_LIST", action_type, "", report_type + summary_yn, std_yy + std_mm, acc_unit, month_flag, "","", request);
	

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+report_type;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph(report_type.startsWith("ACC001")?"재무상태표":"손익계산서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{2f, 1f, 1f, 1f, 1f});
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	table.addCell(PdfUtil.cellFormat("계정과목", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	if(month_flag.equals("M")) {
		if(report_type.startsWith("ACC001")) {
			table.addCell(PdfUtil.cellFormat("당월 ("+std_yy+"년 "+std_mm+"월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			if(std_mm.equals("01")) {
				table.addCell(PdfUtil.cellFormat("전월 ("+(Integer.parseInt(std_yy)-1)+"년 12월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			}else {
				table.addCell(PdfUtil.cellFormat("전월 ("+std_yy+"년 "+StringUtil.lpad(String.valueOf(Integer.parseInt(std_mm)-1),"0",2)+"월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			}
		}else if(report_type.startsWith("ACC002")) {
			table.addCell(PdfUtil.cellFormat("당월 ("+std_yy+"년 "+std_mm+"월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			if(std_mm.equals("01")) {
				table.addCell(PdfUtil.cellFormat("전월 ("+(Integer.parseInt(std_yy)-1)+"년 12월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			}else {
				table.addCell(PdfUtil.cellFormat("전월 ("+std_yy+"년 "+StringUtil.lpad(String.valueOf(Integer.parseInt(std_mm)-1),"0",2)+"월)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			}
		}
	}else {
		if(report_type.startsWith("ACC001")) {
			table.addCell(PdfUtil.cellFormat("당기 ("+std_yy+"년 "+std_mm+"월 "+DateUtil.getDayCount(Integer.parseInt(std_yy), Integer.parseInt(std_mm))+"일 현재)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			table.addCell(PdfUtil.cellFormat("전기 ("+(Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4))-1)+"년 "+obox.get("acc_end_ymd").substring(4,6)+"월 "+StringUtil.substr(obox.get("acc_end_ymd"),6)+"일 현재)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
		}else if(report_type.startsWith("ACC002")) {
			table.addCell(PdfUtil.cellFormat("당기 ("+StringUtil.substr(obox.get("acc_start_ymd"),0,4)+"년 "+StringUtil.substr(obox.get("acc_start_ymd"),4,2)+"월 "+StringUtil.substr(obox.get("acc_start_ymd"),6)+"일 부터 )"+std_yy+"년 "+std_mm+"월 "+DateUtil.getDayCount(Integer.parseInt(std_yy), Integer.parseInt(std_mm))+"일 까지)", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
			table.addCell(PdfUtil.cellFormat("전기 ("+(Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4))-1)+"년 "+StringUtil.substr(obox.get("acc_end_ymd"),4,2)+"월 "+StringUtil.substr(obox.get("acc_start_ymd"),6)+"일 부터 "+(Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4))-1)+"년 "+StringUtil.substr(obox.get("acc_end_ymd"),4,2)+"월 "+StringUtil.substr(obox.get("acc_end_ymd"),6)+"일 까지) ", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
		}
	}
	table.addCell(PdfUtil.cellFormat("금     액", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
	table.addCell(PdfUtil.cellFormat("금     액", font_head, "", "", "LIGHT_GRAY", "f15", "", "col2"));
	
	for(int i=0; i < rsWp.getLength(); i++){
		String cellColor = "";
		if(rsWp.get("row_level",i).equals("1")){ cellColor = "LIGHT_GRAY"; }
		if(rsWp.get("row_level",i).equals("2")){ cellColor = "GRAY"; }
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_nm",i),"^","  "), font_data, "LEFT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("cur_yy_tot1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("cur_yy_tot2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("pre_yy_tot1",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
		table.addCell(PdfUtil.cellFormat(StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("pre_yy_tot2",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", cellColor, "m15", ""));
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