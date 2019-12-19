package parkjonghyun.foodstore.sale.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.domain.Sale;

public interface SaleMapper {
	int addSale(@Param("userId") String userId, @Param("prodNo") String prodNo,
			@Param("prodCnt") String prodCnt, @Param("guestNo") String guestNo);

	List<Sale> selectSale(String userId);

	int updateState(@Param("saleNo") String saleNo,
			@Param("saleState") String saleState);

	// list
	List<Receipt> getSales(@Param("userId") String userId,
			@Param("YYMMDD") String YYMMDD);

	List<Receipt> getDateList(@Param("userId") String userId,
			@Param("YYMMDD") String YYMMDD);

	// lineChart
	List<Receipt> getSalesTotal_line(@Param("userId") String userId,
			@Param("YYMM") String YYMM);

	// barChart
	List<Receipt> getSalesTotal_bar(@Param("userId") String userId,
			@Param("YYMM") String YYMM);

	// pieChart
	List<Receipt> getSalesSushi(@Param("userId") String userId,
			@Param("YYMM") String YYMM);

	List<Receipt> getSalesSide(@Param("userId") String userId,
			@Param("YYMM") String YYMM);

	List<Receipt> getSalesDrink(@Param("userId") String userId,
			@Param("YYMM") String YYMM);

}
