package tw.royalbean.service.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.service.model.Article;
import tw.royalbean.service.model.ArticleReply;
import tw.royalbean.service.model.QA;
import tw.royalbean.service.model.QARepository;
import tw.royalbean.service.model.QAService;

@Controller
//@RequestMapping(path = "/QA")
@SessionAttributes(names = {"totalPages","totalElements"})
public class QAController {
	@Autowired
	private QAService qService;
	@Autowired
	private QA qa;


	
	@GetMapping(path = "/admin/QAmainpage.controller")
    public String processQueryMainPage() {
    	return "/service/serviceBackSystemQA";
    }
	
	@GetMapping(path="/admin/AddQAEntry.controller")
	public String addEntry() {
		System.out.println(qa.getQAid());
		//System.out.println(qa.getQAid());
		return "/service/serviceBackSystemAddQA2";
	}
	
	@GetMapping(path = "/user/{memberID}/findQA.index")
	public String processindexQueryByIdforUser(@PathVariable("memberID") String mid,Model a) {
		a.addAttribute("memberID",mid);
		List<QA> qalist = qService.findAll();					
		//article.getCompany();		
		a.addAttribute("qalist", qalist);				
		return "/service/indexQA";
	}
	
	@GetMapping(path = "/company/{companyID}/findQA.index")
	public String processindexQueryByIdforCompany(@PathVariable("companyID") String cid,Model a) {
		a.addAttribute("company",cid);
		List<QA> qalist = qService.findAll();					
		//article.getCompany();		
		a.addAttribute("qalist", qalist);				
		return "/service/indexQACompany";
	}
	
	@PostMapping(path = "/admin/findQAid.controller")
	
	public String processQueryById(@RequestParam("uptID") int qid, Model q) {
		QA qa = qService.findById(qid);
		q.addAttribute("qa",qa);
		return "/service/serviceBackSystemUptQA";
	}
	
	@PostMapping(path = "/admin/AddQA.controller")
	
	public String processAddAction(@RequestParam("QAtitle") String qatitle,@RequestParam("QAanswer") String qaanswer) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);		
		
		
		qa.setQAtitle(qatitle);
		qa.setQAanswer(qaanswer);
		qa.setQAtime(strDate);
		qService.insertQA(qa);
		return  "/service/serviceBackSystemQA";
	}
	
	@PostMapping(path="/admin/AddQAJson.controller")
	public String addQAbyjson (@RequestBody QA qa) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		qa.setQAtime(strDate);
//		System.out.println(qa.getQAtitle());
//		System.out.println(qa.getQAanswer());
//		System.out.println(qa.geteID());
//		System.out.println(qa.getQAtime());
		qService.insertQA(qa);
		return  "/service/serviceBackSystemQA";
	}
	
	@PostMapping(path ="/admin/QAdel.controller")
	public String processDelAction(@RequestParam("delID") int qid) {
		
		qService.deleteQA(qid);
		 return "/service/serviceBackSystemQA";
	}
	@PostMapping(path="/admin/UptQA.controller")
	public String processUptQA(@RequestParam(name="QAtitle",required = true)String QAtitle,@RequestParam(name="QAanswer",required = true)String QAanswer,@RequestParam(name="QAid",required = true)int QAid,Model m) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
//		qa.setQAid(QAid);
//		qa.setQAtitle(QAtitle);
//		qa.setQAanswer(QAanswer);
//		qa.seteID(0);
//		qa.setQAtime(strDate);
//		qService.updateQA(qa);
		return "/service/serviceBackSystemQA";
	}
	
	@PostMapping(path="/admin/UptQAbyJson.controller")
	public String processUptQAbyJson(@RequestBody QA qa) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
//		qa.setQAid(QAid);
//		qa.setQAtitle(QAtitle);
//		qa.setQAanswer(QAanswer);
//		qa.seteID(0);
		qa.setQAtime(strDate);
		qService.updateQA(qa);
		return "/service/serviceBackSystemQA";
	}
	
	@PostMapping(path = "/admin/queryallbypage/{pageNo}")
	@ResponseBody
	public List<QA> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize,Sort.by("QAtime").descending());
		Page<QA> page = qService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
}
