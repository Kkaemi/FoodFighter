package community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;

@Repository
@Transactional
public class CommunityRankMybatis implements CommunityRankDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityRankResDTO> getRankResList() {
		return sqlSession.selectList("cRankSQL.getRankResList");
	}

	@Override
	public List<CommunityRankMemDTO> getRankMemList() {
		return sqlSession.selectList("cRankSQL.getRankMemList");
	}
}
