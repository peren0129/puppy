package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberLoginController {
	public final String command = "/login.mem";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String loginGet() {
		System.out.println("로그인 페이지로 이동");
		return "/loginForm";
	}
}
