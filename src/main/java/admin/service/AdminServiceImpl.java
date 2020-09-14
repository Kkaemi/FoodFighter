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

import admin.bean.RestaurantDTO;
import admin.dao.RestaurantDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private AdminMemberPaging adminPaging;
	@Autowired
	private AdminShopPaging adminShopPaging;
	@Autowired
	private RestaurantDAO restaurantDAO;

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
		adminDAO.adminShopDelete(Integer.parseInt(resSeq));
		
	}
	@Override
	public void resWrite(RestaurantDTO restaurantDTO) {
		restaurantDAO.resWrite(restaurantDTO);
		
	}

	@Override
	public AdminShopPaging getShopSearchPaging(Map<String, Object> map) {
		int totalA= adminDAO.shopSearchTotalA(map);
		
		adminShopPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		adminShopPaging.setPageBlock(5);
		adminShopPaging.setPageSize(10);
		adminShopPaging.setTotalA(totalA);
		adminShopPaging.makePagingHTML();
		
		return adminShopPaging;
	}

	@Override
	public List<MemberDTO> getShopSearch(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("pg"))*10;
		int startNum = endNum-9;

		map.put("startNum",startNum);
		map.put("endNum",endNum);
		return adminDAO.getShopSearch(map);
	}

	@Override
	public Map<String, Object> getReviewData() {
		
		return adminDAO.getReviewData();
	}

	@Override
	public Map<String, Object> getPostData() {

		return adminDAO.getPostData();
	}

	@Override
	public Map<String, Object> getQnaData() {

		return adminDAO.getQnaData();
	}

	@Override
	public Map<String, Object> getJoinData() {

		return adminDAO.getJoinData();
	}

	@Override
	public Map<String, Object> getFoodData() {

		return adminDAO.getFoodData();
	}

	@Override
	public Map<String, Object> getPriceData() {

		return adminDAO.getPriceData();
	}

	@Override
	public Map<String, Object> getJoinwayData() {

		return adminDAO.getJoinwayData();
	}
}



