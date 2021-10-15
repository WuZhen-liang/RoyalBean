package tw.royalbean.activity.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivitySatisfactionService {
	
	@Autowired
	private ActivitySatisfactionRespository aSatisfactionRespository;
	
	//新增評論
	public ActivitySatisfaction insert(ActivitySatisfaction aSatisfaction) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		aSatisfaction.setAsDate(sdFormat.format(currentDate));
		
		System.out.println("進入ActivitySatisfactionService執行insert方法新增評論");
		return aSatisfactionRespository.save(aSatisfaction);
	}
	
	//查詢全部
	public List<ActivitySatisfaction> findAll(){
		System.out.println("進入ActivitySatisfactionService執行findAll方法查詢評論");
		return aSatisfactionRespository.findAll();
	}
	
	//查詢Byactivityorder
	public List<ActivitySatisfaction> findByactivityOrder(ActivityOrder activityOrder){
		return aSatisfactionRespository.findByactivityOrder(activityOrder);
	}

}
