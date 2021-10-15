package tw.royalbean.activity.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityOrder;
import tw.royalbean.activity.model.ActivityOrderService;
import tw.royalbean.activity.model.ActivitySatisfaction;
import tw.royalbean.activity.model.ActivitySatisfactionService;
import tw.royalbean.activity.model.ActivityService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.util.CnDateConvertUtil;

@Controller
@SessionAttributes(names = { "memberID" })
public class ActivityUserController {

	@Autowired
	private ActivityService actService;

	@Autowired
	private ActivityOrderService orderService;

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ActivitySatisfactionService aSatisfactionService;

	// 導至前端活動清單畫面jsp
	@GetMapping(path = "user/{memberID}/activity")
	public String processActivityMain(@PathVariable("memberID") String mid, Model m) {
		m.addAttribute("memberID", mid); // 提升Session:"mid"
		System.out.println("會員：" + mid);

		List<Activity> actlists = actService.findAll();
		m.addAttribute("actlists", actlists);
		return "activity/userPageActivityView";
	}

	// 活動類別ByCategory
	@PostMapping(path = "/activitycategory/{aCategory}")
	@ResponseBody
	public List<Activity> processStoresUserFindByNameAction(@PathVariable("aCategory") String aCategory, Model m) {
		System.out.println(aCategory);
		List<Activity> actCategory = actService.findByCategory("%" + aCategory + "%");
		System.out.println("進入ActivityUserController模糊查詢ByCategory:" + actCategory);
		return actCategory;
	}

	// 前往報名頁面
	@GetMapping(path = "user/{memberID}/activityorder{aid}")
	public String processtoOrder(@PathVariable("memberID") String mid, @PathVariable("aid") String aid, Model m) {
		System.out.println("進入ActivityUserController報名活動:會員-" + mid + "/參加活動-" + aid);
		
		Activity thisact = actService.findByaid2(Integer.valueOf(aid));
		m.addAttribute("thisact", thisact); // 傳入Activity至報名表單

		Member thismem = mService.findById(Integer.valueOf(mid));
		m.addAttribute("thismem", thismem); // 傳入member至報名表單

		ActivityOrder activityOrder = new ActivityOrder();
		m.addAttribute("activity/activityOrder", activityOrder);
		return "activity/activityOrder";
	}

	// 報名資料送出
	ActivityOrder insertOrder = new ActivityOrder();
	
	@PostMapping(path = "user/{memberID}/ordersubmit")
	public String processOrderInsert(@ModelAttribute(name = "activity/activityOrder") ActivityOrder activityOrder,
			BindingResult bind, Model m, @ModelAttribute(name = "mid") String mid) {
		System.out.println("進入ActivityUserController執行processOrderInsert報名送出");

		if (bind.hasErrors()) {
			return "activity/orderError";
		}

		insertOrder = orderService.insert(activityOrder);
		m.addAttribute("insertOrder", insertOrder);
		return "activity/activityCheckOut";
		
	}
	
	// Ajax異步寄mail
	@PostMapping(path = "/ordermail")
	@ResponseBody
	public void processAjaxMail() {
		System.out.println("Ajax異步寄mail");
		// 寄mail

		String orderhtml = makeOrderHtml(insertOrder);
		System.out.println(orderhtml);
		sendOrderEmail(orderhtml,insertOrder.getAoEmail());
		//return "success";
	}
	
	// Ajax異步串接綠界
	@PostMapping(path = "user/{memberID}/orderepay")
	public String processAjaxePay(Model m) {
		System.out.println("Ajax異步綠界");
		AllInOne pay = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
			
		UUID uuid = UUID.randomUUID();
		obj.setMerchantTradeNo(uuid.toString().replaceAll("-", "").substring(0, 20)); //產生不重複綠界刷卡機訂單編號
			
		Date date = new Date();
		String dateToCnDate = CnDateConvertUtil.dateToOrder(date);
		obj.setMerchantTradeDate(dateToCnDate); //當下交易日期時間
			
		String aoPrice = insertOrder.getAoPrice();
		obj.setTotalAmount(aoPrice); //付款金額
			
		obj.setTradeDesc("test Description");
			
		int aoId = insertOrder.getAoId();
		obj.setItemName("activityOrder"+"-"+String.valueOf(aoId)); 
			
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
			
		String form = pay.aioCheckOut(obj, null);		
		m.addAttribute("form", form);
			
		return "activity/activityePay";
	}
		
