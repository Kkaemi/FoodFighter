package admin.service;

import java.util.List;
import java.util.Map;

import admin.bean.RestaurantDTO;
import admin.bean.ZipcodeDTO;

public interface AdminService {
	
	// 가게 데이터 쓰기 
	public void resWrite(RestaurantDTO restaurantDTO);
	
	// 가게 데이터 주소 입력
	public List<ZipcodeDTO> postSearch(Map<String, String> map);
}
