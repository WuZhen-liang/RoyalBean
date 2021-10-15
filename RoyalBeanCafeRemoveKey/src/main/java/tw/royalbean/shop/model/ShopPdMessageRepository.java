package tw.royalbean.shop.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.royalbean.shopcar.model.ShopCarOrderItem;

public interface ShopPdMessageRepository extends JpaRepository<ShopPdMessage, Integer> {
	
	//查詢用商品編號找到對應的所有評論
	@Query(value = "SELECT * FROM shoppdmessage Where shoppdnumber=?1", nativeQuery = true)
	public List<ShopPdMessage> findByShopPdMessageDetail(int shoppdnumber);
}
