package tw.royalbean.activity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.member.model.Company;

public interface ActivityRespository extends JpaRepository<Activity, Integer> {

	public List<Activity> findBycompany(Company company);
	
	public List<Activity> findByaCategoryLike(String aCategory);
	
}
