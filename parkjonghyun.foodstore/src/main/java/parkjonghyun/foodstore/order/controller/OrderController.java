package parkjonghyun.foodstore.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjonghyun.foodstore.product.service.ProdService;
import parkjonghyun.foodstore.sale.domain.Sale;
import parkjonghyun.foodstore.sale.service.SaleService;
import parkjonghyun.foodstore.user.domain.User;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired private SaleService saleService;
	@Autowired private ProdService prodService;
	
	@RequestMapping("/check")
	public String check(Model model, HttpSession session){
		String userId = ((User)session.getAttribute("user")).getUserId();
		model.addAttribute("sales", saleService.selectSale(userId));
		model.addAttribute("prods", prodService.getProds());
		return "/order/check";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(String id, String type){
		saleService.updateState(id, type);
		return "";
	}
}
