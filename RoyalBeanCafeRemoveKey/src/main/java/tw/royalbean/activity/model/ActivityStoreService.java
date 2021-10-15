package tw.royalbean.activity.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyRepository;

@Service
@Transactional
public class ActivityStoreService {

	@Autowired
	private ActivityStoreRespository activityStoreRespository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	//新增門市
	public ActivityStore insert(ActivityStore aStore) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		aStore.setEditDate(sdFormat.format(currentDate));

		System.out.println("進入ActivityStoreService執行insert方法新增門市");
		return activityStoreRespository.save(aStore);
	}
	
	//查詢單筆門市ById
	public ActivityStore findById(int sid) {
		Optional<ActivityStore> sResp = activityStoreRespository.findById(sid);
		if(sResp.isPresent()) {
			System.out.println("進入ActivityStoreService執行findById方法查詢:"+sid+"門市資料");
			return sResp.get();
		}
		System.out.println("進入ActivityStoreService執行findById方法查詢無"+sid+"資料");
		return null;
	}
	
	//查詢門市ByName
	public List<ActivityStore> findByName(String sName){
		List<ActivityStore> sResp = activityStoreRespository.findBysNameLike(sName);
		if(sResp.isEmpty()) {
			return null;
		}
		System.out.println("進入ActivityStoreService執行findByName方法查詢:"+sName+"門市資料");
		return sResp;
	}
	
	//查詢全部門市
	public List<ActivityStore> findAll(){
		System.out.println("進入ActivityStoreService執行findAll方法取得所有門市List<ActivityStore>");
		return activityStoreRespository.findAll();
	}
	
	//查詢全部門市
	public List<ActivityStore> findAllByOrderByEditDateDesc(){
		System.out.println("進入ActivityStoreService執行findAll方法取得所有門市List<ActivityStore>");
		return activityStoreRespository.findAllByOrderByEditDateDesc();
	}
	
	//查詢門市Bycid
	public List<ActivityStore> findBycid(int cid){
		System.out.println("進入ActivityStoreService執行findBycid方法取得廠商:"+ cid +"的List<ActivityStore>");
		Company company = companyRepository.getById(cid);
		return activityStoreRespository.findBycompany(company);
	}
	
	//查詢門市BysZip
	public List<ActivityStore> findBysZipBetween(String szip, String szip1){
		System.out.println("進入ActivityStoreService執行findBysZipBetween方法取得區域的List<ActivityStore>");
		return activityStoreRespository.findBysZipBetween(szip, szip1);
	}
	
	//分頁查詢門市
	public Page<ActivityStore> findAllByPage(Pageable pageable){
		System.out.println("進入ActivityStoreService執行findAllByPage方法取得Page<ActivityStore>");
		return activityStoreRespository.findAll(pageable);
	}
	
	//修改門市
	public ActivityStore update(ActivityStore aStore) {
		//Date date = new Date();
		//aStore.setEditDate(date);
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		aStore.setEditDate(sdFormat.format(currentDate));

		
		System.out.println("進入ActivityStoreService執行update方法修改門市");
		return activityStoreRespository.save(aStore);
	}
	
	//刪除門市
	public void delete(ActivityStore aStore) {
		System.out.println("進入ActivityStoreService執行delete方法刪除門市");
		activityStoreRespository.delete(aStore);
	}
	
}
