package tw.royalbean.homepage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomepageController {

	@GetMapping(path = "/homepage")
	public String homePage() {
		return "/HomePage/index";
	}
	
	@GetMapping(path = "/backhome")
	public String backhome() {
		return "/BackSystem/backHome";
	}
	
	@GetMapping(path = "/venderlogin")
	public String venderlogin() {
		return "/vender/venderLogin";
	}
}
