package review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import review.service.ReviewService;

@Controller
@RequestMapping(value="review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 리스트 (nonSearch)
	@RequestMapping(value="reviewNonSearchList", method=RequestMethod.GET)
	public String reviewNonSearchList() {
		
		return "/jsp/review/review_nonSearchList";
	}
}
