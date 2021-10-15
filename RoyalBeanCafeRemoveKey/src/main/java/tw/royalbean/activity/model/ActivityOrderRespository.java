package tw.royalbean.activity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.member.model.Member;

public interface ActivityOrderRespository extends JpaRepository<ActivityOrder, Integer> {
	
	public List<ActivityOrder> findByactivity(Activity activity);
	
	public List<ActivityOrder> findBymember(Member member);

}
