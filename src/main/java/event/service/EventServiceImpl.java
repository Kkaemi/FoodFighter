package event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.bean.EventDTO;
import event.bean.EventPaging;
import event.dao.EventDAO;


@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private EventPaging eventPaging;

	@Override
	public void eventWrite(Map<String, String> map) {
		eventDAO.eventWrite(map);	
	}

	@Override
	public List<EventDTO> eventBoardList(String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return eventDAO.eventBoardList(map);
	}

	@Override
	public void hit(String seq_event) {
		eventDAO.hit(seq_event);
	}

	@Override
	public EventDTO geteventBoardtView(String seq_event) {
		return eventDAO.geteventBoardtView(seq_event);
	}

	@Override
	public void eventBoardModify(Map<String, Object> map) {
			eventDAO.eventBoardModify(map);
		
	}

	@Override
	public void eventBoardDelete(String seq_event) {
		eventDAO.eventBoardDelete(seq_event);
	}

	//eventList페이징처리
	@Override
	public EventPaging eventPaging(String pg) {
		//총글수
		int totalA = eventDAO.geteventTotalA();
		
		//현재페이지
		eventPaging.setCurrentPage(Integer.parseInt(pg));
		
		eventPaging.setPageBlock(3);
		eventPaging.setPageSize(5);
		eventPaging.setTotalA(totalA);
		eventPaging.makePagingHTML();
		return eventPaging;
	}

	//검색
	@Override
	public List<EventDTO> getEventSearch(Map<String, String> map) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return eventDAO.getEventSearch(map);
	}
	
	//검색후 eventList페이징처리
	@Override
	public EventPaging eventPaging(Map<String, String> map) {
		//총글수
		int totalA = eventDAO.geteventSearchTotalA(map);
		
		//현재페이지
		eventPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		
		eventPaging.setPageBlock(3);
		eventPaging.setPageSize(5);
		eventPaging.setTotalA(totalA);
		eventPaging.makePagingHTML();
		return eventPaging;
	}

}
