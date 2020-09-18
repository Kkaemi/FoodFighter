package community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityBoardDTO;
import community.bean.CommunityNoticeDTO;
import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;
import community.dao.CommunityBoardDAO;
import community.dao.CommunityNoticeDAO;
import community.dao.CommunityRankDAO;
import event.bean.EventDTO;
import event.dao.EventDAO;

@Service
public class CommunityMainServiceImpl implements CommunityMainService {
	@Autowired
	private CommunityBoardDAO cBoardDAO;
	@Autowired
	private CommunityNoticeDAO cNoticeDAO;
	@Autowired
	private CommunityRankDAO cRankDAO;
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<CommunityBoardDTO> getCBoardList() {
		int endNum = 1*7;
		int startNum = endNum-6;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return cBoardDAO.getCBoardList(map);
	}
	
	@Override
	public List<CommunityNoticeDTO> getCNoticeList() {
		int endNum = 1*7;
		int startNum = endNum-6;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return cNoticeDAO.getCNoticeList(map);
	}

	@Override
	public List<CommunityRankMemDTO> getRankMemList() {
		return cRankDAO.getRankMemList();
	}

	@Override
	public List<CommunityRankResDTO> getRankResList() {
		return cRankDAO.getRankResList();
	}

	@Override
	public List<EventDTO> getEventList() {
		int endNum = 1*7;
		int startNum = endNum-6;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return eventDAO.eventBoardList(map);
	}
}
