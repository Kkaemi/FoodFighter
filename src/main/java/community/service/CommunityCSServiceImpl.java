package community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.QnaBoardDTO;
import community.bean.QnaBoardPaging;
import community.dao.CommunityCSDAO;
import member.bean.MemberDTO;

@Service
public class CommunityCSServiceImpl implements CommunityCSService {
	
	@Autowired
	private CommunityCSDAO communityCSDAO;
	@Autowired
	private QnaBoardPaging boardPaging;
	@Autowired
	private HttpSession session;

	@Override
	public List<QnaBoardDTO> getQnaBoardList(String pg) {
		
		// 1페이지 당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum - 9;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return communityCSDAO.getQnaBoardList(map);
	}
	
	@Override
	public List<QnaBoardDTO> getQnaBoardSearchList(Map<String, String> map) {
		
		int pg = Integer.parseInt(map.get("pg"));
		
		// 1페이지 당 10개씩
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return communityCSDAO.getQnaBoardSearchList(map);
	}

	@Override
	public QnaBoardPaging boardPaging(String pg) {
		
		int currentPage = Integer.parseInt(pg);
		int totalA = communityCSDAO.getTotalA();
		
		boardPaging.setCurrentPage(currentPage);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}

	@Override
	public QnaBoardPaging boardPaging(Map<String, String> map) {
		
		int pg = Integer.parseInt(map.get("pg"));
		
		int currentPage = pg;
		int totalA = communityCSDAO.getTotalSearchA(map);
		
		boardPaging.setCurrentPage(currentPage);
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}
	
	@Override
	public void qnaWrite(Map<String, String> map) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		String id = memberDTO.getName();
		String nickname = memberDTO.getNickname();
		String email = memberDTO.getEmail();
		
		map.put("id", id);
		map.put("nickname", nickname);
		map.put("email", email);
		
		communityCSDAO.qnaWrite(map);
	}

	@Override
	public boolean passwordCheck(Map<String, String> map) {
		
		String seq = map.get("seq");
		String password1 = map.get("password");
		String password2 = communityCSDAO.password_loading(seq);
		
		if (password1.equals(password2)) return true;
		
		return false;
	}

	@Override
	public QnaBoardDTO getBoard(String seq) {
		return communityCSDAO.getBoard(seq);
	}

	@Override
	public void qnaReply(Map<String, String> map) {
		
		String pseq = map.get("pseq");
		
		// 원글
		QnaBoardDTO pDTO = communityCSDAO.getBoard(pseq);
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		String nickname = memberDTO.getNickname();
		String email = memberDTO.getEmail();
		
		map.put("id", pDTO.getNickname());
		map.put("nickname", nickname);
		map.put("email", email);
		map.put("password", pDTO.getPassword());
		
		map.put("ref", pDTO.getRef()+""); // 원글의 그룹번호
		map.put("lev", pDTO.getLev()+""); // 원글의 lev
		map.put("step", pDTO.getStep()+""); // 원글의 step
		
		communityCSDAO.qnaReply(map);
		
	}

	@Override
	public void qnaDelete(String seq) {
		communityCSDAO.qnaDelete(seq);
	}

	@Override
	public void qnaModify(Map<String, Object> map) {
		communityCSDAO.qnaModify(map);
	}

	@Override
	public void qnaHit(String seq) {
		communityCSDAO.qnaHit(seq);
	}

	@Override
	public List<QnaBoardDTO> getQnaViewList(String seq) {
		return communityCSDAO.getQnaViewList(seq);
	}

}