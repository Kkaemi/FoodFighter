package community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.CommunityBoardCmntDTO;
import community.bean.CommunityBoardDTO;

@Repository
@Transactional
public class CommunityBoardDAOMybatis implements CommunityBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeBoard(Map<String, String> map) {
		sqlSession.insert("cBoardSQL.writeBoard", map);		
	}

	@Override
	public List<CommunityBoardDTO> getCBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("cBoardSQL.getCBoardList", map);
	}

	@Override
	public int getTotalA() {
		return sqlSession.selectOne("cBoardSQL.getTotalA");
	}
	
	@Override
	public List<CommunityBoardDTO> getCBoardSrch(Map<String, String> map) {
		return sqlSession.selectList("cBoardSQL.getCBoardSrch", map);
	}
	
	@Override
	public int getCBSrchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("cBoardSQL.getCBSrchTotalA", map);
	}

	@Override
	public void deleteBoardAdmin(List<String> list) {
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i);
			sqlSession.update("cBoardSQL.deleteBoardAdmin",temp);
		}
	}

	@Override
	public CommunityBoardDTO viewBoard(String bseq) {
		return sqlSession.selectOne("cBoardSQL.viewBoard", Integer.parseInt(bseq));
	}

	@Override
	public void hitUpdate(String bseq) {
		sqlSession.update("cBoardSQL.hitUpdate", Integer.parseInt(bseq));
	}

	@Override
	public CommunityBoardDTO viewPrevBoard(String bseq) {
		return sqlSession.selectOne("cBoardSQL.viewPrevBoard", Integer.parseInt(bseq));
	}

	@Override
	public CommunityBoardDTO viewNextBoard(String bseq) {
		return sqlSession.selectOne("cBoardSQL.viewNextBoard", Integer.parseInt(bseq));
	}

	@Override
	public CommunityBoardDTO viewSrchPrevBoard(Map<String, String> map) {
		return sqlSession.selectOne("cBoardSQL.viewSrchPrevBoard", map);
	}

	@Override
	public CommunityBoardDTO viewSrchNextBoard(Map<String, String> map) {
		return sqlSession.selectOne("cBoardSQL.viewSrchNextBoard", map);
	}

	@Override
	public void modifyBoard(Map<String, String> map) {
		sqlSession.update("cBoardSQL.modifyBoard", map);
	}

	@Override
	public void deleteBoard(String bseq) {
		sqlSession.update("cBoardSQL.deleteBoard", Integer.parseInt(bseq));
	}

	@Override
	public void replyBoard(Map<String, String> map) {
		sqlSession.insert("cBoardSQL.replyBoard", map);
	}

	@Override
	public void writeCmnt(Map<String, String> map) {
		sqlSession.insert("cBoardSQL.writeCmnt", map);
	}

	@Override
	public List<CommunityBoardCmntDTO> getCmntList(Map<String, Object> map) {
		return sqlSession.selectList("cBoardSQL.getCmntList", map);
	}
}
