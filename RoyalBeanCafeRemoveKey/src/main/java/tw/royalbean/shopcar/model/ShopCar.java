package tw.royalbean.shopcar.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.royalbean.member.model.Member;
import tw.royalbean.shop.model.ShopPd;

@Component@Entity
@Table(name = "shopcar")
public class ShopCar {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "SHOPCARID")
	private int shopCarId;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@Column(name = "SHOPORDERDATE")
	private Date shopOrderDate;
	
	@Column(name = "PDTOTALPRICE")
	private int pdToTalPrice;
	
	
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "mID")
	private Member member;

	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_cartid")
	private List<ShopCarOrderItem> ShopCarOrderItem = new ArrayList<ShopCarOrderItem>();

	
		
	public void setShopCarOrderItem(List<ShopCarOrderItem> shopCarOrderItem) {
		ShopCarOrderItem = shopCarOrderItem;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<ShopCarOrderItem> getShopCarOrderItem() {
		return ShopCarOrderItem;
	}

	public void setShopCarOrderItem(ArrayList<ShopCarOrderItem> shopCarOrderItem) {
		ShopCarOrderItem = shopCarOrderItem;
	}

	public int getShopCarId() {
		return shopCarId;
	}

	public void setShopCarId(int shopCarId) {
		this.shopCarId = shopCarId;
	}

	public Date getShopOrderDate() {
		return shopOrderDate;
	}

	public void setShopOrderDate(Date shopOrderDate) {
		this.shopOrderDate = shopOrderDate;
	}

	public int getPdToTalPrice() {
		return pdToTalPrice;
	}

	public void setPdToTalPrice(int pdToTalPrice) {
		this.pdToTalPrice = pdToTalPrice;
	}

}
