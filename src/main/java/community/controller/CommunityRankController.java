package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;
import community.service.CommunityRankService;

@Controller
@RequestMapping(value="community")
public class CommunityRankController {
	@Autowired
	private CommunityRankService cRankService;
	
	// 랭킹페이지
	@RequestMapping(value = "communityRank", method = RequestMethod.GET)
	public String communityRank() {
		return "/jsp/community/communityRank/communityRank";
	}

	//맛집 리스트 순위 가져오기
	@RequestMapping(value = "communityRankTopRes", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView communityRankTopRes() {
		ModelAndView mav = new ModelAndView();
		List<CommunityRankResDTO> list = cRankService.getRankResList();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}
	
	// 유저랭킹 리스트 가져오기
	@RequestMapping(value = "getRankMemList", method = RequestMethod.POST)
	public ModelAndView getRankMemList() {
		
		List<CommunityRankMemDTO> list = cRankService.getRankMemList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
