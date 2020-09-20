package member.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value = "member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	JavaMailSender mailSender; 
	
	// 회원가입 폼
	@RequestMapping(value = "signupForm", method = RequestMethod.GET)

	public String signupForm() {

		return "/jsp/member/signupForm";

	}

	// signup Choice
	@RequestMapping(value = "signupChoice", method = RequestMethod.GET)
	public String signupChoice() {

		return "/jsp/member/signupChoice";
	}
	
	// 소셜 회원가입폼
	@RequestMapping(value = "socialSignupForm", method = RequestMethod.GET)
	public String socialSignupForm() {

		return "/jsp/member/socialSignupForm";
	}
	
	//회원가입할 때 비밀번호 암호화해서 DB저장
	@RequestMapping(value="signup",method=RequestMethod.POST)
	public @ResponseBody void signup(HttpSession session,@ModelAttribute MemberDTO memberDTO) {
		String secretPwd = passEncoder.encode(memberDTO.getPwd());
		memberDTO.setPwd(secretPwd);
		memberService.write(memberDTO);
		
		session.invalidate();//인증번호 세션 삭제
	}
	//소셜(카카오)이메일 저장
	@RequestMapping(value="kakaoSignup", method=RequestMethod.POST)
	public @ResponseBody void kakaoSignup(@RequestParam String email, HttpSession session) {
			session.setAttribute("kakaoEmail", email);
		
	}
	//소셜 회원가입
	@RequestMapping(value = "socialSignup", method = RequestMethod.POST)
	public  @ResponseBody void socialSignup(HttpSession session,@ModelAttribute MemberDTO memberDTO) {
	
		 memberService.socialWrite(memberDTO); 
		
		session.invalidate();
		
	}
	
	
	//이메일 중복 여부
	@RequestMapping(value="checkEmail",method=RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email) {
	
		//System.out.println("넘어옴");
		return memberService.checkEmail(email);
	}
	//닉네임 중복 여부
	@RequestMapping(value="checkNickname",method=RequestMethod.POST)
	public @ResponseBody String checkNickname(@RequestParam String nickname) {
	
		
		return memberService.checkNickname(nickname);
	}
	
	//인증 메일 보내기
	@RequestMapping( value = "signupSendMail" , method=RequestMethod.POST )
	@ResponseBody
	public String signupSendMail(@RequestParam(required=false) String email) throws IOException {

        Random random = new Random();
        int authCode = random.nextInt(4589362) + 49311; 
        
		
		  String setfrom = "foodfighter159@gmail.com"; String tomail = email; String
		  title = "Food-Fighter 회원가입 인증 이메일 입니다."; String content =
		  
		  System.getProperty("line.separator")+
		  
		  System.getProperty("line.separator")+
		  
		  "안녕하세요 food-fighter에서 회원가입 인증코드를 안내 해 드립니다."
		  
		  +System.getProperty("line.separator")+
		  
		   System.getProperty("line.separator")+
		  
		  " 인증번호는 " +authCode+ " 입니다. "
		  
		  +System.getProperty("line.separator")+
		  
		  System.getProperty("line.separator")+
		  
		  "받으신 인증번호를 인증코드 란에 입력해 주시면 회원가입을 계속 진행하실 수 있습니다.";
		  
		  
		  try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		  messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		  
		  messageHelper.setFrom(setfrom); messageHelper.setTo(tomail);
		  messageHelper.setSubject(title); messageHelper.setText(content);
		  
		  mailSender.send(message); } catch (Exception e) { System.out.println(e); }
		 
      
        return authCode+"";
        
    }
	
}
