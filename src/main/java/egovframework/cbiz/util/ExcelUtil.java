package egovframework.cbiz.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.*;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.NPOIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.DataValidationConstraint.ValidationType;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Name;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.impl.RsUtilOracle; 

public class ExcelUtil {
	public static Logger logger = LogManager.getLogger("biz");
	
	public static Sheet getExcelWorkSheet(String excelPath, int sheetNo) throws Exception {
		File f = new File(excelPath);
		NPOIFSFileSystem npoifs = null;
		Workbook wb = null;
		
		try {
			npoifs = new NPOIFSFileSystem(f);
		    wb = WorkbookFactory.create(npoifs);
            return wb.getSheetAt(sheetNo);
		} catch(java.lang.IndexOutOfBoundsException ex) {
			return null;
		} catch(Exception ex) {
			throw ex;
		} finally {
			if(npoifs != null) { npoifs.close(); }
		}
	}
	
	public static RsWrapper getRsWp(String excelPath, int sheetNo, int colNmRow, int startRow, int maxCol) throws Exception {
		RsWrapper rsWp = new RsWrapper();
		Sheet exlSheet = getExcelWorkSheet(excelPath, sheetNo);
		if(exlSheet == null) { return rsWp; }
		
		Box hbox = new Box();
		for(Cell cell : exlSheet.getRow(colNmRow)) {
		    if(cell == null) { break; }
		    hbox.put(cell.getColumnIndex()+"", getCellValue(cell));
		}
		for(Row mRow : exlSheet){
		    if(mRow.getRowNum() < startRow) { continue; }
            Box obox = new Box();            
            boolean isEmpty = true;
            for(Cell mCell : mRow) {
                if(mCell != null && getCellValue(mCell).trim().equals("") == false) { 
                    isEmpty = false;
                    continue; 
                }
            }
            
            if(isEmpty) { break; }
		    for(Cell mCell : mRow) {
		        if(mCell == null || getCellValue(mCell).trim().equals("")) { continue; }
		        obox.put("col"+mCell.getColumnIndex(), getCellValue(mCell).trim());
		    }
            rsWp.appendRs(obox);
		}
		return rsWp;
	}
	
	public static RsWrapper getRsWp(String excelPath, int sheetNo, int colNmRow, int startRow) throws Exception {
		return getRsWp(excelPath, sheetNo, colNmRow, startRow, 10);
	}
	
    /**
     * <pre>
     * POI를 통한 엑셀파일 생성 시, 스타일 지정.
     * </pre>
     *
     * @param  스타일 ID
     * @return HSSFCellStyle
     */
    public static HSSFCellStyle getPoiStyle(HSSFWorkbook workbook, String sid, String cellType) {
    	HSSFCellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
    	if(sid.equals("TITLE")) {
    		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    		
    		font.setFontHeightInPoints((short)16);
    		font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
    		font.setFontName("맑은 고딕");
    		style.setFont(font);
    	}else if(sid.equals("HEADER")) {
    		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    		style.setBorderTop   (HSSFCellStyle.BORDER_THIN); style.setTopBorderColor   (HSSFColor.BLACK.index);
    		style.setBorderRight (HSSFCellStyle.BORDER_THIN); style.setRightBorderColor (HSSFColor.BLACK.index);
    		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); style.setBottomBorderColor(HSSFColor.BLACK.index);
    		style.setBorderLeft  (HSSFCellStyle.BORDER_THIN); style.setLeftBorderColor  (HSSFColor.BLACK.index);
    		style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
    		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    		style.setWrapText(true);
            
    		font.setFontHeightInPoints((short)10);
            font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
            font.setFontName("맑은 고딕");
            style.setFont(font);
    	}else if(sid.startsWith("DATA")) {
    		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    		style.setBorderTop   (HSSFCellStyle.BORDER_THIN); style.setTopBorderColor   (HSSFColor.BLACK.index);
    		style.setBorderRight (HSSFCellStyle.BORDER_THIN); style.setRightBorderColor (HSSFColor.BLACK.index);
    		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); style.setBottomBorderColor(HSSFColor.BLACK.index);
    		style.setBorderLeft  (HSSFCellStyle.BORDER_THIN); style.setLeftBorderColor  (HSSFColor.BLACK.index);
    		style.setFillForegroundColor(HSSFColor.WHITE.index);
    		if(sid.equals("DATA_LEFT")) {
    			style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    		}else if(sid.equals("DATA_RIGHT")) {
    			style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
    		}else {
    			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    		}
    		style.setWrapText(true);
    		
