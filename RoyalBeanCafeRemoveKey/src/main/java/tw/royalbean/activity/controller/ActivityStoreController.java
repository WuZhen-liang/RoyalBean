package tw.royalbean.activity.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.activity.model.ActivityStoreService;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;

@Controller
//@SessionAttributes(names = {"totalPages", "totalElements"})
@SessionAttributes(names = {"companyID"})
public class ActivityStoreController {

	@Autowired
	private ActivityStoreService storeService;
	
	@Autowired
	private CompanyService cService;
	
	//導至門市管理主畫面jsp
	@GetMapping(path = "company/{companyID}/activityStore")
	public String processActivityStoreMain(@PathVariable("companyID") String cid,Model m) {
		m.addAttribute("cid", cid); //提升Session:"cid"
		System.out.println("廠商：" + cid);
		
		List<ActivityStore> actstores = storeService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actstores",actstores);
		return "activity/activityStoreManagement";
	}
		
	
	
	//導至新增門市畫面jsp
	@GetMapping(path = "company/{cid}/activityStoreAdd")
	public String processActivityStoreAdd(Model m) {
		ActivityStore store = new ActivityStore();
		m.addAttribute("activity/activityStoreAdd",store);
		return "activity/activityStoreAdd";
	}
	
	//新增門市submit
	@PostMapping(path = "company/{cid}/addStores")
	public String processActivityStoreAddFormAction(@ModelAttribute(name="activity/activityStoreAdd") ActivityStore store1, BindingResult bind,Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityStoreController執行processActivityStoreAddFormAction新增門市");

		if(bind.hasErrors()) {
			return "activity/activityStoreError";
		}
		
		Company company = cService.findById(Integer.valueOf(cid));
		store1.setCompany(company);
		ActivityStore insertStore = storeService.insert(store1);

		List<ActivityStore> actstores = storeService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actstores",actstores);
		return "activity/activityStoreManagement";
	}
	
	//模糊查詢ByName
	@PostMapping(path = "/activityStorefindbyname/{sName}")
	@ResponseBody
	public List<ActivityStore> processActivityStoresFindByNameAction(@PathVariable("sName") String sName, Model m){
		System.out.println(sName);
		List<ActivityStore> list = storeService.findByName("%"+ sName +"%");
		System.out.println("進入ActivityStoreController模糊查詢ByName:"+list);
		return list;
	}
	
	//導至修改門市畫面jsp
	@GetMapping(path = "company/{cid}/storeupdate{sid}")
	public String processActivityStoreUpdateAction(@PathVariable(name = "sid") String sId, Model m) {
		ActivityStore updateStore = storeService.findById(Integer.valueOf(sId));
		m.addAttribute("activity/activityStoreUpdate",updateStore);
		System.out.println("進入ActivityStoreController執行修改前查找:" + sId);
		return "activity/activityStoreUpdate";
	}
	
	//修改門市submit
	@PostMapping(path = "company/{cid}/updateStore")
	public String processActivityStoreUpdateFormAction(@ModelAttribute(name="activity/activityStoreUpdate") ActivityStore updateStore1, BindingResult bind, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityStoreController執行processActivityStoreUpdateFormAction修改門市資料");

		if(bind.hasErrors()) {
			return "activity/activityStoreError";
		}
		storeService.update(updateStore1);
		
		List<ActivityStore> actstores = storeService.findBycid(Integer.valueOf(cid));
		m.addAttribute("actstores",actstores);
		return "activity/activityStoreManagement";
	}
	
	//刪除門市submit
	@PostMapping(path = "/storedelete{sid}")
	public String processActivityStoreDeleteAction(@PathVariable(name = "sid") String sId, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityStoreController執行processActivityStoreDeleteAction刪除:" + sId);
		ActivityStore deleteStore = storeService.findById(Integer.valueOf(sId));
		storeService.delete(deleteStore);
		
		return "activity/activityStoreManagement";
	} 
	
	//上傳門市照片
	@PostMapping(path = "/activity/activityphotouploadcontroller", produces = MediaType.ALL_VALUE)
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
	
	//分頁門市管理主畫面
		/*
		@PostMapping(path = "/activityStorefindbypage/{pageNo}")
		@ResponseBody
		public List<ActivityStore> processActivityStoresFindByPageAction(@PathVariable("pageNo") int pageNo, Model m){
			
			int pageSize = 5;
			Pageable pageable = PageRequest.of(pageNo-1, pageSize, Sort.by("editDate").descending());
			Page<ActivityStore> page = aService.findAllByPage(pageable);
			
			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();
			
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("totalElements", totalElements);
			return page.getContent();
		}
		*/
	
}
