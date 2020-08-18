package mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {
	
	// 마이페이지 메인
	@RequestMapping(value = "mypageMain")
	public String mypageMain() {
		return "/jsp/mypage/mypageMain";
	}
	
	// 마이리뷰 페이지 
	@RequestMapping(value = "myReview")
	public String myReview() {
		return "/jsp/mypage/myReview";
	}
}
