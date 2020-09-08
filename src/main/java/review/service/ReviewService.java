package review.service;

import java.util.List;
import java.util.Map;

import admin.bean.RestaurantDTO;

public interface ReviewService {
	
	public void writeReview(Map<String, Object> map);

	public List<RestaurantDTO> getSearchList(String pg, String keyword);

}
