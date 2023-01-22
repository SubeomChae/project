<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt"	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>보조부</title>
</head>
<body>
<%	String arr[] = StringUtil.split(box.get("params"), "Ð", true);
	rsWp = CodeHelper.getRsWrapper("PR_ACCTB_SLIP02_LIST", "LIST003C", "", arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], "", "", "", request);
	
	Document document = new Document(PageSize.A4.rotate(), 30, 30, 40, 20);

	String report_id = DateUtil.toString("yyyyMMddHHmmssS")+"_rpt01001";
	PdfWriter.getInstance(document, new FileOutputStream(Config.getInstance().getProperty("report")+"/"+report_id+".pdf"));
	
	document.open();
	
	BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
	Paragraph paragraph = new Paragraph();
	Font font_title = new Font(baseFont, 18, Font.BOLD);
	Paragraph title = new Paragraph("보조부", font_title);
	title.setAlignment(Paragraph.ALIGN_CENTER);
	title.setSpacingAfter(10);
	paragraph.add(title); 
	
	// 본문
	PdfPTable table = new PdfPTable(new float[]{77f, 174f, 70f, 70f, 70f, 98f, 49f, 80f, 93f});
	table.setTotalWidth(800f);
	table.setLockedWidth(true);
	Font font_head = new Font(baseFont, 10, Font.BOLD);
	Font font_data = new Font(baseFont, 10, Font.NORMAL);
	
	String acct_cd = "";
	String sign_ymd = "";
	String remainAmt = "";
	long remain_amt = 0;
	for(int i=0; i < rsWp.getLength(); i++) {
		if(!rsWp.get("acct_cd",i).equals(acct_cd)) { 
			acct_cd = rsWp.get("acct_cd",i); 
			remain_amt = rsWp.get("sign_ymd",i).equals("0") ? rsWp.getLong("remain_amt",i) : 0;
			
			table.addCell(PdfUtil.setBorder(PdfUtil.cellFormat("계정과목 : "+rsWp.get("acct_cd",i)+" "+rsWp.get("acct_nm",i), font_head, "LEFT", "0", "", "f20", "0,5,0,5", "col9"),0));

			table.addCell(PdfUtil.cellFormat("결산반영일", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("적요", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("차변금액", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("대변금액", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("잔액", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("거래처", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("사원명", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("관련번호", font_head, "", "", "LIGHT_GRAY", "m20", ""));
			table.addCell(PdfUtil.cellFormat("전표번호", font_head, "", "", "LIGHT_GRAY", "m20", ""));
		}else {
			remain_amt += rsWp.get("sign_ymd",i).equals("z") ? rsWp.getLong("remain_amt",i) : 0;
		}
		sign_ymd = rsWp.get("sign_ymd",i).length() == 8 ? rsWp.get("sign_ymd",i,Box.DEF_DATE_FMT) : "";
		remainAmt = rsWp.get("sign_ymd",i).length() == 8 ? "" : FormatUtil.insertComma(String.valueOf(remain_amt));
		
		table.addCell(PdfUtil.cellFormat(sign_ymd, font_data, "", "", "", "m20", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("etc_remark",i), font_data, "LEFT", "", "", "m20", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("cha_amt",i,Box.THOUSAND_COMMA), font_data, "", "", "", "m20", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("dae_amt",i,Box.THOUSAND_COMMA), font_data, "", "", "", "m20", ""));
		table.addCell(PdfUtil.cellFormat(remainAmt, font_data, "", "", "", "m20", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("cust_nm",i), font_data, "", "", "", "m20", "0,5,0,5"));
		table.addCell(PdfUtil.cellFormat(rsWp.get("empl_nm",i), font_data, "", "", "", "m20", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("rel_no",i), font_data, "", "", "", "m20", ""));
		table.addCell(PdfUtil.cellFormat(rsWp.get("slip_no",i,Box.SLIP_NO), font_data, "", "", "", "m20", ""));
	}
	
	paragraph.add(table);
	
	document.add(paragraph);
	document.newPage();
	document.close();
	
	response.sendRedirect("/com/redirect.do?reqUrl=com/viewer/rptViewer&report_id="+report_id);
%>
</body>
</html>