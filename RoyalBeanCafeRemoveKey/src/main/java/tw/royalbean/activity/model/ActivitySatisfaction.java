package tw.royalbean.activity.model;

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

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "activitysatisfaction")
@Component("activitysatisfaction")
public class ActivitySatisfaction {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ASID")
	private int asId;
	
	@Column(name = "ASPLACE")
	private int asPlace;      //活動場域
	
	@Column(name = "ASPRICE")
	private int asPrice;      //活動價格
	
	@Column(name = "ASPRODUCT")
	private int asProduct;    //活動本身
	
	@Column(name = "ASRESVISIT")
	private int asRevisit;    //活動再訪
	
	@Column(name = "ASTEACHER")
	private int asTeacher;    //活動講師
	
	@Column(name = "ASCONTENT")
	private String asContent; //其他評論
	
	@Column(name = "ASDATE")
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String asDate;    //評論時間
	
	//一對一aoid
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "AOID")
	@JsonManagedReference(value = "activityordersatisfaction")
	private ActivityOrder activityOrder;

	public int getAsId() {
		return asId;
	}

	public void setAsId(int asId) {
		this.asId = asId;
	}

	public int getAsPlace() {
		return asPlace;
	}

	public void setAsPlace(int asPlace) {
		this.asPlace = asPlace;
	}

	public int getAsPrice() {
		return asPrice;
	}

	public void setAsPrice(int asPrice) {
		this.asPrice = asPrice;
	}

	public int getAsProduct() {
		return asProduct;
	}

	public void setAsProduct(int asProduct) {
		this.asProduct = asProduct;
	}

	public int getAsRevisit() {
		return asRevisit;
	}

	public void setAsRevisit(int asRevisit) {
		this.asRevisit = asRevisit;
	}

	public int getAsTeacher() {
		return asTeacher;
	}

	public void setAsTeacher(int asTeacher) {
		this.asTeacher = asTeacher;
	}

	public String getAsContent() {
		return asContent;
	}

	public void setAsContent(String asContent) {
		this.asContent = asContent;
	}

	public String getAsDate() {
		return asDate;
	}

	public void setAsDate(String asDate) {
		this.asDate = asDate;
	}

	public ActivityOrder getActivityOrder() {
		return activityOrder;
	}

	public void setActivityOrder(ActivityOrder activityOrder) {
		this.activityOrder = activityOrder;
	}	

}
