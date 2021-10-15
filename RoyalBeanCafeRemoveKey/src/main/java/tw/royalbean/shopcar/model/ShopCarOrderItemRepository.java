package tw.royalbean.shopcar.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.royalbean.member.model.Company;
import tw.royalbean.shop.model.ShopPd;

public interface ShopCarOrderItemRepository extends JpaRepository<ShopCarOrderItem, Integer> {

	//查詢用購物車編號找到對應的商品
	@Query(value = "SELECT * FROM shopcarorderitem Where fk_cartid=?1", nativeQuery = true)
	public List<ShopCarOrderItem> findByShopCarOrderItemDetail(int shopcartid);
	
}
