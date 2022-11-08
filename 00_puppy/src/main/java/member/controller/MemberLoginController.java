package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;




/*경로 수정하기*/




@Controller
public class MemberLoginController {
	public final String command = "/login.mem";

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String loginGet() {
		System.out.println("로그인 페이지로 이동(GET)/login.mem");
		return "/loginForm";
	}

	//경고 무시 어노테이션
	@SuppressWarnings("unused")
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String loginPost(
			MemberBean member, HttpServletResponse response,
			HttpSession session) throws IOException{

		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();

		MemberBean login = memberDao.getMember(member.getMember_id());
		
		System.out.println("*** MemberLoginController ***");
		System.out.println("id info : "+login.getMember_id());

		if(login != null) { // 기존 회원
			if(member.getPasswd().equals(login.getPasswd())) { // 비번 일치
				String destination = (String)session.getAttribute("destination");
				session.setAttribute("loginInfo", login);
				 if(login.getMember_id().equals("admin")){ 
					 return "/loginForm"; 
					 }
				return "/loginForm";
			}else { // 비밀번호 불일치
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비밀번호가 일치하지 않습니다.');");
				writer.println("</script>");
				writer.flush();
				return "/loginForm";
			}
		}else { // 회원 정보 없음
			System.out.println("회원 정보 없음");

			writer.println("<script type='text/javascript'>");
			writer.println("alert('존재하지 않는 회원입니다.');");
			writer.println("</script>");
			writer.flush();
			return "/loginForm";
		}
	}
}













