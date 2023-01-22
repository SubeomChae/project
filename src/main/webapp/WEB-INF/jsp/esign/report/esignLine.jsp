<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%!	public PdfPTable esignLine(Box msgBox) throws Exception {
		PdfPTable table = new PdfPTable(2);
		BaseFont baseFont = BaseFont.createFont(Config.getInstance().getProperty("report")+"/font/HMKMM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font_head = null;
		Font font_data = null;

		// 문서번호
		font_data = new Font(baseFont, 10, Font.NORMAL);
		table.addCell(PdfUtil.setBorder(PdfUtil.cellFormat("문서번호 : " + msgBox.get("docu_no_x"), font_data, "LEFT", "", "", "f25", "", "col2"), 0));
		
		// 문서개요
		PdfPTable mesgTable = new PdfPTable(new float[]{50, 100});
		font_head = new Font(baseFont, 10, Font.BOLD);
		font_data = new Font(baseFont, 10, Font.NORMAL);
		mesgTable.addCell(PdfUtil.cellFormat("발의부서", font_head, "", "", "LIGHT_GRAY", "m25",""));
		mesgTable.addCell(PdfUtil.cellFormat(msgBox.get("send_dept_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		mesgTable.addCell(PdfUtil.cellFormat("발의자", font_head, "", "", "LIGHT_GRAY", "m25",""));
		mesgTable.addCell(PdfUtil.cellFormat(msgBox.get("send_empl_nm"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		mesgTable.addCell(PdfUtil.cellFormat("발의일자", font_head, "", "", "LIGHT_GRAY", "m25",""));
		mesgTable.addCell(PdfUtil.cellFormat(msgBox.get("send_date"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		mesgTable.addCell(PdfUtil.cellFormat("제목", font_head, "", "", "LIGHT_GRAY", "m25",""));
		mesgTable.addCell(PdfUtil.cellFormat(msgBox.get("subject"), font_data, "LEFT", "", "", "m25", "0,5,0,5"));
		PdfPCell pc1 = new PdfPCell(mesgTable);
		pc1.setBorder(Rectangle.NO_BORDER);
		
		// 결재선
		PdfPTable lineTable = new PdfPTable(new float[]{10, 35, 35, 35, 35});
		font_head = new Font(baseFont, 9, Font.BOLD);
		font_data = new Font(baseFont, 9, Font.NORMAL);
		lineTable.addCell(PdfUtil.cellFormat("발의부서", font_head, "", "", "LIGHT_GRAY", "", "", "row2"));
		lineTable.addCell(PdfUtil.cellFormat("발의자", font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign21"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign22"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign23"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(msgBox.get("send_empl_nm"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign21"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign22"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign23"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat("접수부서", font_head, "", "", "LIGHT_GRAY", "", "", "row2"));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign30"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign31"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign32"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign33"),1,"|"), font_head, "", "", "LIGHT_GRAY", "m16", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign30"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign31"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign32"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		lineTable.addCell(PdfUtil.cellFormat(StringUtil.arrayCol(msgBox.get("sign33"),2,"|").replace("\\n","<br>"), font_data, "", "", "", "m34", ""));
		PdfPCell pc2 = new PdfPCell(lineTable);
		pc2.setBorder(Rectangle.NO_BORDER);
	
		table.addCell(pc1);
		table.addCell(pc2);
		table.setSpacingAfter(10);
		
        return table;
	}
%>