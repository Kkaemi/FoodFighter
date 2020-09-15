package community.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import community.bean.CommunityBoardCmntDTO;
import community.bean.CommunityBoardDTO;
import community.bean.CommunityBoardPaging;
import community.service.CommunityBoardService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="community")
public class CommunityBoardController {
	@Autowired
	private CommunityBoardService cBoardService;
	
	//커뮤니티 자유게시판 목록
	@RequestMapping(value = "communityBoard", method = RequestMethod.GET)
	public ModelAndView communityBoardList(@RequestParam(required=false, defaultValue="1") String pg,
											HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<CommunityBoardDTO> list = cBoardService.getCBoardList(pg);
		CommunityBoardPaging cBPaging = cBoardService.cBPaging(pg);
		
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
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("cBPaging", cBPaging);
		mav.setViewName("/jsp/community/communityBoard/communityBoardList");
		
		return mav;
	}

	//커뮤니티 자유게시판 검색 글 목록
	@RequestMapping(value = "communityBoardSearch", method = RequestMethod.GET)
	public ModelAndView communityBoardSearch(@RequestParam(required=false, defaultValue="1") String pg,
											@RequestParam Map<String, String> map,
											HttpSession session,  HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		map.put("pg", pg);
		List<CommunityBoardDTO> list = cBoardService.getCBoardSrch(map);
		//페이징 처리
		CommunityBoardPaging cBPaging = cBoardService.cBPaging(map);
		
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("cBPaging", cBPaging);
		mav.addObject("bSrchOption" , map.get("bSrchOption"));
		mav.addObject("bKeyword" , map.get("bKeyword"));
		mav.setViewName("/jsp/community/communityBoard/communityBoardList");
		
		return mav;
	}
	
