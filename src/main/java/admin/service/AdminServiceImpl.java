package admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
import admin.bean.ZipcodeDTO;
import admin.dao.RestaurantDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private RestaurantDAO restaurantDAO;
	
	
	@Override
	public void resWrite(RestaurantDTO restaurantDTO) {
		restaurantDAO.resWrite(restaurantDTO);
		
	}


	@Override
	public List<ZipcodeDTO> postSearch(Map<String, String> map) {
		
		return restaurantDAO.postSearch(map);
	}

}
