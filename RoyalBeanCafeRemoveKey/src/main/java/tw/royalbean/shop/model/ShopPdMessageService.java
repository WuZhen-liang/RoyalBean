package tw.royalbean.shop.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.shopcar.model.ShopCarOrderItem;

@Service
@Transactional
public class ShopPdMessageService {
	
	@Autowired
	private ShopPdMessageRepository sPdMessageRepository;
	
	@Autowired ShopPdRepository sPdRepository;
	
	// insert 
	public ShopPdMessage insertShopPdMessage(ShopPdMessage shopPdMessage) {
		return sPdMessageRepository.save(shopPdMessage);
	}
	
	//查詢對應商品
	
	public List<ShopPdMessage> findByShopPdMessageDetail(int shoppdnumber){
		return sPdMessageRepository.findByShopPdMessageDetail(shoppdnumber);
	}
	
	//找全部留言
	public List<ShopPdMessage> findAllShopMessage(){
		return sPdMessageRepository.findAll();
	}
}
