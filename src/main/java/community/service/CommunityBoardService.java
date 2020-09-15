package community.service;

import java.util.List;
import java.util.Map;

import community.bean.CommunityBoardCmntDTO;
import community.bean.CommunityBoardDTO;
import community.bean.CommunityBoardPaging;

public interface CommunityBoardService {

	public void writeBoard(Map<String, String> map);

	public List<CommunityBoardDTO> getCBoardList(String pg);

	public CommunityBoardPaging cBPaging(String pg);

	public void deleteBoardAdmin(List<String> list);

	public List<CommunityBoardDTO> getCBoardSrch(Map<String, String> map);

	public CommunityBoardPaging cBPaging(Map<String, String> map);

	public CommunityBoardDTO viewBoard(String bseq);

	public void hitUpdate(String bseq);

	public CommunityBoardDTO viewPrevBoard(String bseq);

	public CommunityBoardDTO viewNextBoard(String bseq);

	public CommunityBoardDTO viewSrchPrevBoard(Map<String, String> map);

	public CommunityBoardDTO viewSrchNextBoard(Map<String, String> map);

	public void modifyBoard(Map<String, String> map);

	public void deleteBoard(String bseq);

	public void replyBoard(Map<String, String> map);

	public void writeCmnt(Map<String, String> map);

	public List<CommunityBoardCmntDTO> getCmntList(Map<String, Object> map);

	public CommunityBoardPaging cmntPaging(Map<String, Object> map);

	public CommunityBoardCmntDTO viewCmnt(Map<String, Object> map);

	public void modifyCmnt(Map<String, String> map);

	public void deleteCmnt(String rseq);

	public void replyCmnt(Map<String, Object> map);

	public int getCmntCnt(String bseq);

}
