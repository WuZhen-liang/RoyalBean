package tw.royalbean.email.model;

import org.springframework.stereotype.Repository;

@Repository("createCode")
public class CreateCode {
	
	public String createCode() {		
		String string = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";
		int n =20;
		char[] ch =new char[n];
		for(int i=0;i<n;i++) {
			int index = (int) Math.floor(Math.random()*60);
			ch[i] = string.charAt(index);		
		}		
		String result = String.valueOf(ch);
		return result;
	}
	
	public String createCodeBynumber(int n) {		
		String string = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";
		char[] ch =new char[n];
		for(int i=0;i<n;i++) {
			int index = (int) Math.floor(Math.random()*60);
			ch[i] = string.charAt(index);		
		}		
		String result = String.valueOf(ch);
		return result;
	}
		
}
