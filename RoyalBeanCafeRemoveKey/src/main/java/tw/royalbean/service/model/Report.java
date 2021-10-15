package tw.royalbean.service.model;



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

import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.Member;
@Entity @Table(name="Service_Report")
@Component("Service_Report")
public class Report {
	@Id @Column(name="reportid") @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int reportid;
	//@Column(name="reporter")
	//private int reporter;
	@Column(name="reporttitle")
	private String reporttitle;
	@Column(name="reportcontent")
	private String reportcontent;
	@Column(name="reportpicture")
	private String reportpicture;
	@Column(name="reporttime")
	private String reporttime;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "CID")
	//@JsonBackReference(value = "companyreport")
	private Company company;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "MID")
	//@JsonBackReference(value = "memberreport")
	private Member member;
	
	public Report() {
	
}
	public Report(int reportid,String reporttitle,String reportcontent,String reportpicture,String reporttime) {
		this.reportid = reportid;
		this.reporttitle=reporttitle;
		this.reportcontent=reportcontent;
		this.reportpicture=reportpicture;
		this.reporttime=reporttime;
	}
	public int getReportid() {
		return reportid;
	}
	public void setReportid(int reportid) {
		this.reportid = reportid;
	}
	public String getReporttitle() {
		return reporttitle;
	}
	public void setReporttitle(String reporttitle) {
		this.reporttitle = reporttitle;
	}
	public String getReportcontent() {
		return reportcontent;
	}
	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}
	public String getReportpicture() {
		return reportpicture;
	}
	public void setReportpicture(String reportpicture) {
		this.reportpicture = reportpicture;
	}
	public String getReporttime() {
		return reporttime;
	}
	public void setReporttime(String reporttime) {
		this.reporttime = reporttime;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	
	
}

