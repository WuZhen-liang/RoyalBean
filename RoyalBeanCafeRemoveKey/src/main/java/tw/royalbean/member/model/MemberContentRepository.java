package tw.royalbean.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberContentRepository extends JpaRepository<MemberContent, Integer> {
	
	public Optional<MemberContent> findByMember(Member member);	
	
	public List<MemberContent> findByGenderLike(String gender);
	
}
