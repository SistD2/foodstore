package parkjonghyun.foodstore.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.stock.dao.StockDao;
import parkjonghyun.foodstore.stock.domain.Stock;

@Service
public class StockServiceImpl implements StockService {
	@Autowired private StockDao stockDao; 
	
	@Override
	public List<Stock> getStocks(String userId) {
		return stockDao.getStocks(userId);
	}
	
	@Override
	public List<Stock> getStocks0(String userId) {
		return stockDao.getStocks0(userId);
	}
	
	@Transactional
	@Override
	public int saleStocks(String userId, String prodNo, String stockCnt) {
		return stockDao.saleStocks(userId, prodNo, stockCnt);
	}
	
	@Transactional
	@Override
	public boolean modifyStock(String stockNo, String stockCnt) {
		return stockDao.modifyStock(stockNo, stockCnt)>0;
	}
	
	@Transactional
	@Override
	public boolean addStocks(Stock stock) {
		return stockDao.addStocks(stock)>0;
	}

	
}
