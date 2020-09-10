package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public void write(MemberDTO memberDTO);
	
	public String checkEmail(String email);

	public String checkNickname(String nickname);
	
	//로그인
	public MemberDTO login(Map<String, String> map);

	public MemberDTO getforgotId(Map<String, String> map);
	
	public MemberDTO userInfo(Map<String, String> map);

	public void pwdUpdate(MemberDTO memberDTO);

	public MemberDTO kakaologin(String email);

	public void socialWrite(MemberDTO memberDTO);
}