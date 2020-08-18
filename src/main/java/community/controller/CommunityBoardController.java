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
public class CommunityBoardController {
	@Autowired
	private CommunityBoardService communityBoardService;

	// 커뮤니티 게시판 목록
	@RequestMapping(value = "communityBoard", method = RequestMethod.GET)
	public String communityBoardList() {
		return "/jsp/community/communityBoard/communityBoardList";
	}

	// 커뮤니티 게시판 글 보기
	@RequestMapping(value = "communityBoardView", method = RequestMethod.GET)
	public String communityBoardView() {
		return "/jsp/community/communityBoard/communityBoardView";
	}

	// 커뮤니티 게시판 글쓰기폼
	@RequestMapping(value = "communityBoardWriteForm", method = RequestMethod.GET)
	public String communityBoardWriteForm() {
		return "/jsp/community/communityBoard/communityBoardWriteForm";
	}

	// 커뮤니티 게시판 글수정폼
	@RequestMapping(value = "communityBoardModifyForm", method = RequestMethod.GET)
	public String communityBoardModifyForm() {
		return "/jsp/community/communityBoard/communityBoardModifyForm";
	}

	// 커뮤니티 게시판 답글 폼
	@RequestMapping(value = "communityBoardReplyForm", method = RequestMethod.GET)
	public String communityBoardReplyForm() {
		return "/jsp/community/communityBoard/communityBoardReplyForm";
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