package member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class MemberJoinController {

	public final String command = "/join.mem";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String joinGet() {
		System.out.println("회원가입 페이지로 이동");
		return "/joinForm";
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String joinPost(@ModelAttribute("member") @Valid MemberBean member, 
			BindingResult result, HttpServletResponse response) throws Exception {
		System.out.println("로그인 페이지로 이동");

		PrintWriter writer = response.getWriter();
		if(result.hasErrors()) {
			System.out.println("가입 정규식 오류");
			System.out.println("hasErrors : "+result.hasErrors());
			System.out.println("getErrorCount : "+result.getErrorCount());
			System.out.println("getAllErrors : "+result.getAllErrors());
			return "/joinForm";
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('가입이 완료되었습니다.\n로그인후에 이용하세요.');");
		writer.println("location.href='login.mem';");
		writer.println("</script>");
		writer.flush();

		return "redirect:/login.mem";
	}
}
