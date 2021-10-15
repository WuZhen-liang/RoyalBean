package tw.royalbean.member.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberContent;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.member.model.PeopleNumberLogin;


@Controller
@SessionAttributes(names = {"totalPages_member","totalElements_member","totalPages_MemberContent","totalElements_MemberContent"})
public class BackgroundController {
	@Autowired
	private MemberService mService;
	@Autowired
	private CompanyService cService;
	
//	---------------------------member BS-------------------------------
	@GetMapping(path = "admin/memberBackSystem")
	public String processMemberAdminSystemAction() {
		return "BackSystem/memberBackSystem";
	}
	
//	---------------------------company BS-------------------------------
	@GetMapping(path = "admin/companyBackSystem")
	public String processCompanyAdminSystemAction(Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(0, pageSize);
		Page<Company> page3= cService.findAllByPage(pageable);
		int totalPages3 = page3.getTotalPages();
		long totalElements3 = page3.getTotalElements();
		m.addAttribute("totalPages_company",totalPages3);
		m.addAttribute("totalElements_company",totalElements3);
		return "BackSystem/companyBackSystem";
	}	
	
//	--------------------member chart BS-----------------------------------------
	@GetMapping(path = "admin/memberBackSystemData")
	public String processMemberChartSystemAction(Model m) {		
		List<MemberContent> woman= mService.findMemberGender("%女%");
		List<MemberContent> man= mService.findMemberGender("%男%");
		m.addAttribute("manNumber",man.size());
		m.addAttribute("womanNumber",woman.size());		
		int respeople= mService.findAlldata().size();
		m.addAttribute("ResPeople", respeople);
		return "member/memberChartBackSystem";
	}
	
	@GetMapping(path = "admin/TotalLoginPeople")
	@ResponseBody
	public List<PeopleNumberLogin> processTotalVisitor() {
		Calendar calendar =Calendar.getInstance();
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);
		String yearS = "%"+String.valueOf(year)+"%";  
		return mService.LoginPeopleForMonth(yearS);
	}
	
	
//  ---------------------------------Member--------------------------------------------	
	@GetMapping(path = "/BackgroundSearchMemberfindAlldata")
	@ResponseBody	
	public List<Member> processMemberAllSearchAction(){	
		return mService.findAlldata();
	}
	
	@PostMapping(path = "admin/BackgroundSearchMember_findAlldata/{pageNo}")
	@ResponseBody
	public List<Member> queryMemberByPageAction(@PathVariable("pageNo")int pageNo,Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Member> page= mService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		m.addAttribute("totalPages_member",totalPages);
		m.addAttribute("totalElements_member",totalElements);
		
		return page.getContent();
	}
	
	@GetMapping(path = "admin/member_ban/{mid}")
	public String processBanMember(@PathVariable("mid") Integer memberID) {		
		Member member =	mService.findById(memberID);
		member.setBlackList("B");		
		mService.saveAndUpdate(member);
		return "BackSystem/memberBackSystem";
	}
	
	@GetMapping(path = "admin/member_open/{mid}")
	public String processOpenMember(@PathVariable("mid") Integer memberID) {		
		Member member =	mService.findById(memberID);
		member.setBlackList("W");		
		mService.saveAndUpdate(member);
		return "BackSystem/memberBackSystem";
	}
	
	
//  ---------------------------------MemberContent--------------------------------------------
	@GetMapping(path = "/BackgroundMemberContent_findAlldata")
	@ResponseBody
	public List<MemberContent> processMemberContentAllSearchAction(){
		return mService.findAlldataContent();		
	}
	
	
	@PostMapping(path = "admin/BackgroundMemberContent_findAlldata/{pageNo}")
	@ResponseBody
	public List<MemberContent> queryMemberContentByPageAction(@PathVariable("pageNo")int pageNo,Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<MemberContent> page= mService.findAllContentByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		m.addAttribute("totalPages_MemberContent",totalPages);
		m.addAttribute("totalElements_MemberContent",totalElements);
		
		return page.getContent();
	}
//  ---------------------------------MemberContent--------------------------------------------
	@PostMapping(path = "admin/member_content_update")
	@ResponseBody
	public String processMemberContentResgiterAction(@RequestBody MemberContent memberContent) {
		MemberContent memberContent2 = mService.findMemberContentById(memberContent);		
		memberContent2.setName(memberContent.getName());
		memberContent2.setAddress(memberContent.getAddress());
		memberContent2.setBirthday(memberContent.getBirthday());
		memberContent2.setCity(memberContent.getCity());
		memberContent2.setGender(memberContent.getGender());
		memberContent2.setPhone(memberContent.getPhone());
		mService.saveAndUpdateContent(memberContent2);
		return "Success";		
	}
	
}
