package tw.royalbean.shop.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyRepository;
import tw.royalbean.member.model.Member;

@Service
@Transactional
public class ShopPdService {
	
	@Autowired
	private CompanyRepository companyRepository;
		
	@Autowired
	private ShopPdRepository sRepository;
	
	
	//insert
	public ShopPd insertShopPd(ShopPd addshopPd) {
		
//		Company company = companyRepository.getById(2);		
//		addshopPd.setCompany(company);
//		System.out.println((addshopPd.getCompany().getId()));
		return sRepository.save(addshopPd);
	}
	
	//update	
	public ShopPd updateShopPd(ShopPd updateshopPd) {
		return sRepository.save(updateshopPd);
	}
	
	//queryById
	
	public ShopPd queryShopPdById(int shopPdNum) {
		Optional<ShopPd> shopPdResult = sRepository.findById(shopPdNum);
		return shopPdResult.get();
	}
	
	//queryByCompanyProduct
	
	public List<ShopPd> queryByCompanyProduct(int cid) {
		Company company = companyRepository.getById(cid);
		System.out.println("取得對應廠商成功");
		List<ShopPd> venderPd = sRepository.findByCompany(company);
		System.out.println("查詢商品成功");
		return venderPd;
	}
	
	//queryAll
	public List<ShopPd> queryShopPdAllItem(){
		return sRepository.findAll();
	}
	
	//deleteShopPdById	
	public void deleteShopPdById(int shopPdNum) {
		sRepository.deleteById(shopPdNum);
	}
	
	//deleteShopPdUseInfo
	public void deleteShopPdInfo(ShopPd shopPdItem) {
		sRepository.delete(shopPdItem);
	}
	
	//AdminSystem SearchPdPage
	public Page<ShopPd> findAllByPage(Pageable pageable) {
		return sRepository.findAll(pageable);
	}
	
	//userQueryByNameLike
	public List<ShopPd> findByShopPdNameIsLike(String name){
		return sRepository.findByShopPdNameIsLike(name);
	}
	
	//userQuery_OrderBy_price high --> cheap
	public List<ShopPd> findAllByOrderByShopPdPriceDESC(){
		return sRepository.findAllByOrderByShopPdPriceDESC();
	}
	
	//userQuery_OrderBy_price cheap --> high
	public List<ShopPd> findAllByOrderByShopPdPriceASC(){
		return sRepository.findAllByOrderByShopPdPriceASC();
	}
	
	//userQuery_findAllCake --->查看所有蛋糕
	public List<ShopPd> findAllCake(){
		return sRepository.findAllCake();
	}
	
	//userQuery_findAllCoffee --->查看所有咖啡
	public List<ShopPd> findAllCoffee(){
		return sRepository.findAllCoffee();
	}
	
	//userQuery_findAllCoffeeBean --->查看所有咖啡豆
	public List<ShopPd> findAllCoffeeBean(){
		return sRepository.findAllCoffeeBean();
	}
	
	//userQuery_findCompanyPd --->查看各個廠商自己所上架的商品
	public List<Integer> findCompanyPds() {
		return sRepository.findCompanyPds();
	}
	
	//user_PdDetail_findOtherPd --->查看其他相關商品
	//shopdetail_Page
	public List<ShopPd> findByShopPdTypeNotInclude(String shoppdType,int shoppdnumber){
		return sRepository.findByShopPdTypeNotInclude(shoppdType,shoppdnumber);
	}
}
