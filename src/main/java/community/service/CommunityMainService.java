package community.service;

import java.util.List;

import community.bean.CommunityBoardDTO;
import community.bean.CommunityNoticeDTO;
import community.bean.CommunityRankMemDTO;
import community.bean.CommunityRankResDTO;
import event.bean.EventDTO;

public interface CommunityMainService {

	public List<CommunityBoardDTO> getCBoardList();

	public List<CommunityNoticeDTO> getCNoticeList();

	public List<CommunityRankMemDTO> getRankMemList();

	public List<CommunityRankResDTO> getRankResList();

	public List<EventDTO> getEventList();

}
