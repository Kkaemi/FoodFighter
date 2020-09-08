package community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.QnaBoardDTO;

@Repository
@Transactional
public class CommunityCSDAOMybatis implements CommunityCSDAO {
	
//	@Autowired
//	private SqlSession sqlSession;
//
//	@Override
//	public void qnaWrite(Map<String, String> map) {
//		sqlSession.insert("qnaBoardSQL.qnaWrite", map);
//	}
//
//	@Override
//	public List<QnaBoardDTO> getQnaBoardList(Map<String, Integer> map) {
//		return sqlSession.selectList("qnaBoardSQL.getQnaBoardList", map);
//	}
//
//	@Override
//	public List<QnaBoardDTO> getQnaBoardSearchList(Map<String, String> map) {
//		return sqlSession.selectList("qnaBoardSQL.getQnaBoardSearchList", map);
//	}
//	
//	@Override
//	public int getTotalA() {
//		return sqlSession.selectOne("qnaBoardSQL.getTotalA");
//	}
//
//	@Override
//	public int getTotalSearchA(Map<String, String> map) {
//		return sqlSession.selectOne("qnaBoardSQL.getTotalSearchA", map);
//	}
//	
//	@Override
//	public String password_loading(Map<String, String> map) {
//		return sqlSession.selectOne("qnaBoardSQL.password_loading", map);
//	}
//
//	@Override
//	public QnaBoardDTO getBoard(String seq) {
//		return sqlSession.selectOne("qnaBoardSQL.getBoard", seq);
//	}

}
