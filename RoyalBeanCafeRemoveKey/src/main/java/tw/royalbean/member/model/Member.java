package tw.royalbean.member.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.activity.model.ActivityOrder;
import tw.royalbean.benefit.model.Coupon;
import tw.royalbean.service.model.ArticleReply;
import tw.royalbean.service.model.Report;
import tw.royalbean.shopcar.model.ShopCar;
import tw.royalbean.user.model.Role;
import tw.royalbean.user.model.Users;

@Entity
@Table(name = "member")
@Component("member")
//@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Member {

	@Id
	@Column(name = "MID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "MPWD")
	private String pwd;

	@Column(name = "MEMAIL")
	private String email;

	@Column(name = "MACTIVE")
	private String active;

	@Column(name = "MBLACKLIST")
	private String blackList;
	
	@Column(name = "MENCODE")
	private String encode;
	
	@Column(name = "MTOKEN")
	private String token;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "auth_provider")
	private AuthenticationProvider authProvider;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "ROLE")
	@JsonBackReference(value = "roleMember")
	private Role role;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "USER_ID")
	@JsonBackReference(value = "usersMember")
	private Users users;
	
	@OneToMany(mappedBy = "member")
//	@JsonManagedReference
	private Set<Coupon> coupons = new HashSet<Coupon>();
	
	@OneToMany(mappedBy = "member")
	private Set<ShopCar> sCars = new HashSet<ShopCar>();
	
	@OneToMany(mappedBy = "member")
	//@JsonManagedReference(value = "memberreport")
	private Set<Report> reports = new HashSet<Report>();
	
	@OneToMany(mappedBy = "member")
	private Set<ArticleReply> articlereply = new HashSet<ArticleReply>();
	
	
	@OneToMany(mappedBy = "member")
	@JsonManagedReference(value = "memberactivityorder")
	private Set<ActivityOrder> activityOrders = new HashSet<ActivityOrder>();
	
//  雙向關係，但我希望我要有會員才找到，因此不需要。
	@OneToOne(mappedBy = "member")
	@JsonManagedReference(value = "memberAndMemberContent")
	MemberContent memberContent;
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
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

	public AuthenticationProvider getAuthProvider() {
		return authProvider;
	}

	public void setAuthProvider(AuthenticationProvider authProvider) {
		this.authProvider = authProvider;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}	
}
