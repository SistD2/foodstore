package parkjonghyun.foodstore.stock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjonghyun.foodstore.product.service.ProdService;
import parkjonghyun.foodstore.stock.service.StockService;
import parkjonghyun.foodstore.user.domain.User;

@Controller
@RequestMapping("/stock")
public class StockController {
	@Autowired private StockService stockService;
	@Autowired private ProdService prodService;
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(HttpSession session, Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("stocks", stockService.getStocks0(user.getUserId()));
		model.addAttribute("products", prodService.getProds());
		return "stock/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public String modify2(String id, String cnt){
		if(stockService.modifyStock(id, cnt)) return "true";
		else return "false";
	}
}
