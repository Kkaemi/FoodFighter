package community.service;

import java.util.List;

import community.bean.BoardPaging;
import community.bean.QnAboardDTO;


public interface CommunityBoardService {

	List<QnAboardDTO> getBoardList(String pg);

	BoardPaging boardPaging(String pg);

}
