package kr.or.ddit.member.web;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value = "/ddit_signup", method = RequestMethod.GET)
	public String signup() {
		
		return "pages/ddit_signup";
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST) 
	public String signupCheck(MemberVO memberVO, Model model) {
		
		int result = memberService.signup(memberVO);
		System.out.println("result : " + result);
		if(result == 1) {
			model.addAttribute("flag","ok");  //"success"라는 값을 "flag"라는 이름으로 보내겠다.
			return "pages/ddit_signin";
		} else {
			model.addAttribute("flag","error");
			return "pages/ddit_signup";
		}
		
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String signin() {
		
		return "pages/ddit_signin";
	}
	
	@RequestMapping(value = "/signin.do" , method = RequestMethod.POST)
	public String signinCheck(MemberVO memberVO, HttpServletRequest req, Model model) {
		
		log.info(memberVO.getMemId()); 
		log.info(memberVO.getMemPw());
		
		HttpSession session = req.getSession(); 
		MemberVO vo = memberService.signin(memberVO); 
		System.out.println("vo :" + vo);
		
		if(vo != null) { 
			session.setAttribute("memberVO", vo); 
			return "redirect: /board/boardlist.do";
		}else { 
			model.addAttribute("flag","no");
		    return "pages/ddit_signin";
		}
	}
}
