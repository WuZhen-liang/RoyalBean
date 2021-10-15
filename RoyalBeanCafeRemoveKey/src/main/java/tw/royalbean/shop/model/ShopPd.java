package tw.royalbean.shop.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.member.model.Company;
import tw.royalbean.shopcar.model.ShopCar;


@Entity
@Component
@Table(name = "shoppd")
public class ShopPd {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SHOPPDNUMBER")
	private int shopPdNumber;
	
	
	@Column(name = "SHOPPDNAME")
	private String shopPdName;
	
	
	@Column(name = "SHOPPDPRICE")
	private int shopPdPrice;
	
	@Column(name = "SHOPPDCOUNT")
	private int shopPdCount;
	
	@Column(name = "SHOPPDWEIGHT")
	private int shopPdWeight;
	
	@Column(name = "SHOPPDPICTURE")
	private String shopPdPicture;
	
	@Column(name = "SHOPPDTYPE")
	private String shopPdType;
	
	@Column(name = "SHOPPDDEPICTION")
	private String shopPdDepiction;
	
	@Column(name = "SHOPPDBAKING")
	private String shopPdBaking;
	
	@Column(name = "SHOPPDINGREDIENT")
	private String shopPdIngredient;
	
	@Column(name = "SHOPPDORIGIN")
	private String shopPdOrigin;
	
	@Column(name = "SHOPPDSAVEMETHOD")
	private String shopPdSaveMethod;
	
	@Column(name = "SHOPPDEXPTIME")
	private String shopPdExpTime;

	@Column(name = "SHOPPDSHIPMENT")
	private String shopPdShipment;
	
	@Column(name = "SHOPPDNOTICE")
	private String shopPdNotice;
	
	
	
//	@ManyToMany( mappedBy = "shopcarnumber")
//	private Set<ShopCar> shopCart = new HashSet<ShopCar>();
//	
	@JsonBackReference(value = "member")
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	private Company company;
	
	@JsonManagedReference(value = "shopPd")
	@OneToMany(mappedBy = "shopPd")
	private Set<ShopPdMessage> shopPdMessage = new HashSet<ShopPdMessage>();
	
	public ShopPd() {
		
	}
	
	public ShopPd(int shopPdNumber, String shopPdName, int shopPdPrice, int shopPdCount, int shopPdWeight,
			String shopPdPicture, String shopPdType, String shopPdDepiction, String shopPdBaking,
			String shopPdIngredient, String shopPdOrigin, String shopPdSaveMethod, String shopPdExpTime,
			String shopPdShipment, String shopPdNotice) {
		this.shopPdNumber = shopPdNumber;
		this.shopPdName = shopPdName;
		this.shopPdPrice = shopPdPrice;
		this.shopPdCount = shopPdCount;
		this.shopPdWeight = shopPdWeight;
		this.shopPdPicture = shopPdPicture;
		this.shopPdType = shopPdType;
		this.shopPdDepiction = shopPdDepiction;
		this.shopPdBaking = shopPdBaking;
		this.shopPdIngredient = shopPdIngredient;
		this.shopPdOrigin = shopPdOrigin;
		this.shopPdSaveMethod = shopPdSaveMethod;
		this.shopPdExpTime = shopPdExpTime;
		this.shopPdShipment = shopPdShipment;
		this.shopPdNotice = shopPdNotice;
	}

	public int getShopPdNumber() {
		return shopPdNumber;
	}

	public void setShopPdNumber(int shopPdNumber) {
		this.shopPdNumber = shopPdNumber;
	}

	public String getShopPdName() {
		return shopPdName;
	}

	public void setShopPdName(String shopPdName) {
		this.shopPdName = shopPdName;
	}

	public int getShopPdPrice() {
		return shopPdPrice;
	}

	public void setShopPdPrice(int shopPdPrice) {
		this.shopPdPrice = shopPdPrice;
	}

	public int getShopPdCount() {
		return shopPdCount;
	}

	public void setShopPdCount(int shopPdCount) {
		this.shopPdCount = shopPdCount;
	}

	public int getShopPdWeight() {
		return shopPdWeight;
	}

	public void setShopPdWeight(int shopPdWeight) {
		this.shopPdWeight = shopPdWeight;
	}

	public String getShopPdPicture() {
		return shopPdPicture;
	}

	public void setShopPdPicture(String shopPdPicture) {
		this.shopPdPicture = shopPdPicture;
	}

	public String getShopPdType() {
		return shopPdType;
	}

	public void setShopPdType(String shopPdType) {
		this.shopPdType = shopPdType;
	}

	public String getShopPdDepiction() {
		return shopPdDepiction;
	}

	public void setShopPdDepiction(String shopPdDepiction) {
		this.shopPdDepiction = shopPdDepiction;
	}

	public String getShopPdBaking() {
		return shopPdBaking;
	}

	public void setShopPdBaking(String shopPdBaking) {
		this.shopPdBaking = shopPdBaking;
	}

	public String getShopPdIngredient() {
		return shopPdIngredient;
	}

	public void setShopPdIngredient(String shopPdIngredient) {
		this.shopPdIngredient = shopPdIngredient;
	}

	public String getShopPdOrigin() {
		return shopPdOrigin;
	}

	public void setShopPdOrigin(String shopPdOrigin) {
		this.shopPdOrigin = shopPdOrigin;
	}

	public String getShopPdSaveMethod() {
		return shopPdSaveMethod;
	}

	public void setShopPdSaveMethod(String shopPdSaveMethod) {
		this.shopPdSaveMethod = shopPdSaveMethod;
	}

	public String getShopPdExpTime() {
		return shopPdExpTime;
	}

	public void setShopPdExpTime(String shopPdExpTime) {
		this.shopPdExpTime = shopPdExpTime;
	}

	public String getShopPdShipment() {
		return shopPdShipment;
	}

	public void setShopPdShipment(String shopPdShipment) {
		this.shopPdShipment = shopPdShipment;
	}

	public String getShopPdNotice() {
		return shopPdNotice;
	}

	public void setShopPdNotice(String shopPdNotice) {
		this.shopPdNotice = shopPdNotice;
	}

//	public Set<ShopCar> getShopCart() {
//		return shopCart;
//	}
//
//	public void setShopCart(Set<ShopCar> shopCart) {
//		this.shopCart = shopCart;
//	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Set<ShopPdMessage> getShopPdMessage() {
		return shopPdMessage;
	}

	public void setShopPdMessage(Set<ShopPdMessage> shopPdMessage) {
		this.shopPdMessage = shopPdMessage;
	}



	

}
