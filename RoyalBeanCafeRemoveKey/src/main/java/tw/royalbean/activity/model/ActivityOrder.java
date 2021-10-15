package tw.royalbean.activity.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.royalbean.member.model.Member;

@Entity
@Table(name = "activityorder")
@Component("activityorder")
public class ActivityOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AOID")
	private int aoId;
	
	@Column(name = "AONAME")
	private String aoName;
	
	@Column(name = "AOGENDER")
	private String aoGender;
	
	@Column(name = "AOAGE")
	private String aoAge;
	
	@Column(name = "AOPHONE")
	private String aoPhone;
	
	@Column(name = "AOEMAIL")
	private String aoEmail;
	
	@Column(name = "AOPRICE")
	private String aoPrice;
	
	@Column(name = "ARESDATE")
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String aResDate;
	
	@Column(name = "ARESTIME")
	private String aResTime;
	
	@Column(name = "AODERDATE")
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String aorderDate;
	
	//多對一aid
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "AID")
	@JsonBackReference(value = "activityactivityorder")
	private Activity activity;
	
	//多對一mid
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "MID")
	@JsonBackReference(value = "memberactivityorder")
	private Member member;
	
	//一對一aoid
	@OneToOne(mappedBy = "activityOrder")
	@JsonBackReference(value = "activityordersatisfaction")
	private ActivitySatisfaction activitySatisfaction;

	public int getAoId() {
		return aoId;
	}

	public void setAoId(int aoId) {
		this.aoId = aoId;
	}

	public String getAoName() {
		return aoName;
	}

	public void setAoName(String aoName) {
		this.aoName = aoName;
	}

	public String getAoGender() {
		return aoGender;
	}

	public void setAoGender(String aoGender) {
		this.aoGender = aoGender;
	}

	public String getAoAge() {
		return aoAge;
	}

	public void setAoAge(String aoAge) {
		this.aoAge = aoAge;
	}

	public String getAoPhone() {
		return aoPhone;
	}

	public void setAoPhone(String aoPhone) {
		this.aoPhone = aoPhone;
	}

	public String getAoEmail() {
		return aoEmail;
	}

	public void setAoEmail(String aoEmail) {
		this.aoEmail = aoEmail;
	}

	public String getAoPrice() {
		return aoPrice;
	}

	public void setAoPrice(String aoPrice) {
		this.aoPrice = aoPrice;
	}

	public String getaResDate() {
		return aResDate;
	}

	public void setaResDate(String aResDate) {
		this.aResDate = aResDate;
	}

	public String getaResTime() {
		return aResTime;
	}

	public void setaResTime(String aResTime) {
		this.aResTime = aResTime;
	}

	public String getAorderDate() {
		return aorderDate;
	}

	public void setAorderDate(String aorderDate) {
		this.aorderDate = aorderDate;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public ActivitySatisfaction getActivitySatisfaction() {
		return activitySatisfaction;
	}

	public void setActivitySatisfaction(ActivitySatisfaction activitySatisfaction) {
		this.activitySatisfaction = activitySatisfaction;
	}

}
