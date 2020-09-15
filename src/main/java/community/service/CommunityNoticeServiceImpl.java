package community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityNoticeDTO;
import community.bean.CommunityNoticePaging;
import community.dao.CommunityNoticeDAO;

@Service
public class CommunityNoticeServiceImpl implements CommunityNoticeService {
	@Autowired
	private CommunityNoticeDAO cNoticeDAO;
	@Autowired
	private CommunityNoticePaging cNpaging;
	
	@Override
	public void writeNotice(Map<String, String> map) {
		cNoticeDAO.writeNotice(map);
	}

	@Override
	public List<CommunityNoticeDTO> getCNoticeList(String pg) {
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return cNoticeDAO.getCNoticeList(map);
	}

	@Override
	public CommunityNoticePaging cNPaging(String pg) {
		int totalA = cNoticeDAO.getTotalA(); //총 글수
		
		cNpaging.setCurrentPage(Integer.parseInt(pg));
		cNpaging.setPageBlock(10);
		cNpaging.setPageSize(10);
		cNpaging.setTotalA(totalA);
		cNpaging.makePagingHTML();
		
		return cNpaging;
	}

	@Override
	public List<CommunityNoticeDTO> getCNoticeSrch(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		
		return cNoticeDAO.getCNoticeSrch(map);
	}

	@Override
	public CommunityNoticePaging cNPaging(Map<String, String> map) {
		int totalA = cNoticeDAO.getCNSrchTotalA(map);
		
		cNpaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		cNpaging.setPageBlock(10);
		cNpaging.setPageSize(10);
		cNpaging.setTotalA(totalA);
		cNpaging.makeSearchPagingHTML(map.get("nKeyword"), map.get("nSrchOption"));
		
		return cNpaging;
	}
	
	@Override
	public void hitUpdate(String nseq) {
		cNoticeDAO.hitUpdate(nseq);
	}

	@Override
	public void deleteNoticeAdmin(List<String> list) {
		cNoticeDAO.deleteNoticeAdmin(list);
	}

	@Override
	public CommunityNoticeDTO viewNotice(String nseq) {
		return cNoticeDAO.viewNotice(nseq);
	}

	@Override
	public CommunityNoticeDTO viewPrevNoitce(String nseq) {
		return cNoticeDAO.viewPrevNoitce(nseq);
	}

	@Override
	public CommunityNoticeDTO viewNextNoitce(String nseq) {
		return cNoticeDAO.viewNextNoitce(nseq);
	}
	
	@Override
	public CommunityNoticeDTO viewSrchPrevNoitce(Map<String, String> map) {
		return cNoticeDAO.viewSrchPrevNoitce(map);
	}
	
	@Override
	public CommunityNoticeDTO viewSrchNextNotice(Map<String, String> map) {
		return cNoticeDAO.viewSrchNextNotice(map);
	}

	@Override
	public void modifyNotice(Map<String, String> map) {
		cNoticeDAO.modifyNotice(map);
	}

	@Override
	public void deleteNotice(String nseq) {
		cNoticeDAO.deleteNotice(nseq);
	}

}
