package review.dao;

import java.util.List;
import java.util.Map;

import admin.bean.RestaurantDTO;
import review.bean.ReviewDTO;

public interface ReviewDAO {
	
	public void writeReview(Map<String, Object> map);

	public List<RestaurantDTO> getSearchList(Map<String, String> map);

	public RestaurantDTO getReviewView(String resSeq);

	public List<RestaurantDTO> modalSearchList(Map<String, String> map);

	public List<ReviewDTO> getReviewList(String resName);
	
	
}
