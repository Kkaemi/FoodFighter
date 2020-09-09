package admin.service;

import java.util.List;
import java.util.Map;

import admin.bean.AdminMemberPaging;
import admin.bean.AdminShopPaging;
import member.bean.MemberDTO;

public interface AdminService {

	public List<MemberDTO> getMemberList(Map<String,Object> map);

	public AdminMemberPaging getAdminPaging(String pg);

	public void AdminWithdraw(String member_seq);

	public List<MemberDTO> getMemberSearch(Map<String, Object> map);

	public AdminMemberPaging getSearchPaging(Map<String, Object> map);

	public AdminShopPaging getAdminShopPaging(String pg);

	public List<MemberDTO> getResList(Map<String, Object> map);

	public void adminShopDelete(String resSeq);

}
