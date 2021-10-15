package tw.royalbean.shopcar.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.shop.model.ShopPd;

@Service
@Transactional
public class ShopCarService {
	
	@Autowired
	private ShopCarRepository sRepository;
	@Autowired
	private MemberService mService;
	
	//insert
	public ShopCar insert(ShopCar car) {
		return sRepository.save(car);
	}
	
	//finById
	public ShopCar findById(int id) {
		Optional<ShopCar> shopOrderRep = sRepository.findById(id);
		if (shopOrderRep.isPresent()) {			
			return shopOrderRep.get();
		}
		return null;
	}
	
	//findAll
	public List<ShopCar> findAll(){
		return sRepository.findAll();
	}
	
	//queryByUserOrderDetail
	
	public List<ShopCar> queryByUserOrderDetail(int mid) {
		Member member = mService.findById(mid);
		System.out.println("取得對應使用者成功");
		List<ShopCar> UserOrderDetail = sRepository.findByMember(member);
		System.out.println("查詢訂單成功");
		return UserOrderDetail;
	}
	
}
