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
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void qnaWrite(Map<String, String> map) {
		sqlSession.insert("qnaBoardSQL.qnaWrite", map);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("qnaBoardSQL.getQnaBoardList", map);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoardSearchList(Map<String, String> map) {
		return sqlSession.selectList("qnaBoardSQL.getQnaBoardSearchList", map);
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("qnaBoardSQL.getTotalA");
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		return sqlSession.selectOne("qnaBoardSQL.getTotalSearchA", map);
	}
	
	@Override
	public String password_loading(String seq) {
		return sqlSession.selectOne("qnaBoardSQL.password_loading", seq);
	}

	@Override
	public QnaBoardDTO getBoard(String seq) {
		return sqlSession.selectOne("qnaBoardSQL.getBoard", seq);
	}

	@Override
	public void qnaReply(Map<String, String> map) {
		sqlSession.update("qnaBoardSQL.qnaReply1", map);
		sqlSession.insert("qnaBoardSQL.qnaReply2", map);
		sqlSession.update("qnaBoardSQL.qnaReply3", map);
	}

	@Override
	public void qnaDelete(String seq) {
		sqlSession.update("qnaBoardSQL.qnaDelete1", seq);
		sqlSession.update("qnaBoardSQL.qnaDelete2", seq);
		sqlSession.delete("qnaBoardSQL.qnaDelete3", seq);
	}

	@Override
	public void qnaModify(Map<String, Object> map) {
		sqlSession.update("qnaBoardSQL.qnaModify", map);
	}

	@Override
	public void qnaHit(String seq) {
		sqlSession.update("qnaBoardSQL.qnaHit", seq);
	}

	@Override
	public List<QnaBoardDTO> getQnaViewList(String seq) {
		return sqlSession.selectList("qnaBoardSQL.getQnaViewList", seq);
	}

}
