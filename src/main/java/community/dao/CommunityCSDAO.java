package community.dao;

import java.util.List;
import java.util.Map;

import community.bean.QnaBoardDTO;

public interface CommunityCSDAO {
	
	public void qnaWrite(Map<String, String> map);

	public List<QnaBoardDTO> getQnaBoardList(Map<String, Integer> map);
	
	public List<QnaBoardDTO> getQnaBoardSearchList(Map<String, String> map);

	public int getTotalA();

	public int getTotalSearchA(Map<String, String> map);
	
	public String password_loading(String seq);

	public QnaBoardDTO getBoard(String seq);

	public void qnaReply(Map<String, String> map);

	public void qnaDelete(String seq);

	public void qnaModify(Map<String, Object> map);

	public void qnaHit(String seq);

	public List<QnaBoardDTO> getQnaViewList(String seq);
	
}
