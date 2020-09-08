package community.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.bean.BoardPaging;
import community.bean.QnAboardDTO;
import community.service.CommunityBoardService;

@Controller
@RequestMapping(value = "community")
public class CommunityCSCenterController {
	@Autowired
	private CommunityBoardService communityBoardService;
	
	// cs center
	@RequestMapping(value = "csCenter", method = RequestMethod.GET)
	public String csCenter() {
		return "/jsp/community/communityCS/csCenter";
	}

	// qna
	@RequestMapping(value = "qna", method = RequestMethod.GET)
	public String qna(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		model.addAttribute("pg", pg);
		return "/jsp/community/communityCS/qna";
	}

	// qna 게시글 db에서 불러오기
	@RequestMapping(value = "getQnaList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getQnaList(@RequestParam String pg, HttpSession session, HttpServletResponse response) {

		// 1페이지 당 5개씩
		List<QnAboardDTO> list = communityBoardService.getBoardList(pg);

		// 페이징 처리
		BoardPaging boardPaging = communityBoardService.boardPaging(pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);

		mav.setViewName("jsonView");

		return mav;

	}

	// faq
	@RequestMapping(value = "memberFAQ", method = RequestMethod.GET)
	public String memberFAQ() {
		return "/jsp/community/communityCS/memberFAQ";
	}

	@RequestMapping(value = "reviewFAQ", method = RequestMethod.GET)
	public String reviewFAQ() {
		return "/jsp/community/communityCS/reviewFAQ";
	}

	@RequestMapping(value = "etcFAQ", method = RequestMethod.GET)
	public String etcFAQ() {
		return "/jsp/community/communityCS/etcFAQ";
	}
}
