package review.dao;

import java.util.List;
import java.util.Map;

import manager.bean.StoreDTO;

public interface ReviewDAO {
	
	public void writeReview(Map<String, Object> map);
	
	public List<StoreDTO> getSearchList(Map<String, String> map);
}
