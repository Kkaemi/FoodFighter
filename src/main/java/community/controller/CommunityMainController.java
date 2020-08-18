package community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="community")
public class CommunityMainController {
	
	// 커뮤니티 공지사항
	@RequestMapping(value = "communityMain", method = RequestMethod.GET)
	public String communityNoticeList() {
		return "/jsp/community/communityMain/communityMain";
	}
}