	//커뮤니티 자유게시판 글 상세보기
	@RequestMapping(value = "communityBoardView", method = RequestMethod.GET)
	public ModelAndView communityBoardView(@RequestParam String bseq, String pg, String bSrchOption, String bKeyword,
											@CookieValue(value = "hit", required=false)Cookie cookie,
											HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//현재 글
		CommunityBoardDTO cBDTO = cBoardService.viewBoard(bseq);
		cBDTO.setCmt(cBoardService.getCmntCnt(bseq));
		if(bSrchOption != null && bKeyword != null){ //검색 키워드가 있을 때
			Map<String, String> map = new HashMap<String, String>();
			map.put("bSrchOption", bSrchOption);
			map.put("bKeyword", bKeyword);
			map.put("bseq", bseq);
			
			CommunityBoardDTO cBPrev = cBoardService.viewSrchPrevBoard(map);
			CommunityBoardDTO cBNext = cBoardService.viewSrchNextBoard(map);
			
			mav.addObject("bSrchOption", bSrchOption);
			mav.addObject("bKeyword", bKeyword);
			mav.addObject("cBPrev", cBPrev);
			mav.addObject("cBNext", cBNext);
		} else {
			CommunityBoardDTO cBPrev = cBoardService.viewPrevBoard(bseq);
			CommunityBoardDTO cBNext = cBoardService.viewNextBoard(bseq);
			mav.addObject("cBPrev", cBPrev);
			mav.addObject("cBNext", cBNext);
		}
		
		if(cookie != null) {
			cBoardService.hitUpdate(bseq); //조회수 증가
			//쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		mav.addObject("cBDTO", cBDTO);
		mav.addObject("bseq", bseq);
		mav.addObject("pg", pg);
		
		mav.setViewName("/jsp/community/communityBoard/communityBoardView");
		return mav;
	}
	
	//커뮤니티 자유게시판 글쓰기폼
	@RequestMapping(value = "communityBoardWriteForm", method = RequestMethod.GET)
	public ModelAndView communityBoardWriteForm(@RequestParam(required=false, defaultValue="1") String pg, String bseq,
												String bSrchOption, String bKeyword) {
		ModelAndView mav = new ModelAndView();
		
		if (bSrchOption != null && bKeyword != null) {
			mav.addObject("bSrchOption", bSrchOption);
			mav.addObject("bKeyword", bKeyword);
		}
		
		mav.addObject("pg", pg);
		mav.addObject("bseq", bseq);
		mav.setViewName("/jsp/community/communityBoard/communityBoardWriteForm");
		
		return mav;
	}
	
	// 절대경로 ->변경 필요
	private static final String UPLOAD_PATH = "/Users/aria.k/Downloads/bit/fighter/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FoodFighter/storage/community";
	@RequestMapping(value = "uploadBoardImage", method = RequestMethod.POST)
	@ResponseBody
	public String uploadBoardImage(@RequestParam("file") MultipartFile[] files) throws Exception {
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
	
	//커뮤니티 자유게시판 글쓰기
	@RequestMapping(value = "communityBoardWrite", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardWrite(@RequestParam Map<String,String> map, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		String nickname = memberDTO.getNickname();
		map.put("nickname", nickname);
		
		cBoardService.writeBoard(map);
	}
	
	//커뮤니티 자유게시판 글수정폼
	@RequestMapping(value = "communityBoardModifyForm", method = RequestMethod.GET)
	public ModelAndView communityBoardModifyForm(@RequestParam String bseq, String bSrchOption, String bKeyword) {
		ModelAndView mav = new ModelAndView();
	
		CommunityBoardDTO cBDTO = cBoardService.viewBoard(bseq);
		if (bSrchOption != null && bKeyword != null) {
			mav.addObject("bSrchOption", bSrchOption);
			mav.addObject("bKeyword", bKeyword);
		}
		mav.addObject("cBDTO", cBDTO);
		mav.addObject("bseq", bseq);
		mav.setViewName("/jsp/community/communityBoard/communityBoardModifyForm");
		
		return mav;
	}
	
	//커뮤니티 자유게시판 글수정
	@RequestMapping(value = "communityBoardModify", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardModify(@RequestParam Map<String,String> map, String bseq) {
		map.put("bseq", bseq);

		cBoardService.modifyBoard(map);
	}
	
	//커뮤니티 자유게시판 글 목록에서 삭제
	@RequestMapping(value = "communityBoardDeleteAdmin", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardDeleteAdmin(@RequestParam(value="deleteSelect[]")List<String> list) {
		cBoardService.deleteBoardAdmin(list);
	}
	
	//커뮤니티 자유게시판 글 삭제
	@RequestMapping(value = "communityBoardDelete", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardDelete(@RequestParam String bseq) {
		cBoardService.deleteBoard(bseq);
	}
	
	//커뮤니티 자유게시판 답글 폼
	@RequestMapping(value = "communityBoardReplyForm", method = RequestMethod.GET)
	public ModelAndView communityBoardReplyForm(@RequestParam(required=false, defaultValue="1") String pg, String bseq,
											String bSrchOption, String bKeyword) {
		ModelAndView mav = new ModelAndView();
		
		if (bSrchOption != null && bKeyword != null) {
			mav.addObject("bSrchOption", bSrchOption);
			mav.addObject("bKeyword", bKeyword);
		}
		
		mav.addObject("pg", pg);
		mav.addObject("pseq", bseq);
		mav.setViewName("/jsp/community/communityBoard/communityBoardReplyForm");
		
		return mav;
	}
	
	//커뮤니티 자유게시판 답글쓰기
	@RequestMapping(value = "communityBoardReply", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardReply(@RequestParam Map<String,String> map, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		String nickname = memberDTO.getNickname();
		
		CommunityBoardDTO cBPDTO = cBoardService.viewBoard(map.get("pseq"));
		map.put("nickname", nickname);
		map.put("ref", cBPDTO.getRef()+"");
		map.put("lev", cBPDTO.getLev()+"");
		map.put("step", cBPDTO.getStep()+"");
		
		cBoardService.replyBoard(map);
	}
	
	//커뮤니티 자유게시판 댓글쓰기
	@RequestMapping(value = "communityBoardCmntWrite", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardCmnt(@RequestParam Map<String,String> map) {
		cBoardService.writeCmnt(map);
	}
	
	//커뮤니티 자유게시판 댓글리스트
	@RequestMapping(value = "communityBoardCmntList", method = RequestMethod.GET, produces={"application/json"})
	@ResponseBody
	public ModelAndView communityBoardCmntList(@RequestParam(required=false, defaultValue="1") String num,
														@RequestParam Map<String,Object> map, HttpServletRequest session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		map.put("num", num);
		List<CommunityBoardCmntDTO> list = cBoardService.getCmntList(map);
		//페이징 처리
		CommunityBoardPaging cmntPaging = cBoardService.cmntPaging(map);
		
		if(list != null) {
			mav.addObject("list",list);
		}else {
			mav.addObject("list", null);
		}
		
		mav.addObject("num", num);
		mav.addObject("cmntPaging", cmntPaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "communityBoardCmntView", method = RequestMethod.GET, produces={"application/json"})
	@ResponseBody
	public CommunityBoardCmntDTO communityBoardCmntView (@RequestParam Map<String,Object> map){
		CommunityBoardCmntDTO cmntDTO = cBoardService.viewCmnt(map);
		return cmntDTO;
	}
	
	//커뮤니티 자유게시판 댓글수정
	@RequestMapping(value = "communityBoardCmntModify", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardCmntModify(@RequestParam Map<String,String> map) {
		cBoardService.modifyCmnt(map);
	}
	
	//커뮤니티 자유게시판 댓글 삭제
	@RequestMapping(value = "communityBoardCmntDelete", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardCmntDelete(@RequestParam String rseq) {
		cBoardService.deleteCmnt(rseq);
	}
	
	//커뮤니티 자유게시판 대댓글쓰기
	@RequestMapping(value = "communityBoardCmntReply", method = RequestMethod.POST)
	@ResponseBody
	public void communityBoardCmntReply(@RequestParam Map<String,Object> map) {
		CommunityBoardCmntDTO cmntDTO = cBoardService.viewCmnt(map);
		map.put("rref", cmntDTO.getRref()+"");
		map.put("rlev", cmntDTO.getRlev()+"");
		map.put("rstep", cmntDTO.getRstep()+"");

		cBoardService.replyCmnt(map);
	}
}