package event.service;

import java.util.List;
import java.util.Map;

import event.bean.EventCoDTO;
import event.bean.EventDTO;
import event.bean.EventPaging;

public interface EventService {

	public void eventWrite(Map<String, String> map);

	public List<EventDTO> eventBoardList(String pg);

	public void hit(String seq_event);

	public EventDTO geteventBoardtView(String seq_event);

	public void eventBoardModify(Map<String, Object> map);

	public void eventBoardDelete(String seq_event);

	public EventPaging eventPaging(String pg);

	public List<EventDTO> getEventSearch(Map<String, String> map);

	public EventPaging eventPaging(Map<String, String> map);

	public void eventBoardListDelete(List<String> list);

	public void eventboardcommentwirte(Map<String, String> map);

	public List<EventCoDTO> eventboardcommentList(Map<String, Object> map);

	public EventCoDTO geteventBoardtcommentView(String seq_event, String seq_eventco);

	public void eventBoardcommentModify(Map<String, String> map);

	public void eventBoardcommentDelete(String seq_eventco);

}
