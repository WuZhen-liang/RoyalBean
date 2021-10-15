package tw.royalbean.activity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivitySatisfactionRespository extends JpaRepository<ActivitySatisfaction, Integer> {
	
	public List<ActivitySatisfaction> findByactivityOrder(ActivityOrder activityOrder);

}
