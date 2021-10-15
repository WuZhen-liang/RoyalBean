package tw.royalbean.email.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import tw.royalbean.email.model.EmailAPI;
import tw.royalbean.email.model.EmailService;

// 這是個範例

@RestController
public class CodeController {
	@Autowired
	private EmailService emailService;
	@Autowired
	private EmailAPI emailAPI;
	
	@GetMapping(path = "just_a_sample/memberactive/{code}")
	public String name(@PathVariable("code")String code) {
		return "I get your code = "+code;
	}
	
	@GetMapping(path = "just_a_sample/createCode")
	public String createCodeAction() {
		String text="This is your code. \n\n"+"http://localhost:8080/memberactive/"+emailService.createCode()+"\n\n Please use it.";
		
		emailAPI.SendEmail("cdsad6959@gmail.com","This mail is from Dio",text);
		
		return "Success";
	}
	
	
}
