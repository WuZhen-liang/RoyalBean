package tw.royalbean.user.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import tw.royalbean.benefit.model.Coupon;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Member;
@Entity
@Table(name = "ROLE")
@Component("role")
//@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Role {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int roleId;
	private String roleName;
	
	@OneToMany(mappedBy = "role")
	@JsonManagedReference(value = "roleMember")
	private Set<Member> members =new HashSet<Member>();
	
	@OneToMany(mappedBy = "role")
	@JsonManagedReference(value = "roleCompany")
	private Set<Company> companys =new HashSet<Company>();
	
	@OneToMany(mappedBy = "role")
	@JsonManagedReference(value = "roleUserId")
	private Set<UserRoleId> UserRoleId =new HashSet<UserRoleId>();
	
	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}

	public Set<UserRoleId> getUserRoleId() {
		return UserRoleId;
	}

	public void setUserRoleId(Set<UserRoleId> userRoleId) {
		UserRoleId = userRoleId;
	}

	

}
