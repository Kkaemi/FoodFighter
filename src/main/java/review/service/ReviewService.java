package review.service;

import java.util.List;
import java.util.Map;

<<<<<<< HEAD
=======

>>>>>>> b2a724c37a7e00294f55671f6d505ca0666c2cd4
import admin.bean.RestaurantDTO;

public interface ReviewService {
	/*
	public RestaurantDTO checkRes();
	public List<RestaurantDTO> resSearch(String resSearchIcon);
	*/
	
	public void writeReview(Map<String, Object> map);

	public List<RestaurantDTO> getSearchList(String pg, String keyword);

}
