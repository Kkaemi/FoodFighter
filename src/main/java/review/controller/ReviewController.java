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
import review.bean.ReviewDTO;
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

	//리뷰 리스트(review_writeForm)
	@RequestMapping(value="review_writeForm", method=RequestMethod.GET)
	public ModelAndView review_writeForm(@RequestParam String resSeq,Model model,
			 							HttpSession session, HttpServletRequest request) {
		
		MemberDTO memberDTO =(MemberDTO)session.getAttribute("memberDTO");
		
		RestaurantDTO restaurantDTO = reviewService.getReviewView(resSeq);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("restaurantDTO", restaurantDTO);
		mav.addObject("MemberDTO", memberDTO);
		mav.setViewName("/jsp/review/review_writeForm");

		return mav;
	}
	
	//리뷰 리스트(review_searchList)
	@RequestMapping(value="review_searchList", method=RequestMethod.GET)
	public String review_searchList() {
		return "/jsp/review/review_searchList";
	}
		
	//리뷰 DB저장 
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(HttpSession session,@RequestParam Map<String, Object> map,
							  @RequestParam("img[]") List<MultipartFile> list,
							  @RequestParam(value="resSeq", required=false) String resSeq,
							  @RequestParam(value="resName", required=false) String resName,
							  HttpServletRequest request,
							  HttpServletResponse response){
		
		//String filePath = "D:\\reallysong\\FoodFighter\\src\\main\\webapp\\storage\\review";
//		String filePath = "/Users/aria.k/Downloads/bit/fighter/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FoodFighter/storage/community";
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

			map.put("nickname", memberDTO.getNickname());
			map.put("member_seq",memberDTO.getMember_seq());
			map.put("resName",resName);
			map.put("resSeq",resSeq);
			
		//DB
		reviewService.writeReview(map);
		
		return "/jsp/review/reviewView";
	}
	
	
	
	//검색어를 통한 리스트
	@RequestMapping(value="getSearchList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSearchList(@RequestParam Map<String, Object> map,
									  @RequestParam(required=false, defaultValue="1") String pg,
									  @RequestParam(required=false) String resSeq,
									  @RequestParam(required=false) String resName,
									  HttpSession session, HttpServletResponse response) {
		
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
	
	//필터를 통한 리뷰리스트
	@RequestMapping(value="modalSearchList", method=RequestMethod.POST)
	public String modalSearchList(@RequestParam Map<String, Object> map, Model model, @RequestParam String pg,  @RequestParam(required=false) String resSeq) {
	
	//5개씩 필터링
    List<RestaurantDTO> list = reviewService.modalSearchList(pg,(String)map.get("orderby"),(String)map.get("Price") ,(String)map.get("Food") ,
    		(String)map.get("keyword"),resSeq);

		map.put("list",list);

		model.addAttribute("list",list);
		model.addAttribute("pg", pg);
		model.addAttribute("keyword", map.get("keyword"));
	
	return "/jsp/review/review_searchList";
	
	}
	
	//검색어를 통한 리스트
	//더보기 기능구현
	@RequestMapping(value="moreSearchList", method=RequestMethod.POST, produces={"application/json"})
	@ResponseBody
	public List<RestaurantDTO> moreSearchList(@RequestBody HashMap<String, Object> map,HttpServletRequest requeest,
											@RequestParam(required=false) String resName,
											@RequestParam(required=false) String resSeq, HttpServletResponse response) {
		
	//5개씩 보여지는 리스트
	List<RestaurantDTO> list = reviewService.getSearchList(map.get("pg")+"",(String)map.get("keyword"), resSeq);
	
	return list;
	}
	
	//리뷰 페이지(reviewView)
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public String reviewView(@RequestParam String resSeq,@RequestParam String resName,Model model, HttpServletRequest request) {
			
		model.addAttribute("resSeq", resSeq);
		model.addAttribute("resName", resName);

		return "/jsp/review/reviewView";
	}
		
	// 가게데이터 끌어오기 
	//리뷰(reviewView)
	@ResponseBody
	@RequestMapping(value="getRestaurantDTOAndReviewList", method=RequestMethod.POST)
	public ModelAndView getRestaurantDTOAndReviewList(@RequestParam String resSeq,
									@RequestParam String resName) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("resSeq", resSeq);
		map.put("resName", resName);
		
		Map<String, Object> restaurantAndReviewMap = reviewService.getRestaurantDTOAndReviewList(map);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("restaurantAndReviewMap", restaurantAndReviewMap);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
}