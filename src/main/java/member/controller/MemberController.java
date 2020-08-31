package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "member")
public class MemberController {

	// 회원가입 폼
	@RequestMapping(value = "signupForm", method = RequestMethod.GET)
	public String singupForm() {
		return "/jsp/member/signupForm";

	}
	
	// singup Choice
	@RequestMapping(value = "signupChoice", method = RequestMethod.GET)
	public String singupChoice() {
		return "/jsp/member/signupChoice";
	}
	
	// 소셜 로그인 폼
	@RequestMapping(value = "socialSignupForm", method = RequestMethod.GET)
	public String socialSingupForm() {
		return "/jsp/member/socialSignupForm";
	}
	
}
