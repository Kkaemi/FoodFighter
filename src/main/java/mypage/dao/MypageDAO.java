package mypage.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MypageDAO {

	public MemberDTO getInfo(String email);

	public void withdraw(String email);

	public void modify(MemberDTO memberDTO);

	public void modifyPwd(Map<String, String> map);

}
