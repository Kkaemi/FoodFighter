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
			sqlSession.update("cBoardSQL.deleteBoardAdmin1",temp);
			sqlSession.update("cBoardSQL.deleteBoardAdmin2",temp);
			sqlSession.update("cBoardSQL.deleteBoardAdmin3",temp);
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
		sqlSession.update("cBoardSQL.deleteBoard1", Integer.parseInt(bseq));
		sqlSession.update("cBoardSQL.deleteBoard2", Integer.parseInt(bseq));
		sqlSession.update("cBoardSQL.deleteBoard3", Integer.parseInt(bseq));
	}

	@Override
	public void replyBoard(Map<String, String> map) {
		sqlSession.insert("cBoardSQL.replyBoard1", map);
		sqlSession.insert("cBoardSQL.replyBoard2", map);
		sqlSession.insert("cBoardSQL.replyBoard3", map);
	}

	@Override
	public void writeCmnt(Map<String, String> map) {
		sqlSession.insert("cBoardSQL.writeCmnt", map);
	}

	@Override
	public List<CommunityBoardCmntDTO> getCmntList(Map<String, Object> map) {
		return sqlSession.selectList("cBoardSQL.getCmntList", map);
	}

	@Override
	public CommunityBoardCmntDTO viewCmnt(Map<String, Object> map) {
		return sqlSession.selectOne("cBoardSQL.viewCmnt", map);
	}

	@Override
	public void modifyCmnt(Map<String, String> map) {
		sqlSession.update("cBoardSQL.modifyCmnt", map);
	}

	@Override
	public void deleteCmnt(String rseq) {
		sqlSession.update("cBoardSQL.deleteCmnt1", Integer.parseInt(rseq));
		sqlSession.update("cBoardSQL.deleteCmnt2", Integer.parseInt(rseq));
		sqlSession.update("cBoardSQL.deleteCmnt3", Integer.parseInt(rseq));
		
	}

	@Override
	public int getCmntTotalA(int bseq) {
		return sqlSession.selectOne("cBoardSQL.getCmntTotalA", bseq);
	}

	@Override
	public void replyCmnt(Map<String, Object> map) {
		sqlSession.insert("cBoardSQL.replyCmnt1", map);
		sqlSession.insert("cBoardSQL.replyCmnt2", map);
		sqlSession.insert("cBoardSQL.replyCmnt3", map);
	}
}
