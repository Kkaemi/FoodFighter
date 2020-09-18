package review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
import review.bean.ReviewDTO;
import review.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void writeReview(Map<String, Object> map) {
		reviewDAO.writeReview(map);
	}

	@Override
	public List<RestaurantDTO> getSearchList(String pg, String keyword, String resSeq) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", pg);
		map.put("keyword", keyword);
		map.put("resSeq", resSeq);

		// 1페이지당 5개씩
		int endNum = (Integer.parseInt(pg)) * 5;
		int startNum = endNum - 4;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");

		return reviewDAO.getSearchList(map);
	}
	
	@Override
	public List<RestaurantDTO> modalSearchList(String pg, String orderby,String Price ,String Food ,String keyword,String resSeq){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", pg="1");
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		map.put("Price", Price);
		map.put("Food", Food);
		map.put("resSeq", resSeq);
		
		// 1페이지당 5개씩
		int endNum = (Integer.parseInt(pg)) * 5;
		int startNum = endNum - 4;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		return reviewDAO.modalSearchList(map);
	}
	
	@Override
	public RestaurantDTO getReviewView(String resSeq) {
		return reviewDAO.getReviewView(resSeq);
	}

	@Override
	public Map<String, Object> getRestaurantDTOAndReviewList(Map<String, String> map) {
		
		Map<String, Object> restaurantAndreviewMap = new HashMap<String, Object>();
		
		RestaurantDTO restaurantDTO = reviewDAO.getReviewView(map.get("resSeq"));
		List<ReviewDTO> reviewList = reviewDAO.getReviewList(map.get("resName"));
		
		restaurantAndreviewMap.put("restaurantDTO", restaurantDTO);
		restaurantAndreviewMap.put("reviewList", reviewList);
		
		return restaurantAndreviewMap;
	}

	public void avgUpdate(Map<String, Object> map) {
		reviewDAO.writeReview(map);
		
	}


}