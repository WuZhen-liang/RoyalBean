package tw.royalbean.shopcar.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.member.model.Member;

public interface ShopCarRepository extends JpaRepository<ShopCar, Integer> {

	public List<ShopCar> findByMember(Member member);
	
	
}
