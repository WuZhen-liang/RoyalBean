package tw.royalbean.activity.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyRepository;

@Service
@Transactional
public class ActivityService {
	
	@Autowired
	private ActivityRespository activityRespository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	//新增活動
	public Activity insert(Activity activity) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		activity.setaDate(sdFormat.format(currentDate));
		
		System.out.println("進入ActivityService執行insert方法新增活動");
		return activityRespository.save(activity);
	}
	
	//查詢所有All
	public List<Activity> findAll(){
		System.out.println("進入ActivityService執行findAll方法查詢所有活動");
		return activityRespository.findAll();
	}
	
	//查詢活動Byaid
	public Optional<Activity> findByaid(int aid){
		System.out.println("進入ActivityService執行findByaid方法取得aid:"+ aid +"之資料");
		return activityRespository.findById(aid);
	}
	
	//查詢活動Byaid
	public Activity findByaid2(int aid){
		System.out.println("進入ActivityService執行findByaid方法取得aid:"+ aid +"之資料");
		return activityRespository.findById(aid).get();
	}
	
	//查詢活動Bycid
	public List<Activity> findBycid(int cid){
		System.out.println("進入ActivityService執行findBycid方法取得廠商:"+ cid +"的List<Activity>");
		Company company = companyRepository.getById(cid);
		return activityRespository.findBycompany(company);
	}
	
	//查詢活動ByName
	public List<Activity> findByCategory(String aCategory){
		List<Activity> sResp = activityRespository.findByaCategoryLike(aCategory);
		if(sResp.isEmpty()) {
			return null;
		}
		System.out.println("進入ActivityService執行findByCategory方法查詢:"+aCategory+"活動資料");
		return sResp;
	}
	
	//新增活動
	public Activity update(Activity activity) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		activity.setaDate(sdFormat.format(currentDate));
		
		System.out.println("進入ActivityService執行update方法修改活動");
		return activityRespository.save(activity);
	}
	
	//刪除活動
	public void deleteById(int aid) {
		System.out.println("進入ActivityService執行delete方法刪除活動");
		activityRespository.deleteById(aid);
	}

}
