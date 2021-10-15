package tw.royalbean.shop.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.royalbean.member.model.Company;

public interface ShopPdRepository extends JpaRepository<ShopPd, Integer> {

//	@Query(value = "form Shoppd where cid = ?1")
//	public List<ShopPd> findShopPdsBycid();
//	
	public List<ShopPd> findByCompany(Company com);

	//模糊查詢
	public List<ShopPd> findByShopPdNameIsLike(String name);
	
	//依價格查詢 高到低
	@Query(value = "SELECT * FROM shoppd ORDER BY shoppdprice DESC", nativeQuery = true)
	public List<ShopPd> findAllByOrderByShopPdPriceDESC();
	
	//依價格查詢 低到高
	@Query(value = "SELECT * FROM shoppd ORDER BY shoppdprice ASC", nativeQuery = true)
	public List<ShopPd> findAllByOrderByShopPdPriceASC();
	
	//依種類查詢 --> 蛋糕
	@Query(value = "SELECT * FROM shoppd Where shoppdType='蛋糕'", nativeQuery = true)
	public List<ShopPd> findAllCake();
	
	//依種類查詢 --> 咖啡
	@Query(value = "SELECT * FROM shoppd Where shoppdType='咖啡'", nativeQuery = true)
	public List<ShopPd> findAllCoffee();
	
	//依種類查詢 --> 咖啡豆
	@Query(value = "SELECT * FROM shoppd Where shoppdType='咖啡豆'", nativeQuery = true)
	public List<ShopPd> findAllCoffeeBean();
	
	
	//依廠商查詢 --> 所上架的商品數量
	@Query(value = "SELECT count(*) FROM shoppd Group By cid Order By cid", nativeQuery = true)
	public List<Integer> findCompanyPds();
	
	//相關產品查詢排除自己本身
	@Query(value = "SELECT * FROM shoppd Where shoppdType=?1 and shoppdnumber != ?2", nativeQuery = true)
	public List<ShopPd> findByShopPdTypeNotInclude(String shoppdType,int shoppdnumber);

	

}
