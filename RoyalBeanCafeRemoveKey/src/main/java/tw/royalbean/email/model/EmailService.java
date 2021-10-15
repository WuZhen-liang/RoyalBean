package tw.royalbean.email.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	@Autowired
	private CreateCode createCode;
		
	public String createCode() {
		return createCode.createCode();
	}		
	
}
