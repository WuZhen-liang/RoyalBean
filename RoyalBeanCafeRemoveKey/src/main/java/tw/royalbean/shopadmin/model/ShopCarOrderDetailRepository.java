package tw.royalbean.shopadmin.model;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.royalbean.shopcar.model.ShopCar;
import tw.royalbean.shopcar.model.ShopCarOrderItem;

public interface ShopCarOrderDetailRepository extends JpaRepository<ShopCarOrderItem, Integer> {

}
