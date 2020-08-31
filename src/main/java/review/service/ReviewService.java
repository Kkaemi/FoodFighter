package review.service;

import java.util.List;
import java.util.Map;

import manager.bean.StoreDTO;


import admin.bean.RestaurantDTO;

public interface ReviewService {
	/*
	public RestaurantDTO checkRes();
	public List<RestaurantDTO> resSearch(String resSearchIcon);
	*/
	
	
	public void writeReview(Map<String, Object> map);

	public List<StoreDTO> getSearchList(String pg, String keyword);

}
