package event.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import event.bean.EventCoDTO;
import event.bean.EventDTO;
import event.bean.EventPaging;
import event.service.EventService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value="event")
public class EventController {
	@Autowired
	private EventService eventService;
	
	
	
	private static final String UPLOAD_PATH =
	//"/Users/aria.k/Downloads/bit/fighter/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/fighter/storage/community";
	"D:\\spring\\Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FoodFighter\\storage\\event";
	
	// 이벤트 리스트
	@RequestMapping(value="/eventList", method = RequestMethod.GET)
	public String eventList(@RequestParam(required=false, defaultValue="1") String pg,  Model model) {
		
		model.addAttribute("pg", pg);
		return "/jsp/event/eventList";
		
	}
	
	//이벤트 리스트
	@RequestMapping(value="/eventBoardList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView eventBoardList(@RequestParam(required=false, defaultValue="1") String pg, HttpSession session,
																HttpServletResponse response) {
			String email = (String) session.getAttribute("memId");
			//String nickname = (String) session.getAttribute("memnickname");
			//System.out.println("pg = " +pg);
			//쿠키
			if(email != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30*60);
			cookie.setPath("/");
			response.addCookie(cookie);//클라이언트에게 보내기
			}
			
			//1페이지당 5개
			List<EventDTO> list = eventService.eventBoardList(pg);
			
