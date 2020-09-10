package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {
	
	public void write(MemberDTO memberDTO);

	public MemberDTO checkEmail(String email);

	public MemberDTO checkNickname(String nickname);
	
	//로그인
	public MemberDTO login(Map<String, String> map);
	
	public MemberDTO getforgotId(Map<String, String> map);

	public void pwdUpdate(MemberDTO memberDTO);

	public MemberDTO userInfo(Map<String, String> map);

	public MemberDTO kakaologin(String email);

	public void socialWrite(MemberDTO memberDTO);
}
