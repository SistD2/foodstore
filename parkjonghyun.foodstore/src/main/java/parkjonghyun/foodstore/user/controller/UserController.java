package parkjonghyun.foodstore.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import parkjonghyun.foodstore.product.domain.Product;
import parkjonghyun.foodstore.product.service.ProdService;
import parkjonghyun.foodstore.stock.domain.Stock;
import parkjonghyun.foodstore.stock.service.StockService;
import parkjonghyun.foodstore.user.domain.User;
import parkjonghyun.foodstore.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProdService prodService;
	@Autowired
	private StockService stockService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String move() {
		return "/user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String userId, String userPw, HttpSession session,
			RedirectAttributes redirectAttr) {
		User user = new User();
		user.setUserId(userId);
		user.setUserPw(userPw);
		User user2 = userService.loginUser(user);
		if (user2 != null) {
			session.setAttribute("user", user2);
			session.setMaxInactiveInterval(24 * 60 * 60); // 24 시간 세션 유지
			redirectAttr.addFlashAttribute("type", "01");
		} else {
			redirectAttr.addFlashAttribute("type", "00");
		}
		return "redirect:/main";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String move2(Model model) {
		model.addAttribute("nextUser", userService.franCnt());
		return "/user/join";
	}

	@Transactional
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(RedirectAttributes redirectAttr, String userId,
			String userPw, String userName, Date regDate, String userAddress1,
			String userAddress2, String userAddress3, String userTel,
			String userEmail) throws IOException {
		String userAddress = userAddress1 + " " + userAddress2 + " "
				+ userAddress3;
		boolean result = userService.joinUser(new User(userId, userPw,
				userName, regDate, userAddress, userTel, userEmail));
		List<Product> list = prodService.getProds();
		for (int i = 0; i < list.size(); i++) {
			stockService.addStocks(new Stock(0, userId,
					list.get(i).getProdNo(), 0));
		}
		if (result) {
			redirectAttr.addFlashAttribute("type", "11");
		} else {
			redirectAttr.addFlashAttribute("type", "10");
		}
		return "redirect:/main";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String move06() {
		return "user/check";
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public User PwResult(HttpSession session, String pwInfo) {
		User user = (User) session.getAttribute("user");
		if (user.getUserPw().equals(pwInfo)) {
			return user;

		} else
			return null;
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String move07() {
		return "sale/order";
	}

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public User PwResult02(HttpSession session, String pwInfo) {
		User user = (User) session.getAttribute("user");
		if (user.getUserPw().equals(pwInfo)) {
			return user;
		} else
			return null;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify_in(String userId, Model model) {
		model.addAttribute("user", userService.getUser(userId));
		return "user/modify";
	}

	@RequestMapping("/update")
	@ResponseBody
	public boolean modify1(String userId, String userPw, String userName,Date regDate, String userTel, String userEmail, String userAddress) {
		User user = new User(userId, userPw, userName, regDate, userAddress, userTel, userEmail);
		return userService.updateUser(user);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(String id){
		return userService.deleteUser(id);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String search(Model model, @RequestParam(defaultValue="")String searchVal, @RequestParam(defaultValue="0")String searchCnt){
		List<User> search = userService.getUserSearch(searchVal, searchCnt);
		model.addAttribute("searchVal", searchVal);
		model.addAttribute("users", search);
		return "/user/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public List<User> addSearch(String searchVal, String searchCnt){
		return userService.getUserSearch(searchVal, searchCnt);
	}
}
