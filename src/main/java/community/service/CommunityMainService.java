package community.service;

import java.util.List;

import community.bean.CommunityBoardDTO;
import community.bean.CommunityNoticeDTO;

public interface CommunityMainService {

	public List<CommunityBoardDTO> getCBoardList();

	public List<CommunityNoticeDTO> getCNoticeList();

}
