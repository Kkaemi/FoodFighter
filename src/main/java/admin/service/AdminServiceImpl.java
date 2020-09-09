package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminMemberPaging;
import admin.bean.AdminShopPaging;
import admin.dao.AdminDAO;
import member.bean.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private AdminMemberPaging adminPaging;
	@Autowired
	private AdminShopPaging adminShopPaging;

	@Override
	public List<MemberDTO> getMemberList(Map<String,Object> map) {
		
		return adminDAO.getMemberList(map);
	}

	@Override
	public AdminMemberPaging getAdminPaging(String pg) {
		int totalA= adminDAO.getMemberTotalA();
		
		adminPaging.setCurrentPage(Integer.parseInt(pg));
		adminPaging.setPageBlock(5);
		adminPaging.setPageSize(10);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		return adminPaging;
	}

	@Override
	public void AdminWithdraw(String member_seq) {
		adminDAO.AdminWithdraw(Integer.parseInt(member_seq));
		
	}

	@Override
	public List<MemberDTO> getMemberSearch(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("pg"))*10;
		int startNum = endNum-9;

		map.put("startNum",startNum);
		map.put("endNum",endNum);
		
		return adminDAO.getMemberSearch(map);
	}

	@Override
	public AdminMemberPaging getSearchPaging(Map<String, Object> map) {
		int totalA= adminDAO.getSearchTotalA(map); 
		
		adminPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		adminPaging.setPageBlock(5);
		adminPaging.setPageSize(10);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		return adminPaging;
	}

	@Override
	public AdminShopPaging getAdminShopPaging(String pg) {
		int totalA= adminDAO.getShopTotalA();
		
		adminShopPaging.setCurrentPage(Integer.parseInt(pg));
		adminShopPaging.setPageBlock(5);
		adminShopPaging.setPageSize(10);
		adminShopPaging.setTotalA(totalA);
		adminShopPaging.makePagingHTML();
		
		return adminShopPaging;
	}

	@Override
	public List<MemberDTO> getResList(Map<String, Object> map) {
		
		return adminDAO.getResList(map);
	}

	@Override
	public void adminShopDelete(String resSeq) {
		adminDAO.adminShopDelete(resSeq);
		
	}
}
