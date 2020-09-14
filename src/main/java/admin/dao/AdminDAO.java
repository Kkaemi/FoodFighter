package admin.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> getMemberList(Map<String,Object> map);

	public int getMemberTotalA();

	public void AdminWithdraw(int member_seq);

	public List<MemberDTO> getMemberSearch(Map<String, Object> map);

	public int getSearchTotalA(Map<String, Object> map);

	public int getShopTotalA();

	public List<MemberDTO> getResList(Map<String, Object> map);

	public void adminShopDelete(int resSeq);

	public int shopSearchTotalA(Map<String, Object> map);

	public List<MemberDTO> getShopSearch(Map<String, Object> map);

	public Map<String, Object> getReviewData();

	public Map<String, Object> getPostData();

	public Map<String, Object> getQnaData();

	public Map<String, Object> getJoinData();

	public Map<String, Object> getFoodData();

	public Map<String, Object> getPriceData();

	public Map<String, Object> getJoinwayData();

}
