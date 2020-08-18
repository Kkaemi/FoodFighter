package community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="community")
public class CommunityNoticeController {
	
	// 커뮤니티 공지사항 글 목록
	@RequestMapping(value = "communityNotice", method = RequestMethod.GET)
	public String communityNoticeList() {
		return "/jsp/community/communityNotice/communityNoticeList";
	}

	//커뮤니티 공지사항 글 보기
	@RequestMapping(value = "communityNoticeView", method = RequestMethod.GET)
	public String communityNoticeView() {
		return "/jsp/community/communityNotice/communityNoticeView";
	}
	
	//커뮤니티게시판 글쓰기폼
	@RequestMapping(value = "communityNoticeWriteForm", method = RequestMethod.GET)
	public String communityNoticeWriteForm() {
		return "/jsp/community/communityNotice/communityNoticeWriteForm";
	}
	
	//커뮤니티게시판 글수정폼
	@RequestMapping(value = "communityNoticeModifyForm", method = RequestMethod.GET)
	public String communityNoticeModifyForm() {
		return "/jsp/community/communityNotice/communityNoticeModifyForm";
	}
}
