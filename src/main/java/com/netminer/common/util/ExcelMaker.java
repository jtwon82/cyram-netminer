//package com.netminer.common.util;
//
//import java.awt.Font;
//import java.net.URLEncoder;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.poi.ss.usermodel.BorderStyle;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.CellStyle;
//import org.apache.poi.ss.usermodel.FillPatternType;
//import org.apache.poi.ss.usermodel.HorizontalAlignment;
//import org.apache.poi.ss.usermodel.IndexedColors;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.ss.util.CellRangeAddress;
//import org.springframework.stereotype.Component;
//
//
//@Component("excelMaker")
//public class ExcelMaker extends AbstractXlsxView {
//
//	@Override
//	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		
//		/*XSSF의 Streaming Version으로 
//		 * 메모리를 적게 사용하여 대용량 엑셀 다운로드에 주로 사용되는 방식
//		 * 생성자 방식에서의 기본 flush 크기는 100 이며, -1 지정시 무제한이다. 
//		 * 쓰기전용이며 읽기는 불가능하다.
//		 * 현업에서는 SXSSF를 Out Of Memory방지용으로 잘 사용하고 있다고 합니다.
//		 * by.hc
//		*/
//		
//		//엑셀파일로 받아지도록 통신 설정
//		String fileName = URLEncoder.encode("test","utf-8") + ".xlsx";
//		
//		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
//		response.setHeader("Content-Transfer-Encoding", "binary");
//		
//		
//		// 모델에서 객체 받아오기
//		@SuppressWarnings("unchecked")
//		Map<String, Object> excelModel = (Map<String, Object>) model.get("excel");
//		
//		//컬럼이름
//		@SuppressWarnings("unchecked")
//		List<String> colName = (List<String>) excelModel.get("colName");
//		logger.info(colName);
//		
//		//로우데이터
//		@SuppressWarnings("unchecked")
//		List<List<String>> rowList = (List<List<String>>) excelModel.get("rowList");
//		logger.info(rowList);
//		
//		String title = (String)excelModel.get("title");
//		
//		// Sheet 생성
//		Sheet sheet1 = workbook.createSheet("cookieShop");
//		Row row;
//		Cell cell;
//		int rowIdx = 0;
//		int cellIdx = 0;
//		
//		//title 생성
//		row = sheet1.createRow(rowIdx++);
//		cell = row.createCell(cellIdx++);
//		cell.setCellValue(title);
//		cell.setCellStyle(takeCellStyle(workbook, "title"));
//		
//		//A1 - F1 의 셀 병합
//		sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 5));
//		
//		//A1 - F1 의 셀 스타일 설정
//		for (int i = 1; i<6; i ++) {
//			cell = row.createCell(i);
//			cell.setCellStyle(takeCellStyle(workbook, "title"));
//		}
//		
//		//한줄 띄우기
//		rowIdx++;
//		
//		//col 데이터 생성
//		row = sheet1.createRow(rowIdx++);
//		cell = row.createCell(cellIdx++);
//		for (int i = 0; i< colName.size(); i++) {
//			cell = row.createCell(i);
//			cell.setCellValue(colName.get(i));
//			cell.setCellStyle(takeCellStyle(workbook, "data"));
//		}
//		
//		//rowData 데이터 생성
//		for (List<String> tempList : rowList ) {
//			row = sheet1.createRow(rowIdx++);
//			cell = row.createCell(cellIdx++);
//			for (int i = 0; i< tempList.size(); i++) {
//				cell = row.createCell(i);
//				cell.setCellValue((String)tempList.get(i));
//				cell.setCellStyle(takeCellStyle(workbook, "data"));
//			}
//		}
//		
//		//컬럼 너비 자동 설정
//		for (int i=0; i<=12; i++){
//			sheet1.autoSizeColumn(i);
//			sheet1.setColumnWidth(i, (sheet1.getColumnWidth(i))+(short)1024);
//		}		
//		
//	}
//
//	
//	public static CellStyle takeCellStyle(Workbook xlsxWb, String type) {
//		CellStyle cellStyle = xlsxWb.createCellStyle();
//		Font font = xlsxWb.createFont();
//		
//		//중앙 정렬
//		cellStyle.setAlignment(HorizontalAlignment.CENTER);
//		
//		//본문 스타일 : 테두리
//		cellStyle.setBorderBottom(BorderStyle.MEDIUM);
//		cellStyle.setBorderLeft(BorderStyle.MEDIUM);
//		cellStyle.setBorderRight(BorderStyle.MEDIUM);
//		cellStyle.setBorderTop(BorderStyle.MEDIUM);
//		
//		if(type.equals("title")) {
//			cellStyle.setFillForegroundColor(IndexedColors.LIME.getIndex());
//			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//			font.setFontHeightInPoints((short) 11);
//			font.setBold(true);
//			font.setFontName("함초롬돋움");
//			cellStyle.setFont(font);
//		} else if(type.equals("data")) {
//			font.setFontHeightInPoints((short) 11);
//			font.setFontName("함초롬돋움");
//			cellStyle.setFont(font);
//		}
//		
//		return cellStyle;
//	}
//
//}