package review.dao;

import java.util.List;
import java.util.Map;

import admin.bean.RestaurantDTO;


public interface ReviewDAO {
<<<<<<< HEAD
=======

>>>>>>> upstream/master
	public void writeReview(Map<String, Object> map);
	
	public List<RestaurantDTO> getSearchList(Map<String, String> map);

	public RestaurantDTO getReviewView(String resSeq);



}
