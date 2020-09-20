package mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import community.bean.CommunityBoardDTO;
import community.bean.QnaBoardDTO;
import member.bean.MemberDTO;
import review.bean.ReviewDTO;

@Repository
@Transactional
public class MypageDAOMybatis implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getInfo(String email) {

		return sqlSession.selectOne("mypageSQL.getInfo", email);
	}

	@Override
	public void withdraw(String email) {
		sqlSession.delete("mypageSQL.withdraw", email);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		if(memberDTO.getProfile() == null) {
			sqlSession.update("mypageSQL.modify", memberDTO);
		}else {
			sqlSession.update("mypageSQL.modifyP", memberDTO);
		}
		
		
	}

	@Override
	public void modifyPwd(Map<String, String> map) {
		sqlSession.update("mypageSQL.modifyPwd", map);
		
	}

	@Override
	public List<ReviewDTO> myreviewGetList(Map<String,Object> map) {
		
		return sqlSession.selectList("mypageSQL.myreviewGetList", map);
	}

	@Override
	public ReviewDTO getModalView(String seq_review) {

		return sqlSession.selectOne("mypageSQL.getModalView",Integer.parseInt(seq_review));
	}

	@Override
	public int getReviewNum(String nickname) {

		return sqlSession.selectOne("mypageSQL.getReviewNum", nickname);
	}

	@Override
	public int getPostNum(String nickname) {

		return sqlSession.selectOne("mypageSQL.getPostNum", nickname);
	}

	@Override
	public int getReplyNum(String nickname) {

		return sqlSession.selectOne("mypageSQL.getReplyNum", nickname);
	}

	@Override
	public List<CommunityBoardDTO> getMyPost(Map<String, Object> listMap) {

		return sqlSession.selectList("mypageSQL.getMyPost", listMap);
	}

	@Override
	public List<QnaBoardDTO> getMyAsk(Map<String, Object> listMap) {

		return sqlSession.selectList("mypageSQL.getMyAsk", listMap);
	}

	@Override
	public void socialModify(Map<String,Object> map) {
		sqlSession.update("mypageSQL.socialModify", map);
		
	}

	@Override
	public int getPostTotalA(Map<String, Object> map) {

		return sqlSession.selectOne("mypageSQL.getPostTotalA", map);
	}

	@Override
	public int getAskTotalA(Map<String, Object> map) {

		return sqlSession.selectOne("mypageSQL.getAskTotalA", map);
	}

	@Override
	public void deleteReview(String seq_review) {
		sqlSession.delete("mypageSQL.deleteReview", seq_review);
		
	}
}
