package tw.royalbean.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.MemberContent;

@RestController
@SessionAttributes(names = {"totalPages_company","totalElements_company"})
public class CompanyController {
	@Autowired
	private CompanyService cService;
	
	@GetMapping(path = "/company_delete/{cid}")
	public String processDeleteCompany(@PathVariable("cid") Integer cid) {
		cService.deleteById(cid);
		return "Success";
	}
	
	@GetMapping(path = "admin/company_Ban/{cid}")
	public String processBanCompany(@PathVariable("cid") Integer cid) {
		Company company= cService.findById(cid);
		company.setBlackList("B");
		cService.saveAndUpdate(company);
		return "Success";
	}
	
	@GetMapping(path = "admin/company_Open/{cid}")
	public String processOpenCompany(@PathVariable("cid") Integer cid) {
		Company company= cService.findById(cid);
		company.setBlackList("W");
		cService.saveAndUpdate(company);
		return "Success";
	}
	
	@GetMapping(path = "/company_find/{cnumber}")
	public Company processFindCompany(@PathVariable("cnumber") String companyNumber) {
		return cService.findByNumber(companyNumber);
	}
	
	@PostMapping(path = "/company_update")
	public Company processCompanyUpdateAction(@RequestBody Company company) {
		String encodepwd = new BCryptPasswordEncoder().encode(company.getPwd());
		company.setActive("Y");
		company.setBlackList("W");
		company.setPwd(encodepwd);
//		company.setRole("COMPANY");
		return cService.saveAndUpdate(company);		
	}
	
	@GetMapping(path = "/company_finded_all")
	public List<Company> processFindAllCompany() {
		return cService.findAlldata();
	}
	
	@PostMapping(path = "admin/company_finded_all/{pageNo}")
	public List<Company> queryCompanyByPageAction(@PathVariable("pageNo")int pageNo,Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Company> page= cService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		m.addAttribute("totalPages_company",totalPages);
		m.addAttribute("totalElements_company",totalElements);
		
		return page.getContent();
	}
	
}
