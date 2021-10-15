package tw.royalbean.service.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

import ch.qos.logback.core.net.SyslogOutputStream;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.service.model.QA;
import tw.royalbean.service.model.Report;
import tw.royalbean.service.model.ReportService;

@Controller
@SessionAttributes(names = {"totalPages","totalElements","memberID","companyID"})
public class ReportController {
	@Autowired
	private ReportService rService;
	@Autowired
	private Report report;
	@Autowired 
	private Member member;
	@Autowired
	private MemberService mService;
	@Autowired
	private Company company;
	@Autowired
	private CompanyService cService;
	
	@GetMapping(path="/admin/ReportQuery")
	public String processQueryMainpage() {
		
		return"/service/serviceBackSystemReport";
	}
	
	@GetMapping(path="/user/{memberID}/AddReportEntry")
	public String processReportEntry(@PathVariable("memberID") String mid,Model p) {
		p.addAttribute("memberID",mid);
		System.out.println(mid);
		return "/service/indexReportInsert";
	}
	
	@GetMapping(path="/company/{companyID}/AddReportEntry")
	public String processReportEntryCompany(@PathVariable("companyID") String mid,Model p) {
		p.addAttribute("companyID",mid);
		System.out.println(mid);
		return "/service/indexReportInsertCompany";
	}
	
	@PostMapping(path ="/admin/Reportdel.controller")
	public String processDelAction(@RequestParam("delID") int rid) {
		
		rService.deleteReport(rid);
		 return "/service/serviceBackSystemReport";
	}
	
	@PostMapping(path = "/admin/findReportid.controller")
	
	public String processQueryById(@RequestParam("uptID") int rid, Model r) {
		Report report = rService.findById(rid);
		r.addAttribute("report",report);
		return "/service/serviceBackSystemFindReport";
	}
	
	@PostMapping(path="user/AddReport")
	public String addReport(Report report,@RequestParam("picture")MultipartFile multipartFile,@ModelAttribute("memberID") String mid,Model p) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		System.out.println("mid:"+mid);
		Member member = mService.findById(Integer.parseInt(mid));
		//Member member = mService.findById(mid);
		report.setReporttime(strDate);
		//Company company = new Company();
		//company.setName("");
		report.setMember(member);
		//report.setCompany(company);
	
		
		if(multipartFile!=null) {
		String fileName = multipartFile.getOriginalFilename();
		
		String saveDirPath="D:\\workspace3\\RoyalBeanCafe\\RoyalBeanCafeProject\\src\\main\\resources\\static\\images\\service";
		System.out.println(fileName);
		
		//report.setReportpicture(fileName);
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
		try {
			File saveFilePath = new File(saveFileDir, fileName);
			multipartFile.transferTo(saveFilePath);
			report.setReportpicture(fileName);
			System.out.println("saveFilePath:" + saveFilePath);
		} catch (IllegalStateException | IOException e) {
			System.out.println("上傳圖片失敗:" + e);
			e.printStackTrace();
		}
		}
		rService.insertReport(report);
		
		return"/websocket/index";
	}
	
	@PostMapping(path="company/AddReport")
	public String addReportCompany(Report report,@RequestParam("picture")MultipartFile multipartFile,@RequestParam("companyID") String cid,Model p) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		System.out.println("mid:"+cid);
		Company company = cService.findById(Integer.parseInt(cid));
		
		//Member member = mService.findById(Integer.parseInt(cid));
		//Member member = new Member();
		//member.setEmail("");
		report.setReporttime(strDate);
		//report.setMember(member);
		report.setCompany(company);
	
		
		if(multipartFile!=null) {
		String fileName = multipartFile.getOriginalFilename();
		
		String saveDirPath="D:\\workspace3\\RoyalBeanCafe\\RoyalBeanCafeProject\\src\\main\\resources\\static\\images\\service";
		System.out.println(fileName);
		
		//report.setReportpicture(fileName);
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
		try {
			File saveFilePath = new File(saveFileDir, fileName);
			multipartFile.transferTo(saveFilePath);
			report.setReportpicture(fileName);
			System.out.println("saveFilePath:" + saveFilePath);
		} catch (IllegalStateException | IOException e) {
			System.out.println("上傳圖片失敗:" + e);
			e.printStackTrace();
		}
		}
		rService.insertReport(report);
		
		return  "/websocket/index";
	}
	
	@PostMapping(path = "/queryallreportbypage/{pageNo}")
	@ResponseBody
	public List<Report> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize,Sort.by("Reporttime").descending());
		Page<Report> page = rService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	
}
