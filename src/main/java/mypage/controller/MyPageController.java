package mypage.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import mypage.service.MypageService;
import review.bean.ReviewDTO;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 마이페이지 메인
	@RequestMapping(value = "mypageMain")
	public String mypageMain(HttpSession session,Model model) {
		String email = (String) session.getAttribute("memId");
		
		MemberDTO memberDTO = mypageService.getInfo(email);
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("display","/jsp/mypage/myReview.jsp");
		return "/jsp/mypage/mypageMain";
	}
	
	// 마이리뷰 페이지 
	@RequestMapping(value = "myReview")
	public String myReview(Model model) {
		
		model.addAttribute("display","/jsp/mypage/myReview.jsp");
		return "/jsp/mypage/mypageMain";
	}
	//북마크
	@RequestMapping(value = "myShop")
	public String myShop(Model model) {
		
		model.addAttribute("display","/jsp/mypage/myShop.jsp");
		return "/jsp/mypage/mypageMain";
	}
	//작성글
	@RequestMapping(value = "myPost")
	public String myPost(Model model) {
		
		model.addAttribute("display","/jsp/mypage/myPost.jsp");
		return "/jsp/mypage/mypageMain";
	}
	//문의
	@RequestMapping(value = "myAsk")
	public String myAsk(Model model) {
		
		model.addAttribute("display","/jsp/mypage/myAsk.jsp");
		return "/jsp/mypage/mypageMain";
	}
	//리뷰 갖고오기
	@RequestMapping(value = "myreviewGetList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView myreviewGetList(@RequestParam String pg,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		int endNum = Integer.parseInt(pg)*6;
		int startNum = endNum-5;
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNum",startNum);
		map.put("endNum",endNum);
		map.put("member_seq",memberDTO.getMember_seq());
		
		List<ReviewDTO> list = mypageService.myreviewGetList(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	//리뷰보는 모달
	@RequestMapping(value = "getModalView", method = RequestMethod.POST)
	@ResponseBody
	public ReviewDTO getModalView(@RequestParam String seq_review) {
		ReviewDTO reviewDTO = mypageService.getModalView(seq_review);
		
		
		return reviewDTO;
		
	}
	
	//정보수정 전 비밀번호 입력
		@RequestMapping(value = "modifyCheckPwd")
		public String modifyCheckPwd(HttpSession session,Model model) {
			String email = (String) session.getAttribute("memId");
			
			model.addAttribute("email",email);
			return "/jsp/mypage/modifyCheckPwd";
		}
		
	//정보수정 전 비밀번호 확인
		@RequestMapping(value = "confirmPwd",method=RequestMethod.POST)
		@ResponseBody
		public String confirmPwd(@RequestParam Map<String, String> map) {
			MemberDTO memberDTO = mypageService.getInfo(map.get("email"));
			
			if(passEncoder.matches(map.get("pwd"), memberDTO.getPwd())) {
					return "match";
				} else {
					return "not match";
				}
		}
		
	//비밀번호 변경 기존 비밀번호 확인
		@RequestMapping(value = "checkNowPwd",method=RequestMethod.POST)
		@ResponseBody
		public String checkNowPwd(HttpSession session,@RequestParam String nowPwd) {
			MemberDTO memberDTO = mypageService.getInfo((String)session.getAttribute("memId"));
			
			if(passEncoder.matches(nowPwd, memberDTO.getPwd())) {
					return "match";
				} else {
					return "not match";
				}
		}
		
	//비밀번호 변경 
		@RequestMapping(value = "modifyPwd",method=RequestMethod.POST)
		@ResponseBody
		public void modifyPwd(@RequestParam Map<String,String> map) {
			String secretPwd = passEncoder.encode(map.get("pwd"));
			map.put("pwd", secretPwd);
			
			mypageService.modifyPwd(map);
		}
	
	//정보 수정 페이지
	@RequestMapping(value = "modifyForm")
	public String modifyForm(HttpSession session,Model model) {
		String email = (String) session.getAttribute("memId");
		MemberDTO memberDTO = mypageService.getInfo(email);
		session.setAttribute("memberDTO", memberDTO);
		
		model.addAttribute("memberDTO",memberDTO);
		return "/jsp/mypage/modifyForm";
	}
	
	//회원탈퇴
	@RequestMapping(value="withdraw",method=RequestMethod.POST)
	@ResponseBody
	public void withdraw(@RequestParam String email) {
		mypageService.withdraw(email);
	}
	
	//정보수정
	@RequestMapping(value="modify",method=RequestMethod.POST)
	@ResponseBody
	public void modify(@ModelAttribute MemberDTO memberDTO,@RequestParam MultipartFile profileFile) {
		System.out.println("빈값 넘어올 때= "+profileFile);
		if(profileFile != null) {
			String filePath="D:\\reallysong\\FoodFighter\\src\\main\\webapp\\storage\\profile";
		
			String fileName = profileFile.getOriginalFilename();
			File file = new File(filePath,fileName);
			
			try {
				FileCopyUtils.copy(profileFile.getInputStream(), new FileOutputStream(file));
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			memberDTO.setProfile(fileName);
		}
		
		mypageService.modify(memberDTO);
	}
	
	
}

