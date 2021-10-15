package tw.royalbean.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.shop.model.ShopPd;
import tw.royalbean.shop.model.ShopPdService;

@RestController
@SessionAttributes(value = {"count"})
public class ShopPdSelectFavorateController {
	@Autowired
	private ShopPdService sPdService;
	
	@Autowired
	private CompanyService cService;
	
	//模糊查詢
	@PostMapping(path = "user/search_for_user_keyin")
	public List<ShopPd> processShopPdSearchForKeyIn(String data,Model m){
		System.out.println("data:"+data);
		List<ShopPd> search = sPdService.findByShopPdNameIsLike("%"+data+"%");
		m.addAttribute("shopSearchResult",search);
		return search;
	}
	
	//使用者選取價格由高到低排序
	@PostMapping(path = "user/search_for_user_orderByPrice_upTodown")
	public List<ShopPd> processShopPdSearchForUserOrderByPriceDESC(){
		List<ShopPd> search = sPdService.findAllByOrderByShopPdPriceDESC();
		return search;
	}
	
	//使用者選取價格由低到高排序
	@PostMapping(path = "user/search_for_user_orderByPrice_downToup")
	public List<ShopPd> processShopPdSearchForUserOrderByPriceASC(){
		List<ShopPd> search = sPdService.findAllByOrderByShopPdPriceASC();
		return search;
	}
	
	//使用者選取商品種類-->蛋糕
	@PostMapping(path = "user/search_for_user_shoptype_cake")
	public List<ShopPd> processShopPdSearchForUserShopTypeCake(){
		List<ShopPd> search = sPdService.findAllCake();
		return search;
	}
	
	//使用者選取商品種類-->咖啡
	@PostMapping(path = "user/search_for_user_shoptype_coffee")
	public List<ShopPd> processShopPdSearchForUserShopTypeCoffee(){
		List<ShopPd> search = sPdService.findAllCoffee();
		return search;
	}
	
	//使用者選取商品種類-->咖啡豆
	@PostMapping(path = "user/search_for_user_shoptype_coffeebean")
	public List<ShopPd> processShopPdSearchForUserShopTypeCoffeeBean(){
		List<ShopPd> search = sPdService.findAllCoffeeBean();
		return search;
	}
	
	//找尋所有廠商
	@PostMapping(path = "user/search_for_company")
	public List<Company> processShopPdSearchForCompany(Model m){
		List<Company> search = cService.findAlldata();
		return search;
	}
	
	//找尋所有廠商
	@PostMapping(path = "user/searchCompanyPd")
	public List<ShopPd> processShopPdSearchForCompanyProduct(int cid){
		System.out.println("cid:"+cid);
		List<ShopPd> searchShopPd = sPdService.queryByCompanyProduct(cid);
		System.out.println("成功!!!!");
		return searchShopPd;
	}
	
	
//	//商品詳細頁面
//	@PostMapping(path = "user/searchRealationPd")
//	public List<ShopPd> processShopRealationPdSearch(String pdtype){
//		System.out.println("pdtype:"+pdtype);
//		if(pdtype.equals("咖啡")) {
//			return sPdService.findAllCoffee();
//		}else if (pdtype.equals("咖啡豆")) {
//			return sPdService.findAllCoffeeBean();
//		}else {
//			return sPdService.findAllCake();
//		}
//	}
	
}
