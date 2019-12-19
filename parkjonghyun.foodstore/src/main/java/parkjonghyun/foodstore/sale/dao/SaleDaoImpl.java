package parkjonghyun.foodstore.sale.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjonghyun.foodstore.sale.dao.mapper.SaleMapper;
import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.domain.Sale;

@Repository
public class SaleDaoImpl implements SaleDao {
	@Autowired
	private SaleMapper saleMapper;

	@Override
	public int addSale(String userId, String prodNo, String prodCnt,
			String guestNo) {
		return saleMapper.addSale(userId, prodNo, prodCnt, guestNo);
	}

	@Override
	public List<Sale> selectSale(String userId) {
		return saleMapper.selectSale(userId);
	}

	@Override
	public int updateState(String saleNo, String saleState) {
		return saleMapper.updateState(saleNo, saleState);
	}

	// list
	@Override
	public List<Receipt> getSales(String userId, String YYMMDD) {
		return saleMapper.getSales(userId, YYMMDD);
	}

	// lineChart
	@Override
	public List<Receipt> getSalesTotal_line(String userId, String YYMM) {
		return saleMapper.getSalesTotal_line(userId, YYMM);
	}

	// barChart
	@Override
	public List<Receipt> getSalesTotal_bar(String userId, String YYMM) {
		return saleMapper.getSalesTotal_bar(userId, YYMM);
	}

	// pieChart
	@Override
	public List<Receipt> getSalesSushi(String userId, String YYMM) {
		return saleMapper.getSalesSushi(userId, YYMM);
	}

	@Override
	public List<Receipt> getSalesSide(String userId, String YYMM) {
		return saleMapper.getSalesSide(userId, YYMM);
	}

	@Override
	public List<Receipt> getSalesDrink(String userId, String YYMM) {
		return saleMapper.getSalesDrink(userId, YYMM);
	}

	@Override
	public List<Receipt> getDateList(String userId, String YYMMDD) {
		return saleMapper.getDateList(userId, YYMMDD);
	}

}
