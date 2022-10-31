package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberJoinController {

	@RequestMapping("/join.mem")
	public String join() {
		System.out.println();
		return "/joinForm";
	}
}