	// 導至前端活動紀錄畫面jsp
	@GetMapping(path = "user/{memberID}/activitysatisfaction")
	public String processActivitySatisfactionMain(@PathVariable("memberID") String mid, Model m) {
		
		Member thismem = mService.findById(Integer.valueOf(mid));
		List<ActivityOrder> orderSat = orderService.findByMember(thismem);
		m.addAttribute("orderSat", orderSat);
		
		return "activity/activitySatisfaction";
	}	
	
	// 評論送出
	@PostMapping(path = "/satisfactionsubmit")
	//@ResponseBody
	public String processSatisfactionOK(@RequestParam(value = "asPlace") String asPlace,
										@RequestParam(value = "asPrice") String asPrice,
										@RequestParam(value = "asProduct") String asProduct,
										@RequestParam(value = "asRevisit") String asRevisit,
										@RequestParam(value = "asTeacher") String asTeacher,
										@RequestParam(value = "asContent") String asContent,
										@RequestParam(value = "aoId") String aoId, Model m) {

		System.out.println("進入ActivityUserController執行processSatisfactionOK評論送出");
		ActivitySatisfaction sat = new ActivitySatisfaction();
		sat.setAsPlace(Integer.valueOf(asPlace));
		sat.setAsPrice(Integer.valueOf(asPrice));
		sat.setAsProduct(Integer.valueOf(asProduct));
		sat.setAsRevisit(Integer.valueOf(asRevisit));
		sat.setAsTeacher(Integer.valueOf(asTeacher));
		sat.setAsContent(asContent);
		
		ActivityOrder activityOrder1 = orderService.findById(Integer.valueOf(aoId));
		sat.setActivityOrder(activityOrder1);
		
		aSatisfactionService.insert(sat);
		
		int aid = activityOrder1.getActivity().getaId();		
		Activity thisact = actService.findByaid2(aid);
		m.addAttribute("thisact", thisact); // 傳入Activity至報名表單
		
		//int mid = activityOrder.getMember().getId();
		//Member thismem = mService.findById(mid);
		//m.addAttribute("thismem", thismem); // 傳入member至報名表單
		
		ActivityOrder activityOrder = new ActivityOrder();
		m.addAttribute("activity/activityOrder", activityOrder);
		return "activity/activityOrder";
		
	}
	
	// 評論資料Ajax送至活動頁面
	@PostMapping(path = "/satisfactionAjax/{aid}")
	@ResponseBody
	public List<ActivitySatisfaction> processSatisfactionAjax(@PathVariable("aid") String aid, Model m){
		System.out.println("進入processSatisfactionAjax方法:"+aid);
		
		Activity act = actService.findByaid2(Integer.valueOf(aid));
		List<ActivityOrder> orders = orderService.findByActivity(act);
		List<ActivitySatisfaction> satList = new  ArrayList<>();
		for(ActivityOrder order : orders) {
			List<ActivitySatisfaction> sat = aSatisfactionService.findByactivityOrder(order);
			satList.addAll(sat);
		}
		
		return satList;
	}
	
	
	
	
	
