package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(String userid, Model model) {
		
		
		log.info("@ChatController, GET Chat / Username : " + userid);
		
		model.addAttribute("userid", userid);
		
		return "chat";
	}
}
