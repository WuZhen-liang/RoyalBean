package tw.royalbean.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import tw.royalbean.email.model.EmailAPI;
import tw.royalbean.member.model.AuthenticationProvider;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberContent;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.user.model.Role;
import tw.royalbean.user.model.UserService;
import tw.royalbean.user.model.Users;

@Controller
@SessionAttributes(names = { "memberID" })
public class RegisterController {

	@Autowired
	private MemberService mService;

	@Autowired
	private CompanyService cService;

	@Autowired
	private UserService userService;

	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

// -----------------------------memberCenter-------------------------------	
	@GetMapping(path = "/user/member_center_{mid}")
	public String processMemberCenterAction(@PathVariable("mid") String mid, Model m) {
		System.out.println("mid:" + mid);
		m.addAttribute("memberID", mid);
		return "member/memberCenter";
	}

// -----------------------------   member-------------------------------------	

	@GetMapping(path = "/member_resgiter")
	public String processMemberRegiter() {
		return "member/memberResgister";
	}
	
	@GetMapping(path = "/resgiter_all")
	public String processAllRegiter() {
		return "member/registerhome";
	}

	@PostMapping(path = "/memberResgiterAction")
	public String processMemberResgiterAction(@RequestBody Member member, Model m) {
		String encodepwd = new BCryptPasswordEncoder().encode(member.getPwd());
		String email = member.getEmail();
		Member member2= mService.findByEmail(email);
//		
		if (member2==null) {
			Users users = userService.saveAndUpdate(email, encodepwd);
			member.setUsers(users);

			Role role = userService.findRole("USER");
			member.setRole(role);
			userService.saveUserRoleId(users, role);

			String activeEncode = mService.createCode();
			member.setActive("N");
			member.setBlackList("W");
			member.setPwd(encodepwd);
			member.setEncode(activeEncode);

			mService.saveAndUpdate(member);
			mService.sendEmail(member.getEmail(), activeEncode);
			return "member/memberResgister";
		}else if (member2.getPwd()==null &&member2!=null) {
			Users users = userService.saveAndUpdate(email, encodepwd);
			member2.setUsers(users);
			Role role = userService.findRole("USER");
			member2.setRole(role);
			userService.saveUserRoleId(users, role);
			String activeEncode = mService.createCode();
			member2.setActive("N");
			member2.setBlackList("W");
			member2.setPwd(encodepwd);
			member2.setEncode(activeEncode);
			mService.saveAndUpdate(member2);
			mService.sendEmail(member2.getEmail(), activeEncode);
			return "member/memberResgister";
		}	
		return "member/memberResgister";
	}

	@GetMapping(path = "/memberactive/{code}")
	public String name(@PathVariable("code") String code, Model m) {
		Member member = mService.findByEncode(code);

		if (member != null) {
			member.setActive("Y");
			member.setEncode(null);
			mService.saveAndUpdate(member);
		} else {
			m.addAttribute("Result", "你的信箱已經驗證完了.");
			return "member/memberActive";
		}

		m.addAttribute("Result", "已經通過驗證.");
		return "member/memberActive";
	}

//	---------------------------------Member find all data and password refresh--------------------------------------------
	@GetMapping(path = "/user/memberAllDetail")
	public String processMemberAllDetail(@ModelAttribute(name = "memberID") int mid, Model m) {
		Member member = mService.findById(mid);
		MemberContent memberContent = mService.findMemberContentByMember2(member);
		m.addAttribute("MemberContentResult", memberContent);
		return "member/memberContentDetail";
	}

	@GetMapping(path = "/user/passwordchange")
	public String processMemberpassword(@ModelAttribute(name = "memberID") int mid, Model m) {
		Member member = mService.findById(mid);
//		AuthenticationProvider AuthProvider =member.getAuthProvider();
		String pwdString = member.getPwd();
		if (pwdString==null) {
			m.addAttribute("abled", " disabled=\"true\"");
			return "member/memberPassword";
		}
			int len = member.getPwd().length();
//			m.addAttribute("abled", "false");
			m.addAttribute("MemberResult", member.getEmail());
			m.addAttribute("len", len);		
		return "member/memberPassword";
	}

