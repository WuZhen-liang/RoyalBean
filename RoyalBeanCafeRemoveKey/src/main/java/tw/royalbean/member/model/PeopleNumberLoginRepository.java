package tw.royalbean.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PeopleNumberLoginRepository extends JpaRepository<PeopleNumberLogin, Integer> {
	
	public List<PeopleNumberLogin> findByYearLike(String year);
	
	public Optional<PeopleNumberLogin> findByMonth(int month);
	
}
