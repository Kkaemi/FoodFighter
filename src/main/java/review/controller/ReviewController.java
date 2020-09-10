package review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.RestaurantDTO;
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
		
	//리뷰 DB저장 
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(HttpSession session,@RequestParam Map<String, Object> map,
							  @RequestParam("img[]") List<MultipartFile> list){
		
		
		String filePath = "D:\\reallysong\\FoodFighter\\src\\main\\webapp\\storage\\review";

		
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

			map.put("nickname", memberDTO.getNickname());
			map.put("member_seq",memberDTO.getMember_seq());
			map.put("resName","카페");

		//DB
		reviewService.writeReview(map);
		
		return "/jsp/review/reviewView";
	}
	
	//검색어를 통한 리스트
	@RequestMapping(value="getSearchList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSearchList(@RequestParam Map<String, Object> map,
									  @RequestParam(required=false, defaultValue="1") String pg, @RequestParam(required=false) String resSeq, HttpSession session, HttpServletResponse response) {
		
		//5개씩 보여지는 리스트
		List<RestaurantDTO> list = reviewService.getSearchList(pg,(String)map.get("keyword"), resSeq);

		map.put("list",list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("resSeq", resSeq);

		mav.addObject("keyword", map.get("keyword"));

		mav.setViewName("/jsp/review/review_searchList");
		
		return mav;
	}
	
	//더보기 기능구현
	@RequestMapping(value="moreSearchList", method=RequestMethod.POST, produces={"application/json"})
	@ResponseBody
	public List<RestaurantDTO> moreSearchList(@RequestBody HashMap<String, Object> map,HttpServletRequest requeest,
											@RequestParam(required=false) String resSeq, HttpServletResponse response) {
	System.out.println("moreSearchList");
	
	//5개씩 보여지는 리스트
	List<RestaurantDTO> list = reviewService.getSearchList(map.get("pg")+"",(String)map.get("keyword"), resSeq);
	
	return list;
	}

	
	//리뷰 페이지(reviewView)
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public String reviewView(@RequestParam String resSeq, Model model, HttpServletRequest request) {
		model.addAttribute("resSeq", resSeq);
		request.getParameter("resSeq");
		
		return "/jsp/review/reviewView";
	}
	
	
	// 가게데이터 끌어오기 
	//리뷰(reviewView)
	@ResponseBody
	@RequestMapping(value="getReviewView", method=RequestMethod.POST)
	public ModelAndView getReviewView(@RequestParam String resSeq) {
		
		RestaurantDTO restaurantDTO = reviewService.getReviewView(resSeq);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("restaurantDTO", restaurantDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}

}