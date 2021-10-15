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

import tw.royalbean.member.model.Staff;

@Entity @Table(name="Service_QandA")
@Component("Service_QandA")
public class QA {
	@Id @Column(name = "QAid") @GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int QAid;
	
	@Column(name = "QAtitle")
	private String QAtitle;
	@Column(name = "QAanswer")
	private String QAanswer;
	@Column(name = "QAtime")
	private String QAtime;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "sID")
	private Staff staff;
	
	public QA() {

	}
	public QA(int QAid,String QAtitle,String QAanswer,String QAtime) {
		this.QAid=QAid;
		this.QAtitle=QAtitle;
		this.QAanswer=QAanswer;
		this.QAtime=QAtime;
	}

	public int getQAid() {
		return QAid;
	}

	public void setQAid(int qAid) {
		QAid = qAid;
	}

	public String getQAtitle() {
		return QAtitle;
	}

	public void setQAtitle(String qAtitle) {
		QAtitle = qAtitle;
	}

	public String getQAanswer() {
		return QAanswer;
	}

	public void setQAanswer(String qAanswer) {
		QAanswer = qAanswer;
	}

	public String getQAtime() {
		return QAtime;
	}

	public void setQAtime(String qAtime) {
		QAtime = qAtime;
	}
	
}