    		if(cellType.equals("MONEY")) {
    			HSSFDataFormat format = workbook.createDataFormat();
    			style.setDataFormat(format.getFormat("#,###"));
    		}else if(cellType.equals("FMONEY")) {
    			HSSFDataFormat format = workbook.createDataFormat();
    			style.setDataFormat(format.getFormat("#,###.####"));
    		}
            
    		font.setFontHeightInPoints((short)9);
            font.setBoldweight((short)font.BOLDWEIGHT_NORMAL);
            font.setFontName("맑은 고딕");
            style.setFont(font);
    	}
    	return style;
    }
    
    public static HSSFCellStyle getPoiStyle(HSSFWorkbook workbook, String sid) {
    	return getPoiStyle(workbook, sid, "@");
    }
    
    private static String getCellValue(HSSFCell cell) {
        int cellType = cell.getCellType();
        String fvalue = "";
        if(cellType == HSSFCell.CELL_TYPE_NUMERIC ) { 
        	fvalue = ((float)cell.getNumericCellValue()) + ""; 
        }else if(cellType == HSSFCell.CELL_TYPE_STRING) { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
              fvalue = ((float)cell.getNumericCellValue()) + ""; 
           }
        }else { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
              fvalue = ((float)cell.getNumericCellValue()) + ""; 
           } 
        } 
        return fvalue;
    }
    
    private static String getCellValue(XSSFCell cell) {
        int cellType = cell.getCellType();
        String fvalue = "";
        if(cellType == XSSFCell.CELL_TYPE_NUMERIC) { 
        	fvalue = ((float)cell.getNumericCellValue()) + ""; 
        }else if(cellType == XSSFCell.CELL_TYPE_STRING) { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
        	   fvalue = ((float)cell.getNumericCellValue()) + ""; 
           } 
        }else { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
        	   fvalue = ((float)cell.getNumericCellValue()) + ""; 
           }
        }
        return fvalue;
    }
    
    private static String getCellValue(Cell cell) {
        int cellType = cell.getCellType();
        String fvalue = "";
        if(cellType == Cell.CELL_TYPE_NUMERIC) {
        	if(HSSFDateUtil.isCellDateFormatted(cell)){
        		SimpleDateFormat fommatter = new SimpleDateFormat("yyyyMMdd");
        		fvalue = fommatter.format(cell.getDateCellValue()); 
        	}else{
        		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
    			fvalue = cell.getStringCellValue()+ "";
        	}
        }else if(cellType == Cell.CELL_TYPE_STRING) { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
        	   fvalue = ((float)cell.getNumericCellValue()) + ""; 
           }
        	
        }else { 
           try { 
        	   fvalue = cell.getStringCellValue();
           }catch(Exception e) { 
        	   fvalue = ((float)cell.getNumericCellValue()) + ""; 
           }
        }
        return fvalue;
    }
	
	public static RsWrapper getExcelToRsWrapper(String filePath, String colList, int firstRow) {
		OPCPackage opac = null;
		XSSFWorkbook wb = null;
		XSSFSheet sheet1 = null;

		RsWrapper exWp = new RsWrapper();
		try {
			String[] colArr = colList.split(",");
			opac = OPCPackage.open(filePath);
			wb = new XSSFWorkbook(opac);
			sheet1 = wb.getSheetAt(0);

			int rowCount = 0;
			for(Row row : sheet1) {
				rowCount++;
				if(firstRow <= rowCount) {
					if(ExcelUtil.getCellValue(row.getCell(0)) == null || ExcelUtil.getCellValue(row.getCell(0)) == null
							|| ExcelUtil.getCellValue(row.getCell(0)).trim().equals("")) {
						break;
					}
					Box rb = new Box("");
					for(int i=0; i < colArr.length; i++) {
						rb.put(colArr[i], ExcelUtil.getCellValue(row.getCell(i)));
					}
					exWp.add(rb);
				}
			}
		}catch (Exception ex) {
			CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
		}finally {
			if(wb != null) {
				try { wb.close(); } catch(Exception ex2) {}
			}
			if(opac != null) {
				try { opac.close(); } catch(Exception ex2) {}
			}
		}
		return exWp;
	}
    
	/*
	 * 대용량  엑셀파일 생성
	 */
	public static Box createExcelBigSize(ResultSet rs, RsWrapper excelWp, String excel_form_no, String excel_file_nm) throws Exception {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();
		HSSFRow row = null;
		HSSFCell cell = null;
		int rownum = 0;
		
		// 제목영역
		HSSFCellStyle style_title 	= getPoiStyle(workbook, "TITLE");
		sheet.addMergedRegion(new Region(0,(short)0,0,(short)(excelWp.getLength()-1)));
		row = sheet.createRow((short)rownum);
		row.setHeight((short)0x200);
		
		cell = row.createCell((short)0);
		cell.setCellValue(excel_file_nm);
		cell.setCellStyle(style_title);
		
		// 헤더영역
		HSSFCellStyle style_header = getPoiStyle(workbook, "HEADER");
		rownum++;
		row = sheet.createRow((short)rownum);
		for(int i=0; i < excelWp.getLength(); i++) {
			sheet.setColumnWidth((short)i, (short)(excelWp.getInt("cell_width",i)*36));
			cell = row.createCell((short)i);
			cell.setCellValue(StringUtil.getReplaceSpecialCharacters(excelWp.get("mark_hdr_nm",i)));
			cell.setCellStyle(style_header);
		}
		
		// 데이터영역
		HSSFCellStyle style_Ldata 	= getPoiStyle(workbook, "DATA_LEFT");
		HSSFCellStyle style_Rdata 	= getPoiStyle(workbook, "DATA_RIGHT");
		HSSFCellStyle style_Cdata 	= getPoiStyle(workbook, "DATA_CENTER");
		HSSFCellStyle style_money 	= getPoiStyle(workbook, "DATA_RIGHT", "MONEY");
		HSSFCellStyle style_fmoney 	= getPoiStyle(workbook, "DATA_RIGHT", "FMONEY");
		if(rs != null && rs.next()) {
			java.sql.ResultSetMetaData rsMeta = rs.getMetaData();
			int colCnt = rsMeta.getColumnCount();
			do {
				Box rsBox = new Box(""); 
				for(int k=1; k <= colCnt; k++) {
					if(rs.getObject(k) != null) {
						rsBox.put(rsMeta.getColumnName(k).toLowerCase(), RsUtilOracle.getColumnData(rs, k, rsMeta.getColumnType(k)));
					}else {
						rsBox.put(rsMeta.getColumnName(k).toLowerCase(), "");
					}
				}

				rownum++;
				row = sheet.createRow((short)rownum);
				row.setHeight((short)0x100);
				for(int i=0; i < excelWp.getLength(); i++) {
					cell = row.createCell((short)i);
					String cell_key = excelWp.get("cell_key",i);
					String key = cell_key; int inx = -1;
					if(cell_key.indexOf("[") > 0 && cell_key.indexOf("]") > 0) {
						key = cell_key.substring(0, cell_key.indexOf("["));
						inx = Integer.parseInt(cell_key.substring(cell_key.indexOf("[")+1,cell_key.indexOf("]")));
					}
					String data = rsBox.get(key);
					if(inx > 0) { data = StringUtil.arrayCol(data+"||||", inx); }
					if(excelWp.get("cell_key",i).equals("row_num")) { data = String.valueOf(rownum - 1); }
					
					if(excelWp.get("align_type",i).equals("L")) { 
						cell.setCellStyle(style_Ldata);
					}else if(excelWp.get("align_type",i).equals("R")) { 
						cell.setCellStyle(style_Rdata);
					}else { 
						cell.setCellStyle(style_Cdata);
					}
					
					if(excelWp.get("fmt_mask",i).equals("MONEY")) { 
						cell.setCellValue(Long.parseLong(FormatUtil.nvl2(data,"0"))*1);
						cell.setCellStyle(style_money);
						cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC); 
					}else if(excelWp.get("fmt_mask",i).equals("FMONEY")) { 
						cell.setCellValue(Double.parseDouble(FormatUtil.nvl2(data,"0"))*1);
						if(data.indexOf(".") >= 0) { 
							cell.setCellStyle(style_fmoney);
						}else {
							cell.setCellStyle(style_money);
						}
						cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC); 
					}else if(excelWp.get("fmt_mask",i).equals("DATE")) { 
						cell.setCellValue(DateUtil.defFmtDate(data)); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else if(excelWp.get("fmt_mask",i).equals("DATETIME")) { 
						cell.setCellValue(DateUtil.defFmtDateTimeAPM(data)); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else if(excelWp.get("fmt_mask",i).equals("MULTILINE")) { 
						cell.setCellValue(StringUtil.replace(data, "\n", "<br>")); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else if(excelWp.get("fmt_mask",i).equals("JUMIN_NO")) { 
						cell.setCellValue(FormatUtil.juminNo(data,"x")); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else if(excelWp.get("fmt_mask",i).equals("SAUPJA_NO")) { 
						cell.setCellValue(FormatUtil.bizRegiNoFormat(data)); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else if(excelWp.get("fmt_mask",i).equals("TEL_NO")) { 
						cell.setCellValue(StringUtil.replace(data, "--", "")); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}else {
						cell.setCellValue(data); 
						cell.setCellType(HSSFCell.CELL_TYPE_STRING); 
					}
				}
				if(rownum >= 32767) { break; }
			} while(rs.next());
		}

		String excelPath = CD.getNewID() + "_" + excel_form_no + ".xls"; 
		String rootPath = CustomProperty.upload_dir;
		FileOutputStream fileOutput = new FileOutputStream(rootPath + "/temp/" + excelPath);
		workbook.write(fileOutput);
		fileOutput.close();

		Box obox = new Box("");
		obox.put("excelPath", excelPath);
		obox.put("row_count", String.valueOf(rownum));
		return obox;
	}
	
	/**
	 * excel 업로드를 위한 템플릿 서식 생성
	 */
	public static String createExcelTemplete(RsWrapper metaWp, RsWrapper codeWp, int rowCount, Box box) throws Exception {
		HSSFWorkbook workbook = createExcelWorkbook(metaWp, codeWp, rowCount, box);
		String excelPath = CD.getNewID() + "_" + box.getNvl("excel_form_nm",box.get("excel_form_no")) + ".xls"; 
		String rootPath = CustomProperty.upload_dir;
		FileOutputStream fileOutput = new FileOutputStream(rootPath + "/temp/" + excelPath);
		workbook.write(fileOutput);
		fileOutput.close();

		return excelPath;
	}
	
	public static HSSFWorkbook createExcelWorkbook(RsWrapper metaWp, RsWrapper codeWp, int rowCount, Box box) throws Exception {
		HSSFWorkbook workbook = new HSSFWorkbook();
		String excelSubject = metaWp.getLength() > 0 ? metaWp.get("subject",0) : ""; 
		HSSFSheet dataSheet = workbook.createSheet(excelSubject);
		HSSFSheet codeSheet = workbook.createSheet("공통코드");
		workbook.setSheetHidden(1, HSSFWorkbook.SHEET_STATE_HIDDEN);

		// 헤더영역
		int rownum = 0;
		HSSFCellStyle style_header = ExcelUtil.getPoiStyle(workbook, "HEADER");
		HSSFRow headRow = dataSheet.createRow((short)rownum);
		headRow.setHeight((short)0x300);
		CreationHelper factory = workbook.getCreationHelper(); 
		for(int i=0; i < metaWp.getLength(); i++) {
			dataSheet.setColumnWidth(i, metaWp.getInt("cell_width",i)*36);
			HSSFCell cell = headRow.createCell(i);
			cell.setCellValue((metaWp.get("required_yn",i).compareTo("P") >= 0 ? "(*)":"") + metaWp.get("mark_hdr_nm",i));
			cell.setCellStyle(style_header);
			if(!metaWp.get("etc_remark",i).equals("")) { // 입력도움말 메모삽입
				ClientAnchor anchor = factory.createClientAnchor();
				anchor.setCol1(cell.getColumnIndex() + 1);
				anchor.setCol2(cell.getColumnIndex() + 3);
				anchor.setRow1(rownum + 1);
				anchor.setRow2(rownum + 5);
				Drawing drawing = dataSheet.createDrawingPatriarch();
				Comment comment = drawing.createCellComment(anchor);
				comment.setString(factory.createRichTextString(metaWp.get("etc_remark",i)));
				comment.setAuthor("");
				cell.setCellComment(comment);
			}
		}

		// 데이터 입력템플릿 영역
		rownum++;
		int codePos = 0;
		int codeNum = 0;
		int limitRow = 32767;
		String formula[] = new String[metaWp.getLength()];
		for(int i=0; i < metaWp.getLength(); i++) {
			HSSFCellStyle dataStyle = workbook.createCellStyle();
			dataSheet.setColumnWidth(i, (metaWp.getInt("cell_width",i)*36));
			if(metaWp.get("valid_rule",i).equals("YYYYMMDD")) {
				CellRangeAddressList regions = new CellRangeAddressList(rownum, limitRow, i, i);
				DVConstraint constraint = DVConstraint.createNumericConstraint(ValidationType.TEXT_LENGTH, DVConstraint.OperatorType.BETWEEN, "1", "8");
				HSSFDataValidation validRule = new HSSFDataValidation(regions, constraint);
				validRule.createPromptBox("알림", metaWp.get("mark_hdr_nm",i)+"은(는) YYYYMMDD 형식으로 입력하셔야 합니다.");
				validRule.createErrorBox("ERROR", metaWp.get("mark_hdr_nm",i)+"은(는) YYYYMMDD 형식으로 입력하셔야 합니다.");
				validRule.setShowErrorBox(true);
				dataSheet.addValidationData(validRule);
			}else if(metaWp.get("valid_rule",i).equals("CODE")) {
				dataStyle.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);
				dataStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
				codeNum = 0;
				for(int k=0; k < codeWp.getLength(); k++){
					if(!metaWp.get("code_group",i).equals(codeWp.get("code_group",k))) { continue; }
					HSSFRow codeRow = codeSheet.createRow((codePos+codeNum));
					codeRow.createCell(0).setCellValue(codeWp.get("code_group",k)+StringUtil.getReplaceSpecialCharacters(codeWp.get("data",k)));
					codeRow.createCell(1).setCellValue(codeWp.get("code",k));
					codeRow.createCell(2).setCellValue(StringUtil.getReplaceSpecialCharacters(codeWp.get("data",k).trim()));
					codeNum++;
				}
				String cellId = Character.toString((char)(66+i));
				if(i >= 51) { cellId = "B" + Character.toString((char)(15+i)); }
				else if(i >= 25) { cellId = "A" + Character.toString((char)(40+i)); }
				formula[i] = "IF("+cellId+"{CELL}=\"\",\"\",VLOOKUP(\""+metaWp.get("code_group",i)+"\"&"+cellId+"{CELL},공통코드!$A$"+(codePos+1)+":$B$"+(codePos+codeNum)+",2,0))";
			}else if(metaWp.get("valid_rule",i).startsWith("DATA")) { 
				if(metaWp.get("valid_rule",i).equals("DATA")) {
					// 유효성규칙이 DATA*로 등록된 경우는, 개별 컨트롤러에서 드롭다운박스 생성
					String dropDownName = "dropDownName" + String.valueOf(i);
					Name namedCell = workbook.createName();
					namedCell.setNameName(dropDownName);
					namedCell.setRefersToFormula("공통코드!$C$"+(codePos+1)+":$C$"+(codePos+codeNum));
					
					CellRangeAddressList regions = new CellRangeAddressList(rownum, limitRow, i, i);
					DVConstraint constraint = DVConstraint.createFormulaListConstraint(dropDownName);
					HSSFDataValidation listValid = new HSSFDataValidation(regions, constraint);
					if(metaWp.get("required_yn",i).compareTo("P") >= 0) {
						listValid.setShowErrorBox(true);
						listValid.createErrorBox("코드오류", "해당 항목에 해당하는 코드값이 존재하지 않습니다.");
					}
					dataSheet.addValidationData(listValid);
				}
				codePos += codeNum;
			}

			// 스타일 지정
			if(metaWp.get("required_yn",i).compareTo("P") >= 0) {
				dataStyle.setFillForegroundColor(HSSFColor.GOLD.index);
				dataStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			}
			if(metaWp.get("align_type",i).equals("C")) {
				dataStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			}else if(metaWp.get("align_type",i).equals("L")){
				dataStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			}else if(metaWp.get("align_type",i).equals("R")){
				dataStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			}
			if(metaWp.getInt("cell_width",i) > 0) { dataStyle.setWrapText(true); }
			dataStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);      
			dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);   
			dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);   
			dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);   
			dataSheet.setDefaultColumnStyle(i, dataStyle);
		}
		
		// Row 생성, 코드찾기 수식 삽입
		for(int i=rownum; i < rowCount; i++){
			HSSFRow dataRow = dataSheet.createRow(i);
			for(int k=0; k < metaWp.getLength(); k++) {
				if(metaWp.get("valid_rule",k).equals("CODE")) {
					HSSFCell dataCell = dataRow.createCell(k);
					dataCell.setCellFormula(StringUtil.replace(formula[k],"{CELL}",String.valueOf(i+1)));
				}
			}
		}
		
		// 공통코드 시트보호
		for(int i=0; i < 3; i++) { codeSheet.autoSizeColumn(i); }
		codeSheet.protectSheet("sinjinitc"); 
		
		// 첫행 틀고정
		dataSheet.createFreezePane(0, rownum); 
		
		// 헤더에 필더설정
		dataSheet.setAutoFilter(new CellRangeAddress(0, limitRow, 0, metaWp.getLength())); 
		
		return workbook;
	}
	
	/**
	 * 코드단계별 드롭다운 박스를 동적으로 생성
	 */
	public static void makeDropDownList(HSSFWorkbook workbook, ArrayList<String> groupList, RsWrapper codeWp, String key1, String key2, String sheetNm, int rowCount) throws Exception {
		int startRow = -1;
		HSSFSheet dataSheet = workbook.getSheetAt(0);
		HSSFSheet codeSheet = workbook.getSheetAt(1);
		Iterator<Row> rowIterator = codeSheet.iterator();
		while(rowIterator.hasNext()) {
			Row codeRow = rowIterator.next();
			String code_group = codeRow.getCell(0).getStringCellValue();
			if(!code_group.startsWith(key2)) { 
				if(startRow > 0) break; else continue;
			}
			
			int rowNum = codeRow.getRowNum();
			if(startRow < 0) { startRow = rowNum+1; }
			String curKeyVal = codeRow.getCell(1).getStringCellValue();
			for(int k=0; k < groupList.size(); k++) {
				String groupData = (String)groupList.get(k);
				if(curKeyVal.startsWith(StringUtil.arrayCol(groupData,1))) {
					groupData = StringUtil.arrayCol(groupData,1) + "|" + String.valueOf(rowNum+1);
					groupList.set(k, groupData);
					break;
				}
			}
		}

		for(int i=0; i < groupList.size(); i++) {
			String groupData = (String)groupList.get(i);
			//System.out.println("["+i+"] "+groupData);
			String groupArr[] = StringUtil.split(groupData, "|", true);
			int startPos = i == 0 ? startRow : Integer.parseInt(StringUtil.arrayCol((String)groupList.get(i-1),3))+1;
			groupData = groupArr[0] + "|" + startPos + "|" + groupArr[1];
			groupList.set(i, groupData);
		}

		// 코드 서식 재지정
		for(int i=1; i < rowCount; i++) {
			HSSFRow dataRow = dataSheet.getRow(i);
			HSSFCell codeCell = dataRow.createCell(2);
			String formula = "IF(D"+(i+1)+"=\"\",\"\",VLOOKUP(\""+key2+"\"&D"+(i+1);
			for(int k=0; k < groupList.size(); k++) {
				String groupData = (String)groupList.get(k);
				String groupArr[] = StringUtil.split(groupData, "|", true);
				formula += ",IF(A"+(i+1)+"=\""+groupArr[0]+"\",공통코드!$A$"+groupArr[1]+":$B$"+groupArr[2];
			}
			for(int k=0; k < groupList.size(); k++) { formula += ")"; }
			formula += ",2,FALSE))";
			codeCell.setCellFormula(formula);
		}

		// 단계별 코드 시트 생성
		Sheet treeSheet = workbook.createSheet(sheetNm);
		workbook.setSheetHidden(2, HSSFWorkbook.SHEET_STATE_HIDDEN);
		TreeMap<String, String[]> treeMap = new TreeMap();
		for(int i=0; i < codeWp.getLength(); i++) {
			if(!codeWp.get("code_group",i).equals(key1)) { continue; }
			String treeItems = "";
			for(int k=0; k < codeWp.getLength(); k++) {
				if(codeWp.get("code_group",k).equals(key2) && codeWp.get("code",k).startsWith(codeWp.get("code",i))) {
					if(!treeItems.equals("")) { treeItems += "|"; } 
					treeItems += codeWp.get("data",k); 
				}
			}
			treeMap.put(StringUtil.lpad(i+"","0",4)+codeWp.get("data",i), StringUtil.split(treeItems,"|",true));
		}
		
		Name namedRange = null;
		String colLetter = "";
		String reference = "";
		int col_index = 0;
		for(String key : treeMap.keySet()) {
			int row_index = 0;
			Row treeRow = treeSheet.getRow(row_index); 
			if(treeRow == null) { treeRow = treeSheet.createRow(row_index); } 
			row_index++;
			treeRow.createCell(col_index).setCellValue(key.substring(4));
			String[] items = treeMap.get(key);
			for(String item : items) {
				treeRow = treeSheet.getRow(row_index); 
				if(treeRow == null) { treeRow = treeSheet.createRow(row_index); } 
				row_index++;
				treeRow.createCell(col_index).setCellValue(item);
			}
			for(int k=0; k < treeMap.size(); k++) { treeSheet.autoSizeColumn(k); }
			treeSheet.protectSheet("sinjinitc"); 

			// create names for the item list constraints, each named from the current key
			colLetter = CellReference.convertNumToColString(col_index);
			namedRange = workbook.createName();
			namedRange.setNameName(key.substring(4));
			reference = sheetNm+"!$" + colLetter + "$2:$" + colLetter + "$" + row_index;
			namedRange.setRefersToFormula(reference);
			col_index++;
		}
		
		// create name for Categories list constraint
		colLetter = CellReference.convertNumToColString((col_index-1));
		namedRange = workbook.createName();
		namedRange.setNameName("Categories");
		reference = sheetNm+"!$A$1:$" + colLetter + "$1";
		namedRange.setRefersToFormula(reference);
		treeSheet.setSelected(false);
		
		// KEY1에 따라 KEY2셀에 종속적 드롭다운 박스 생성
		for(int i=1; i < rowCount; i++) {
			DataValidationHelper dvHelper = dataSheet.getDataValidationHelper();
			DataValidationConstraint dvConstraint = dvHelper.createFormulaListConstraint("Categories");
			CellRangeAddressList addressList = new CellRangeAddressList(i, i, 1, 1);
			DataValidation validation = dvHelper.createValidation(dvConstraint, addressList);
			validation.setShowErrorBox(true);
			validation.createErrorBox("코드오류", "해당 항목에 해당하는 코드값이 존재하지 않습니다.");
			dataSheet.addValidationData(validation);

			dvConstraint = dvHelper.createFormulaListConstraint("INDIRECT($B$"+(i+1)+")");
			addressList = new CellRangeAddressList(i, i, 3, 3);
			validation = dvHelper.createValidation(dvConstraint, addressList);
			validation.setShowErrorBox(true);
			validation.createErrorBox("코드오류", "해당 항목에 해당하는 코드값이 존재하지 않습니다.");
			dataSheet.addValidationData(validation);
		}
	}
	
	/**
	 * 드롭다운박스 키값 허용가능문자로 치환
	 */
	public static String removeDropDownInvalidChars(String dropDownKey) throws Exception {
		String keyName = dropDownKey;
		String[] invalidChars = {" ","-","\\/","\\|","\\<","\\>","\\+","\\=","\\`",",",":",";","'","\"","\\!","\\@","\\#","\\$","\\%","\\&","\\*","\\~","\\^","\\(","\\)","\\{","\\}","\\[","\\]"};
		for(int k=0; k < invalidChars.length; k++) { keyName = keyName.replaceAll(invalidChars[k],"_"); }
		if(StringUtil.containsCharOnly(keyName.substring(0,1), "0123456789")) { keyName = "_" + keyName; }
		return keyName;
	}
	
	/**
	 * 엑셀 업로드 서식 유효성 검사
	 */
	public static Hashtable checkUploadTemplete(RsWrapper metaWp, Box box) throws Exception {
		String cliFileNm = box.getSourceFileNm("uploadFile");
		String file_type = cliFileNm.substring(cliFileNm.lastIndexOf(".")+1);
		String svrFileNm = CD.getNewID() + "_upload." + file_type;
		box.springMoveFileToService("uploadFile", CustomProperty.upload_dir, "temp", svrFileNm);

		Hashtable ht = new Hashtable();
		RsWrapper dataWp = new RsWrapper(); 
		RsWrapper errorWp = new RsWrapper(); 
		String excelPath = CustomProperty.upload_dir + "temp/" + svrFileNm;
		Sheet sheet = getExcelWorkSheet(excelPath, 0);
		if(sheet == null) { return ht; }
		
		FormulaEvaluator formulaEval = sheet.getWorkbook().getCreationHelper().createFormulaEvaluator(); 
		boolean isLastRow = false;
		int error_row_cnt = 0;
		for(int row_index=1; row_index < sheet.getPhysicalNumberOfRows(); row_index++) {
			if(isLastRow) { break; }
			Row row = sheet.getRow(row_index);
			if(row == null) { continue; }
			String rtn_msg = "";
			Box ibox = new Box("");
			Box ebox = new Box("");
			ebox.put("error_row", String.valueOf(row_index+1)); 
			for(int col_index=0; col_index < metaWp.getLength(); col_index++) {
				Cell cell = row.getCell(col_index);
				String key = metaWp.get("cell_key",col_index);
				if(cell == null) {
					ibox.put(key, "");
				}else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					ibox.put(key, cell.getStringCellValue().trim() + "");
				}else {
					try {
						ibox.put(key, cell.getStringCellValue().trim() + "");
					}catch(Exception ex) { 
						if(cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) { // 사용자가 직접 템플릿에 수식을 지정한 경우..
							CellValue evaluate = formulaEval.evaluate(cell);
							String formula_val = "";
							if(evaluate != null) { 
								formula_val = evaluate.formatAsString();
								if(metaWp.get("data_type",col_index).equals("N")) {
									formula_val = String.valueOf(Math.round(Double.parseDouble(formula_val)*Math.pow(10,metaWp.getInt("data_precision",col_index))) / Math.pow(10,metaWp.getInt("data_precision",col_index)));
								}
							}
							ibox.put(key, formula_val);
						}
					}
				}

				if(metaWp.get("required_yn",col_index).equals("P")) {
					if(ibox.get(key).equals("")) { isLastRow = true; break; }
				}else {
					String msg = checkMetaValidate(metaWp.getRsBoxAt(col_index), ibox);
					if(!msg.equals("")) {
						rtn_msg += msg + "<br>";
						error_row_cnt++;
					}
				}
				ibox.put("prevKey", key);
				if(error_row_cnt > 10) { break; }
			}
			if(!isLastRow) {
				ebox.put("error_msg", rtn_msg);
				errorWp.appendRs(ebox); 
				dataWp.appendRs(ibox);
			}
			if(error_row_cnt > 10) { break; }
		}
		ht.put("dataWp", 	dataWp);
		ht.put("errorWp", 	errorWp);
		return ht;
	}
	
	public static String checkMetaValidate(Box metaBox, Box dataBox) {
		String rtn_msg = "";
		String input_data = dataBox.get(metaBox.get("cell_key"));
		if(input_data.trim().equals("") || input_data == null) {
			if(metaBox.get("required_yn").equals("Y")) {
				rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 필수입력항목입니다.";
			}
		}else {
			if(metaBox.get("data_type").equals("N")) {
				if(!StringUtil.isNumber(input_data)) {
					rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 숫자형식만 허용됩니다.";
				}
				if(input_data.indexOf(".") >= 0) { // Data Precision
					int dot_num = input_data.length() - input_data.indexOf(".") - 1;
					if(dot_num > metaBox.getInt("data_precision")) {
						rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 소숫점이하 자리수 초과(허용한도 : " + metaBox.get("data_precision") + "자리, 입력값 : " + dot_num + "자리)";
					}
				}
			}

			if(input_data.length() > metaBox.getInt("max_length")) {
				rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 자리수 초과(허용한도 : " + metaBox.get("max_length") + "자리, 입력값 : " + input_data.length() + "자리)";
			}

			// Valid Rule
			if(metaBox.get("valid_rule").equals("YYYYMMDD")) {
				if(input_data.length() != 8 || !DateUtil.isDate(input_data, "yyyyMMdd")) {
					rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 날짜형식에 맞지 않습니다.("+input_data+")";
				}
			}else if(metaBox.get("valid_rule").equals("DATA")) {
				String prevVal = dataBox.get("prevKey");
				if(!input_data.equals("") && prevVal.equals("")){
					rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 코드값이 매핑되지 않았습니다.";
				}
			}else if(metaBox.get("valid_rule").indexOf(",") > 0) {
				String rule[] = StringUtil.split(metaBox.get("valid_rule"), ",", true);
				boolean isOk = false;
				for(int j=0; j < rule.length; j++) {
					if(input_data.equals(rule[j])) {
						isOk = true;
						break;
					}
				}
				if(!isOk) {
					rtn_msg += "["+metaBox.get("mark_hdr_nm")+"] 허용되지 않는 값("+input_data+")이 입력되었습니다.("+metaBox.get("valid_rule")+" 만 가능)";
				}
			}
		}
		return rtn_msg;
	}	
	
	/**
	 * excel 다운로드 처리
	 * 
	 * @param fileNm
	 * @param rsWp
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public static void excelDownload(String fileNm, HSSFWorkbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "UTF-8"));

		BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
		wb.write(outs);
		outs.close();
	}

	public static void excelDownload(String fileNm, XSSFWorkbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "UTF-8"));

		BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
		wb.write(outs);
		outs.close();
	}

	public static void excelSave(String fileNm, String saveDir, HSSFWorkbook wb, HttpServletRequest request) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(saveDir + "/" + fileNm);
			wb.write(fos);
			fos.close();
		}catch(FileNotFoundException fnfe) {
			logger.error("File not found" + fnfe);
		}catch (IOException ioe) {
			logger.error("Error while writing to file" + ioe);
		}finally {
			try {
				if(fos != null) {
					fos.flush();
					fos.close();
				}
			}catch (Exception e) {
				logger.error("Error while closing streams" + e);
			}
		}
	}

}