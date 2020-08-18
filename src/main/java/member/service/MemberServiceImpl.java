package member.service;

import org.springframework.beans.factory.annotation.Autowired;

import member.dao.MemberDAO;

public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
}
