package member.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value="login")
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired 
	private JavaMailSender mailSender;
	
	// 로그인 폼
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "/jsp/login/loginForm";
	}
	

	//이메일 찾기 페이지
		@RequestMapping(value="forgotIdForm", method=RequestMethod.GET)
		public String forgotIdForm() {
			return "/jsp/login/forgotIdForm";
		}
	
	
	//비밀번호 찾기 페이지
		@RequestMapping(value="forgotPwdForm", method=RequestMethod.GET)
		public String forgotPwdForm() {
			return "/jsp/login/forgotPwdForm";
		}
		
		//로그인
		@RequestMapping(value="login", method=RequestMethod.POST)
		public @ResponseBody String login(@RequestParam Map<String,String> map,
										  HttpSession session) {
					
			MemberDTO memberDTO = memberService.login(map);

				if(memberDTO != null && passEncoder.matches(map.get("pwd"), memberDTO.getPwd())) {
				session.setAttribute("memId", memberDTO.getEmail());
				session.setAttribute("memberDTO", memberDTO);
				
				if (memberDTO.getNickname().equals("관리자")) {
					return "admin";

				} else {
					
					 return "success";
				}
			
			}else {
				
				return "fail";
			}
		
			}
		
		//카카오로그인
		@RequestMapping(value="kakaologin", method=RequestMethod.POST)
		@ResponseBody
		public String kakaologin(@RequestParam String email, HttpSession session) {
		
			MemberDTO memberDTO = memberService.kakaologin(email);
			
			if(memberDTO != null) {
			session.setAttribute("memId", memberDTO.getEmail());
			session.setAttribute("memberDTO", memberDTO);

				
					return "success";

				} else {
					
					return "fail";
				}
			}
			
		
		//로그아웃
	      @RequestMapping(value="/logout", method=RequestMethod.GET)
	      public ModelAndView logout(HttpSession session) {
	         session.invalidate();
	         return new ModelAndView("redirect:/");
	      }

		
		//비밀번호 찾기
		@RequestMapping(value="/getforgotId", method=RequestMethod.POST)
		public ModelAndView getforgotId(@RequestParam Map<String, String> map) {
			ModelAndView mav = new ModelAndView();
			
			MemberDTO memberDTO = memberService.getforgotId(map);
			
			if(memberDTO == null) {
				mav.addObject("find","no");
			}else {
				mav.addObject("find","yes");
				mav.addObject("memberDTO", memberDTO);			
			}
			mav.setViewName("jsonView");
			return mav;
		}
		
		
		@RequestMapping(value="getforgotpwd", method=RequestMethod.POST)
		public @ResponseBody String getforgotpwd(@RequestParam Map<String, String> map){
			//System.out.println(">>>>>>>>>>>>>>>>>> getforgotpwd");
			MemberDTO memberDTO = memberService.userInfo(map); 
			//System.out.println("1111");
			if (memberDTO == null) {
				return "fail";
				
			} else {
				// pwd update 
				String pass = passEncoder.encode("1234");
				memberDTO.setPwd(pass);
				
				memberService.pwdUpdate(memberDTO);
				// email send 

		        String setfrom = "foodfighter@gmail.com";
		        String tomail = map.get("email"); // 받는 사람 이메일
		        String title = "FoodFighter 임시비밀번호 발송 메일 입니다.."; 
		        String content =
		                
		        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다."+

		        " 임시비밀번호는 " + "1234"+ " 입니다. "+
		        
		        " 임시 비밀번호이니 꼭 비밀번호 수정하시기 바랍니다."; 
		        
		        
		        try {
		        	MimeMessage message = mailSender.createMimeMessage();
		        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
		            messageHelper.setTo(tomail); // 받는사람 이메일
		            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		            messageHelper.setText(content); // 메일 내용
		            
		            mailSender.send(message);
		        } catch (Exception e) {
		            System.out.println(e);
		        }
				
				return "success";
			}
		
		}

}
