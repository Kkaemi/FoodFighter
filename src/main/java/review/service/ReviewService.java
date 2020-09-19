package review.service;

import java.util.List;
import java.util.Map;


import admin.bean.RestaurantDTO;

public interface ReviewService {
	
	public void writeReview(Map<String, Object> map);

	public List<RestaurantDTO> getSearchList(String pg, String keyword, String resSeq);

	public RestaurantDTO getReviewView(String resSeq);

	public List<RestaurantDTO> modalSearchList(String pg, String orderby,String Price ,String Food ,String keyword,String resSeq);

	public Map<String, Object> getRestaurantDTOAndReviewList(Map<String, String> map);

	public void avgUpdate(Map<String, Object> map);


}
