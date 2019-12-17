package parkjonghyun.foodstore.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import parkjonghyun.foodstore.stock.domain.Stock;

public interface StockDao {
	List<Stock> getStocks(String userId);
	List<Stock> getStocks0(String userId);
	int addStocks(Stock stock);
	int saleStocks(String userId, String prodNo, String stockCnt);
	int modifyStock(String stockNo, String stockCnt);
}
