package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.AdminMemberPaging;
import admin.bean.AdminShopPaging;
import admin.service.AdminService;
import admin.bean.RestaurantDTO;
import member.bean.MemberDTO;


@Controller
@RequestMapping(value="admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	

	@RequestMapping(value = "adminMain")
	public String adminMain(Model model) {
	
		model.addAttribute("display","/jsp/admin/adminDashboard.jsp");
		return "/jsp/admin/adminMain";
	}
	//대시보드
	@RequestMapping(value = "adminDashboard")
	public String adminDashboard(Model model) {
	
		//리뷰
		Map<String,Object> reviewMap = adminService.getReviewData();
		//게시글
		Map<String,Object> postMap = adminService.getPostData();
		//문의
		Map<String,Object> qnaMap = adminService.getQnaData();
		//등록가게
		Map<String,Object> countJMap = adminService.getJoinData();
		//음식별 파이차트
		Map<String,Object> foodMap = adminService.getFoodData();
		//가격대별 파이차트
		Map<String,Object> priceMap = adminService.getPriceData();
		//회원가입
		Map<String,Object> joinMap = adminService.getJoinwayData();
		
		
		model.addAttribute("todayReview", reviewMap.get("todayReview"));
		model.addAttribute("totalReview", reviewMap.get("totalReview"));
		
		model.addAttribute("todayPost", postMap.get("todayPost"));
		model.addAttribute("totalPost", postMap.get("totalPost"));
		
		model.addAttribute("todayQna", qnaMap.get("todayQna"));
		model.addAttribute("totalQna", qnaMap.get("totalQna"));
		
		model.addAttribute("todayJoin", countJMap.get("todayJoin"));
		model.addAttribute("totalJoin", countJMap.get("totalJoin"));
		
		model.addAttribute("kFood", foodMap.get("kFood"));
		model.addAttribute("wFood", foodMap.get("wFood"));
		model.addAttribute("cFood", foodMap.get("cFood"));
		model.addAttribute("jFood", foodMap.get("jFood"));
		model.addAttribute("dessert", foodMap.get("dessert"));
		
		model.addAttribute("under1", priceMap.get("under1"));
		model.addAttribute("manwon1", priceMap.get("manwon1"));
		model.addAttribute("manwon2", priceMap.get("manwon2"));
		model.addAttribute("manwon3", priceMap.get("manwon3"));
		model.addAttribute("manwon4", priceMap.get("manwon4"));
		
		model.addAttribute("joinKakao", joinMap.get("joinKakao"));
		model.addAttribute("join", joinMap.get("join"));
		
		return "/jsp/admin/adminDashboard";
	}
	
	//멤버관리
		@RequestMapping(value = "adminMemberManagement", method = RequestMethod.GET)
		public String adminMemberManagement(Model model,@RequestParam(defaultValue = "1") String pg) {
			
			AdminMemberPaging adminMemberPaging = adminService.getAdminPaging(pg);
			
			int endNum = Integer.parseInt(pg)*10;
			int startNum = endNum-9;
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("startNum",startNum);
			map.put("endNum",endNum);
			
			
			List<MemberDTO> list = adminService.getMemberList(map);
			
			model.addAttribute("pg", pg);
			model.addAttribute("adminMemberPaging", adminMemberPaging);
			model.addAttribute("list", list);
			return "/jsp/admin/adminMemberManagement";

		}
	//가게 관리
		@RequestMapping(value = "adminShopManagement", method = RequestMethod.GET)
		public String adminShopManagement(Model model,@RequestParam(defaultValue = "1") String pg) {
			
			AdminShopPaging adminShopPaging = adminService.getAdminShopPaging(pg);
			
			int endNum = Integer.parseInt(pg)*10;
			int startNum = endNum-9;
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("startNum",startNum);
			map.put("endNum",endNum);
			
			
			List<MemberDTO> list = adminService.getResList(map); 
			
			model.addAttribute("pg", pg);
			model.addAttribute("adminShopPaging", adminShopPaging);
			model.addAttribute("list", list); 
			return "/jsp/admin/adminShopManagement";

		}
		
	//회원 탈퇴	
		@RequestMapping(value="AdminWithdraw",method=RequestMethod.POST)
		@ResponseBody
		public void AdminWithdraw(@RequestParam String member_seq) {

			adminService.AdminWithdraw(member_seq);
		}
	//회원검색	
		@RequestMapping(value = "getMemberSearch", method = RequestMethod.POST)
		public @ResponseBody ModelAndView getMemberSearch(Model model,@RequestParam Map<String, Object> map) {
			System.out.println("키워드= "+map.get("memSearchKeyword"));
			
			AdminMemberPaging adminMemberPaging = adminService.getSearchPaging(map);
			
			
			List<MemberDTO> list = adminService.getMemberSearch(map);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pg", map.get("pg"));
			mav.addObject("adminMemberPaging", adminMemberPaging);
			mav.setViewName("jsonView");

			return mav;

		}
	//가게 삭제
	  @RequestMapping(value="adminShopDelete",method=RequestMethod.POST)
	  @ResponseBody public void adminShopDelete(@RequestParam String resSeq) {
		  	adminService.adminShopDelete(resSeq); 
	  }
	//가게 검색
	  @RequestMapping(value = "getShopSearch", method = RequestMethod.POST)
		public @ResponseBody ModelAndView getShopSearch(Model model,@RequestParam Map<String, Object> map) {
		  	AdminShopPaging adminShopPaging = adminService.getShopSearchPaging(map);
			
			
			List<MemberDTO> list = adminService.getShopSearch(map);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pg", map.get("pg"));
			mav.addObject("adminShopPaging", adminShopPaging);
			mav.setViewName("jsonView");

			return mav;

		}	 


	// 가게정보 입력 페이지
	@RequestMapping(value="resWriteForm", method=RequestMethod.GET)
	public String resWriteForm() {
		return "/jsp/admin/resWriteForm";
	}
	
	// 가게정보 입력
	@ResponseBody
	@RequestMapping(value="resWrite", method=RequestMethod.POST)
	public void resWrite(@ModelAttribute RestaurantDTO restaurantDTO, @RequestParam MultipartFile[] img){
		
		String filePath = "D:\\spring\\workSTS\\FoodFighter\\src\\main\\webapp\\storage\\restaurant";
		
		String fileName;
		File file;
		
		if(img[0] != null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			restaurantDTO.setResImage1(fileName);
		}else {
			restaurantDTO.setResImage1("");
		}
		
		if(img[1] != null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			restaurantDTO.setResImage2(fileName);
		}else {
			restaurantDTO.setResImage2("");
		}
		
		adminService.resWrite(restaurantDTO);
		

	}
	
}



