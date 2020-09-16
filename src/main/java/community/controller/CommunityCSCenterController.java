package community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import member.bean.MemberDTO;

@Controller
@RequestMapping(value = "community")
public class CommunityCSCenterController {
	
	@Autowired
	private CommunityCSService communityCSService;

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
	public ModelAndView getQnaList(@RequestParam String pg, HttpServletResponse response) {

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
	public String qnaWriteForm(HttpSession session,
							   Model model) {
		
		String memId = (String) session.getAttribute("memId");
		
		model.addAttribute("memId", memId);
		
		return "/jsp/community/communityCS/qnaWrite";
	}
	
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public @ResponseBody void qnaWrite(@RequestParam Map<String, String> map) {
		communityCSService.qnaWrite(map);
	}
	
	// qna password page
	@RequestMapping(value = "passwordPage", method = RequestMethod.GET)
	public String passwordPage(@RequestParam String seq,
							@RequestParam String pg,
							HttpSession session,
							Model model) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		if (memberDTO == null) {
			
			model.addAttribute("seq", seq);
			model.addAttribute("pg", pg);
			
			return "/jsp/community/communityCS/passwordPage";
		}
		
		model.addAttribute("nickname", memberDTO.getNickname());
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		
		return "/jsp/community/communityCS/passwordPage";
	}
	
	@RequestMapping(value = "passwordCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView passwordCheck(@RequestParam Map<String, String> map) {
		
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
	
	// 잘못된 패스워드 입력시
	@RequestMapping(value = "qnaPasswordWrong", method = RequestMethod.GET)
	public String qnaPasswordWrong(@RequestParam String seq,
									@RequestParam String pg,
									Model model) {
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		
		return "/jsp/community/communityCS/qnaPasswordWrong";
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
									 HttpServletRequest req,
									 HttpServletResponse res,
									 HttpSession session) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		QnaBoardDTO qnaBoardDTO = communityCSService.getBoard(seq);
		
		ModelAndView mav = new ModelAndView();
		
		if (memberDTO == null) {
			
			mav.setViewName("jsonView");
			return mav;
			
		}
		
		if (!(memberDTO.getEmail().equals(qnaBoardDTO.getEmail())) && !(memberDTO.getNickname().equals("관리자")) && !(memberDTO.getNickname().equals(qnaBoardDTO.getId()))) {
			
			mav.setViewName("jsonView");
			return mav;
		}
		
		// 쿠키들을 불러온다
		Cookie cookies[] = req.getCookies();
		
		// 비교를 위한 임시쿠키 생성
		Cookie viewCookie = null;
		
		// 쿠키가 있을 경우 cookies배열에서 게시판 번호를 가진 쿠키를 viewCookie에 넣어줌
	    if (cookies != null && cookies.length > 0) {
	        for (int i = 0; i < cookies.length; i++) {
	            if (cookies[i].getName().equals("cookie"+seq)) viewCookie = cookies[i];
	        }
	    }
	    
	    // 쿠키가 없을 경우
	    if (viewCookie == null) {    
	
	        // 쿠키 생성(이름, 값)
	        Cookie newCookie = new Cookie("cookie"+seq, seq);
	        newCookie.setMaxAge(30 * 60);
	                        
	        // 쿠키 추가
	        res.addCookie(newCookie);
	
	        // 쿠키를 추가 시키고 조회수 증가시킴
	        communityCSService.qnaHit(seq);
	        
	        // 조회수가 증가된 qnaBoardDTO를 다시 불러옴
	        qnaBoardDTO = communityCSService.getBoard(seq);
	    }
	    
	    List<QnaBoardDTO> list = communityCSService.getQnaViewList(seq);
		
		mav.addObject("qnaboardDTO", qnaBoardDTO);
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("list", list);
		mav.addObject("seq", seq);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// qna 게시판 관리자 답글달기
	@RequestMapping(value = "qnaReplyForm", method = RequestMethod.POST)
	public String qnaReplyForm(@RequestParam String seq,
								 @RequestParam String pg, 
								 Model model) {
		
		model.addAttribute("pseq", seq); // 원글번호
		model.addAttribute("pg", pg); // 원글이 있는 페이지번호
		
		return "/jsp/community/communityCS/qnaReply";
	}
	
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	@ResponseBody
	public void qnaReply(@RequestParam Map<String, String> map) {
		
		communityCSService.qnaReply(map);
	}
	
	// qna 게시판 글 삭제
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public String qnaDelete(@RequestParam String seq) {
		
		communityCSService.qnaDelete(seq);
		
		return "/jsp/community/communityCS/qnaDelete";
	}
	
	// qna 게시판 글 수정
	@RequestMapping(value = "qnaModifyForm", method = RequestMethod.POST)
	public String qnaModifyForm(@RequestParam String seq,
								  @RequestParam String pg,
								  Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		
		return "/jsp/community/communityCS/qnaModify";
	}
	
	@RequestMapping(value = "qnaModify", method = RequestMethod.POST)
	@ResponseBody
	public void qnaModify(@RequestParam Map<String, Object> map) {
		communityCSService.qnaModify(map);
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