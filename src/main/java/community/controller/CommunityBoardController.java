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

	
}