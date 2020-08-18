package event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="event")
public class EventController {
	
	// 이벤트 리스트
	@RequestMapping(value="eventList", method=RequestMethod.GET)
	public String eventList() {
		return "/jsp/event/eventList";
		
	}
	
	// 이벤트 수정창
	@RequestMapping(value="eventModifyForm", method=RequestMethod.GET)
	public String eventModifyForm() {
		return "/jsp/event/eventModifyForm";
		
	}
	
	// 이벤트 뷰 창
	@RequestMapping(value="eventView", method=RequestMethod.GET)
	public String eventView() {
		return "/jsp/event/eventView";
		
	}
	
	// 이벤트 쓰는 창
	@RequestMapping(value="eventWrite", method=RequestMethod.GET)
	public String eventWrite() {
		return "/jsp/event/eventWrite";
		
	}
	
	
}
