package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.RestaurantDTO;
import admin.dao.RestaurantDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private RestaurantDAO restaurantDAO;
	
	
	@Override
	public void resWrite(RestaurantDTO restaurantDTO) {
		restaurantDAO.resWrite(restaurantDTO);
		
	}

<<<<<<< HEAD

=======
>>>>>>> upstream/master
	

}