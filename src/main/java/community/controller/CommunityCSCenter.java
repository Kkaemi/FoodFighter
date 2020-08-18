package community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="community")
public class CommunityCSCenter {
	// cs center
	@RequestMapping(value = "csCenter", method = RequestMethod.GET)
	public String csCenter() {
		return "/jsp/community/communityCS/csCenter";
	}

}
