package parkjonghyun.foodstore.stock.service;

import java.util.List;

import parkjonghyun.foodstore.stock.domain.Stock;

public interface StockService {
	List<Stock> getStocks(String userId);
	List<Stock> getStocks0(String userId);
	boolean addStocks(Stock stock);
	int saleStocks(String userId, String prodNo, String stockCnt);
	boolean modifyStock(String stockNo, String stockCnt);
}
