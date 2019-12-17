package parkjonghyun.foodstore.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import parkjonghyun.foodstore.product.domain.Product;

public interface ProdService {
	List<Product> getProds();
	Product getProd(String prodId);
	List<Product> getProdSearch(String searchCase, String searchVal, String page);
	List<Product> getProdstr(String str);
	int prodSearchCnt(String searchCase, String searchVal);
	boolean updateProd(HttpServletRequest request, String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath);
	boolean addProd(HttpServletRequest request, String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath);
	int prodNoCnt();
	boolean deleteProd(String prodNo);
	
	Map<String, List<Product>> getProdName();
}
