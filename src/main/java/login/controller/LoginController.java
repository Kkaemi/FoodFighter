package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="login")
public class LoginController {
	// 로그인 폼
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "/jsp/login/login";
	}
	
	// 로그아웃 
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout() {
		return "/jsp/login/logout";
	}
}
