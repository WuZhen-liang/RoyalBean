package tw.royalbean.shopadmin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.shop.model.ShopPd;
import tw.royalbean.shop.model.ShopPdMessage;
import tw.royalbean.shop.model.ShopPdMessageService;
import tw.royalbean.shop.model.ShopPdService;
import tw.royalbean.shopcar.model.ShopCar;
import tw.royalbean.shopcar.model.ShopCarService;

@Controller
@SessionAttributes(names = {"totalPages_shoppd","totalElements_shoppd"})
public class ShopAdminController {

	@Autowired
	private ShopPdService sPdService;
	
	@Autowired
	private CompanyService cService;
	
	@Autowired
	private ShopCarService sCarService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShopPdMessageService sPdMessageService;
	
	@GetMapping(path = "admin/adminEntry")
	public String processToShopAdminPage() {
		return "BackSystem/shopBackSystem";
	}
	
	@GetMapping(path = "admin/goto_addpd_form")
	public String processGoToAddPdForm() {
		return "shop/shopBackSystemAdd";
	}
	
	//admin searchAllPd
	@PostMapping(path = "admin/shopAdminSearchShopPd_findAlldata/{pageNo}")
	@ResponseBody
	public List<ShopPd> queryAdminShopPdByPageAction(@PathVariable("pageNo")int pageNo,Model m) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<ShopPd> page= sPdService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		System.out.println("totalPages"+totalPages);
		long totalElements = page.getTotalElements();
		m.addAttribute("totalPages_shoppd",totalPages);
		m.addAttribute("totalElements_shoppd",totalElements);
		
		return page.getContent();
	}
	
	//admin insert pd to db
	@PostMapping(path = "admin/shopadmininsertshoppd")
	@ResponseBody
	public String processAdminInsertShopPd(@RequestBody ShopPd pd,Model m) {
		System.out.println(pd.getShopPdName());
//		Company company = cService.findById(1);
////		System.out.println(company.getName());
//		pd.setCompany(company);		
		sPdService.insertShopPd(pd);
		return "success";
	}
	
	//admin saveImage
	@PostMapping(path = "admin/adminshopphoto", produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String processMemberPhotoAction(@RequestParam("PdPicture") MultipartFile multipartFile, Model m) throws Exception, IOException {
					
		String currentDate = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String fileName = currentDate+multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);
			
		String saveDirPath = "C:/temp/shoppicture/";
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
		String saveFilePath = saveDirPath+ fileName;
	
			
		File saveFile = new File(saveFilePath);
		multipartFile.transferTo(saveFile);
		System.out.println("saveFilePath:" + saveFilePath);
		
//		String filename = "/temp-rainy/" + fileName; 
//		m.addAttribute("filename", filename);
		
		return fileName;
	}
	
	//admin update product go to updateForm
	
	@GetMapping(path = "admin/{pdId}.adminupdate")
	public String processAdminUpdateGoToUpdateForm(@PathVariable("pdId") int pdId,Model m) {
		System.out.println("pdId:"+pdId);
		ShopPd updateItem = sPdService.queryShopPdById(pdId);
		m.addAttribute("shop/shopBackSystemUpdate",updateItem);
		System.out.println(updateItem.getShopPdName());
		return "shop/shopBackSystemUpdate";
	}
	
	//admin update product to database
	@PostMapping(path = "admin/adminupdatePd")
	public String processAdminUpdateFormAction(@ModelAttribute("shop/shopBackSystemUpdate") ShopPd adminUpdatePd,Model m) {
		sPdService.updateShopPd(adminUpdatePd);
		return "BackSystem/shopBackSystem";
	}
	
	
	
	
	//admin delete product to database
	
	@GetMapping(path = "admin/{pdId}.admindelete")
	public String processAdminDeleteShopPd(@PathVariable("pdId") int pdId,Model m) {
		System.out.println("pdId:"+pdId);
		sPdService.deleteShopPdById(pdId);
		return "BackSystem/shopBackSystem";
	}
	
	//admin 訂單管理
	@GetMapping(path = "admin/orderDetail")
	public String processFindAllShopOrder(Model m) {
		List<ShopCar> allOrderDetail = sCarService.findAll();
		m.addAttribute("allOrderDetail", allOrderDetail);
		return "shop/shopBackSystemOrderList";
	}
	
	//拿到訂單所對應到的會員編號
	@PostMapping(path = "/getOrderMemberId")
	@ResponseBody
	public int processFindAllShopOrderMemberId(int shopcarid){
		ShopCar thisCar = sCarService.findById(shopcarid);
		return thisCar.getMember().getId();
	}
	
//	//拿到訂單所對應到的會員編號
//	@PostMapping(path = "/getOrderMemberIdTest")
//	@ResponseBody
//	public ArrayList<Integer> processFindAllShopOrderMemberIdTest(){
//		ArrayList<Integer> allMemberId = new ArrayList<Integer>();
//		List<ShopCar> allOrderDetail = sCarService.findAll();
//		for(int i=0;i<allOrderDetail.size();i++) {
//			int memberId = allOrderDetail.get(i).getMember().getId();
//			allMemberId.add(memberId);
//		}
//		return allMemberId;
//	}
	
//-------------	統計圖表------------------
	//admin 統計圖表
	@GetMapping(path = "admin/statisticalDiagram")
	public String processFindStatisticChart() {
		return "shop/shopBackSystemStatisticalDiagram";
//		return "shop/shopBackCharJs";
	}
	
	//admin 統計圖表(查詢所有廠商)
	@PostMapping(path = "admin/findAllMember")
	@ResponseBody
	public List<Member> processFindAllCompany(){
		return memberService.findAlldata();
	}
	
	// admin 統計圖表找到所有商品
	@PostMapping(path = "admin/findAllPd")
	@ResponseBody
	public List<ShopPd> processFindAllPd(){
		List<ShopPd> allShopPd = sPdService.queryShopPdAllItem();
		return allShopPd;
	}
	
	// admin 統計圖表找到所有商品
	@PostMapping(path = "admin/findAllShopOrder")
	@ResponseBody
	public List<ShopCar> processFindAllShopOrder(String shopPdMember){
		System.out.println("shopPdMember"+shopPdMember);
		return sCarService.findAll();
	}
	
	// admin 找到所有留言
	@PostMapping(path = "admin/findAllShopPdMessaage")
	@ResponseBody
	public List<ShopPdMessage> processFindAllShopPdMessaage(){
		return sPdMessageService.findAllShopMessage();		
	}
	
}
