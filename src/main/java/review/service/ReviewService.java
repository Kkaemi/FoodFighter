package review.service;

import java.util.List;
import java.util.Map;

import manager.bean.StoreDTO;

public interface ReviewService {
	
	public void writeReview(Map<String, Object> map);

	public List<StoreDTO> getSearchList(String pg, String keyword);
}
