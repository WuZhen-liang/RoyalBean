package tw.royalbean.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityOrder;
import tw.royalbean.activity.model.ActivityOrderService;
import tw.royalbean.activity.model.ActivitySatisfaction;
import tw.royalbean.activity.model.ActivitySatisfactionService;
import tw.royalbean.activity.model.ActivityService;
import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.activity.model.ActivityStoreService;

@Controller
public class ActivityStaffController {

	@Autowired
	private ActivityService activityService;
	
	@Autowired
	public ActivityStoreService storeService;
	
	@Autowired
	public ActivityOrderService aOrderService;
	
	@Autowired
	public ActivitySatisfactionService aSatisfactionService;
	
	
	//導至後台活動主畫面jsp
	@GetMapping(path = "admin/activity")
	public String processActivityAdmin(Model m) {
		return "activity/staffActivity";
	}
	
	@GetMapping(path = "activityajax")
	@ResponseBody
	public List<Activity> processActivityAjax() {
		List<Activity> activities = activityService.findAll();
		System.out.println("進入ActivityStaffController執行processActivityAjax方法");
		return activities;
	}
	
	//導至後台門市主畫面jsp
	@GetMapping(path = "admin/store")
	public String processStoreAdmin(Model m) {
		return "activity/staffStore";
	}
	
	@GetMapping(path = "storeajax")
	@ResponseBody
	public List<ActivityStore> processOrderAjax() {
		List<ActivityStore> stores = storeService.findAllByOrderByEditDateDesc();
		System.out.println("進入ActivityStaffController執行processOrderAjax方法");
		return stores;
	}
	
	//導至後台訂單主畫面jsp
	@GetMapping(path = "admin/activityorder")
	public String processOrderAdmin(Model m) {
		System.out.println("進入ActivityStaffController執行processOrderAdmin方法");
		List<ActivityOrder> orders = aOrderService.findAllOrders();
		m.addAttribute("orders", orders);
		return "activity/staffActivityOrder";
	}
	
	//導至後台評價主畫面jsp
	@GetMapping(path = "admin/activitysatisfaction")
	public String processSatisfactionAdmin(Model m) {
		List<ActivitySatisfaction> satisfactions = aSatisfactionService.findAll();
		System.out.println("進入ActivityStaffController執行processSatisfactionAdmin方法");
		m.addAttribute("satisfactions", satisfactions);
		return "activity/staffActivitySatisfaction";
	}
	
	
	//導至後台數據主畫面jsp
	@GetMapping(path = "admin/activitycharts")
	public String processChartsAdmin(Model m) {
		return "activity/staffActivityCharts";
	}
	
	//Ajax取ChartJS門市Data
	@PostMapping(path = "admin/getstoresdata")
	@ResponseBody
	public List<ActivityStore> processGetStoresData(Model m) {
		List<ActivityStore> storesList = storeService.findAll();		
		return storesList;
	}
	
	//Ajax取ChartJS活動Data
	@PostMapping(path = "admin/getactsdata")
	@ResponseBody
	public List<Activity> processGetActivityData(Model m) {
		List<Activity> actsList = activityService.findAll();		
		return actsList;
	}
	
	//Ajax取ChartJS訂單Data
	@PostMapping(path = "admin/getordersdata")
	@ResponseBody
	public List<ActivityOrder> processGetOrderData(Model m) {
		List<ActivityOrder> orders = aOrderService.findAllOrders();
		return orders;
	}
	
	//Ajax取ChartJS評論Data
	@PostMapping(path = "admin/satisfactionsdata")
	@ResponseBody
	public List<ActivitySatisfaction> processGetSatisfactionsData(Model m) {
		List<ActivitySatisfaction> sats = aSatisfactionService.findAll();
		return sats;
	}
	
}
