package review.dao;

import java.util.List;
import java.util.Map;

import admin.bean.RestaurantDTO;
<<<<<<< HEAD

=======
>>>>>>> b2a724c37a7e00294f55671f6d505ca0666c2cd4

public interface ReviewDAO {
	/*
	public RestaurantDTO checkRes();
	public List<RestaurantDTO> resSearch(String resSearchIcon);
	*/
	public void writeReview(Map<String, Object> map);
	
	public List<RestaurantDTO> getSearchList(Map<String, String> map);

}