	@PostMapping(path = "/user/passwordChangeAction")
	@ResponseBody
	public String processMemberPassword(@RequestBody Member member, Model m,
			@ModelAttribute(name = "memberID") int mid) {
		String encodepwd = new BCryptPasswordEncoder().encode(member.getPwd());
		Member member2 = mService.findById(mid);
		member2.setPwd(encodepwd);
		mService.saveAndUpdate(member2);

		String email = member2.getEmail();
		Users users = userService.findByUsersEmail(email);
		users.setPassword(encodepwd);
		userService.saveAndUpdateTheSame(users);
//		mService.sendEmail(member.getEmail(), );		
		return "Success";
	}

// -----------------------------   forgetPassword-------------------------------------		

	@GetMapping(path = "/forgetPassword")
	public String processforgetPassword() {
		return "member/forgetPassword";
	}

	@PostMapping(path = "/forgetPasswordAction")
	@ResponseBody
	public String processforgetPasswordAction(@RequestBody Member member2, Model m) {
		String email = member2.getEmail();
		Member member = mService.findByEmail(email);
		if (member == null) {
			return "false";
		}
		String newpassord = mService.createCodeByNumber(10);
		String encodepwd = new BCryptPasswordEncoder().encode(newpassord);
		member.setPwd(encodepwd);
		mService.saveAndUpdate(member);

		Users users = userService.findByUsersEmail(email);
		users.setPassword(encodepwd);
		userService.saveAndUpdateTheSame(users);

		mService.sendPasswordEmail(email, newpassord);

		return "Success";
	}

//  ---------------------------------MemberContent Register--------------------------------------------

	@GetMapping(path = "/user/member_content_resgiter")
	public String processMemberContentResgiter(@ModelAttribute(name = "memberID") int mid, Model m) {
		m.addAttribute("memberID", mid);
		return "member/memberContentRegister";
	}

	@PostMapping(path = "/user/member_content_resgiter_action")
	@ResponseBody
	public String processMemberContentResgiterAction(@RequestBody MemberContent memberContent, Model m,
			@ModelAttribute(name = "memberID") int mid) {
		Member member = mService.findById(mid);
		mService.saveOrUpdateMemberContentByMember(member, memberContent);
		return "Success";
	}

	@PostMapping(path = "/user/memberphoto", produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String processMemberPhotoAction(@RequestParam("mPicture") MultipartFile multipartFile, Model m)
			throws Exception, IOException {

		String currentDate = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String fileName = currentDate + multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);

		String saveDirPath = "C:/temp/memberpicture/";
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
		String saveFilePath = saveDirPath + fileName;

		File saveFile = new File(saveFilePath);
		multipartFile.transferTo(saveFile);
		System.out.println("saveFilePath:" + saveFilePath);

//		String filename = "/temp-rainy/" + fileName; 
//		m.addAttribute("filename", filename);

		return fileName;
	}

// -----------------------------   company-------------------------------------	
	@GetMapping(path = "/company_resgiter")
	public String processCompanyResgiter() {
		return "company/companyResgister";
	}

	@PostMapping(path = "/company_resgiter_action")
	@ResponseBody
	public String processCompanyResgiterAction(@RequestBody Company company) {
		String encodepwd = new BCryptPasswordEncoder().encode(company.getPwd());
		String email = String.valueOf(company.getNumber());
		Users users = userService.saveAndUpdate(email, encodepwd);
		company.setUsers(users);

		Role role = userService.findRole("COMPANY");
		company.setRole(role);
		userService.saveUserRoleId(users, role);

		company.setActive("Y");
		company.setBlackList("W");
		company.setPwd(encodepwd);

		cService.saveAndUpdate(company);
		return "Success";
	}

// -----------------------------   company-------------------------------------		
	@GetMapping(path = "/staff_resgiter")
	public String processStaffResgiter() {
		return "BackSystem/StaffResgister";
	}

	@PostMapping(path = "/Staff_resgiter_action")
	@ResponseBody
	public String processStaffResgiterAction(@RequestBody Users users) {

		Role role = userService.findRole("ADMIN");
		List<Role> roleList = new ArrayList<Role>();
		roleList.add(role);
		users.setRoles(roleList);
		userService.saveAndSaff(users);
		return "Success";
	}

}
