package tw.royalbean.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;



/**
 * 接收Client送來的WebSocket訊息及推送給前端的訊息
 */
@Controller
@SessionAttributes(names = {"memberID","companyID","admin"})
public class ChatController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private CompanyService cService;
    
    /**
     * 處理前端加入聊天室的訊息，並把訊息推送給前端
     */
    @MessageMapping("/join")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, 
            SimpMessageHeaderAccessor headerAccessor) {
        // 把username加入WebSocket的Session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    /**
     * 處理前端送來的聊天訊息，並把訊息推送給前端
     */
    @MessageMapping("/chat")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    @GetMapping(path="/user/{memberID}/cht")
	public String membercht(@PathVariable("memberID") String mid,Model p) {
    	Member member = mService.findById(Integer.parseInt(mid));
    	
    	p.addAttribute("member",member);
		return"/websocket/index";
	}
    @GetMapping(path="/company/{companyID}/cht")
	public String companycht(@PathVariable("companyID") String cid,Model p) {
    	Company company = cService.findById(Integer.parseInt(cid));
    	p.addAttribute("company",company);
		return"/websocket/index";
	}
    @GetMapping(path="/admin/cht")
	public String admincht(@RequestParam("admin") String admin,Model p) {
    	p.addAttribute("admin", admin);
		return"/websocket/index";
	}
	

}