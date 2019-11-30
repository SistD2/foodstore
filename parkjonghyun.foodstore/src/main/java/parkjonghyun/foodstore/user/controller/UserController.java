package parkjonghyun.foodstore.user.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import parkjonghyun.foodstore.user.domain.User;
import parkjonghyun.foodstore.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired private UserServiceImpl userServiceImpl;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String move(){
		return "/user/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String userId, String userPw, HttpSession session,RedirectAttributes redirectAttr){
		User user = new User();
		user.setUserId(userId);
		user.setUserPw(userPw);
		User user2 = userServiceImpl.loginUser(user);
		if(user2 != null){
			session.setAttribute("user", user2);
			redirectAttr.addFlashAttribute("type", "01");
		}else{
			redirectAttr.addFlashAttribute("type", "00");
		}
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String move2(Model model){
		model.addAttribute("nextUser", userServiceImpl.franCnt());
		return "/user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(RedirectAttributes redirectAttr, String userId, String userPw, String userName, Date regDate, String userAddress1, String userAddress2, String userAddress3, String userTel, String userEmail) throws IOException{
		String userAddress = userAddress1 + " " + userAddress2 + " " + userAddress3;
		boolean result = userServiceImpl.joinUser(new User(userId, userPw, userName, regDate, userAddress, userTel, userEmail));
		if(result){
			redirectAttr.addFlashAttribute("type", "11");
		}else{
			redirectAttr.addFlashAttribute("type", "10");
		}
		return "redirect:/main";
	}
}
