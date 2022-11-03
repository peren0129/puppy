package qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PopController {
	private final String command = "/popup.qna";
	private String getPage = "/popup";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String popup() {
		System.out.println();
		return getPage;
	}
}
