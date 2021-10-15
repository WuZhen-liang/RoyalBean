package tw.royalbean.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tw.royalbean.member.model.AuthenticationProvider;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberContent;
import tw.royalbean.member.model.MemberService;

@Controller
@RequestMapping
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CompanyService companyService;
//	@Autowired
//	private UserService userService;
	@Autowired
	private Member member;
//	---------------- Member -------------------	
//  入口
	@RequestMapping("/user")
	public ModelAndView defaultHome() {
		return new ModelAndView("member/login");
	}
//  同入口回傳
	@RequestMapping("/user/login")
	public ModelAndView login() {
		return new ModelAndView("member/login");
	}

	@RequestMapping("/user/homepage")
	public ModelAndView userDashboard(@AuthenticationPrincipal User user,Model m) {
		Member member = memberService.findByEmail(user.getUsername());
		System.out.println(member.getId());
		memberService.RecordLoginNumber();		
		m.addAttribute("memberID", member.getId());
		return new ModelAndView("member/indexMember");
	}
	
	@RequestMapping("/user/Oauth2homepage")
	public ModelAndView user(Authentication authentication,Model m) {
//		System.out.println(authentication.getPrincipal());
		OAuth2User oauth2 = (OAuth2User) authentication.getPrincipal();
		System.out.println(oauth2);
		String email = (String) oauth2.getAttributes().get("email");
		String token =  oauth2.getName();
		System.out.println("Customer's email:"+email);	
		
		member = memberService.findByEmail(email);		
		if (member==null) {
			Member member2 = new Member();
			member2.setEmail(email);
			member2.setAuthProvider(AuthenticationProvider.GOOGLE);
			member2.setToken(token);
			memberService.saveAndUpdate(member2);
			memberService.sendNewOauth2Email(email);
			m.addAttribute("memberID", member2.getId());
			return new ModelAndView("member/indexMember");
		}else if (member!=null&& member.getBlackList().equals("B")) {
			m.addAttribute("error", "此帳號已經黑名單");
			return new ModelAndView("member/login");
		}
		member.setAuthProvider(AuthenticationProvider.GOOGLE);
		member.setToken(token);
		memberService.saveAndUpdate(member);
		m.addAttribute("memberID", member.getId());
		memberService.RecordLoginNumber();
		return new ModelAndView("member/indexMember");
	}

	@RequestMapping("/user/accessdenied")
	public ModelAndView userAccessError(Model m) {
		m.addAttribute("error", "帳號和密碼錯誤或是此帳號已經黑名單");
		return new ModelAndView("member/login");
	}

//	---------------- Admin -------------------
	@RequestMapping("/admin")
	public ModelAndView admin() {
		return new ModelAndView("admin/login");
	}

	@RequestMapping("/admin/login")
	public ModelAndView adminlogin() {
		return new ModelAndView("admin/login");
	}

	@RequestMapping("/admin/dashboard")
	public ModelAndView admindashboard(Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(0, pageSize);
		
		Page<Member> page= memberService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		m.addAttribute("totalPages_member",totalPages);
		m.addAttribute("totalElements_member",totalElements);
		
		Page<MemberContent> page2= memberService.findAllContentByPage(pageable);
		int totalPages2 = page2.getTotalPages();
		long totalElements2 = page2.getTotalElements();
		m.addAttribute("totalPages_MemberContent",totalPages2);
		m.addAttribute("totalElements_MemberContent",totalElements2);
		
		return new ModelAndView("BackSystem/memberBackSystem");
	}

	@RequestMapping("/admin/accessdenied")
	public ModelAndView adminAccessError(Model m) {
		m.addAttribute("error", "帳號或密碼錯誤");
		return new ModelAndView("admin/login");
	}
	
//	----------------company-------------
	
	@RequestMapping("/company")
	public ModelAndView company() {
		return new ModelAndView("company/login");
	}

	@RequestMapping("/company/login")
	public ModelAndView companylogin() {
		return new ModelAndView("company/login");
	}
	
	@RequestMapping("/company/dashboard")
	public ModelAndView companydashboard(@AuthenticationPrincipal User user,Model m) {
		Company company = companyService.findByNumber(user.getUsername());
		System.out.println(company.getId());
		m.addAttribute("companyID", company.getId());
		return new ModelAndView("vender/venderLogin");
	}

	@RequestMapping("/company/accessdenied")
	public ModelAndView companyAccessError(Model m) {
		m.addAttribute("error", "帳號和密碼錯誤或是此帳號已經黑名單");
		return new ModelAndView("company/login");
	}
	
}
