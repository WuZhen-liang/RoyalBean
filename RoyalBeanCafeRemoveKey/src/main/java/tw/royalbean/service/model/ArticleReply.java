package tw.royalbean.service.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Member;

@Entity @Table(name="Service_ArticleReply")
@Component
public class ArticleReply {
	@Id @Column(name="replyid")@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int replyid;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "articleid")
	@JsonBackReference(value = "articlereply")
	private Article article;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	private Company company;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "MID")
	private Member member;
	
	@Column(name="replycontent")
	private String replycontent;
	
	@Column(name="replytime")
	private String replytime;
	
	public ArticleReply() {
		
	}
	public ArticleReply(int replyid,String replycontent,String replytime) {
		this.replyid=replyid;
		this.replycontent=replycontent;
		this.replytime=replytime;
		
	}

	public int getReplyid() {
		return replyid;
	}

	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public String getReplytime() {
		return replytime;
	}

	public void setReplytime(String replytime) {
		this.replytime = replytime;
	}
	
	
	
}
