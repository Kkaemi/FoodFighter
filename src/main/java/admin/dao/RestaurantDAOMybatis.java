package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.bean.RestaurantDTO;
import admin.bean.ZipcodeDTO;

@Repository
public class RestaurantDAOMybatis implements RestaurantDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void resWrite(RestaurantDTO restaurantDTO) {
		sqlSession.insert("restaurantSQL.resWrite", restaurantDTO);
		
	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, String> map) {
				return null;
	}
	
	
}
