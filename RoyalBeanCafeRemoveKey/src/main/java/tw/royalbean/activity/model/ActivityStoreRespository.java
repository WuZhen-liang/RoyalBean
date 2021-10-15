package tw.royalbean.activity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.member.model.Company;

public interface ActivityStoreRespository extends JpaRepository<ActivityStore, Integer> {

	public List<ActivityStore> findBysNameLike(String sName);
	
	public List<ActivityStore> findBycompany(Company company);
	
	public List<ActivityStore> findAllByOrderByEditDateDesc();
	
	public List<ActivityStore> findBysZipBetween(String szip, String szip1);
	
}
