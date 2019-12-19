package parkjonghyun.foodstore.stock.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import parkjonghyun.foodstore.stock.domain.Stock;

public interface StockMapper {
	List<Stock> getStocks(String userId);
	List<Stock> getStocks0(String userId);
	int addStocks(Stock stock);
	int saleStocks(@Param("userId") String userId, @Param("prodNo") String prodNo, @Param("stockCnt") String stockCnt);
	int modifyStock(@Param("stockNo") String stockNo, @Param("stockCnt") String stockCnt);
}