			//페이징 처리
			EventPaging eventPaging = eventService.eventPaging(pg);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg",pg);
			mav.addObject("list",list);
			mav.addObject("eventPaging",eventPaging);
			mav.addObject("memId", email);
			//mav.addObject("memnickname",nickname);
			mav.setViewName("jsonView");
			return mav;
		
	}
	
	//이벤트 글쓰기창
	@RequestMapping(value="eventWriteForm", method=RequestMethod.GET)
	public String eventWriteForm() {
		return "/jsp/event/eventWriteForm";
	}
	
	// 이벤트 글쓰기 이미지올리기 
		@RequestMapping(value="eventWriteImage", method=RequestMethod.POST)
		@ResponseBody
		public String eventWriteImage(@RequestParam("file") MultipartFile[] files) throws Exception {
			String fileName = "";
			String saveName = "";
			String url = "";
			
			for (int i = 0; i < files.length; i++) {
				fileName = files[i].getOriginalFilename(); 
				UUID uuid = UUID.randomUUID();
				String extension = fileName.substring(fileName.lastIndexOf(".") + 1); 
				saveName = uuid + "_." + extension;
				
				File file = new File(UPLOAD_PATH, saveName); 
				files[i].transferTo(file); 
				
				Tika tika = new Tika();
				String mimeType = tika.detect(file);
				
				if (mimeType.startsWith("image")) {
					url = "/FoodFighter/storage/event/" + saveName;
				} else {
					url = "noimage";
					file.delete();
				}
			}
			
			return url;
			
		}
		
	//이벤트 글쓰기 (controller)
	   @RequestMapping(value="eventWrite", method=RequestMethod.POST)
	   public String eventWrite(HttpSession session,@RequestParam Map<String, String> map, String pg, Model model) {
		  MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
	      map.put("email", memberDTO.getEmail());      
	      //System.out.println("syout" +map);
	      
	      map.put("nickname", memberDTO.getNickname());
	     // System.out.println("세션값 확인 =" +memberDTO.getNickname());
	      model.addAttribute("pg", pg);
	      eventService.eventWrite(map);
	      
	      //System.out.println(session.getAttribute("nickname"));
	      return "/jsp/event/eventList";
	   }
	
	// 이벤트 수정창
	@RequestMapping(value="eventModifyForm", method=RequestMethod.POST)
	public String eventModifyForm(@RequestParam String seq_event, @RequestParam String pg, Model model) {
		
		model.addAttribute("seq_event", seq_event);
		model.addAttribute("pg", pg);
		return "/jsp/event/eventModifyForm";
		
	}
	
	@RequestMapping(value="eventBoardModify", method=RequestMethod.POST)
	@ResponseBody
	public void eventBoardModify(@RequestParam Map<String, Object> map) {
		eventService.eventBoardModify(map);	
	}
	
	
	
	// 이벤트 뷰 창
	@RequestMapping(value="eventView", method=RequestMethod.GET)
	public String eventView(@RequestParam String seq_event, @RequestParam String pg, Model model) {
		
		model.addAttribute("seq_event",seq_event);
		model.addAttribute("pg",pg);
		return "/jsp/event/eventView";
		
	}
	
	@RequestMapping(value="geteventBoardtView", method=RequestMethod.POST)
	public ModelAndView geteventBoardtView(@RequestParam String seq_event, @CookieValue(value="memHit", required=false)
												Cookie cookie,HttpServletResponse response,HttpSession session){
		//System.out.println(seq_event);
	
		String email = (String) session.getAttribute("memId");
		
		//쿠키 - 조회수 증가
		//System.out.println(cookie);
		if(cookie != null) {//쿠키존재여부묻기
		eventService.hit(seq_event);//조회수 증가
		
		
		//쿠키삭제
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		}
		
		EventDTO eventDTO = eventService.geteventBoardtView(seq_event);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventDTO",eventDTO);
		mav.addObject("memId", email);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="eventBoardDelete", method=RequestMethod.POST)
	public String eventBoardDelete(@RequestParam String seq_event) {
		eventService.eventBoardDelete(seq_event);
		return "/jsp/event/eventList";	
	}
	
	@RequestMapping(value="getEventSearch", method=RequestMethod.GET)
	public ModelAndView getEventSearch(@RequestParam Map<String, String> map) {
		
		List<EventDTO> list = eventService.getEventSearch(map);
		
		//페이징 처리
		EventPaging eventPaging = eventService.eventPaging(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list",list);
		mav.addObject("eventPaging",eventPaging);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value = "eventBoardListDelete", method = RequestMethod.POST)
	@ResponseBody
	public void eventBoardListDelete(@RequestParam(value="deleteSelect[]")List<String> list) {
		eventService.eventBoardListDelete(list);	
	}
	
	@RequestMapping(value = "eventboardcomment", method = RequestMethod.POST)
	@ResponseBody
	public void eventboardcomment(@RequestParam Map<String,String> map) {
		eventService.eventboardcommentwirte(map);
	}
	
	@RequestMapping(value = "eventboardcommentList", method = RequestMethod.GET, produces={"application/json"})
	@ResponseBody
	public List<EventCoDTO> eventboardcommentList(@RequestParam(required=false, defaultValue="1") String pg,
														@RequestParam Map<String,Object> map, HttpServletRequest session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		map.put("pg", pg);
		List<EventCoDTO> list = eventService.eventboardcommentList(map);
		

		if(list != null) {
			
			return list;
			
		}else {
			
			return null;
		}
	}
	
	@RequestMapping(value="geteventBoardtcommentView", method=RequestMethod.GET)
	public ModelAndView geteventBoardtcommentView(@RequestParam String seq_event, String seq_eventco){
		
		//String email = (String) session.getAttribute("memId");
		
		EventCoDTO eventCoDTO = eventService.geteventBoardtcommentView(seq_event,seq_eventco);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventCoDTO",eventCoDTO);
		//mav.addObject("memId", email);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="eventBoardcommentModify", method=RequestMethod.POST)
	@ResponseBody
	public void eventBoardcommentModify(@RequestParam Map<String, String> map) {
		eventService.eventBoardcommentModify(map);
	}
	
	@RequestMapping(value="eventBoardcommentDelete", method=RequestMethod.POST)
	@ResponseBody
	public void eventBoardcommentDelete(@RequestParam String seq_eventco) {
		eventService.eventBoardcommentDelete(seq_eventco);
	}
	
}
