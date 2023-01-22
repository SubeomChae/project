<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="uSesEnt.dbo" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>세금계산서 합계표</title>
</head>
<body>
<%	String[] arr = StringUtil.getArrToken(box.get("params"),"|");
	Box obox = CodeUtil.getRsBox("PR_REPORT_SQL", "SELECT_TAX",  arr[0], arr[1],"","","",uSesEnt.dbo);
	Box vbox = CodeUtil.getRsBox("PR_ACCTB_VATX01_LIST", "LIST004B", arr[0], arr[1],"2","","",uSesEnt.dbo);
	RsWrapper rsWp = CodeUtil.getRsWrapper("PR_ACCTB_VATX01_LIST", "LIST004A", "", arr[0], arr[1], "2", "", "", "", uSesEnt.dbo);
	
	Document document = new Document(PageSize.A4, 0, 0, 60, 30);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_"+arr[0];
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("세금계산서 합계표", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 

	// 본문
	PdfPTable table = new PdfPTable(new float[]{60, 100, 60, 100});
	Font font_head = new Font(baseFont, 10, Font.BOLD);
	Font font_data = new Font(baseFont, 10, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("(1)사업자등록번호", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(FormatUtil.bizRegiNoFormat(obox.get("saupja_no")), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("(2)상호(법인명)", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("corp_nm"), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("(3)성명(대표자)", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("rep_person_nm"), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("(4)사업장 소재지", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("addr"), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("(5)거래기간", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("tax_ymd_from")+" ~ \n        "+obox.get("tax_ymd_to"), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	table.addCell(PdfUtil.cellFormat("(6)작성일자", font_head, "", "", "LIGHT_GRAY", "m35", ""));
	table.addCell(PdfUtil.cellFormat(obox.get("tax_ymd_to"), font_data, "LEFT", "", "", "m35", "0,5,0,5"));
	paragraph.add(table);

	PdfPTable table2 = new PdfPTable(new float[]{160, 60, 30, 70});
	
	table2.addCell(PdfUtil.cellFormat("구분", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat("(7)매입처수", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat("(8)매수", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat("(9)매입금액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat("합계", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_cnt"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_slip_cnt"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt"))), font_data, "RIGHT", "", "", "m25", "0,5,0,5"));
	table2.addCell(PdfUtil.cellFormat("과세기간 종료일 다음 달 11일까지 전송된 \n전자 세금계산서 발급받은 분", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_cnt_y"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_slip_cnt_y"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt_y"))), font_data, "RIGHT", "", "", "m25", "0,5,0,5"));
	table2.addCell(PdfUtil.cellFormat("위 전자 세금계산서 외의 발급받은분", font_head, "", "", "LIGHT_GRAY", "m25", "", "row3"));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_cnt_n"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(vbox.get("cust_slip_cnt_n"), font_data, "", "", "", "m25", ""));
	table2.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt_n"))), font_data, "RIGHT", "", "", "m25", "0,5,0,5"));
	paragraph.add(table2);
	
	PdfPTable table3 = new PdfPTable(new float[]{30, 50, 140, 30, 45, 25});
	
	table3.addCell(PdfUtil.cellFormat("(10)번호", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table3.addCell(PdfUtil.cellFormat("(11)사업자\n등록번호", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table3.addCell(PdfUtil.cellFormat("(12)상호(법인명)", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table3.addCell(PdfUtil.cellFormat("(13)매수", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table3.addCell(PdfUtil.cellFormat("(14)매입금액", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table3.addCell(PdfUtil.cellFormat("비고", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	
	if(rsWp.getLength() == 0) {
		table3.addCell(PdfUtil.cellFormat("검색된 자료가 없습니다.", font_data, "", "", "", "m25", "", "col7"));
	}else {
		for(int i=0; i < rsWp.getLength(); i++){
			table3.addCell(PdfUtil.cellFormat(rsWp.get("rn",i), font_data, "", "", "", "m25", ""));
			table3.addCell(PdfUtil.cellFormat(rsWp.get("saupja_no_x",i), font_data, "", "", "", "m25", ""));
			table3.addCell(PdfUtil.cellFormat(rsWp.get("cust_nm",i), font_data, "", "", "", "m25", ""));
			table3.addCell(PdfUtil.cellFormat(rsWp.get("slip_cnt",i), font_data, "", "", "", "m25", ""));
			table3.addCell(PdfUtil.cellFormat(rsWp.get("gong_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m25", ""));
			table3.addCell(PdfUtil.cellFormat("", font_data, "", "", "", "m25", ""));		
		}
	}
	paragraph.add(table3);
	
	PdfPTable table4 = new PdfPTable(new float[]{160, 160});
	
	table4.addCell(PdfUtil.cellFormat("관리번호(매입)", font_head, "", "", "LIGHT_GRAY", "m25", ""));
	table4.addCell(PdfUtil.cellFormat("", font_head, "", "", "", "m25", ""));
	paragraph.add(table4);
	
	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>