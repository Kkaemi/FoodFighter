package community.controller;

import java.util.List;
import java.util.Map;

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

import community.bean.QnaBoardDTO;
import community.bean.QnaBoardPaging;
import community.service.CommunityCSService;

@Controller
@RequestMapping(value = "community")
public class CommunityCSCenterController {
	
	@Autowired
	private CommunityCSService communityCSService;

//	// cs center
//	@RequestMapping(value = "csCenter", method = RequestMethod.GET)
//	public String csCenter() {
//		return "/jsp/community/communityCS/csCenter";
//	}

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
		List<QnaBoardDTO> list = communityCSService.getQnaBoardList(pg);

		// 페이징 처리
		QnaBoardPaging boardPaging = communityCSService.boardPaging(pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);

		mav.setViewName("jsonView");

		return mav;

	}
	
	@RequestMapping(value = "getBoardSearchList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getBoardSearchList(@RequestParam Map<String, String> map) {
		
		List<QnaBoardDTO> list = communityCSService.getQnaBoardSearchList(map);

		// 페이징 처리
		QnaBoardPaging boardPaging = communityCSService.boardPaging(map);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("search_type", map.get("search_type"));
		mav.addObject("search_keyword", map.get("search_keyword"));
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// qna write
	@RequestMapping(value = "qnaWriteForm", method = RequestMethod.GET)
	public String qnaWriteForm() {
		return "/jsp/community/communityCS/qnaWrite";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public @ResponseBody void qnaWrite(@RequestParam Map<String, String> map) {
		communityCSService.qnaWrite(map);
	}
	
	// qna password page
	@RequestMapping(value = "passwordPage", method = RequestMethod.GET)
	public String qnaView(@RequestParam String seq,
						@RequestParam String pg, 
						Model model) {
		
			model.addAttribute("seq", seq);
			model.addAttribute("pg", pg);
			
			return "/jsp/community/communityCS/passwordPage";
	}
	
	@RequestMapping(value = "passwordCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnaPassword(@RequestParam Map<String, String> map) {
		
		boolean true_or_false = communityCSService.passwordCheck(map);
		
		
		String pg = map.get("pg");
		String seq = map.get("seq");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pg", pg);
		mav.addObject("seq", seq);

		mav.setViewName("jsonView");
		
		if (!true_or_false) {
			mav.clear();
			mav.setViewName("jsonView");
			return mav;
		}

		return mav;
	}
	
	// qna View
	@RequestMapping(value = "qnaView", method = RequestMethod.GET)
	public String boardView(@RequestParam String seq,
							@RequestParam String pg, 
							Model model) {
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		
		return "/jsp/community/communityCS/qnaView";
	}
	
	@RequestMapping(value = "getQnaView", method = RequestMethod.POST)
	public ModelAndView getBoardView(@RequestParam String seq,
									 HttpServletResponse response) {
		
		QnaBoardDTO qnaboardDTO = communityCSService.getBoard(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaboardDTO", qnaboardDTO);
		mav.addObject("seq", seq);
		
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
