package tw.royalbean.member.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.user.model.Users;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	
	public Optional<Member> findByEncode(String encode);

	public Optional<Member> findByEmail(String email);

	public Optional<Member> findByUsers(Users users);

}
