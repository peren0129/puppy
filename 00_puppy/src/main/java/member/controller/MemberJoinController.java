package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberJoinController {
	public final String command = "/join.mem";
	private String getPage = "/joinForm";
	private String gotoPage = "redirect:/login.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String joinGet() {
		System.out.println("회원가입 페이지로 이동/join.mem");
		return "/joinForm";
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView joinPost(@ModelAttribute("member") @Valid MemberBean member, 
			BindingResult result) throws Exception {
		System.out.println("로그인 페이지로 이동/join.mem");
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			System.out.println("가입 정규식 오류/join.mem");
			System.out.println("hasErrors : "+result.hasErrors());
			System.out.println("getErrorCount : "+result.getErrorCount());
			System.out.println("getAllErrors : "+result.getAllErrors());
			mav.setViewName(getPage);
			return mav;
		}
		memberDao.joinMember(member);
		mav.setViewName(gotoPage);
		return mav;
	}
}
