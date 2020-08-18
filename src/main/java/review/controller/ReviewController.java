package review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import review.service.ReviewService;

@Controller
@RequestMapping(value = "review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 리스트 (nonSearch)
	@RequestMapping(value = "reviewNonSearchList", method = RequestMethod.GET)
	public String reviewNonSearchList() {

		return "/jsp/review/review_nonSearchList";
	}

	// 리뷰 리스트(search)
	@RequestMapping(value = "review_searchList", method = RequestMethod.GET)
	public String review_searchList() {
		return "/jsp/review/review_searchList";
	}

	// 리뷰 작성하는 페이지(writeForm)
	@RequestMapping(value = "review_writeForm", method = RequestMethod.GET)
	public String review_writeForm() {
		return "/jsp/review/review_writeForm";
	}

	// 리뷰 페이지(searchView)
	@RequestMapping(value = "reviewView", method = RequestMethod.GET)
	public String reviewView() {
		return "/jsp/review/reviewView";
	}
}
