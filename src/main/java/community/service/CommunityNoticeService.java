package community.service;

import java.util.List;
import java.util.Map;

import community.bean.CommunityNoticeDTO;
import community.bean.CommunityNoticePaging;

public interface CommunityNoticeService {
	public void writeNotice(Map<String, String> map);

	public List<CommunityNoticeDTO> getCNoticeList(String pg);

	public CommunityNoticePaging cNPaging(String pg);
	
	public List<CommunityNoticeDTO> getCNoticeSrch(Map<String, String> map);
	
	public CommunityNoticePaging cNPaging(Map<String, String> map);
	
	public void hitUpdate(String nseq);

	public void deleteNoticeAdmin(List<String> list);
	
	public CommunityNoticeDTO viewNotice(String nseq);
	
	public CommunityNoticeDTO viewPrevNoitce(String nseq);
	
	public CommunityNoticeDTO viewNextNoitce(String nseq);

	public CommunityNoticeDTO viewSrchPrevNoitce(Map<String, String> map);
	
	public CommunityNoticeDTO viewSrchNextNotice(Map<String, String> map);

	public void modifyNotice(Map<String, String> map);

	public void deleteNotice(String nseq);

}
