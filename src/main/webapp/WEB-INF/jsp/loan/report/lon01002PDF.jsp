<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>대부금신청서</title>
</head>
<body>
<%	String loan_no = box.get("params");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "LON01002", loan_no, "","","","",request);
	
	Document document = new Document(PageSize.A4, 20, 20, 60, 30);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+loan_no;
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("대부금신청서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	if(obox.get("sign_status").compareTo("2") >= 0) {
		// 결재선
		String search_key = "ACCTB_SLIP01|"+obox.get("slip_no")+"|"+obox.get("loan_no");
		Box msgBox = CodeHelper.getRsBox("PR_REPORT_SQL", "SIGNLINE", "SLP006", search_key, "","","",request);
		paragraph.add(esignLine(msgBox));
		paragraph.setSpacingAfter(10);
	}

	// 본문
	PdfPTable table = new PdfPTable(new float[]{50, 100, 50, 100});
	Font font_head = new Font(baseFont, 11, Font.BOLD);
	Font font_data = new Font(baseFont, 10, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("사번/성명", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("empl_no")+" "+obox.get("empl_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("부서", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("dept_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	
	table.addCell(PdfUtil.cellFormat("주민번호", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(FormatUtil.juminNo(obox.get("reside_no"),"x"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("직위", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("position_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	
	table.addCell(PdfUtil.cellFormat("입사일자", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("entry_ymd",Box.DEF_DATE_FMT), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("사원구분", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("empl_class_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	
	table.addCell(PdfUtil.cellFormat("대부종류", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("bugt_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5", "col3"));
	
	table.addCell(PdfUtil.cellFormat("신청일자", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("apply_ymd",Box.DEF_DATE_FMT), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("대부일자", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("loan_ymd",Box.DEF_DATE_FMT), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	
	table.addCell(PdfUtil.cellFormat("대부금액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("loan_amt",Box.THOUSAND_COMMA), font_data, "LEFT", "", "", "m18", "0,5,0,5", "col3"));
	
	table.addCell(PdfUtil.cellFormat("대부용도", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("loan_usage"), font_data, "LEFT", "", "", "m18", "0,5,0,5", "col3"));
	
	table.addCell(PdfUtil.cellFormat("상환방법", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(FormatUtil.nvl2(obox.get("defer_year"),"__")+"년 거치 "+FormatUtil.nvl2(obox.get("refund_year"),"__")+"년 상환 (상환횟수 : "+FormatUtil.nvl2(obox.get("refund_cnt"),"__")+"회)", font_data, "LEFT", "", "", "m18", "0,5,0,5", "col3"));
	
	table.addCell(PdfUtil.cellFormat("거치만료일", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("defer_end_ymd",Box.DEF_DATE_FMT), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("1회상환금액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("unit_amt",Box.THOUSAND_COMMA)+"원", font_data, "LEFT", "", "", "m25", "0,5,0,5"));
	
	table.addCell(PdfUtil.cellFormat("이자율", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("intr_rate")+"%", font_data, "LEFT", "", "", "m18", "0,5,0,5", "col3"));
	
	table.addCell(PdfUtil.cellFormat("계좌번호", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("bank_nm")+" "+obox.get("account_no")+" (예금주 : "+obox.get("account_owner")+")", font_data, "LEFT", "", "", "m25", "0,5,0,5", "col3"));
	table.addCell(PdfUtil.cellFormat("비고", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("etc_remark"), font_data, "LEFT", "", "", "m25", "0,5,0,5", "col3"));
	paragraph.add(table);
	
	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
<%@ include file="/esign/report/esignLine.jsp" %>
</body>
</html>