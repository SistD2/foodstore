package parkjonghyun.foodstore.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import parkjonghyun.foodstore.product.domain.Product;
import parkjonghyun.foodstore.product.service.ProdService;
import parkjonghyun.foodstore.stock.domain.Stock;
import parkjonghyun.foodstore.stock.service.StockService;
import parkjonghyun.foodstore.user.domain.User;
import parkjonghyun.foodstore.user.service.UserService;

@Controller
@RequestMapping("/product")
public class ProdController {
	@Autowired private ProdService prodService;
	@Autowired private UserService userService;
	@Autowired private StockService stockService;
	
	@RequestMapping("/list")
	public String list(Model model, @RequestParam(defaultValue="product_case") String searchCase, @RequestParam( defaultValue="") String searchVal, @RequestParam(defaultValue="1") String page){
		List<Product> list = prodService.getProdSearch(searchCase, searchVal, page);
		double a = Math.ceil((double)(prodService.prodSearchCnt(searchCase, searchVal))/10);
		model.addAttribute("maxPage", a);
		model.addAttribute("searchCase", searchCase);
		model.addAttribute("searchVal", searchVal);
		model.addAttribute("page", page);
		model.addAttribute("prods", list);
		return "/product/list";
	}
	
	@RequestMapping(value="add", method=RequestMethod.GET)
	public String add(Model model){
		model.addAttribute("NEXTPROD", prodService.prodNoCnt());
		return "/product/add";
	}
	
	@Transactional
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add2(HttpServletRequest request ,String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath){
		if(prodService.addProd(request, prodNo, prodName, prodCase, prodCost, prodPrice, prodImgPath)){
			List<User> list = userService.listUsers();
			for(int i=0; i<list.size(); i++){
				stockService.addStocks(new Stock(1, list.get(i).getUserId(), Integer.parseInt(prodNo), 50));
			}
		}
		return "/product/list";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete(@RequestParam(value="id")String prodNo){
		if(prodService.deleteProd(prodNo)) return "true";
		else return "false";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(Model model, @RequestParam(value="num", required=false) String prodId){
		model.addAttribute("prod", prodService.getProd(prodId));
		return "/product/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update2(HttpServletRequest request ,String prodNo, String prodName, String prodCase, String prodCost, String prodPrice, MultipartFile prodImgPath){
		System.out.println("prodImgPath_________"+prodImgPath.isEmpty());
		prodService.updateProd(request, prodNo, prodName, prodCase, prodCost, prodPrice, prodImgPath);
		return "/product/list";
	}
}
