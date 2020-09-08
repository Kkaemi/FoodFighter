package review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.RestaurantDTO;

@Repository
@Transactional
public class ReviewDAOMybatis implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeReview(Map<String, Object> map) {
		sqlSession.insert("reviewSQL.writeReview", map);
	}

	@Override
	public List<RestaurantDTO> getSearchList(Map<String, String > map) {
		return sqlSession.selectList("reviewSQL.getSearchList", map);
	}


}
