package parkjonghyun.foodstore.product.dao;

import java.util.List;

import parkjonghyun.foodstore.product.domain.Product;

public interface ProdDao {
	List<Product> getProds();
	Product getProd(String prodId);
	List<Product> getProdSearch(String searchCase, String searchVal, String page);
	int prodSearchCnt(String searchCase, String searchVal);
	Product getProdstr(String prodId);
	int updateProd(Product product);
	int addProd(Product product);
	int prodNoCnt();
	int deleteProd(String prodNo);
	
	List<Product> getProdNameSushi();
	List<Product> getProdNameSide();
	List<Product> getProdNameDrink();

	
	
}
