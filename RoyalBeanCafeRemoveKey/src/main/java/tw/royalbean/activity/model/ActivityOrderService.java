package tw.royalbean.activity.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.member.model.Member;

@Service
@Transactional
public class ActivityOrderService {
	
	@Autowired
	private ActivityOrderRespository activityOrderRespository;
	
	//報名活動
	public ActivityOrder insert(ActivityOrder activityOrder) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		activityOrder.setAorderDate(sdFormat.format(currentDate));
		
		System.out.println("進入ActivityOrderService執行insert方法報名");
		return activityOrderRespository.save(activityOrder);
	}
	
	//取消報名
	public void delete(int aoid) {
		activityOrderRespository.deleteById(aoid);
	}
	
	//查詢所有活動訂單
	public List<ActivityOrder> findAllOrders(){
		return activityOrderRespository.findAll();
	}
	
	//查詢活動訂單ByaoId
	public ActivityOrder findById(int aoId) {
		return activityOrderRespository.findById(aoId).get();
	}
	
	//查詢活動訂單Byactivity
	public List<ActivityOrder> findByActivity(Activity activity){
		return activityOrderRespository.findByactivity(activity);
	}
	
	//查詢活動訂單Bymember
	public List<ActivityOrder> findByMember(Member member){
		return activityOrderRespository.findBymember(member);
	}

}
