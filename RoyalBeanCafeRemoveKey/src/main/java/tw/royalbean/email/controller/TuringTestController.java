package tw.royalbean.email.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TuringTestController {
	
	@GetMapping(path = "/turingtest")
	public String TruringTest() {
		return "member/turingTestSample";
	}
	
	
}
