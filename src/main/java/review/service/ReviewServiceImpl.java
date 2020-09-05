package review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
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
	public List<RestaurantDTO> getSearchList(String pg, String keyword) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", pg);
		map.put("keyword", keyword);

		// 1페이지당 5개씩
		int endNum = (Integer.parseInt(pg)) * 5;
		int startNum = endNum - 4;

		map.put("startNum", startNum + "");
		map.put("endNum", endNum + "");
		
		System.out.println(keyword);
		System.out.println(startNum);
		System.out.println(endNum);
		return reviewDAO.getSearchList(map);
	}



}
