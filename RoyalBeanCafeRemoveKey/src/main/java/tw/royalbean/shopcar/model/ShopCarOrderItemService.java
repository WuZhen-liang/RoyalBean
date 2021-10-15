package tw.royalbean.shopcar.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopCarOrderItemService {

	@Autowired
	private ShopCarOrderItemRepository sRepository;
	
	@Autowired
	private ShopCarRepository sCarRepository;
	
	
	// insert
	public ShopCarOrderItem insertCarOrderItem(ShopCarOrderItem sOrderItem) {
		return sRepository.save(sOrderItem);
	}
	
	//update
	public ShopCarOrderItem updateCarOrderItem(ShopCarOrderItem sOrderItem) {
		return sRepository.save(sOrderItem);
	}
	//原本要查詢對應商品失敗
//	public List<ShopCarOrderItem> queryByShopCarDetail(int shopCarId){
//		ShopCar thisCar = sCarRepository.getById(shopCarId);
//		List<ShopCarOrderItem> thisCarAllItem = thisCar.getShopCarOrderItem();
//		System.out.println("查詢到這筆訂單對應到的商品");
//		return thisCarAllItem;
//	}
	
	//查詢對應商品
	
	public List<ShopCarOrderItem> findByShopCarOrderItemDetail(int shopcartid){
		return sRepository.findByShopCarOrderItemDetail(shopcartid);
	}
	
}
