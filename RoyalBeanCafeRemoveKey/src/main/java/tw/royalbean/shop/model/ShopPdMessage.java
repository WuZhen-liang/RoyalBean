package tw.royalbean.shop.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Component
@Entity
@Table(name = "shoppdmessage")
public class ShopPdMessage {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SHOPPDMESSAGEID")
	private int shopPdMessageId;			//評論編號
	
	@Column(name = "SHOPPDMESSAGEDETAIL")	//評論內容
	private String shopPdMessageDetail;
	
	@Column(name = "SHOPPDMESSAGESCORE")
	private int shopPdMessageScore;			//評論分數
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@Column(name = "SHOPPDMESSAGETIME")
	private Date shopPdMessageTime;
	
	@JsonBackReference(value = "shopPd")
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "shoppdnumber")
	private ShopPd shopPd;
	
	public ShopPdMessage() {
	}

	public ShopPdMessage(int shopPdMessageId, String shopPdMessageDetail, int shopPdMessageScore,
			Date shopPdMessageTime) {
		this.shopPdMessageId = shopPdMessageId;
		this.shopPdMessageDetail = shopPdMessageDetail;
		this.shopPdMessageScore = shopPdMessageScore;
		this.shopPdMessageTime = shopPdMessageTime;
	}



	public int getShopPdMessageId() {
		return shopPdMessageId;
	}

	public void setShopPdMessageId(int shopPdMessageId) {
		this.shopPdMessageId = shopPdMessageId;
	}

	public String getShopPdMessageDetail() {
		return shopPdMessageDetail;
	}

	public void setShopPdMessageDetail(String shopPdMessageDetail) {
		this.shopPdMessageDetail = shopPdMessageDetail;
	}

	public int getShopPdMessageScore() {
		return shopPdMessageScore;
	}

	public void setShopPdMessageScore(int shopPdMessageScore) {
		this.shopPdMessageScore = shopPdMessageScore;
	}



	public Date getShopPdMessageTime() {
		return shopPdMessageTime;
	}



	public void setShopPdMessageTime(Date shopPdMessageTime) {
		this.shopPdMessageTime = shopPdMessageTime;
	}

	public ShopPd getShopPd() {
		return shopPd;
	}

	public void setShopPd(ShopPd shopPd) {
		this.shopPd = shopPd;
	}
	
	
	
	
}
