package community.dao;

import java.util.List;
import java.util.Map;

import community.bean.CommunityBoardCmntDTO;
import community.bean.CommunityBoardDTO;

public interface CommunityBoardDAO {

	public void writeBoard(Map<String, String> map);
	
	public List<CommunityBoardDTO> getCBoardList(Map<String, Integer> map);

	public int getTotalA();

	public void deleteBoardAdmin(List<String> list);

	public List<CommunityBoardDTO> getCBoardSrch(Map<String, String> map);

	public int getCBSrchTotalA(Map<String, String> map);

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

	public int getCmntTotalA(int bseq);

	public CommunityBoardCmntDTO viewCmnt(Map<String, Object> map);

	public void modifyCmnt(Map<String, String> map);

	public void deleteCmnt(String rseq);

	public void replyCmnt(Map<String, Object> map);

}
