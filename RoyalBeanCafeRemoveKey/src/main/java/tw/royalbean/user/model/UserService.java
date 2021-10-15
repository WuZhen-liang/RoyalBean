package tw.royalbean.user.model;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {
	@Autowired
	private UsersRepository usersRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserRoleIdRepository userRoleIdRepository;
	
	public Users saveAndUpdate(String email,String password) {
		Users user = new Users();
		user.setUsername(email);
		user.setPassword(password);
		return usersRepository.save(user);
	}
	
	public Users findByUsersEmail(String email) {		
		Optional<Users> users = usersRepository.findByUsername(email);
		if(users.isEmpty()) {
//			throw new UsernameNotFoundException("We can't find your account");	
			return null;
		}
		return users.get();
	}
	
	public void saveAndUpdateTheSame(Users users) {
		usersRepository.save(users);
	}
	
	public Role findRole(String roleName) {
		Optional<Role> role = roleRepository.findByRoleName(roleName);
		if(role.isEmpty()) {
			Role role2 =new Role();
			role2.setRoleName(roleName);
			return roleRepository.save(role2);			
		}			
		return role.get();
	}
	
	public UserRoleId saveUserRoleId(Users users,Role role) {
		UserRoleId userRoleId =new UserRoleId();
		userRoleId.setRole(role);
		userRoleId.setUsers(users);
		return userRoleIdRepository.save(userRoleId);	
	}
	
	public Users saveAndSaff(Users users) {
//		這會直接加入到Role and user table裡
		return usersRepository.save(users);
	}
	
}
