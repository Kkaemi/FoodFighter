package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDTO> getMemberList(Map<String,Object> map) {
	
		return sqlSession.selectList("adminSQL.getMemberList",map);

	}

	@Override
	public int getMemberTotalA() {

		return sqlSession.selectOne("adminSQL.getMemberTotalA");
	}

	@Override
	public void AdminWithdraw(int member_seq) {

		sqlSession.delete("adminSQL.AdminWithdraw", member_seq);
		
	}

	@Override
	public List<MemberDTO> getMemberSearch(Map<String, Object> map) {

		return sqlSession.selectList("adminSQL.getMemberSearch", map);
	}

	@Override
	public int getSearchTotalA(Map<String, Object> map) {

		return sqlSession.selectOne("adminSQL.getSearchTotalA", map);
	}

	@Override
	public int getShopTotalA() {

		return sqlSession.selectOne("adminSQL.getShopTotalA");
	}

	@Override
	public List<MemberDTO> getResList(Map<String, Object> map) {

		return sqlSession.selectList("adminSQL.getResList",map);
	}

	@Override
	public void adminShopDelete(int resSeq) {
		sqlSession.delete("adminSQL.adminShopDelete", resSeq);
		
	}

	@Override
	public int shopSearchTotalA(Map<String, Object> map) {

		return sqlSession.selectOne("adminSQL.shopSearchTotalA", map);
	}

	@Override
	public List<MemberDTO> getShopSearch(Map<String, Object> map) {

		return sqlSession.selectList("adminSQL.getShopSearch", map);
	}

	@Override
	public Map<String, Object> getReviewData() {
		Map<String,Object> reviewMap = new HashMap<String,Object>();
		
		reviewMap.put("todayReview", sqlSession.selectOne("adminSQL.getTodayReview"));
		reviewMap.put("totalReview", sqlSession.selectOne("adminSQL.getTotalReview"));
		
		
		return reviewMap;
	}

	@Override
	public Map<String, Object> getPostData() {
		Map<String,Object> postMap = new HashMap<String,Object>();

		postMap.put("todayPost",sqlSession.selectOne("adminSQL.getTodayPost"));
		postMap.put("totalPost", sqlSession.selectOne("adminSQL.getTotalPost"));
		
		return postMap;
	}

	@Override
	public Map<String, Object> getQnaData() {
		Map<String,Object> qnaMap = new HashMap<String,Object>();
		qnaMap.put("todayQna",sqlSession.selectOne("adminSQL.getTodayQna"));
		qnaMap.put("totalQna",sqlSession.selectOne("adminSQL.getTotalQna"));
		
		return qnaMap;
	}

	@Override
	public Map<String, Object> getJoinData() {
		Map<String,Object> countJMap = new HashMap<String,Object>();
		countJMap.put("todayJoin",sqlSession.selectOne("adminSQL.getTodayJoin"));
		countJMap.put("totalJoin",sqlSession.selectOne("adminSQL.getTotalJoin"));
		
		return countJMap;
	}

	@Override
	public Map<String, Object> getFoodData() {
		Map<String,Object> foodMap = new HashMap<String,Object>();
		
		foodMap.put("kFood",sqlSession.selectOne("adminSQL.getKFood"));
		foodMap.put("wFood",sqlSession.selectOne("adminSQL.getWFood"));
		foodMap.put("cFood",sqlSession.selectOne("adminSQL.getCFood"));
		foodMap.put("jFood",sqlSession.selectOne("adminSQL.getJFood"));
		foodMap.put("dessert",sqlSession.selectOne("adminSQL.getDessert"));
		
		return foodMap;
	}

	@Override
	public Map<String, Object> getPriceData() {
		Map<String,Object> priceMap = new HashMap<String,Object>();
		
		priceMap.put("under1",sqlSession.selectOne("adminSQL.getUnder1"));
		priceMap.put("manwon1",sqlSession.selectOne("adminSQL.getManwon1"));
		priceMap.put("manwon2",sqlSession.selectOne("adminSQL.getManwon2"));
		priceMap.put("manwon3",sqlSession.selectOne("adminSQL.getManwon3"));
		priceMap.put("manwon4",sqlSession.selectOne("adminSQL.getManwon4"));
	
		return priceMap;
	}

	@Override
	public Map<String, Object> getJoinwayData() {
		Map<String,Object> joinMap = new HashMap<String,Object>();		
		joinMap.put("joinKakao",sqlSession.selectOne("adminSQL.getJoinKakao"));
		joinMap.put("join",sqlSession.selectOne("adminSQL.getJoin"));
		
		return joinMap;
	}

	
}