	// 寄送e-mail
		public void sendOrderEmail(String orderMessage,String email) {

			String to = email;

			// Sender's email ID needs to be mentioned
			String from = "EEIT12902@gmail.com";

			// Assuming you are sending email from
			String host = "smtp.gmail.com";
			final String username = "EEIT12902@gmail.com";
			final String password = "EEIT12902EEIT12902";// your password

			// Get system properties
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.port", 587);

			// Setup mail server
			props.setProperty("mail.smtp.host", host);

			// Get the default Session object.
			Session session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {
				// Create a default MimeMessage object.
				MimeMessage message = new MimeMessage(session);

				// Set From: header field of the header.
				message.setFrom(new InternetAddress(from));

				// Set To: header field of the header.
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

				// Set Subject: header field
				message.setSubject("感謝您預約RoyalBean的活動");

				// Now set the actual message
				message.setContent(orderMessage, "text/html;charset=utf-8");

				// Send message
				Transport.send(message);

				System.out.println("Sent message successfully....");

			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
		}

	public String makeOrderHtml(ActivityOrder insertOrder) {

		StringBuffer aStringBuffer = new StringBuffer();
		
		Activity activity = insertOrder.getActivity();

		aStringBuffer.append(
				"<!DOCTYPE html><html><head><title></title>"
				+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>"
				+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
				+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"
				+ "<style type=\"text/css\">"
				+ "body,table,td,a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }"
				+ "table,td { mso-table-lspace: 0pt;mso-table-rspace: 0pt;}"
				+ "img { -ms-interpolation-mode: bicubic; }"
				+ "img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }"
				+ "table { border-collapse: collapse !important; }"
				+ "body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}"
				+ "a[x-apple-data-detectors] { color: inherit !important; text-decoration: none !important; font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important; line-height: inherit !important;}"
				+ "@media screen and (max-width: 480px) {.mobile-hide { display: none !important;} .mobile-center { text-align: center !important;}} div[style*=\"margin: 16px 0;\"] {margin: 0 !important;}"
				+ "</style></head>");

		aStringBuffer.append(
				"<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">    "
				+ "<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>"
				+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tr><td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">"
				+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\"><tr>"
				+ "<td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 35px;\" bgcolor=\"#D2691E\">"
				+ "<div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">"
				+ "<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">"
				+ "<tr><td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">"
				+ "<h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">RealBeanCafe</h1></td></tr>"
				+ "</table></div><div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">"
				+ "<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:300px;\">"
				+ "<tr><td align=\"right\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">"
				+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\">"
				+ "<tr><td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400;\">"
				+ "<p style=\"font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;\"><a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;font-size: 18px;\">活動預約 &nbsp;</a></p></td>"
				+ "<td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\"> <a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\">"
				+ "</a> </td></tr></table></td></tr></table></div></td></tr><tr>");

		aStringBuffer.append(
				"<td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">"
				+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">"
				+ "<tr><td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\"> "
				+ "<img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>"
				+ "<h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\"> 感謝您參與活動 <br> 當天請出示此畫面報到 </h2></td></tr>"
				+ "<tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;\">"
				+ "<p style=\"font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;\"></p>"
				+ "</td></tr>"
				+ "<tr><td align=\"left\" style=\"padding-top: 20px;\">"
				+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">");
		
		aStringBuffer.append(
				"<tr>"
						+ "<td width=\"75%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> 預約內容 </td>\n"
						+ "<td width=\"25%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> 小計 </td>\n"
						+ "</tr>");

		aStringBuffer.append(
				"<tr>"
				+ "<td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">"
				+ activity.getaName() + " - " + insertOrder.getaResDate() + "</td>"
				+ "<td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">"
				+ insertOrder.getAoPrice() + "</td>" + "</tr>");

		aStringBuffer.append("</table>" + "</td>" + "</tr>");
		
		aStringBuffer.append(
				"<tr>"
				+ "<td align=\"left\" style=\"padding-top: 20px;\">"
				+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">"
				+ "<tr>"
				+ "<td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\"> 總價 </td>"
				+ "<td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">"
				+ insertOrder.getAoPrice() + "</td>" + "</tr>"
				+ "</table>" + "</td>"
				+ "</tr>" + "</table>");
		
		aStringBuffer.append(
				"</tr><tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">"
				+ "<p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\">瀏覽<a href=\"http://localhost:8080/user/"+insertOrder.getMember().getId()+"/activitysatisfaction\" target=\"_blank\" style=\"color: #777777;\">我的活動</a>.</p>"
				+ "</td></tr></table></td></tr></table></td></tr></table></body></html>");

		String view = aStringBuffer.toString();

		return view;
	}

}
