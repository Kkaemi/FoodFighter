package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDTO> getMemberList(Map<String,Object> map) {
	
		return sqlSession.selectList("adminSQL.getMemberList",map);

	}

	@Override
	public int getMemberTotalA() {

		return sqlSession.selectOne("adminSQL.getMemberTotalA");
	}

	@Override
	public void AdminWithdraw(int member_seq) {

		sqlSession.delete("adminSQL.AdminWithdraw", member_seq);
		
	}

	@Override
	public List<MemberDTO> getMemberSearch(Map<String, Object> map) {

		return sqlSession.selectList("adminSQL.getMemberSearch", map);
	}

	@Override
	public int getSearchTotalA(Map<String, Object> map) {

		return sqlSession.selectOne("adminSQL.getSearchTotalA", map);
	}

	@Override
	public int getShopTotalA() {

		return sqlSession.selectOne("adminSQL.getShopTotalA");
	}

	@Override
	public List<MemberDTO> getResList(Map<String, Object> map) {

		return sqlSession.selectList("adminSQL.getResList",map);
	}

	@Override
	public void adminShopDelete(String resSeq) {
		sqlSession.delete("adminSQL.adminShopDelete", resSeq);
		
	}
	
}
