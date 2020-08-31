package review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import manager.bean.StoreDTO;
import member.bean.MemberDTO;
import review.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 리스트 (nonSearch)
	@RequestMapping(value="reviewNonSearchList", method=RequestMethod.GET)
	public String reviewNonSearchList() {
		return "/jsp/review/review_nonSearchList";
	}

	//리뷰 작성하는 페이지(writeForm)
	@RequestMapping(value="review_writeForm", method=RequestMethod.GET)
	public String review_writeForm() {
		return "/jsp/review/review_writeForm";
	}
	
	//리뷰 리스트(review_searchList)
	@RequestMapping(value="review_searchList", method=RequestMethod.GET)
	public String review_searchList() {
		return "/jsp/review/review_searchList";
	}
		
	//리뷰 페이지(searchView)
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public String reviewView() {
		return "/jsp/review/reviewView";
	}
	
	//리뷰 DB저장 
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(@RequestParam Map<String, Object> map,
							  @RequestParam("img[]") List<MultipartFile> list,
							  HttpSession session){
		
		String filePath = "/Users/jiyelin/Documents/GitHub/FoodFighter/src/main/webapp/storage/review";
		
		int i=1;
		for(MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
			//파일 복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			map.put("image"+i,fileName);
			i++;
		}//for
		
		for(; i<=5; i++) {
			map.put("image"+i, "");
		}
		
			MemberDTO memberDTO =(MemberDTO)session.getAttribute("memberDTO");
//			StoreDTO storeDTO =(StoreDTO)session.getAttribute("storeDTO");
			
			map.put("nickname", memberDTO.getNickname());
			map.put("member_seq",memberDTO.getMember_seq());
			map.put("storename","");
//			map.put("storename",storeDTO.getStoreName());
		//DB
		reviewService.writeReview(map);
		
		return "/jsp/review/reviewView";
	}
	

	// 가게 찾기 
	/*
	@RequestMapping(value = "checkRes", method = RequestMethod.GET)
	public String checkRes() {
		return "/review/checkRes";
	
	}
	*/
	/*
	@RequestMapping(value = "resSearch", method = RequestMethod.POST)
	public ModelAndView resSearch(@RequestParam String resSearchIcon) {
		// 검색 아이콘(resSearchIcon 가져가기)
		System.out.println(resSearchIcon);
		List<RestaurantDTO> list = reviewService.resSearch(resSearchIcon);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	*/


	//검색어를 통한 리스트
	@RequestMapping(value="getSearchList", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView getSearchList(@RequestParam Map<String, Object> map,
									  @RequestParam(required=false, defaultValue="1") String pg) {

		//5개씩 보여지는 리스트
		List<StoreDTO> list = reviewService.getSearchList(pg,(String)map.get("keyword"));

		map.put("list",list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("keyword", map.get("keyword"));
		mav.setViewName("/jsp/review/review_searchList");
		
		System.out.println(list);
		
		return mav;
	}

	
}


