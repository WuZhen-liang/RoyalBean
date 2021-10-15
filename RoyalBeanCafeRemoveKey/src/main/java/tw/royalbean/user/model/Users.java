package tw.royalbean.user.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.member.model.AuthenticationProvider;

@Entity
@Table(name = "USERS")
@Component("users")
//@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Users {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int userId;
	private String username;
	private String password;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", 
		joinColumns = @JoinColumn(name = "user_id"), 
		inverseJoinColumns = @JoinColumn(name = "role_id"))
	List<Role> roles;
	
//	@Enumerated(EnumType.STRING)
//	@Column(name = "auth_provider")
//	private AuthenticationProvider authProvider;
	
	
	@OneToOne(mappedBy = "users")
	@JsonManagedReference(value = "userAndUserId")
	private UserRoleId userRoleId;
	
	public long getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

//	public AuthenticationProvider getAuthProvider() {
//		return authProvider;
//	}
//
//	public void setAuthProvider(AuthenticationProvider authProvider) {
//		this.authProvider = authProvider;
//	}
	
	
}
