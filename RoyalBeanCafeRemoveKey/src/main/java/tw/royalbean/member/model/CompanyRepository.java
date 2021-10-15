package tw.royalbean.member.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.user.model.Users;

public interface CompanyRepository extends JpaRepository<Company, Integer> {
	
	public Optional<Company> findByNumber(String number);
	
	public Optional<Company> findByUsers(Users users);
}
