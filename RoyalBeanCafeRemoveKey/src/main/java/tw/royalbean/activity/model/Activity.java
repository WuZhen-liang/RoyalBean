package tw.royalbean.activity.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.member.model.Company;

@Entity
@Table(name = "activity")
@Component("activity")
public class Activity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AID")
	private int aId;
	
	@Column(name = "ANAME")
	private String aName;
	
	@Column(name = "ACATEGORY")
	private String aCategory;
	
	@Column(name = "ATARGET")
	private String aTarget;
	
	@Column(name = "APEOPLE")
	private String aPeople;
	
	@Column(name = "APRICE")
	private String aPrice;
	
	@Column(name = "ATIME")
	private String aTime;
	
	@Column(name = "ACONTENT")
	private String aContent;
	
	@Column(name = "APHOTO")
	private String aPhoto;
	
	@Column(name = "AEVALUATION")
	private String aEvaluation;
	
	@Column(name = "ADATE")
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String aDate;
	
	//多對一cid
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	@JsonBackReference(value = "companyactivity")
	private Company company;
	
	//多對一sid
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "SID")
	@JsonBackReference(value = "activitystoreactivity")
	private ActivityStore activityStore;
	
	//一對多aoid
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "activity")
	@JsonManagedReference(value = "activityactivityorder")
	private Set<ActivityOrder> activityOrder = new HashSet<ActivityOrder>();
	
	public Activity() {
		
	}
	
	public Activity(int aId, String aName, String aCategory, String aTarget, String aPeople, String aPrice,
			String aTime, String aContent, String aPhoto, String aEvaluation, String aDate, ActivityStore activityStore) {
		this.aId = aId;
		this.aName = aName;
		this.aCategory = aCategory;
		this.aTarget = aTarget;
		this.aPeople = aPeople;
		this.aPrice = aPrice;
		this.aTime = aTime;
		this.aContent = aContent;
		this.aPhoto = aPhoto;
		this.aEvaluation = aEvaluation;
		this.aDate = aDate;
		this.activityStore = activityStore;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaCategory() {
		return aCategory;
	}

	public void setaCategory(String aCategory) {
		this.aCategory = aCategory;
	}

	public String getaTarget() {
		return aTarget;
	}

	public void setaTarget(String aTarget) {
		this.aTarget = aTarget;
	}

	public String getaPeople() {
		return aPeople;
	}

	public void setaPeople(String aPeople) {
		this.aPeople = aPeople;
	}

	public String getaPrice() {
		return aPrice;
	}

	public void setaPrice(String aPrice) {
		this.aPrice = aPrice;
	}

	public String getaTime() {
		return aTime;
	}

	public void setaTime(String aTime) {
		this.aTime = aTime;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaPhoto() {
		return aPhoto;
	}

	public void setaPhoto(String aPhoto) {
		this.aPhoto = aPhoto;
	}

	public String getaEvaluation() {
		return aEvaluation;
	}

	public void setaEvaluation(String aEvaluation) {
		this.aEvaluation = aEvaluation;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public ActivityStore getActivityStore() {
		return activityStore;
	}

	public void setActivityStore(ActivityStore activityStore) {
		this.activityStore = activityStore;
	}

	public Set<ActivityOrder> getActivityOrder() {
		return activityOrder;
	}

	public void setActivityOrder(Set<ActivityOrder> activityOrder) {
		this.activityOrder = activityOrder;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	
	
}
