package admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.bean.RestaurantDTO;

@Repository
public class RestaurantDAOMybatis implements RestaurantDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void resWrite(RestaurantDTO restaurantDTO) {
		sqlSession.insert("restaurantSQL.resWrite", restaurantDTO);
		
	}

	
}