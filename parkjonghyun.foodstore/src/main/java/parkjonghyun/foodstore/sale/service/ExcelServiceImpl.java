package parkjonghyun.foodstore.sale.service;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import parkjonghyun.foodstore.sale.domain.Receipt;
@Service
public class ExcelServiceImpl implements ExcelService {	
	
	@Override
	public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<Receipt> list) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("매출표");
		
		CellStyle style1 = workbook.createCellStyle();
		style1.setAlignment(HorizontalAlignment.CENTER);
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(1, 4000);
        sheet.setColumnWidth(2, 3000);
        sheet.setColumnWidth(3, 4000);
        sheet.setColumnWidth(4, 3000);
        sheet.setColumnWidth(5, 3000);
        sheet.setColumnWidth(6, 3000);
       
        // 헤더 행 생성
        Row headerRow = sheet.createRow(0);
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("가맹지점");
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("거래날짜");
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("주문번호");
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("제품명");
        // 해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("판매단가");
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("판매수량");
        // 해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellStyle(style1);
        headerCell.setCellValue("판매금액");
        
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
        	Receipt receipt = list.get(i);
        	
        	bodyRow = sheet.createRow(i+1);
        	
        	bodyCell = bodyRow.createCell(0);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getUserName());
        	bodyCell = bodyRow.createCell(1);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getSaleDate());
        	bodyCell = bodyRow.createCell(2);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getSaleNo());
        	bodyCell = bodyRow.createCell(3);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getProdName());
        	bodyCell = bodyRow.createCell(4);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getProdPrice());
        	bodyCell = bodyRow.createCell(5);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getSaleCnt());
        	bodyCell = bodyRow.createCell(6);
        	bodyCell.setCellStyle(style1);
        	bodyCell.setCellValue(receipt.getSalePay());
        	
        	
        	
        }
        
		return workbook;
	}

	@Override
	public SXSSFWorkbook excelFileDownloadProcess(List<Receipt> list) {
		return this.makeSimpleFruitExcelWorkbook(list);
	}

}
