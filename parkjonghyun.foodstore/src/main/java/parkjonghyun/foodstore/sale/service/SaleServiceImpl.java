package parkjonghyun.foodstore.sale.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.product.domain.Product;
import parkjonghyun.foodstore.sale.dao.SaleDao;
import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.domain.Sale;

@Service
public class SaleServiceImpl implements SaleService {
	@Autowired
	private SaleDao saleDao;

	@Transactional
	@Override
	public boolean addSale(String userId, String prodNo, String prodCnt,
			String guestNo) {
		return saleDao.addSale(userId, prodNo, prodCnt, guestNo) > 0;
	}

	@Override
	public List<Sale> selectSale(String userId) {
		return saleDao.selectSale(userId);
	}

	@Transactional
	@Override
	public boolean updateState(String saleNo, String saleState) {
		return saleDao.updateState(saleNo, saleState) > 0;
	}

	@Override
	public Map<String, List<Receipt>> getDateTotal(String userId, String YYMM,
			String YYMMDD) {
		List<Receipt> listTable = saleDao.getSales(userId, YYMMDD);
		List<Receipt> lineChart = saleDao.getSalesTotal_line(userId, YYMM);
		List<Receipt> barChart = saleDao.getSalesTotal_bar(userId, YYMM);
		List<Receipt> pieSushi = saleDao.getSalesSushi(userId, YYMM);
		List<Receipt> pieSide = saleDao.getSalesSide(userId, YYMM);
		List<Receipt> pieDrink = saleDao.getSalesDrink(userId, YYMM);

		Map<String, List<Receipt>> getDate = new HashMap<String, List<Receipt>>();
		getDate.put("listTable", listTable);
		getDate.put("lineChart", lineChart);
		getDate.put("barChart", barChart);
		getDate.put("pieSushi", pieSushi);
		getDate.put("pieSide", pieSide);
		getDate.put("pieDrink", pieDrink);

		return getDate;
	}

	@Override
	public Map<String, List<Receipt>> getDateTotal_ajax_search1(String userId,
			String YYMM, String YYMMDD, Map<String, List<Product>> prodNameList) {
		List<Receipt> listTable = saleDao.getSales(userId, YYMMDD);
		List<Receipt> lineChart = saleDao.getSalesTotal_line(userId, YYMM);
		List<Receipt> barChart = saleDao.getSalesTotal_bar(userId, YYMM);
		List<Receipt> pieSushi = saleDao.getSalesSushi(userId, YYMM);
		List<Receipt> pieSide = saleDao.getSalesSide(userId, YYMM);
		List<Receipt> pieDrink = saleDao.getSalesDrink(userId, YYMM);

		// 매출이 없을 경우 디폴트값 주기
		if (pieSushi.size() == 0) {
			for (int i = 0; i < prodNameList.get("sushiList").size(); i++) {
				pieSushi.add(new Receipt(prodNameList.get("sushiList").get(i)
						.getProdName(), "1"));
			}
		}
		if (pieSide.size() == 0) {
			for (int i = 0; i < prodNameList.get("sideList").size(); i++) {
				pieSide.add(new Receipt(prodNameList.get("sideList").get(i)
						.getProdName(), "1"));
			}
		}
		if (pieDrink.size() == 0) {
			for (int i = 0; i < prodNameList.get("drinkList").size(); i++) {
				pieDrink.add(new Receipt(prodNameList.get("drinkList").get(i)
						.getProdName(), "1"));
			}
		}

		Map<String, List<Receipt>> getDate_ajax = new HashMap<String, List<Receipt>>();
		getDate_ajax.put("listTable", listTable);
		getDate_ajax.put("lineChart", lineChart);
		getDate_ajax.put("barChart", barChart);
		getDate_ajax.put("pieSushi", pieSushi);
		getDate_ajax.put("pieSide", pieSide);
		getDate_ajax.put("pieDrink", pieDrink);

		return getDate_ajax;
	}

	@Override
	public List<Receipt> getDateList(String userId, String YYMMDD) {
		return saleDao.getDateList(userId, YYMMDD);
	}

	@Override
	public List<Receipt> getDateList_ajax_search2(String userId, String YYMMDD) {
		return saleDao.getDateList(userId, YYMMDD);
	}
}
