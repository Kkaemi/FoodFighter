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

	public void adminShopDelete(String resSeq);

}
