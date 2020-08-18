package community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.bean.BoardPaging;
import community.bean.QnAboardDTO;
import community.dao.CommunityBoardDAO;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {

	@Override
	public List<QnAboardDTO> getBoardList(String pg) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardPaging boardPaging(String pg) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
