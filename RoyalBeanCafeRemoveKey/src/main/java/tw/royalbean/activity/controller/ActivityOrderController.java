package tw.royalbean.activity.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityOrder;
import tw.royalbean.activity.model.ActivityOrderService;
import tw.royalbean.activity.model.ActivityService;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;

@Controller
@SessionAttributes(names = {"companyID"})
public class ActivityOrderController {
	
	@Autowired
	private ActivityOrderService aOrderService;
	
	@Autowired
	private CompanyService cService;
	
	@Autowired
	private ActivityService actService;

	//導至活動管理主畫面jsp
	@GetMapping(path = "company/{companyID}/activityOrder")
	public String processActivityMain(@PathVariable("companyID") String cid,Model m) {
		m.addAttribute("companyID", cid); //提升Session:"companyID"
		System.out.println("廠商：" + cid);
		
		List<Activity> activities = actService.findBycid(Integer.valueOf(cid));
		List<ActivityOrder> orderList = new  ArrayList<>();
		for(Activity a: activities) {			
			List<ActivityOrder> act = aOrderService.findByActivity(a);
			orderList.addAll(act);
		}
		
		m.addAttribute("orderList", orderList);
		
		return "activity/activityOrderManagement";
	}
	
	//刪除訂單
	@PostMapping(path = "/orderdelete{aoid}")
	public String processActivityDeleteAction(@PathVariable(name = "aoid") String aoid, Model m, @ModelAttribute(name = "cid") String cid) {
		System.out.println("進入ActivityController執行processActivityDeleteAction刪除:" + aoid);

		aOrderService.delete(Integer.valueOf(aoid));
			
		return "activity/activityOrderManagement";
	} 
	
}
