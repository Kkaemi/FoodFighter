package community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="community")
public class CommunityRankController {
	// 랭킹페이지
	@RequestMapping(value = "communityRank", method = RequestMethod.GET)
	public String communityRank() {
		return "/jsp/community/communityRank/communityRank";
	}

}
