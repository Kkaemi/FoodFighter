package community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.CommunityBoardCmntDTO;
import community.bean.CommunityBoardDTO;
import community.bean.CommunityBoardPaging;
import community.dao.CommunityBoardDAO;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {
	@Autowired
	private CommunityBoardDAO cBoardDAO;
	@Autowired
	private CommunityBoardPaging cBPaging;
	
	@Override
	public void writeBoard(Map<String, String> map) {
		cBoardDAO.writeBoard(map);
	}

	@Override
	public List<CommunityBoardDTO> getCBoardList(String pg) {
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return cBoardDAO.getCBoardList(map);
	}

	@Override
	public CommunityBoardPaging cBPaging(String pg) {
		int totalA = cBoardDAO.getTotalA(); //총 글수
		
		cBPaging.setCurrentPage(Integer.parseInt(pg));
		cBPaging.setPageBlock(10);
		cBPaging.setPageSize(10);
		cBPaging.setTotalA(totalA);
		cBPaging.makePagingHTML();
		
		return cBPaging;
	}
	
	@Override
	public List<CommunityBoardDTO> getCBoardSrch(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");

		return cBoardDAO.getCBoardSrch(map);
	}
	
	@Override
	public CommunityBoardPaging cBPaging(Map<String, String> map) {
		int totalA = cBoardDAO.getCBSrchTotalA(map);
		
		cBPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		cBPaging.setPageBlock(10);
		cBPaging.setPageSize(10);
		cBPaging.setTotalA(totalA);
		cBPaging.makeSearchPagingHTML(map.get("bKeyword"), map.get("bSrchOption"));
		
		return cBPaging;
	}

	@Override
	public void deleteBoardAdmin(List<String> list) {
		cBoardDAO.deleteBoardAdmin(list);
	}

	@Override
	public CommunityBoardDTO viewBoard(String bseq) {
		return cBoardDAO.viewBoard(bseq);
	}

	@Override
	public void hitUpdate(String bseq) {
		cBoardDAO.hitUpdate(bseq);
	}

	@Override
	public CommunityBoardDTO viewPrevBoard(String bseq) {
		return cBoardDAO.viewPrevBoard(bseq);
	}

	@Override
	public CommunityBoardDTO viewNextBoard(String bseq) {
		return cBoardDAO.viewNextBoard(bseq);
	}

	@Override
	public CommunityBoardDTO viewSrchPrevBoard(Map<String, String> map) {
		return cBoardDAO.viewSrchPrevBoard(map);
	}

	@Override
	public CommunityBoardDTO viewSrchNextBoard(Map<String, String> map) {
		return cBoardDAO.viewSrchNextBoard(map);
	}

	@Override
	public void modifyBoard(Map<String, String> map) {
		cBoardDAO.modifyBoard(map);
	}

	@Override
	public void deleteBoard(String bseq) {
		cBoardDAO.deleteBoard(bseq);
	}

	@Override
	public void replyBoard(Map<String, String> map) {
		cBoardDAO.replyBoard(map);
	}

	@Override
	public void writeCmnt(Map<String, String> map) {
		cBoardDAO.writeCmnt(map);
	}

	@Override
	public List<CommunityBoardCmntDTO> getCmntList(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("num"))*10;
		int startNum = endNum-9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		return cBoardDAO.getCmntList(map);
	}

	@Override
	public CommunityBoardPaging cmntPaging(Map<String, Object> map) {
		int totalA = cBoardDAO.getCmntTotalA(Integer.parseInt((String) map.get("bseq"))); //총 글수
		
		cBPaging.setCurrentPage(Integer.parseInt((String) map.get("num")));
		cBPaging.setPageBlock(10);
		cBPaging.setPageSize(10);
		cBPaging.setTotalA(totalA);
		cBPaging.makeCmntPagingHTML();

		return cBPaging;
	}

	@Override
	public CommunityBoardCmntDTO viewCmnt(Map<String, Object> map) {
		return cBoardDAO.viewCmnt(map);
	}

	@Override
	public void modifyCmnt(Map<String, String> map) {
		cBoardDAO.modifyCmnt(map);
	}

	@Override
	public void deleteCmnt(String rseq) {
		cBoardDAO.deleteCmnt(rseq);
	}

	@Override
	public void replyCmnt(Map<String, Object> map) {
		cBoardDAO.replyCmnt(map);
	}

	@Override
	public int getCmntCnt(String bseq) { //댓글 갯수
		return cBoardDAO.getCmntTotalA(Integer.parseInt(bseq));
	}

}
