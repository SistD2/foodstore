package parkjonghyun.foodstore.product.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import parkjonghyun.foodstore.product.dao.mapper.ProdMapper;
import parkjonghyun.foodstore.product.domain.Product;

@Repository
public class ProdDaoImpl implements ProdDao {
	@Autowired private ProdMapper prodMapper;
	
	@Override
	public List<Product> getProds() {
		return prodMapper.getProds();
	}

	public Product getProdstr(String prodId) {
		return prodMapper.getProdstr(prodId);
	}

	@Override
	public List<Product> getProdSearch(String searchCase, String searchVal, String page) {
		return prodMapper.getProdSearch(searchCase, searchVal, page);
	}

	@Override
	public int addProd(Product product) {
		return prodMapper.addProd(product);
	}

	@Override
	public int prodNoCnt() {
		return prodMapper.prodNoCnt();
	}

	@Override
	public int deleteProd(String prodNo) {
		return prodMapper.deleteProd(prodNo);
	}

	@Override
	public Product getProd(String prodId) {
		return prodMapper.getProd(prodId);
	}

	@Override
	public int updateProd(Product product) {
		return prodMapper.updateProd(product);
	}

	@Override
	public int prodSearchCnt(String searchCase, String searchVal) {
		return prodMapper.prodSearchCnt(searchCase, searchVal);
	}
	
	@Override
	public List<Product> getProdNameSushi() {
		return prodMapper.getProdNameSushi();
	}

	@Override
	public List<Product> getProdNameSide() {
		return prodMapper.getProdNameSide();
	}

	@Override
	public List<Product> getProdNameDrink() {
		return prodMapper.getProdNameDrink();
	}


}
