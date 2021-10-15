package tw.royalbean.member.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "MEMBERCONTENT")
@Component("memberContent")
//@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class MemberContent {
	
	@Id 
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "MNAME")
	private String name;
	
	@Column(name = "MPHONE")
	private String phone;
	
	@Column(name = "MBIRTHDAY")
	private String birthday;
	
	@Column(name = "MCITY")
	private String city;
	
	@Column(name = "MADDRESS")
	private String address;
	
	@Column(name = "MGENDER")
	private String gender;
	
	@Column(name = "MPICTURE")
	private String picture;
	
	@OneToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH} ,fetch = FetchType.EAGER)
//	@OneToOne(cascade = CascadeType.ALL )
	@JoinColumn(name = "MID")
	@JsonBackReference(value = "memberAndMemberContent")
	private Member member;


	public MemberContent() {
	}
	



	public MemberContent(int id, String name, String phone, String birthday, String city, String address, String gender,
			Member member) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.city = city;
		this.address = address;
		this.gender = gender;
		this.member = member;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getBirthday() {
		return birthday;
	}




	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public Member getMember() {
		return member;
	}




	public void setMember(Member member) {
		this.member = member;
	}




	public String getPicture() {
		return picture;
	}




	public void setPicture(String picture) {
		this.picture = picture;
	}


	

	
	
}
