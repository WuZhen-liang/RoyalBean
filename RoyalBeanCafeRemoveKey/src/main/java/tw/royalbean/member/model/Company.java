package tw.royalbean.member.model;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.benefit.model.Coupon;
import tw.royalbean.service.model.Article;
import tw.royalbean.service.model.Report;
import tw.royalbean.shop.model.ShopPd;
import tw.royalbean.user.model.Role;
import tw.royalbean.user.model.Users;


@Entity
@Table(name = "company")
@Component("company")
//@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Company {

	@Id
	@Column(name = "CID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "CPWD")
	private String pwd;
	
	@Column(name = "CNAME")
	private String name;
	
	@Column(name = "CNUMBER")
	private String number;
	
	@Column(name = "CACTIVE")
	private String active;

	@Column(name = "CBLACKLIST")
	private String blackList;
	
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "ROLE")
	@JsonBackReference(value = "roleCompany")
	private Role role;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "USER_ID")
	@JsonBackReference(value = "usersCompany")
	private Users users;
		
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "company")
	@JsonManagedReference(value = "companyactivityStores")
	private Set<ActivityStore> activityStores = new HashSet<ActivityStore>();
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "company")
	@JsonManagedReference(value = "companyactivity")
	private Set<Activity> activity = new HashSet<Activity>();
	
	@OneToMany(mappedBy = "company")
	private Set<Coupon> coupons = new HashSet<Coupon>();
	
	@OneToMany(mappedBy = "company")
	@JsonManagedReference(value = "member")
	private Set<ShopPd> shopPds = new HashSet<ShopPd>();
	
	@OneToMany(mappedBy = "company")
	//@JsonManagedReference(value = "companyreport")
	private Set<Report> reports = new HashSet<Report>();
	
	@OneToMany(mappedBy = "company")
	private Set<Article> articles = new HashSet<Article>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getBlackList() {
		return blackList;
	}

	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}



	
}
