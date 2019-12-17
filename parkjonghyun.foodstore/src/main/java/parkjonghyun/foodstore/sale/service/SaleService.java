package parkjonghyun.foodstore.sale.service;

import java.util.List;
import java.util.Map;

import parkjonghyun.foodstore.product.domain.Product;
import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.domain.Sale;


public interface SaleService {
	boolean addSale(String userId, String prodNo, String prodCnt, String guestNo);
	List<Sale> selectSale(String userId);
	boolean updateState(String saleNo, String saleState);
	
	// 초기 출력 데이터
	// 바차트, 라인차트, 파이차트
	Map<String, List<Receipt>> getDateTotal(String userId, String YYMM, String YYMMDD);
	
	// 리스트
	List<Receipt> getDateList(String userId, String YYMMDD);
	
	
	
	// 조회버튼 클릭시 출력 데이터
	// 바차트, 라인차트, 파이차트
	Map<String, List<Receipt>> getDateTotal_ajax_search1(String userId, String YYMM, String YYMMDD, Map<String, List<Product>> prodNameList);
	
	// 리스트
	List<Receipt> getDateList_ajax_search2(String userId, String YYMMDD);
	
	
}
