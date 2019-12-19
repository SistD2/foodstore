package parkjonghyun.foodstore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import parkjonghyun.foodstore.user.domain.User;

public class sessionInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{	// 요청 uri 이 controller로 던져지기 전에 실행되며 true일땐 controller로 이동 false 시에 이동 X
		
		User user = ((User)(request.getSession().getAttribute("user")));
		if(user==null){
			if(request.getRequestURI().contains("main") || request.getRequestURI().contains("user/login")){
				return true;
			}
			response.sendRedirect("/foodstore/main");
		}else{
			return true;
		}
		return false;
	}

}
