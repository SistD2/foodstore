package parkjonghyun.foodstore.sale.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import parkjonghyun.foodstore.sale.domain.Receipt;

public interface ExcelService {
	public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<Receipt> list);
	public SXSSFWorkbook excelFileDownloadProcess(List<Receipt> list);
}
