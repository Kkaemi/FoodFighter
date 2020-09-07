package community.service;

import java.util.List;
import java.util.Map;

import community.bean.QnaBoardDTO;
import community.bean.QnaBoardPaging;

public interface CommunityCSService {
	
	public List<QnaBoardDTO> getQnaBoardList(String pg);
	
	public List<QnaBoardDTO> getQnaBoardSearchList(Map<String, String> map);
	
	public QnaBoardPaging boardPaging(String pg);

	public QnaBoardPaging boardPaging(Map<String, String> map);
	
	public void qnaWrite(Map<String, String> map);

	public boolean passwordCheck(Map<String, String> map);

	public QnaBoardDTO getBoard(String seq);
	
}
