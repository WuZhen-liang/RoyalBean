package tw.royalbean.shopadmin.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.member.model.Member;
import tw.royalbean.shop.model.ShopPd;

@Service
@Transactional
public class ShopAdminService {

	@Autowired
	private ShopPdAdminRepository sPdAdminRepository;
	
	
//---------------------- --------ShopPd--------------------------------------	
	//新增	
	public ShopPd insertPd(ShopPd shopPd) {
		return sPdAdminRepository.save(shopPd);
	}
	
	//刪除
	public void deleteById(Integer id) {
		sPdAdminRepository.deleteById(id);
	}
	
	//更新	
	public ShopPd updatePd(ShopPd shopPd) {
		return sPdAdminRepository.save(shopPd);
	}
	
	//查詢
	public ShopPd findByShopPdId(int id) {
		
		Optional<ShopPd> pd = sPdAdminRepository.findById(id);
		return pd.get();
	}
	
	
	//查詢所有商品	
	public List<ShopPd> findAllPd() {
		return sPdAdminRepository.findAll();
	}
	
	//頁數
	public Page<ShopPd> findAllByPage(Pageable pageable) {
		return sPdAdminRepository.findAll(pageable);
	}
	
//------------------------------ShopOrderDetail--------------------------------------	
	
}
