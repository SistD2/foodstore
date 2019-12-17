package parkjonghyun.foodstore.sale.dao;

import java.util.List;


import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.domain.Sale;

public interface SaleDao {
	int addSale(String userId, String prodNo, String prodCnt, String guestNo);

	List<Sale> selectSale(String userId);

	int updateState(String saleNo, String saleState);

	// list
	List<Receipt> getSales(String userId, String YYMMDD);

	// lineChart
	List<Receipt> getSalesTotal_line(String userId, String YYMM);

	// barChart
	List<Receipt> getSalesTotal_bar(String userId, String YYMM);

	// pieChart
	List<Receipt> getSalesSushi(String userId, String YYMM);

	List<Receipt> getSalesSide(String userId, String YYMM);

	List<Receipt> getSalesDrink(String userId, String YYMM);

	List<Receipt> getDateList(String userId, String YYMMDD);
}
