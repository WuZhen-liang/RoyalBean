package tw.royalbean.shopcar.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "shopcarorderitem")
@Component
public class ShopCarOrderItem {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String pdname;
	
	private int qty;
	
	private int unitprice;
	
	public ShopCarOrderItem() {
	}

	public ShopCarOrderItem(String pdname, int qty, int unitprice) {
		this.pdname = pdname;
		this.qty = qty;
		this.unitprice = unitprice;	
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	
	
}
