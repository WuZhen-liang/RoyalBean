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
@Table(name = "activitystore")
@Component("activitystore")
public class ActivityStore{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SID")
	private int sId;
	
	@Column(name = "SNAME")
	private String sName;
	
	@Column(name = "SPHONE")
	private String sPhone;
	
	@Column(name = "SZIP")
	private String sZip;
	
	@Column(name = "SCITY")
	private String sCity;
	
	@Column(name = "SDISTRICT")
	private String sDistrict;
	
	@Column(name = "SADD")
	private String sAdd;
	
	@Column(name = "SNS")
	private Double sNs;
	
	@Column(name = "SEW")
	private Double sEw;
	
	@Column(name = "SPHOTO")
	private String sPhoto;
	
	@Column(name = "MONOPEN")
	private String monOpen;
	
	@Column(name = "MONCLOSE")
	private String monClose;
	
	@Column(name = "TUEOPEN")
	private String tueOpen;
	
	@Column(name = "TUECLOSE")
	private String tueClose;
	
	@Column(name = "WEDOPEN")
	private String wedOpen;
	
	@Column(name = "WEDCLOSE")
	private String wedClose;
	
	@Column(name = "THUOPEN")
	private String thuOpen;
	
	@Column(name = "THUCLOSE")
	private String thuClose;
	
	@Column(name = "FIROPEN")
	private String firOpen;
	
	@Column(name = "FIRCLOSE")
	private String firClose;
	
	@Column(name = "SATOPEN")
	private String satOpen;
	
	@Column(name = "SATCLOSE")
	private String satClose;
	
	@Column(name = "SUNOPEN")
	private String sunOpen;
	
	@Column(name = "SUNCLOSE")
	private String sunClose;
	
	@Column(name = "EDITDATE")
	//@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String editDate;
	
	//多對一cid
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	@JsonBackReference(value = "companyactivityStores")
	private Company company;

	//一對多aid
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "activityStore")
	@JsonManagedReference(value = "activitystoreactivity")
	private Set<Activity> activity = new HashSet<Activity>();

	public ActivityStore() {

	}

	public ActivityStore(int sId, String sName, String sPhone, String sZip, String sCity, String sDistrict, String sAdd,
			Double sNs, Double sEw, String sPhoto, String monOpen, String monClose, String tueOpen, String tueClose,
			String wedOpen, String wedClose, String thuOpen, String thuClose, String firOpen, String firClose,
			String satOpen, String satClose, String sunOpen, String sunClose, String editDate) {
		this.sId = sId;
		this.sName = sName;
		this.sPhone = sPhone;
		this.sZip = sZip;
		this.sCity = sCity;
		this.sDistrict = sDistrict;
		this.sAdd = sAdd;
		this.sNs = sNs;
		this.sEw = sEw;
		this.sPhoto = sPhoto;
		this.monOpen = monOpen;
		this.monClose = monClose;
		this.tueOpen = tueOpen;
		this.tueClose = tueClose;
		this.wedOpen = wedOpen;
		this.wedClose = wedClose;
		this.thuOpen = thuOpen;
		this.thuClose = thuClose;
		this.firOpen = firOpen;
		this.firClose = firClose;
		this.satOpen = satOpen;
		this.satClose = satClose;
		this.sunOpen = sunOpen;
		this.sunClose = sunClose;
		this.editDate = editDate;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsZip() {
		return sZip;
	}

	public void setsZip(String sZip) {
		this.sZip = sZip;
	}

	public String getsCity() {
		return sCity;
	}

	public void setsCity(String sCity) {
		this.sCity = sCity;
	}

	public String getsDistrict() {
		return sDistrict;
	}

	public void setsDistrict(String sDistrict) {
		this.sDistrict = sDistrict;
	}

	public String getsAdd() {
		return sAdd;
	}

	public void setsAdd(String sAdd) {
		this.sAdd = sAdd;
	}

	public Double getsNs() {
		return sNs;
	}

	public void setsNs(Double sNs) {
		this.sNs = sNs;
	}

	public Double getsEw() {
		return sEw;
	}

	public void setsEw(Double sEw) {
		this.sEw = sEw;
	}

	public String getsPhoto() {
		return sPhoto;
	}

	public void setsPhoto(String sPhoto) {
		this.sPhoto = sPhoto;
	}

	public String getMonOpen() {
		return monOpen;
	}

	public void setMonOpen(String monOpen) {
		this.monOpen = monOpen;
	}

	public String getMonClose() {
		return monClose;
	}

	public void setMonClose(String monClose) {
		this.monClose = monClose;
	}

	public String getTueOpen() {
		return tueOpen;
	}

	public void setTueOpen(String tueOpen) {
		this.tueOpen = tueOpen;
	}

	public String getTueClose() {
		return tueClose;
	}

	public void setTueClose(String tueClose) {
		this.tueClose = tueClose;
	}

	public String getWedOpen() {
		return wedOpen;
	}

	public void setWedOpen(String wedOpen) {
		this.wedOpen = wedOpen;
	}

	public String getWedClose() {
		return wedClose;
	}

	public void setWedClose(String wedClose) {
		this.wedClose = wedClose;
	}

	public String getThuOpen() {
		return thuOpen;
	}

	public void setThuOpen(String thuOpen) {
		this.thuOpen = thuOpen;
	}

	public String getThuClose() {
		return thuClose;
	}

	public void setThuClose(String thuClose) {
		this.thuClose = thuClose;
	}

	public String getFirOpen() {
		return firOpen;
	}

	public void setFirOpen(String firOpen) {
		this.firOpen = firOpen;
	}

	public String getFirClose() {
		return firClose;
	}

	public void setFirClose(String firClose) {
		this.firClose = firClose;
	}

	public String getSatOpen() {
		return satOpen;
	}

	public void setSatOpen(String satOpen) {
		this.satOpen = satOpen;
	}

	public String getSatClose() {
		return satClose;
	}

	public void setSatClose(String satClose) {
		this.satClose = satClose;
	}

	public String getSunOpen() {
		return sunOpen;
	}

	public void setSunOpen(String sunOpen) {
		this.sunOpen = sunOpen;
	}

	public String getSunClose() {
		return sunClose;
	}

	public void setSunClose(String sunClose) {
		this.sunClose = sunClose;
	}
	
	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public Set<Activity> getActivity() {
		return activity;
	}

	public void setActivity(Set<Activity> activity) {
		this.activity = activity;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "ActivityStore [sId=" + sId + ", sName=" + sName + ", sPhone=" + sPhone + ", sZip=" + sZip + ", sCity="
				+ sCity + ", sDistrict=" + sDistrict + ", sAdd=" + sAdd + ", sNs=" + sNs + ", sEw=" + sEw + ", sPhoto="
				+ sPhoto + ", monOpen=" + monOpen + ", monClose=" + monClose + ", tueOpen=" + tueOpen + ", tueClose="
				+ tueClose + ", wedOpen=" + wedOpen + ", wedClose=" + wedClose + ", thuOpen=" + thuOpen + ", thuClose="
				+ thuClose + ", firOpen=" + firOpen + ", firClose=" + firClose + ", satOpen=" + satOpen + ", satClose="
				+ satClose + ", sunOpen=" + sunOpen + ", sunClose=" + sunClose + ", editDate=" + editDate + "]";
	}

}
