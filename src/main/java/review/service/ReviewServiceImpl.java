package review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
import review.dao.ReviewDAO;


// ps) 가게 검색은 앞선 springProject에서 했던 postSearch와 거의 비슷함
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	// 가게 체크
	/*
	@Override
	public RestaurantDTO checkRes() {
		// TODO Auto-generated method stub
		return reviewDAO.checkRes();
	}
	*/
	// 가게 찾기 
	/*
	@Override
	public List<RestaurantDTO> resSearch(String resSearchIcon) {
	
		return reviewDAO.resSearch(resSearchIcon);
	}
	*/
	
	
}
