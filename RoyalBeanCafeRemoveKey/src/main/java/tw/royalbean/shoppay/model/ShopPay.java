package tw.royalbean.shoppay.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.royalbean.shopcar.model.ShopCar;

@Entity @Table(name = "shoppay") 
@Component
public class ShopPay {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SHOPPDPAYID")
	private int shopPdPayId ;
	
	
	@Column(name = "SHOPPDSHIPMENT")
	private String shopPdShipment;
	
	@Column(name = "SHOPPDGOADDRESS")
	private String shopPdGoAddress ;
	
	@Column(name = "SHOPPDNOTE")
	private String shopPdNote ;
		
	@Column(name = "SHOPPAYMETHOD")
	private String shopPayMethod ;
	
	@Column(name = "SHOPPAYCARD")
	private String shopPayCard ;
	
	@Column(name = "SHOPPAYCARDDATE")
	private String shopPayCardDate ;
	
	
	@Column(name = "SHOPPAYCVV")
	private String shopPayCVV ;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "shopcarmatchid")
	private ShopCar shopCar;
	
	

	public int getShopPdPayId() {
		return shopPdPayId;
	}

	public void setShopPdPayId(int shopPdPayId) {
		this.shopPdPayId = shopPdPayId;
	}

	public String getShopPdShipment() {
		return shopPdShipment;
	}

	public void setShopPdShipment(String shopPdShipment) {
		this.shopPdShipment = shopPdShipment;
	}

	public String getShopPdGoAddress() {
		return shopPdGoAddress;
	}

	public void setShopPdGoAddress(String shopPdGoAddress) {
		this.shopPdGoAddress = shopPdGoAddress;
	}

	public String getShopPdNote() {
		return shopPdNote;
	}

	public void setShopPdNote(String shopPdNote) {
		this.shopPdNote = shopPdNote;
	}

	public String getShopPayMethod() {
		return shopPayMethod;
	}

	public void setShopPayMethod(String shopPayMethod) {
		this.shopPayMethod = shopPayMethod;
	}

	public String getShopPayCard() {
		return shopPayCard;
	}

	public void setShopPayCard(String shopPayCard) {
		this.shopPayCard = shopPayCard;
	}

	public String getShopPayCardDate() {
		return shopPayCardDate;
	}

	public void setShopPayCardDate(String shopPayCardDate) {
		this.shopPayCardDate = shopPayCardDate;
	}

	public String getShopPayCVV() {
		return shopPayCVV;
	}

	public void setShopPayCVV(String shopPayCVV) {
		this.shopPayCVV = shopPayCVV;
	}

	public ShopCar getShopCar() {
		return shopCar;
	}

	public void setShopCar(ShopCar shopCar) {
		this.shopCar = shopCar;
	}
		
	
}
