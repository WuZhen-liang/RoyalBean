package tw.royalbean.activity.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityService;
import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.activity.model.ActivityStoreService;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;

@Controller
@SessionAttributes(names = {"companyID"})
public class ActivityController {
	
	@Autowired
	private ActivityService actService;
	
	@Autowired
	private CompanyService cService;
	
	@Autowired
	private ActivityStoreService storeService;
	
	//導至活動管理主畫面jsp
	@GetMapping(path = "company/{companyID}/activity")
	public String processActivityMain(@PathVariable("companyID") String cid,Model m) {
		m.addAttribute("cid", cid); //提升Session:"cid"
		System.out.println("廠商：" + cid);
			
		List<Activity> actlist = actService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actlist", actlist);
		return "activity/activityManagement";
	}

	//導至活動新增畫面jsp
	@GetMapping(path = "company/{companyID}/activityadd{sid}")
	public String processActivityAdd(@PathVariable("companyID") String cid, @PathVariable("sid") String sid, Model m) {
		System.out.println("廠商：" + cid);
		System.out.println("門市：" + sid);
		
		Activity activity = new Activity();
		//先透過Path取得company物件送到新增畫面
		Company company = cService.findById(Integer.valueOf(cid));
		activity.setCompany(company);
		//先透過Path取得activityStore物件送到新增畫面
		ActivityStore activityStore = storeService.findById(Integer.valueOf(sid));
		activity.setActivityStore(activityStore);
		
		m.addAttribute("activity/activityAdd",activity);
		return "activity/activityAdd";
	}
	
	//新增活動submit
	@PostMapping(path = "company/{cid}/addActivity")
	public String processActivityAddFormAction(@ModelAttribute(name="activity/activityAdd") Activity activity, BindingResult bind1, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityController執行processActivityAddFormAction新增活動");

		if(bind1.hasErrors()) {
			return "activity/activityError";
		}
			
		Activity insertStore = actService.insert(activity);

		List<Activity> actlist = actService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actlist", actlist);
		return "activity/activityManagement";
	}
		
	//導至修改活動畫面jsp
	@GetMapping(path = "company/{cid}/activityupdate{aid}")
	public String processActivityUpdate(@PathVariable(name = "aid") String aid, Model m) {
		Optional<Activity> updateActivity = actService.findByaid(Integer.valueOf(aid));
		m.addAttribute("activity/activityUpdate", updateActivity);
		System.out.println("進入ActivityController執行修改前查找:" + aid);
		return "activity/activityUpdate";
	}
	
	//修改門市submit
	@PostMapping(path = "company/{cid}/updateActivity")
	public String processActivityUpdateFormAction(@ModelAttribute(name = "activity/activityUpdate") Activity activity, BindingResult bind, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityController執行processActivityUpdateFormAction修改活動資料");
		
		actService.update(activity);
		
		List<Activity> actlist = actService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actlist", actlist);
		return "activity/activityManagement";
	}
	
	//刪除活動submit
	@PostMapping(path = "/activitydelete{aid}")
	public String processActivityDeleteAction(@PathVariable(name = "aid") String aid, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityController執行processActivityDeleteAction刪除:" + aid);

		actService.deleteById(Integer.valueOf(aid));
		
		return "activity/activityStoreManagement";
	} 
	
	
	
	//上傳活動照片
	@PostMapping(path = "/activity/activityphotoupload", produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String processActivityPhotoUploadAction(@RequestParam("myfile") MultipartFile multipartFile, Model m) {
					
		String currentDate = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String fileName = currentDate + multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);
			
		//String saveDirPath = "C:\\Users\\YAYI\\git\\RoyalBeanCafe\\RoyalBeanCafe\\RoyalBeanCafeProject\\src\\main\\resources\\static\\images\\activity";
		String saveDirPath = "C:\\activityphoto";
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
			
		try {
			File saveFilePath = new File(saveFileDir, fileName);
			multipartFile.transferTo(saveFilePath);
			System.out.println("saveFilePath:" + saveFilePath);
		} catch (IllegalStateException | IOException e) {
			System.out.println("上傳圖片失敗:" + e);
			e.printStackTrace();
		}
			
		return fileName;
	}
	
	
	
	
	

}
