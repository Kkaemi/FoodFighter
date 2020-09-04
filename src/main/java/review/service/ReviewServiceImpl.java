package review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
<<<<<<< HEAD
=======

// ps) 가게 검색은 앞선 springProject에서 했던 postSearch와 거의 비슷함

>>>>>>> b2a724c37a7e00294f55671f6d505ca0666c2cd4
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
