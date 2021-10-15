package tw.royalbean.benefit.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Member;
import tw.royalbean.shop.model.ShopPd;

@Entity
@Table(name = "coupon")
@Component
public class Coupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cpid;

	private String cpname;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cpsdate;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cpddate;

	private int cpprice;
	private String cpcontent;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "cID")
	private Company company;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "mID")
	private Member member;
	
	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "cppdtype")
	private Set<ShopPd> shopPd = new HashSet<ShopPd>();

	public Coupon() {
	}

	public Coupon(String cpname, Date cpsdate, Date cpddate, int cpprice, String cpcontent) {
		this.cpname = cpname;
		this.cpsdate = cpsdate;
		this.cpddate = cpddate;
		this.cpprice = cpprice;
		this.cpcontent = cpcontent;
	}

	public int getCpid() {
		return cpid;
	}

	public void setCpid(int cpid) {
		this.cpid = cpid;
	}

	public String getCpname() {
		return cpname;
	}

	public void setCpname(String cpname) {
		this.cpname = cpname;
	}

	public Date getCpsdate() {
		return cpsdate;
	}

	public void setCpsdate(Date cpsdate) {
		this.cpsdate = cpsdate;
	}

	public Date getCpddate() {
		return cpddate;
	}

	public void setCpddate(Date cpddate) {
		this.cpddate = cpddate;
	}

	public int getCpprice() {
		return cpprice;
	}

	public void setCpprice(int cpprice) {
		this.cpprice = cpprice;
	}

	public String getCpcontent() {
		return cpcontent;
	}

	public void setCpcontent(String cpcontent) {
		this.cpcontent = cpcontent;
	}

}
