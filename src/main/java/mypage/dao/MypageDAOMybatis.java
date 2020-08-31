package mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MypageDAOMybatis implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getInfo(String email) {

		return sqlSession.selectOne("mypageSQL.getInfo", email);
	}

	@Override
	public void withdraw(String email) {
		sqlSession.delete("mypageSQL.withdraw", email);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		if(memberDTO.getProfile() == null) {
			sqlSession.update("mypageSQL.modify", memberDTO);
		}else {
			sqlSession.update("mypageSQL.modifyP", memberDTO);
		}
		
		
	}

	@Override
	public void modifyPwd(Map<String, String> map) {
		sqlSession.update("mypageSQL.modifyPwd", map);
		
	}
}
