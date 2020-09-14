package admin.service;

import java.util.List;
import java.util.Map;

import admin.bean.AdminMemberPaging;
import admin.bean.AdminShopPaging;
import member.bean.MemberDTO;

import admin.bean.RestaurantDTO;

public interface AdminService {

	public List<MemberDTO> getMemberList(Map<String,Object> map);

	public AdminMemberPaging getAdminPaging(String pg);

	public void AdminWithdraw(String member_seq);

	public List<MemberDTO> getMemberSearch(Map<String, Object> map);

	public AdminMemberPaging getSearchPaging(Map<String, Object> map);

	public AdminShopPaging getAdminShopPaging(String pg);

	public List<MemberDTO> getResList(Map<String, Object> map);

	public void adminShopDelete(String resSeq);
	
	public void resWrite(RestaurantDTO restaurantDTO);

	public AdminShopPaging getShopSearchPaging(Map<String, Object> map);

	public List<MemberDTO> getShopSearch(Map<String, Object> map);

	public Map<String, Object> getReviewData();

	public Map<String, Object> getPostData();

	public Map<String, Object> getQnaData();

	public Map<String, Object> getJoinData();

	public Map<String, Object> getFoodData();

	public Map<String, Object> getPriceData();

	public Map<String, Object> getJoinwayData();
}
