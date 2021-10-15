package tw.royalbean.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberContent;
import tw.royalbean.member.model.MemberService;

@RestController
public class MemberController {
	@Autowired
	private MemberService mService;
	
// 	------------------------------------  member	------------------------
	@GetMapping(path = "/member_delete/{mid}")
	public String processDeleteMember(@PathVariable("mid") Integer cid) {
		mService.deleteById(cid);
		return "Success";
	}
	
	@GetMapping(path = "/member_find/{mid}")
	public Member processFindMember(@PathVariable("mid") Integer memberID) {
		return mService.findById(memberID);
	}
	
	@PostMapping(path = "/member_update")
	public Member processMemberUpdateAction(@RequestBody Member member) {
		String encodepwd = new BCryptPasswordEncoder().encode(member.getPwd());
//		之後改為內部抓資料後傳進去
		member.setActive("Y");
		member.setBlackList("W");
		member.setPwd(encodepwd);
		return mService.saveAndUpdate(member);		
	}
	
	@GetMapping(path = "/member_finded_all")
	public List<Member> processFindAllMember() {
		return mService.findAlldata();
	}
	
//  ---------------------------------MemberContent--------------------------------------------

//	@GetMapping(path = "/membercontent_delete/{id}")
	public String processMemberContentDeleteAction(@PathVariable("id") Integer id) {
		mService.deleteMemberContent(id);
		return "Success";
	}
	
	
}
