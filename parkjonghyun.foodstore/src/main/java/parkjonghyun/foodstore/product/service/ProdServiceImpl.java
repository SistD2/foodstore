package parkjonghyun.foodstore.product.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import parkjonghyun.foodstore.product.dao.ProdDao;
import parkjonghyun.foodstore.product.domain.Product;

@Service
public class ProdServiceImpl implements ProdService{
	@Autowired private ProdDao prodDao;
	@Value("${uploadDir}") private String uploadDir; 
	
	@Override
	public List<Product> getProds() {
		return prodDao.getProds();
	}

	@Override
	public List<Product> getProdstr(String str) {
		List<Product> list = new ArrayList<Product>();
		String [] arr = str.split("/");
		for(int i=0; i<arr.length; i++){
			list.add(prodDao.getProdstr(arr[i].trim()));
		}
		return list;
	}

	@Override
	public List<Product> getProdSearch(String searchCase, String searchVal, String page) {
		return prodDao.getProdSearch(searchCase, searchVal, page);
	}
	
	@Override
	public int prodNoCnt() {
		return prodDao.prodNoCnt()+1;
	}
	
	@Transactional
	@Override
	public boolean addProd(HttpServletRequest request, String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath) {
		String dir = request.getServletContext().getRealPath(uploadDir);
		String fileName = prodImgPath.getOriginalFilename();
		save(dir+"/"+fileName, prodImgPath);
		return prodDao.addProd(new Product(Integer.parseInt(prodNo), prodName, prodCase, Integer.parseInt(prodCost), Integer.parseInt(prodPrice), "", fileName))>0;
	}

	@Transactional
	@Override
	public boolean updateProd(HttpServletRequest request, String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath) {
		if(prodImgPath.isEmpty()){
			return prodDao.updateProd(new Product(Integer.parseInt(prodNo), prodName, prodCase, Integer.parseInt(prodCost), Integer.parseInt(prodPrice), "", null))>0;
		}else{
			String dir = request.getServletContext().getRealPath(uploadDir);
			String fileName = prodImgPath.getOriginalFilename();
			save(dir+"/"+fileName, prodImgPath);
			return prodDao.updateProd(new Product(Integer.parseInt(prodNo), prodName, prodCase, Integer.parseInt(prodCost), Integer.parseInt(prodPrice), "", fileName))>0;
		}
		
	}
	
	@Transactional
	@Override
	public boolean deleteProd(String prodNo) {
		return prodDao.deleteProd(prodNo)>0;
	}
	
	@Override
	public Product getProd(String prodId) {
		return prodDao.getProd(prodId);
	}
	
	@Override
	public int prodSearchCnt(String searchCase, String searchVal) {
		return prodDao.prodSearchCnt(searchCase, searchVal);
	}
	
	@Override		
	public Map<String, List<Product>> getProdName() {
		Map<String, List<Product>> getProName = new HashMap<String, List<Product>>();
		getProName.put("sushiList", prodDao.getProdNameSushi());
		getProName.put("sideList", prodDao.getProdNameSide());
		getProName.put("drinkList", prodDao.getProdNameDrink());
		
		return getProName;
	}
	
	public void save(String fileFullName, MultipartFile file){
		try{
			file.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}



	

	

	

	
}
