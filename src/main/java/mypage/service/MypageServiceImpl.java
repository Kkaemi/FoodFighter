package mypage.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityBoardDTO;
import community.bean.QnaBoardDTO;
import member.bean.MemberDTO;
import mypage.dao.MypageDAO;
import review.bean.ReviewDTO;

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

	@Override
	public List<ReviewDTO> myreviewGetList(Map<String,Object> map) {
		
		return mypageDAO.myreviewGetList(map);
	}


	@Override
	public ReviewDTO getModalView(String seq_review) {

		return mypageDAO.getModalView(seq_review);
	}

	@Override
	public int getReviewNum(String nickname) {

		return mypageDAO.getReviewNum(nickname);
	}

	@Override
	public int getPostNum(String nickname) {

		return mypageDAO.getPostNum(nickname);
	}

	@Override
	public int getReplyNum(String nickname) {

		return mypageDAO.getReplyNum(nickname);
	}

	@Override
	public List<CommunityBoardDTO> getMyPost(String nickname) {

		return mypageDAO.getMyPost(nickname);
	}

	@Override
	public List<QnaBoardDTO> getMyAsk(String nickname) {

		return mypageDAO.getMyAsk(nickname);
	}

	@Override
	public void socialModify(Map<String,Object> map) {
		mypageDAO.socialModify(map);
		
	}

}
