package mypage.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public MemberDTO getInfo(String email) {
		
		return mypageDAO.getInfo(email);
	}

	@Override
	public void withdraw(String email) {
		mypageDAO.withdraw(email);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		mypageDAO.modify(memberDTO);
		
	}

	@Override
	public void modifyPwd(Map<String, String> map) {
		mypageDAO.modifyPwd(map);
		
	}

}
