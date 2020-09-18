package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write", memberDTO);
		
	}

	@Override
	public MemberDTO checkEmail(String email) {
		return sqlSession.selectOne("memberSQL.checkEmail",email);
	}

	@Override
	public MemberDTO checkNickname(String nickname) {
		return sqlSession.selectOne("memberSQL.checkNickname",nickname);
	}
	
	//로그인
	@Override
	public MemberDTO login(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.login", map);
	}
	
	@Override
	public MemberDTO getforgotId(Map<String, String> map) {	
		//System.out.println(map.get("nickName"));
		return sqlSession.selectOne("memberSQL.getforgotId", map);
	}

	@Override
	public void pwdUpdate(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.pwdUpdate", memberDTO);
		
	}

	@Override
	public MemberDTO userInfo(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.userInfo", map);
	}

	@Override
	public MemberDTO kakaologin(String email) {
		return sqlSession.selectOne("memberSQL.kakaologin",email);
	}

	@Override
	public void socialWrite(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.socialWrite", memberDTO);
		
	}
	
}