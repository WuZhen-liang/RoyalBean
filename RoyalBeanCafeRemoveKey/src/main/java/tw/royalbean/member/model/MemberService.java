package tw.royalbean.member.model;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.royalbean.email.model.CreateCode;
import tw.royalbean.email.model.EmailAPI;
import tw.royalbean.user.model.Users;

@Service
@Transactional
public class MemberService  {

	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private CreateCode createCode;
	@Autowired
	private EmailAPI emailAPI;
	@Autowired
	private MemberContentRepository memberContentRepository;
	@Autowired
	private PeopleNumberLoginRepository peopleNumberLoginRepository;

	
//	--------------- 自己指定生成一個亂數 ------------------------	
	public String createCodeByNumber(int n) {		
		return createCode.createCodeBynumber(n);
	}	
	
//	--------------- Member ------------------------
	public Member findById(Integer mid) {
		Optional<Member> mResp= memberRepository.findById(mid);
		if (mResp.isEmpty()) {
//			throw new UsernameNotFoundException("We can't find your account");
			return null;
		}
		return mResp.get();
	}
	
	public Member findByEmail(String username) {
		Optional<Member> mResp= memberRepository.findByEmail(username);
		if (mResp.isEmpty()) {
//			throw new UsernameNotFoundException("We can't find your account");
			return null;
		}
		return mResp.get();
	}
	
	public Member saveAndUpdate(Member member) {
		return memberRepository.save(member);
	}
	
	public void deleteById(Integer id) {
		memberRepository.deleteById(id);
	}
	
	public List<Member> findAlldata() {
		return memberRepository.findAll();
	}	
	
	public Page<Member> findAllByPage(Pageable pageable) {
		return memberRepository.findAll(pageable);
	}
	
	public Member findByUsers(Users users) {
		Optional<Member> mResp= memberRepository.findByUsers(users);
		return mResp.get();
	}
	
	public String createCode() {
		return createCode.createCode();
	}
//	-----------------------------email-----------------------------------------
	public void sendEmail(String emailLocation,String encode) {
		
		String title ="啟動您的郵件";
		
		String text = "請點擊下方的按鈕<br>"
					  + "<a href=\"http://localhost:8080/memberactive/"+encode+"\">"
					  + "<button style=\"border: 2px; margin: 10px auto; background-color: #e2c395;border-radius: 5px;padding: 10px;\">驗證按鈕</button>"
					  + "</a><br>感謝您的幫忙";	
		
		emailAPI.SendEmail(emailLocation, title, text);
	}
	
	public Member findByEncode(String encode) {
		Optional<Member> mResp= memberRepository.findByEncode(encode);
		if (mResp.isEmpty()) {
			return null;
//			throw new UsernameNotFoundException("We can't find your account");			
		}
		return mResp.get();
	}
	
	public void sendPasswordEmail(String emailLocation,String content) {
		
		String title ="這是你的新密碼";
		
		String text = "這是您的新密碼<br>"
					  +"您的新密碼 :"+content
					  +"<br>謝謝你的幫忙";		
		emailAPI.SendEmail(emailLocation, title, text);
	}
	
	public void sendNewOauth2Email(String emailLocation) {
		
		String title ="Hello, new Google Account welcome to Royalbean.";
		
		String text = "Thank you!";	
		
		emailAPI.SendEmail(emailLocation, title, text);
	}
//	----------------------------------------MemberContent----------------------------------
	
	public MemberContent saveAndUpdateContent(MemberContent memberContent) {
		return memberContentRepository.save(memberContent);
	}
	
	public List<MemberContent> findAlldataContent() {
		return memberContentRepository.findAll();
	}
	
	public Page<MemberContent> findAllContentByPage(Pageable pageable) {
		return memberContentRepository.findAll(pageable);
	}
	
	
	public void deleteMemberContent(Integer id) {
		memberContentRepository.deleteById(id);
	}

	public Boolean findMemberContentByMember(Member m) {
		Optional<MemberContent> mcResp= memberContentRepository.findByMember(m);
		if (mcResp.isEmpty()) {
			return true;
		}
		return false;
	}
	
	public MemberContent findMemberContentByMember2(Member m) {
		Optional<MemberContent> mcResp= memberContentRepository.findByMember(m);
		if (mcResp.isEmpty()) {
//			throw new UsernameNotFoundException("We can't find your account");
			return null;
		}
		return mcResp.get();
	}
	
	
	public MemberContent saveOrUpdateMemberContentByMember(Member member, MemberContent memberContent) {
		Optional<MemberContent> mcResp= memberContentRepository.findByMember(member);
		memberContent.setMember(member);
		if (mcResp.isEmpty()) {
			return memberContentRepository.save(memberContent);
		}
		MemberContent memberContent2 = mcResp.get();
		memberContent.setId(memberContent2.getId());
		return memberContentRepository.save(memberContent);
	}

	public MemberContent findMemberContentById(MemberContent memberContent) {
		Optional<MemberContent> mcResp= memberContentRepository.findById(memberContent.getId());
		if (mcResp.isEmpty()) {
//			throw new UsernameNotFoundException("We can't find your account");
			return null;
		}
		return mcResp.get();
	}
	

//	------------------- BK Chart---------------------------------------
	public List<MemberContent> findMemberGender(String gender) {
		return memberContentRepository.findByGenderLike(gender);
	}
	
	
	public List<PeopleNumberLogin> LoginPeopleForMonth(String year) {
		return peopleNumberLoginRepository.findByYearLike(year);
	}
	
//	記錄登陸次數人
	public void RecordLoginNumber() {
		Calendar calendar =Calendar.getInstance();
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);  
		int month = calendar.get(Calendar.MONTH)+1;
		int monthY = year*100+month;
		Optional<PeopleNumberLogin> Resp= peopleNumberLoginRepository.findByMonth(monthY);
		if (Resp.isEmpty()) {
			PeopleNumberLogin pLogin = new PeopleNumberLogin();
			pLogin.setMonth(monthY);
			pLogin.setYear(String.valueOf(year));
			pLogin.setNumber(1);
			peopleNumberLoginRepository.save(pLogin);
		}else {
		PeopleNumberLogin pLogin2= Resp.get();
		int rc= pLogin2.getNumber()+1;
		pLogin2.setNumber(rc);
		peopleNumberLoginRepository.save(pLogin2);
		}
	}
	
}
