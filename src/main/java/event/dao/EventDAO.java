package event.dao;

import java.util.List;
import java.util.Map;

import event.bean.EventDTO;

public interface EventDAO {

	public void eventWrite(Map<String, String> map);

	public List<EventDTO> eventBoardList(Map<String, Integer> map);

	public void hit(String seq_event);
	
	public EventDTO geteventBoardtView(String seq_event);

	public void eventBoardModify(Map<String, Object> map);

	public int geteventTotalA();
	
	public void eventBoardDelete(String seq_event);

	public List<EventDTO> getEventSearch(Map<String, String> map);

	public int geteventSearchTotalA(Map<String, String> map);

}
