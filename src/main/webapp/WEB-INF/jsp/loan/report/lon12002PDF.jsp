<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>대부금일시상환</title>
</head>
<body onload="">
<%
	String loan_no = StringUtil.arrayCol(box.get("params"), 1, "|");
	String refund_seq = StringUtil.arrayCol(box.get("params"), 2, "|");
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BOKTB_LOAN11_LIST", "LIST001", "", loan_no, "", "", "", "", "", request);
System.out.println(loan_no+"|||"+refund_seq);
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "LON01002", loan_no, "", "", "", "", request);
	Box tbox = CodeHelper.getRsBox("PR_REPORT_SQL", "LON12002", loan_no, refund_seq, "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+loan_no;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("대부금일시상환", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	if(tbox.get("sign_status").compareTo("2") >= 0) {
		// 결재선
		String search_key = "ACCTB_SLIP01|"+tbox.get("slip_no")+"|L22|"+loan_no+"|"+refund_seq;
		Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", "SLP007", search_key, "","","",request);
		paragraph.add(esignLine(msgBox));
		paragraph.setSpacingAfter(10);
	}
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 2f, 1f, 2f}); // 테이블의 열 수
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("사번/성명", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("empl_no")+"  "+obox.get("empl_nm"), font_head, "", "", "", "f15", ""));
	table.addCell(PdfUtil.cellFormat("대부종류", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_nm"), font_head, "", "", "", "f15", ""));
	table.addCell(PdfUtil.cellFormat("대부일자", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("loan_ymd",Box.DEF_DATE_FMT), font_head, "", "", "", "f15", ""));
	table.addCell(PdfUtil.cellFormat("대부금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("loan_amt",Box.THOUSAND_COMMA)+" 원", font_head, "", "", "", "f15", ""));
	table.addCell(PdfUtil.cellFormat("최종상환일", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("last_refund_ymd",Box.DEF_DATE_FMT), font_head, "", "", "", "f15", ""));
	table.addCell(PdfUtil.cellFormat("대부잔액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("remain_amt",Box.THOUSAND_COMMA)+" 원", font_head, "", "", "", "f15", ""));
	
	table.setSpacingAfter(10);
	paragraph.add(table);
	
	PdfPTable table2 = new PdfPTable(new float[]{1f, 4f, 4f, 4f, 8f, 4f}); // 테이블의 열 수
	table2.addCell(PdfUtil.cellFormat("No", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table2.addCell(PdfUtil.cellFormat("구분", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("원금상환", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("대부잔액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("전표번호", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("비고", font_head, "", "", "LIGHT_GRAY", "f15", "", "row2"));
	table2.addCell(PdfUtil.cellFormat("상환일자", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("이자상환", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("이자기산일", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table2.addCell(PdfUtil.cellFormat("결재상태", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	for(int i=0; i < rsWp.getLength(); i++) {
		table2.addCell(PdfUtil.cellFormat(String.valueOf(i+1), font_data, "", "", "", "m15", "", "row2"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("refund_flag_nm",i), font_data, "", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("refund_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(obox.getLong("loan_amt")-rsWp.getLong("refund_sum",i))), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("slip_no",i,Box.SLIP_NO), font_data, "", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("etc_remark",i), font_data, "LEFT", "", "", "m15", "0,5,0,5", "row2"));
		
		table2.addCell(PdfUtil.cellFormat(rsWp.get("refund_ymd",i,Box.DEF_DATE_FMT), font_data, "", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("intr_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("end_ymd",i,Box.DEF_DATE_FMT), font_data, "", "", "", "m15", "0,5,0,5"));
		table2.addCell(PdfUtil.cellFormat(rsWp.get("sign_status_nm",i), font_data, "", "", "", "m15", "0,5,0,5"));
	}
	
	paragraph.add(table2);

	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
<%@ include file="/esign/report/esignLine.jsp" %>
</body>
</html>