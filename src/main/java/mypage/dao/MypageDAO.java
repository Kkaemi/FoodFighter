package mypage.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import review.bean.ReviewDTO;

public interface MypageDAO {

	public MemberDTO getInfo(String email);

	public void withdraw(String email);

	public void modify(MemberDTO memberDTO);

	public void modifyPwd(Map<String, String> map);

	public List<ReviewDTO> myreviewGetList(Map<String,Object> map);

	public ReviewDTO getModalView(String seq_review);

}
