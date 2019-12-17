package parkjonghyun.foodstore;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class Main{

	@RequestMapping
	public String main(){
		return "main";
	}
	
	@RequestMapping("main")
	public String main2(){
		return "main";
	}
}
