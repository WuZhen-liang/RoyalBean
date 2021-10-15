package tw.royalbean.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.activity.model.ActivityStoreService;

@Controller
@SessionAttributes(names = {"memberID"})
public class ActivityUserStoreController {
	
	@Autowired
	private ActivityStoreService storeService;
	
	//導至前端門市據點畫面jsp
	@GetMapping(path = "user/{memberID}/store")
	public String processStoreMain(@PathVariable("memberID") String mid,Model m) {
		m.addAttribute("memberID", mid); //提升Session:"cid"
		System.out.println("會員：" + mid);
		
		List<ActivityStore> allstores = storeService.findAllByOrderByEditDateDesc();
		m.addAttribute("allstores", allstores);
		
		int storeSize = allstores.size();
		m.addAttribute("storeSize", storeSize);
		
		List<ActivityStore> northstore = storeService.findBysZipBetween("0", "3");
		int northSize = northstore.size();
		m.addAttribute("northSize", northSize);
		
		List<ActivityStore> taoyuanstore = storeService.findBysZipBetween("3", "4");
		int taoyuanSize = taoyuanstore.size();
		m.addAttribute("taoyuanSize", taoyuanSize);
		
		List<ActivityStore> centralstore = storeService.findBysZipBetween("4", "6");
		int centralSize = centralstore.size();
		m.addAttribute("centralSize", centralSize);
		
		List<ActivityStore> tainanstore = storeService.findBysZipBetween("6", "8");
		int tainanSize = tainanstore.size();
		m.addAttribute("tainanSize", tainanSize);
		
		List<ActivityStore> southstore = storeService.findBysZipBetween("8", "999");
		int southSize = southstore.size();
		m.addAttribute("southSize", southSize);
		
		return "activity/userPageStoreView";
	}
	
	//模糊查詢ByName
	@PostMapping(path = "/activitystoreusersearch/{sName}")
	@ResponseBody
	public List<ActivityStore> processStoresUserFindByNameAction(@PathVariable("sName") String sName, Model m){
		System.out.println(sName);
		List<ActivityStore> allstores = storeService.findByName("%"+ sName +"%");
		System.out.println("進入ActivityUserStoreController模糊查詢ByName:"+ allstores);
		return allstores;
	}
	
	//分區查詢ByZip
	@PostMapping(path = "/activitystorezipsearch/{sZip}/{sZip1}")
	@ResponseBody
	public List<ActivityStore> processStoresUserFindByZipAction(@PathVariable("sZip") String sZip, @PathVariable("sZip1") String sZip1, Model m){
		System.out.println("介於:"+sZip+"和"+sZip1);
		List<ActivityStore> zipStores = storeService.findBysZipBetween("'"+sZip+"'", "'"+sZip1+"'");
		System.out.println("進入ActivityUserStoreController模糊查詢ByZip:"+ zipStores);
		return zipStores;
	}

}
