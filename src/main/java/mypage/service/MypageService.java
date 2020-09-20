package mypage.service;

import java.util.List;
import java.util.Map;

import community.bean.CommunityBoardDTO;
import community.bean.QnaBoardDTO;
import member.bean.MemberDTO;
import mypage.bean.MypagePaging;
import review.bean.ReviewDTO;

public interface MypageService {

	public MemberDTO getInfo(String email);

	public void withdraw(String email);

	public void modify(MemberDTO memberDTO);

	public void modifyPwd(Map<String, String> map);

	public List<ReviewDTO> myreviewGetList(Map<String,Object> map);

	public ReviewDTO getModalView(String seq_review);

	public int getReviewNum(String nickname);

	public int getPostNum(String nickname);

	public int getReplyNum(String nickname);

	public List<CommunityBoardDTO> getMyPost(Map<String, Object> listMap);

	public List<QnaBoardDTO> getMyAsk(Map<String, Object> listMap);

	public void socialModify(Map<String,Object> map);

	public MypagePaging myPostPaging(Map<String, Object> map);

	public MypagePaging myAskPaging(Map<String, Object> map);

	public void deleteReview(String seq_review);


}
