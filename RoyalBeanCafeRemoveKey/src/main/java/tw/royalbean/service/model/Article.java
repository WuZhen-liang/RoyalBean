package tw.royalbean.service.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Staff;

@Entity @Table(name="Service_Article")
@Component
public class Article {
	@Id @Column(name="articleid")@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int articleid;
	//@Column(name="author")
	//private String author;
	@Column(name="articletitle")
	private String articletitle;
	@Column(name="articlecontent")
	private String articlecontent;
	@Column(name="articletime")
	private String articletime;
	@Column(name="articletype")
	private String articletype;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "article")	
	@JsonManagedReference(value = "articlereply")
	private Set<ArticleReply> articlereply = new HashSet<ArticleReply>();

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	private Company company;
	
	public Article() {
		
	}
	
	public Article(int articleid,String articletitle,String articlecontent,String articletime,String articlytype) {
		this.articleid=articleid;
		this.articletitle=articletitle;
		this.articlecontent=articlecontent;
		this.articletime=articletime;
		this.articletype=articlytype;	
	}

	public int getArticleid() {
		return articleid;
	}

	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}

	public String getArticletitle() {
		return articletitle;
	}

	public void setArticletitle(String articletitle) {
		this.articletitle = articletitle;
	}

	public String getArticlecontent() {
		return articlecontent;
	}

	public void setArticlecontent(String articlecontent) {
		this.articlecontent = articlecontent;
	}

	public String getArticletime() {
		return articletime;
	}

	public void setArticletime(String articletime) {
		this.articletime = articletime;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getArticletype() {
		return articletype;
	}

	public void setArticletype(String articletype) {
		this.articletype = articletype;
	}

	public Set<ArticleReply> getArticlereply() {
		return articlereply;
	}

	public void setArticlereply(Set<ArticleReply> articlereply) {
		this.articlereply = articlereply;
	}


	

	
	
}
