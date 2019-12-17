package parkjonghyun.foodstore.stock.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.stock.dao.mapper.StockMapper;
import parkjonghyun.foodstore.stock.domain.Stock;

@Repository
public class StockDaoImpl implements StockDao{
	@Autowired private StockMapper stockMapper;
	
	// 재고가 5 초과인 제품만 보여줌.
	public List<Stock> getStocks(String userId) {
		return stockMapper.getStocks(userId);
	}

	@Transactional
	@Override
	public int saleStocks(String userId, String prodNo, String stockCnt) {
		return stockMapper.saleStocks(userId, prodNo, stockCnt);
	}

	@Override
	public List<Stock> getStocks0(String userId) {
		return stockMapper.getStocks0(userId);
	}

	@Override
	public int modifyStock(String stockNo, String stockCnt) {
		return stockMapper.modifyStock(stockNo, stockCnt);
	}

	@Override
	public int addStocks(Stock stock) {
		return stockMapper.addStocks(stock);
	}

	

}
