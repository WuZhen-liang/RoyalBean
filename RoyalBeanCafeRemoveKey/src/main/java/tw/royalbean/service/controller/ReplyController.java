package tw.royalbean.service.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.service.model.Article;
import tw.royalbean.service.model.ArticleReply;
import tw.royalbean.service.model.ArticleReplyService;
import tw.royalbean.service.model.ArticleService;
import tw.royalbean.service.model.QA;

@Controller
@SessionAttributes(names = {"totalPages","totalElements","companyID","memberID"})

public class ReplyController {
	@Autowired
	private ArticleReplyService replyService;
	@Autowired
	private CompanyService cService;
	@Autowired
	private Company company;
	@Autowired
	private ArticleService aService;
	@Autowired
	private MemberService mService;
	
	
	@PostMapping(path="company/{companyID}/AddReply.controller/{replyid}")
	public String addCompanyArticlebyjson (@PathVariable("replyid") int rid ,@RequestBody ArticleReply reply,@ModelAttribute("companyID") String cid,Model m) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		reply.setReplytime(strDate);
		
		System.out.println(cid);
		Company company = cService.findById(Integer.parseInt(cid));
		//Member  member = mService.findById(Integer.parseInt(mid));
		Article article = aService.findById(rid);
		//reply.setMember(member);
		reply.setCompany(company);
		reply.setArticle(article);
		
		replyService.insertReply(reply);
		
		return  "/service/indexArticle";
	}
	
	@PostMapping(path="user/{memberID}/AddReply.controller/{replyid}")
	public String addMemberArticlebyjson (@PathVariable("replyid") int rid ,@RequestBody ArticleReply reply,@ModelAttribute("memberID") String mid,Model m) {
		SimpleDateFormat sdFormat = new SimpleDateFormat();
		Date date = new Date();
		String strDate = sdFormat.format(date);	
		reply.setReplytime(strDate);
		
		//System.out.println(cid);
		//Company company = cService.findById(Integer.parseInt(cid));
		Member  member = mService.findById(Integer.parseInt(mid));
		Article article = aService.findById(rid);
		reply.setMember(member);
		//reply.setCompany(company);
		reply.setArticle(article);
		
		replyService.insertReply(reply);
		
		return  "/service/indexArticle";
	}
	
//	@PostMapping(path = "company/{companyID}/findartreplyid.index")
//	public String processreplyQueryById(@RequestParam("uptID") int aid, Model a) {
//		Article article = aService.findById(aid);
//		
//		//Company company = cService.findById(Integer.parseInt(cid));	
//		
//		//System.out.println(company.getName());
//		
//		a.addAttribute("company", company);
//				
//		a.addAttribute("article",article);
//		return "/service/indexArticleReply";
//	}
}
