package mypage.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityBoardDTO;
import community.bean.QnaBoardDTO;
import member.bean.MemberDTO;
import mypage.bean.MypagePaging;
import mypage.dao.MypageDAO;
import review.bean.ReviewDTO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	@Autowired
	private MypagePaging mypagePaging;
	
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
	public List<CommunityBoardDTO> getMyPost(Map<String, Object> listMap) {

		return mypageDAO.getMyPost(listMap);
	}

	@Override
	public List<QnaBoardDTO> getMyAsk(Map<String, Object> listMap) {

		return mypageDAO.getMyAsk(listMap);
	}

	@Override
	public void socialModify(Map<String,Object> map) {
		mypageDAO.socialModify(map);
		
	}

	@Override
	public MypagePaging myPostPaging(Map<String, Object> map) {
		int totalA= mypageDAO.getPostTotalA(map);
		
		mypagePaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		mypagePaging.setPageBlock(5);
		mypagePaging.setPageSize(5);
		mypagePaging.setTotalA(totalA);
		mypagePaging.makePagingHTML();
		
		return mypagePaging;
	}

	@Override
	public MypagePaging myAskPaging(Map<String, Object> map) {
		int totalA= mypageDAO.getAskTotalA(map);
		
		mypagePaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		mypagePaging.setPageBlock(5);
		mypagePaging.setPageSize(5);
		mypagePaging.setTotalA(totalA);
		mypagePaging.makePagingHTML();
		
		return mypagePaging;
	}

	@Override
	public void deleteReview(String seq_review) {
		mypageDAO.deleteReview(seq_review);
		
	}

}
