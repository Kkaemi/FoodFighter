package mypage.dao;

import java.util.List;
import java.util.Map;

import community.bean.CommunityBoardDTO;
import community.bean.QnaBoardDTO;
import member.bean.MemberDTO;
import review.bean.ReviewDTO;

public interface MypageDAO {

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

	public int getPostTotalA(Map<String, Object> map);

	public int getAskTotalA(Map<String, Object> map);

	public void deleteReview(String seq_review);

}
