package review.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import review.bean.ReviewDTO;

@Repository
public class ReviewDAOMybatis implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeReview(Map<String, Object> map) {
		sqlSession.insert("reviewSQL.writeReview", map);
	}

}
