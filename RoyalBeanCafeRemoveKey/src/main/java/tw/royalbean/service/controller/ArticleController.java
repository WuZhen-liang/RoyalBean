package tw.royalbean.service.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.service.model.Article;
import tw.royalbean.service.model.ArticleReply;
import tw.royalbean.service.model.ArticleReplyService;
import tw.royalbean.service.model.ArticleService;
import tw.royalbean.service.model.QA;
import tw.royalbean.service.model.Report;

@Controller
@SessionAttributes(names = {"totalPages","totalElements","companyID","memberID"})

public class ArticleController {
	@Autowired
	private ArticleService aService;
	@Autowired
	private Article article;
	@Autowired
	private CompanyService cService;
	@Autowired
	private Company company;
	@Autowired
	private ArticleReply articlereply;
	@Autowired
	private ArticleReplyService replyService;
	
	@GetMapping(path="/company/{companyID}/AddArticle")
	public String processArticleEntry(@PathVariable("companyID") String cid,Model m) {
		m.addAttribute("companyID",cid);
		System.out.println(cid);
		return"service/indexArticleInsert";
	}
	
	@GetMapping(path="/admin/Article")
	public String processArticle() {
		return"/service/serviceBackSystemArticle";
	}
	
	@GetMapping(path="user/{memberID}/indexArticle")
	public String processindexArticle(@PathVariable("memberID") String mid,Model m) {
		m.addAttribute("memberID",mid);
		System.out.println(mid);
		return"/service/indexArticle";
	}
	
	@GetMapping(path="/indexArticle")
	public String processindexguestArticle() {
	
		return"/service/indexArticle";
	}
	
	@GetMapping(path="/company/{companyID}/indexArticle")
	public String processindexArticlecid(@PathVariable("companyID") String cid,Model m) {
		m.addAttribute("companyID", cid);
		return"/service/indexArticleMember";
	}
	
	@PostMapping(path ="/admin/artdel.controller")
	public String processDelAction(@RequestParam("delID") int aid) {
		
		aService.deleteArticle(aid);
		 return "/service/serviceBackSystemArticle";
	}
	
	@PostMapping(path ="company/{companyID}/artdel.index")
	public String processDelindexAction(@RequestParam("delID") int aid) {
		
		aService.deleteArticle(aid);
		 return "/service/indexArticleMember";
	}
	
	@PostMapping(path = "/admin/findartid.controller")
	public String processQueryById(@RequestParam("uptID") int aid , Model a) {
		
		Article article = aService.findById(aid);		
		//Company company = cService.findById(Integer.parseInt(cid));	
		
		//System.out.println(company.getName());
		
		//a.addAttribute("company", company);
				
		a.addAttribute("article",article);
		return "/service/serviceBackSystemFindArticle";
	}
	

	
	@PostMapping(path = "company/{companyID}/updateentry.index")
	public String articleUpdateEntry(@RequestParam("uptID") int aid,@ModelAttribute("companyID") String cid, Model a) {
		Article article = aService.findById(aid);		
		Company company = cService.findById(Integer.parseInt(cid));	
		
		System.out.println(company.getName());
		
		a.addAttribute("company", company);
				
		a.addAttribute("article",article);
		return "/service/indexArticleUpdate";
	}
	
	
	
	
	
	@PostMapping(path = "user/{memberID}/findartid.index")
	public String processindexQueryByIdforUser(@RequestParam("uptID") int aid, Model a) {
		Article article = aService.findById(aid);		
		//Company company = cService.findById(Integer.parseInt(cid));	
		List<ArticleReply> articlereply = replyService.findArticleId(aid);
		
		//article.getCompany();
		a.addAttribute("company", company);
		a.addAttribute("articlereply", articlereply);		
		a.addAttribute("article",article);
		//a.addAttribute("roleheader","/WEB-INF/pages/headerfooter/memberheader.jsp");
		return "/service/indexArticleReplyMember";
	}
	
	@PostMapping(path = "company/{companyID}/findartid.index")
	public String processindexQueryByIdforCompany(@RequestParam("uptID") int aid, Model a) {
		Article article = aService.findById(aid);		
		//Company company = cService.findById(Integer.parseInt(cid));	
		List<ArticleReply> articlereply = replyService.findArticleId(aid);
		
		//article.getCompany();
		a.addAttribute("company", company);
		a.addAttribute("articlereply", articlereply);	
		a.addAttribute("article",article);
		//a.addAttribute("roleheader","/WEB-INF/pages/headerfooter/venderheader.jsp");
		return "/service/indexArticleReply";
	}
	
	@PostMapping(path = "/findartid.index")
	public String processindexQueryByIdforGuest(@RequestParam("uptID") int aid, Model a) {
		Article article = aService.findById(aid);		
		//Company company = cService.findById(Integer.parseInt(cid));	
		List<ArticleReply> articlereply = replyService.findArticleId(aid);
		
		//article.getCompany();
		a.addAttribute("company", company);
		a.addAttribute("articlereply", articlereply);	
		a.addAttribute("article",article);
		return "/service/indexArticleReply";
	}
	
	@PostMapping(path="company/AddArticle.controller")
	public String addArticlebyjson (@RequestBody Article article,@ModelAttribute("companyID") String cid,Model m) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		article.setArticletime(strDate);
		System.out.println(cid);
		Company company = cService.findById(Integer.parseInt(cid));
		
		article.setCompany(company);

		aService.insertArticle(article);
		return  "/service/indexArticleMember";
	}
	
	@PostMapping(path="company/{companyID}/uptArticle.controller")
	public String upArticlebyjson (@RequestBody Article article,@ModelAttribute("companyID") String cid,Model m) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		article.setArticletime(strDate);
		System.out.println(cid);
		Company company = cService.findById(Integer.parseInt(cid));
		//article.setArticleid(aid);
		article.setCompany(company);

		aService.insertArticle(article);
		return  "/service/indexArticleMember";
	}
	

	
	@PostMapping(path = "/queryallarticlebypage/{pageNo}")
	@ResponseBody
	public List<Article> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize,Sort.by("articletime").descending());
		Page<Article> page = aService.findAllByPage(pageable);
		
		//Page<Company> cpage = cService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
}
