package tw.royalbean.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.user.model.Users;

@Service
@Transactional
//public class CompanyService implements UserDetailsService {
	public class CompanyService {
	@Autowired
	private CompanyRepository companyRepository;
	
	public Company findByNumber(String number) {
		Optional<Company> cResp =  companyRepository.findByNumber(number);		
		if (cResp.isEmpty()) {
			throw new UsernameNotFoundException(number);
		}		
		return cResp.get();
	}
	
	public Company saveAndUpdate(Company company) {
		return companyRepository.save(company);
	}
	
	public void deleteById(Integer id) {
		companyRepository.deleteById(id);
	}
	
	public List<Company> findAlldata() {
		return companyRepository.findAll();
	}
	
	public Page<Company> findAllByPage(Pageable pageable) {
		return companyRepository.findAll(pageable);
	}
	
	public Company findById(Integer mid) {
		Optional<Company> cResp= companyRepository.findById(mid);
		if (cResp.isEmpty()) {
			throw new UsernameNotFoundException("We can't find your account");
		}
		return cResp.get();
	}
	public Company findByUsers(Users users) {
		Optional<Company> cResp= companyRepository.findByUsers(users);
		return cResp.get();
	}
	
//  ------------------------------   CompanyLogin ------------------------------	

	
}
