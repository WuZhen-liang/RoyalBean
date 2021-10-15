package tw.royalbean.user.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "USER_ROLE")
@Component("user_role")
public class UserRoleId {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="USER_ROLE_ID")
	private int id;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "ROLE_ID")
	@JsonBackReference(value = "roleUserId")
	private Role role;
//	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "USER_ID")
	@JsonBackReference(value = "userAndUserId")
	private Users users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
