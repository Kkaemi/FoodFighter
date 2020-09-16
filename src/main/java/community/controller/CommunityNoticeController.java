package community.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import community.bean.CommunityNoticeDTO;
import community.bean.CommunityNoticePaging;
import community.service.CommunityNoticeService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="community")
public class CommunityNoticeController {
	@Autowired
	private CommunityNoticeService cNoticeService;
	
	// 커뮤니티 공지사항 글 목록
	@RequestMapping(value = "communityNotice", method = RequestMethod.GET)
	public ModelAndView communityNoticeList(@RequestParam(required=false, defaultValue="1") String pg,
											HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<CommunityNoticeDTO> list = cNoticeService.getCNoticeList(pg);
		CommunityNoticePaging cNPaging = cNoticeService.cNPaging(pg);

		//조회수
		if(session.getAttribute("memberDTO") != null) {
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
			String nickname = memberDTO.getNickname();
			
			if(nickname != null && !nickname.equals("관리자")) {
				Cookie cookie = new Cookie("hit", "ok");
				cookie.setMaxAge(30*60);//30분
				cookie.setPath("/");
				response.addCookie(cookie); //클라이언트에 보내기
			}
		}
		//페이징 처리
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("cNPaging", cNPaging);
		mav.setViewName("/jsp/community/communityNotice/communityNoticeList");
		return mav;
	}
	
