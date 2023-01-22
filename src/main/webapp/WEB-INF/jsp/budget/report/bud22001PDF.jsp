<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>목적사업계획서</title>
</head>
<body onload="">
<%
	String bugt_yy = box.get("params");
	RsWrapper rsWp = CodeHelper.getRsWrapper("PR_BUDTB_BUGT01_LIST", "LIST001", "", bugt_yy, "S", "", "", "", "", request);

	Document document = new Document(PageSize.A4, 0, 0, 40, 20);
	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_bud22001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("목적사업계획서", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(20);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{1f, 2f, 1f, 1.5f, 1f, 1f}); // 테이블의 열 수
	Font font_head = new Font(baseFont, 8, Font.BOLD);
	Font font_data = new Font(baseFont, 8, Font.NORMAL);
	
	table.addCell(PdfUtil.cellFormat("사업명", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("목적", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("세분류", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("대상인원", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("총금액", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	table.addCell(PdfUtil.cellFormat("지원방법", font_head, "", "", "LIGHT_GRAY", "f15", ""));
	
	int pass_cnt = 0;
	int span_cnt = 0;
	long bugt_amt_sum = 0;
	for(int i=0; i < rsWp.getLength(); i++){
		bugt_amt_sum += rsWp.getLong("bugt_amt",i);
		if(pass_cnt == 0) {
			span_cnt = 1;
			for(int tmp_index=i + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
				if(!rsWp.get("bugt_cd",i).substring(0,4).equals(rsWp.get("bugt_cd",tmp_index).substring(0,4))) { break; }
				span_cnt ++;
			}
			table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_nm",i), font_data, "", "", "", "m15", "", "row"+span_cnt));
			table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_purpose",i), font_data, "", "", "", "m15", "", "row"+span_cnt));
		}
		table.addCell(PdfUtil.cellFormat(rsWp.get("sub_nm",i), font_data, "", "", "", "m15", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("member_cnt",i) + "명 x " + rsWp.get("unit_amt",i,Box.THOUSAND_COMMA) + "원", font_data, "LEFT", "", "", "m15", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("bugt_amt",i,Box.THOUSAND_COMMA), font_data, "RIGHT", "", "", "m15", "0,5,0,5"));
		if(pass_cnt == 0) {
			table.addCell(PdfUtil.cellFormat(rsWp.get("pay_guide",i), font_data, "", "", "", "m15", "", "row"+span_cnt));
			pass_cnt = span_cnt - 1;
		}else {
			pass_cnt --;
		}
	}
	table.addCell(PdfUtil.cellFormat("계", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat("", font_data, "", "", "LIGHT_GRAY", "m15", ""));
	table.addCell(PdfUtil.cellFormat(FormatUtil.insertComma(String.valueOf(bugt_amt_sum)), font_data, "RIGHT", "", "LIGHT_GRAY", "m15", "0,5,0,5"));
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