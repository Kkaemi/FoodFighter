package member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
		
	}

	@Override
	public String checkEmail(String email) {
		MemberDTO memberDTO = memberDAO.checkEmail(email);
		if(memberDTO == null)
			return "non_exist";
		else
			return "exist";
	}

	@Override
	public String checkNickname(String nickname) {
		MemberDTO memberDTO = memberDAO.checkNickname(nickname);
		if(memberDTO == null)
			return "non_exist";
		else
			return "exist";
	}
	
	//로그인
	
	@Override
	public MemberDTO login(Map<String, String> map) {
		return memberDAO.login(map);
	}
	@Override
	public MemberDTO getforgotId(Map<String, String> map) {
		return memberDAO.getforgotId(map);
	}

	@Override
	public void pwdUpdate(MemberDTO memberDTO) {
		 memberDAO.pwdUpdate(memberDTO);
		
	}

	@Override
	public MemberDTO userInfo(Map<String, String> map) {
		return memberDAO.userInfo(map);
	}

	@Override
	public MemberDTO kakaologin(String email) {
		return memberDAO.kakaologin(email);
	}

	@Override
	public void socialWrite(MemberDTO memberDTO) {
		memberDAO.socialWrite(memberDTO);
		
	}
	
	
}