	// 커뮤니티 공지사항 검색 글 목록
	@RequestMapping(value = "communityNoticeSearch", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView communityNoticeSearch(@RequestParam(required=false, defaultValue="1") String pg,
													@RequestParam Map<String, String> map,
													HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		map.put("pg", pg);
		List<CommunityNoticeDTO> list = cNoticeService.getCNoticeSrch(map);
		//페이징 처리
		CommunityNoticePaging cNPaging = cNoticeService.cNPaging(map);
		
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("cNPaging", cNPaging);
		mav.addObject("nSrchOption" , map.get("nSrchOption"));
		mav.addObject("nKeyword" , map.get("nKeyword"));
		mav.setViewName("/jsp/community/communityNotice/communityNoticeList");
		
		return mav;
	}
	
	//커뮤니티 공지사항 글 상세보기
	@RequestMapping(value = "communityNoticeView", method = RequestMethod.GET)
	public ModelAndView communityNoticeView(@RequestParam String nseq, String pg, String nSrchOption, String nKeyword,
											@CookieValue(value = "hit", required=false)Cookie cookie,
											HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		//현재 글
		CommunityNoticeDTO cNDTO = cNoticeService.viewNotice(nseq);
		
		if (nSrchOption != null && nKeyword != null) { //검색 키워드가 있을 때
			Map<String, String> map = new HashMap<String, String>();
			map.put("nSrchOption", nSrchOption);
			map.put("nKeyword", nKeyword);
			map.put("nseq", nseq);
			
			CommunityNoticeDTO cNPrev = cNoticeService.viewSrchPrevNoitce(map); //이전 글
			CommunityNoticeDTO cNNext = cNoticeService.viewSrchNextNotice(map); //다음 글
			
			mav.addObject("nSrchOption", nSrchOption);
			mav.addObject("nKeyword", nKeyword);
			mav.addObject("cNPrev", cNPrev);
			mav.addObject("cNNext", cNNext);
			
		} else {
			CommunityNoticeDTO cNPrev = cNoticeService.viewPrevNoitce(nseq); //이전 글
			CommunityNoticeDTO cNNext = cNoticeService.viewNextNoitce(nseq); //다음 글
			mav.addObject("cNPrev", cNPrev);
			mav.addObject("cNNext", cNNext);
		}
		
		if(cookie != null) {
			cNoticeService.hitUpdate(nseq); //조회수 증가
			//쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		mav.addObject("cNDTO", cNDTO);
		mav.addObject("nseq", nseq);
		mav.addObject("pg", pg);
		
		mav.setViewName("/jsp/community/communityNotice/communityNoticeView");
		return mav;
	}
	
	//커뮤니티 공지사항 글쓰기폼
	@RequestMapping(value = "communityNoticeWriteForm", method = RequestMethod.GET)
	public ModelAndView communityNoticeWriteForm(@RequestParam(required=false, defaultValue="1") String pg, String nseq,
			 										String nSrchOption, String nKeyword) {
		ModelAndView mav = new ModelAndView();
		
		if (nSrchOption != null && nKeyword != null) {
			mav.addObject("nSrchOption", nSrchOption);
			mav.addObject("nKeyword", nKeyword);
		}
		mav.addObject("pg", pg);
		mav.addObject("nseq", nseq);
		mav.setViewName("/jsp/community/communityNotice/communityNoticeWriteForm");
		
		return mav;
	}
	
	// 절대경로 ->변경 필요
	private static final String UPLOAD_PATH = "/Users/aria.k/Downloads/bit/fighter/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FoodFighter/storage/community";
	@RequestMapping(value = "uploadNoticeImage", method = RequestMethod.POST)
	@ResponseBody
	public String uploadNoticeImage(@RequestParam("file") MultipartFile[] files) throws Exception {
		String fileName = "";
		String saveName = "";
		String url = "";
		
		for (int i = 0; i < files.length; i++) {
			fileName = files[i].getOriginalFilename(); 
			UUID uuid = UUID.randomUUID();
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1); 
			saveName = uuid + "_." + extension;
			
			File file = new File(UPLOAD_PATH, saveName); 
			files[i].transferTo(file); 
			
			Tika tika = new Tika();
			String mimeType = tika.detect(file);
			
			if (mimeType.startsWith("image")) {
				url = "/FoodFighter/storage/community/" + saveName;
			} else {
				url = "noimage";
				file.delete();
			}
		}
		return url;
	}
	//커뮤니티 공지사항 글쓰기
	@RequestMapping(value = "communityNoticeWrite", method = RequestMethod.POST)
	@ResponseBody
	public void communityNoticeWrite(@RequestParam Map<String,String> map) {
		cNoticeService.writeNotice(map);
	}
	
	//커뮤니티 공지사항 글수정폼
	@RequestMapping(value = "communityNoticeModifyForm", method = RequestMethod.GET)
	public ModelAndView communityNoticeModifyForm(@RequestParam String nseq, String nSrchOption, String nKeyword) {
		ModelAndView mav = new ModelAndView();
		
		CommunityNoticeDTO cNDTO = cNoticeService.viewNotice(nseq);
		if (nSrchOption != null && nKeyword != null) {
			mav.addObject("nSrchOption", nSrchOption);
			mav.addObject("nKeyword", nKeyword);
		}
		mav.addObject("cNDTO", cNDTO);
		mav.addObject("nseq", nseq);
		mav.setViewName("/jsp/community/communityNotice/communityNoticeModifyForm");
		
		return mav;
	}
	
	//커뮤니티 공지사항 글수정
	@RequestMapping(value = "communityNoticeModify", method = RequestMethod.POST)
	@ResponseBody
	public void communityNoticeModify(@RequestParam Map<String,String> map, String nseq) {
		map.put("nseq", nseq);

		cNoticeService.modifyNotice(map);
	}

	// 커뮤니티 공지사항 글 목록에서 삭제
	@RequestMapping(value = "communityNoticeDeleteAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void communityNoticeDeleteAdmin(@RequestParam(value="deleteSelect[]")List<String> list) {
		cNoticeService.deleteNoticeAdmin(list);
	}
	
	//커뮤니티 공지사항 글 삭제
	@RequestMapping(value = "communityNoticeDelete", method = RequestMethod.POST)
	@ResponseBody
	public void communityNoticeDelete(@RequestParam String nseq) {
		cNoticeService.deleteNotice(nseq);
	}
}
