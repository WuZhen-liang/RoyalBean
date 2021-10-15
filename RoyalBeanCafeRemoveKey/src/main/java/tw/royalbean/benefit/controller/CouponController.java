package tw.royalbean.benefit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.benefit.model.Coupon;
import tw.royalbean.benefit.model.CouponService;

@Controller
@SessionAttributes(names = {"totalPages", "totalElements"})
public class CouponController {
	
	@Autowired
	private CouponService cpService;
	
	
	@GetMapping(path = "/venderEntry")
	public String processVenderEntry() {
		return "vender/venderLogin";
	}
	
	
	@RequestMapping(path = "/addCouponEntry",method = RequestMethod.GET)
	public String proccessAddCouponEntry(Model m) {
		Coupon cp = new Coupon();
		m.addAttribute("benefit/couponAddForm", cp);
		return "benefit/couponAddForm";
	}
		
	
	@RequestMapping(value = "/addCoupon",method = RequestMethod.POST)
	public String processAddCouponAction(@ModelAttribute("benefit/couponAddForm") Coupon cp,BindingResult bind, Model m) {
		if (bind.hasErrors()) {
			return "benefit/couponError";
		}		
		cpService.insertCoupon(cp);	
		return "benefit/manageTable";		
	}

	
	@GetMapping(path = "/couponManagementEntry")
	public String porcessCouponManagementEntry(Model m) {
		List<Coupon> cps = cpService.findAll();
		m.addAttribute("coupons", cps);
				
		return "benefit/manageTable";
	}
	
	@GetMapping(path = "/couponManagement.controller")
	public String processCouponMain(Model m) {
		return "benefit/manageTable";
	}
	
	@PostMapping(path = "/couponfindbypage/{pageNo}")
	@ResponseBody
	public List<Coupon> processCouponFindByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 3;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Coupon> page = cpService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		System.out.println("總頁數: "+totalPages);
		System.out.println("總資料筆數:  "+totalElements);
		
		return page.getContent();
	}
	
	 
	@PostMapping(path = "/coupon/{deleteID}")
	public String processCouponDeleteAction(@PathVariable(name = "deleteID") String cpid, Model m) {
		Coupon deletecp = cpService.findByCpid(Integer.valueOf(cpid));
		System.out.println("使用n.cpid查詢傳回deletecp");
		cpService.deleteCoupon(deletecp);
		System.out.println("成功刪除deletecp資料");
		return "benefit/manageTable";
	} 

	@GetMapping(path = "/coupon/update{n.cpid}")
	public String processCouponUpdateEntry(@PathVariable(name = "n.cpid") String cpid, Model m) {
		
		System.out.println("找到cpid: "+cpid);
		
		Coupon updatecp = cpService.findByCpid(Integer.valueOf(cpid));
		
		System.out.println("找到updatecp:"+updatecp);
		
		m.addAttribute("benefit/couponUpdate",updatecp);
		return "benefit/couponUpdate";
	}
		
	@PostMapping(path = "/coupon/updateCoupon")
	public String processCouponUpdateAction(@ModelAttribute(name="benefit/couponUpdate") Coupon updatecp1, BindingResult bind,Model m) {

		if(bind.hasErrors()) {
			return "benefit/couponUpdateError";
		}
		cpService.updateCoupon(updatecp1);	
		return "benefit/manageTable";
	}
	
	
	
	
	
	
	
	
	
	

}
