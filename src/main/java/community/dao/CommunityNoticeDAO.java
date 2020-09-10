package community.dao;

import java.util.List;
import java.util.Map;

import community.bean.CommunityNoticeDTO;

public interface CommunityNoticeDAO {

	public void writeNotice(Map<String, String> map);

	public List<CommunityNoticeDTO> getCNoticeList(Map<String, Integer> map);

	public int getTotalA();
	
	public List<CommunityNoticeDTO> getCNoticeSrch(Map<String, String> map);
	
	public int getCNSrchTotalA(Map<String, String> map);
	
	public void hitUpdate(String seq);

	public void deleteNoticeAdmin(List<String> list);

	public CommunityNoticeDTO viewNotice(String seq);

	public CommunityNoticeDTO viewPrevNoitce(String seq);

	public CommunityNoticeDTO viewNextNoitce(String seq);
	
	public CommunityNoticeDTO viewSrchPrevNoitce(Map<String, String> map);
	
	public CommunityNoticeDTO viewSrchNextNotice(Map<String, String> map);

	public void modifyNotice(Map<String, String> map);

	public void deleteNotice(String seq);

}
