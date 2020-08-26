package review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	//리뷰 리스트(search)
	@RequestMapping(value="review_searchList", method=RequestMethod.GET)
	public String review_searchList() {
		return "/jsp/review/review_searchList";
	}
	
	//리뷰 작성하는 페이지(writeForm)
	@RequestMapping(value="review_writeForm", method=RequestMethod.GET)
	public String review_writeForm() {
		return "/jsp/review/review_writeForm";
	}
	
	//리뷰 페이지(searchView)
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public String reviewView() {
		return "/jsp/review/reviewView";
	}
	
	//리뷰 DB저장 
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(@RequestParam Map<String, String> map,
							  @RequestParam("img[]") List<MultipartFile> list){
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
			map.put("member_seq","");
			map.put("nickname","");
			map.put("storename","");
		//DB
		reviewService.writeReview(map);
		
		return "/jsp/review/reviewView";
	}
	
	//검색어를 통한 페이지이동
	
}


