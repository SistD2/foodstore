package parkjonghyun.foodstore.product.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import parkjonghyun.foodstore.product.domain.Product;

public interface ProdMapper {
	List<Product> getProds();			// 모든 제품 조회
	Product getProd(String prodId);		// 한가지 제품 조히
	List<Product> getProdSearch(@Param("searchCase") String searchCase, @Param("searchVal") String searchVal, @Param("page") String page); // 검색 조회 제품
	int prodSearchCnt(@Param("searchCase") String searchCase, @Param("searchVal") String searchVal); // 검색한 조회 데이터의 제품만 검색
	Product getProdstr(String prodId);	// 장바구니에서 리스트를 출력하기 위함
	int updateProd(Product product);	// 제품 수정
	int addProd(Product product);		// 제품 추가
	int prodNoCnt();					// 전체 제품 개수 , 제품 추가를 위해 있음 위에
	int deleteProd(String prodNo);		// 제품 삭제
	
	
	List<Product> getProdNameSushi();
	List<Product> getProdNameSide();
	List<Product> getProdNameDrink();
}
