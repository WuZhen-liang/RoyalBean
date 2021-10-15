package tw.royalbean.user.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
@Service("companyDetailsService")
public class CompanyDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private UsersRepository usersRepository;
	@Autowired
	private CompanyService cService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		List<Users> usersList = usersRepository.findCompany(userName);
		boolean blasklist = false;
		if (usersList != null && usersList.size() == 1) {
//			find data
			Users users = usersList.get(0);
			List<String> roleList = new ArrayList<String>();
			for (Role role : users.getRoles()) {
				roleList.add(role.getRoleName());
			}

			Company company= cService.findByUsers(users);			
			if (company.getBlackList().equals("B")) {
				blasklist = true;
			}
			
			
            return User.builder()
                	.username(users.getUsername())
                	//change here to store encoded password in db
                	.accountLocked(blasklist)
                	.password( users.getPassword())
                	.roles(roleList.toArray(new String[0]))
                	.build();
		} else {
			throw new UsernameNotFoundException("User Name is not Found");
		}
	}

}
