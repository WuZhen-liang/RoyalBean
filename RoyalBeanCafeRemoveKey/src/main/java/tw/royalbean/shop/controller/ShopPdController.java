package tw.royalbean.shop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import net.bytebuddy.dynamic.scaffold.MethodRegistry.Handler.ForAbstractMethod;
import tw.royalbean.activity.model.Activity;
import tw.royalbean.activity.model.ActivityOrder;
import tw.royalbean.activity.model.ActivityStore;
import tw.royalbean.member.model.Company;
import tw.royalbean.member.model.CompanyService;
import tw.royalbean.member.model.Member;
import tw.royalbean.member.model.MemberContent;
import tw.royalbean.member.model.MemberService;
import tw.royalbean.shop.model.ShopPd;
import tw.royalbean.shop.model.ShopPdMessage;
import tw.royalbean.shop.model.ShopPdMessageService;
import tw.royalbean.shop.model.ShopPdService;
import tw.royalbean.shop.paypal.model.Order;
import tw.royalbean.shop.paypal.model.PaypalService;
import tw.royalbean.shopcar.model.ShopCar;
import tw.royalbean.shopcar.model.ShopCarOrderItem;
import tw.royalbean.shopcar.model.ShopCarOrderItemService;
import tw.royalbean.shopcar.model.ShopCarService;


@Controller
//@RequestMapping(path = "/company")
@SessionAttributes(value = {"cid","mid","thisShopPdDetail","pdtotalprice","shopOrder","pdid","memberPicture"})
public class ShopPdController {

	@Autowired
	private ShopPdService sPdService;
	
	@Autowired
	private CompanyService cService;
	
	@Autowired
	private ShopCarService sCarService;
	
	@Autowired
	private ShopCarOrderItemService sCarOrderItemService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PaypalService paypalService;
	
	@Autowired
	private ShopPdMessageService sPdMessageService;
	
	@Autowired
	private MemberService memberService;
	
	//paypal成功及失敗的網址
	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";
	
	// venderPage
	@GetMapping(path = "/jpvenderpage")
	public String jumpToVenderPage() {
		return "vender/venderLogin";
	}
	
	// userPage
	@GetMapping(path = "pay/jpuserpage")
	public String jumpToUserPage() {
		return "HomePage/index";
	}
	
	//shopAddController_first_time
	
	@RequestMapping(path = "company/find{cId}.insertpd",method = RequestMethod.GET)
	public String proccessshopPdEntry(Model m ,@PathVariable("cId") String cId) {
		System.out.println("cid:"+cId);
//		Company company = cService.findById(Integer.parseInt(cId));
		m.addAttribute("cid",cId);
		ShopPd shopPd = new ShopPd();
		m.addAttribute("shop/shopAddPdForm",shopPd);
		return "shop/shopAddPdForm";
	}
	//shopAddController_second_time
	@RequestMapping(path = "company/secondinsertpd",method = RequestMethod.GET)
	public String proccessshopPdEntryInsertSecontime(Model m ,@ModelAttribute("cid") String cId) {
		System.out.println("cid:"+cId);
//		Company company = cService.findById(Integer.parseInt(cId));
//		m.addAttribute("cid",cId);
		ShopPd shopPd = new ShopPd();
		m.addAttribute("shop/shopAddPdForm",shopPd);
		return "shop/shopAddPdForm";
	}	
	
	//company_add_picture_controller
	@PostMapping(path = "company/shopphoto", produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String processMemberPhotoAction(@RequestParam("PdPicture") MultipartFile multipartFile, Model m) throws Exception, IOException {
					
		String currentDate = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String fileName = currentDate+multipartFile.getOriginalFilename();
		System.out.println("fileName:" + fileName);
			
		String saveDirPath = "C:/temp/shoppicture/";
		File saveFileDir = new File(saveDirPath);
		saveFileDir.mkdirs();
		String saveFilePath = saveDirPath+ fileName;
	
			
		File saveFile = new File(saveFilePath);
		multipartFile.transferTo(saveFile);
		System.out.println("saveFilePath:" + saveFilePath);
		
//		String filename = "/temp-rainy/" + fileName; 
//		m.addAttribute("filename", filename);
		
		return fileName;
	}
		
//	//company_shopPdsearchController
//	// "/company/shopSearch"
	@RequestMapping(path = "company/shopSearch",method = RequestMethod.GET )
	public String proccessshopPdSearchEntry(Model m,@ModelAttribute("cid") int cid) {
		
		List<ShopPd> searchShopPd = sPdService.queryByCompanyProduct(cid);
		m.addAttribute("shopSearchResult",searchShopPd);
		return "shop/shopSearchPdResult";   
//		return "shop/companyPdView";
	}
	
	//company_shopPdsearchControllerByCompanyId
	// "/company/shopSearch"
	@RequestMapping(path = "company/find{cid}.shopSearch",method = RequestMethod.GET )
	public String proccessshopPdSearchByMid(Model m,@PathVariable("cid") int cid) {
		m.addAttribute("cid",cid);
		List<ShopPd> searchShopPd = sPdService.queryByCompanyProduct(cid);
		m.addAttribute("shopSearchResult",searchShopPd);
		return "shop/shopSearchPdResult";        
//		return "shop/companyPdView";
	}
	
	@GetMapping(path = "findcompanypd")
	@ResponseBody
	public List<ShopPd> processShopAjax(@ModelAttribute("cid") int cid) {
		List<ShopPd> companyPds = sPdService.queryByCompanyProduct(cid);
		return companyPds;
	}
	
	
	
	//user_shopPdsearchController
//	//一般會員 每個畫面載入前讀取localStorage的資料
	@PostMapping(path = "user/shopcaritem")
	@ResponseBody
	public String proccessGetShopCarItem(String cartItem,Model m) {
		System.out.println("cartItem:"+cartItem);
		return cartItem;
	}
	
	//user_shopPdsearchController
	//一般會員 使用者查看商品原本jsp:shopUserPdViewAll -->shop
	@RequestMapping(path = "/user/find{mid}/usershopSearchAll",method = RequestMethod.GET)
	public String proccessUserShopPdSearchEntryTest(Model m,@PathVariable("mid") int mid) {
		System.out.println("mid:"+mid);
		
		//拿到會員id 並提升為session
		m.addAttribute("mid",mid);
		
		//找到每個廠商所對應的商品總數
		List<Integer> products = sPdService.findCompanyPds();
		System.out.println("count:"+products);
		m.addAttribute("count",products);
		
		//找到每個商品類別的總數
		int cakes = sPdService.findAllCake().size();
		int coffees = sPdService.findAllCoffee().size();
		int coffeeBeans = sPdService.findAllCoffeeBean().size();
		m.addAttribute("cakes",cakes);
		m.addAttribute("coffees",coffees);
		m.addAttribute("coffeeBeans",coffeeBeans);
		
		//拿到會員照片
		Member thisMember = memberService.findById(mid);
		MemberContent thisMemberDetail = memberService.findMemberContentByMember2(thisMember);
		String memberPicture = thisMemberDetail.getPicture();
		m.addAttribute("memberPicture", memberPicture);
		
		
		List<ShopPd> searchShopPd = sPdService.queryShopPdAllItem();
		m.addAttribute("shopSearchResult",searchShopPd);
		return "shop/shop";
	}
	
	//user_shopPdsearchviewPdDetail
	//一般會員(查看商品詳細資訊)
	@GetMapping(path = "user/find{mid}/{pdid}/viewPdDetail")
//	@ResponseBody
	public String processUserShopPdViewDetail(Model m,@ModelAttribute("mid") int mid ,@PathVariable("pdid") int pdid ) {
		m.addAttribute("mid",mid);
		m.addAttribute("pdid", pdid);
		System.out.println("pdid:"+pdid);
		ShopPd thisShopPdDetail = sPdService.queryShopPdById(pdid);
		System.out.println("查詢對應商品成功");
		m.addAttribute("thisShopPdDetail",thisShopPdDetail);
		return "redirect:/user/find{mid}/pdDetail";
		
//		return "shop/shopUserPdViewDetail";
	}
	
	
	//在PdDetail 裡面點想其他商品的View
	@GetMapping(path = "user/{pdid}/viewPdDetail")
	public String processUserShopPdViewDetailSecondPage(Model m,@PathVariable("pdid") int pdid ) {
		System.out.println("pdid:"+pdid);
		m.addAttribute("pdid", pdid);
		ShopPd thisShopPdDetail = sPdService.queryShopPdById(pdid);
		System.out.println("查詢對應商品成功");
		m.addAttribute("thisShopPdDetail",thisShopPdDetail);
		return "redirect:/user/find{mid}/pdDetail";
		
//		return "shop/shopUserPdViewDetail";
	}
	
	@GetMapping(path = "user/find{mid}/pdDetail")
	public String processShopPdDetailPage(@ModelAttribute("mid") int mid,@ModelAttribute("thisShopPdDetail") ShopPd thisPd,Model m) {
		m.addAttribute("thisPdPicture",thisPd.getShopPdPicture());
		m.addAttribute("thisPdName",thisPd.getShopPdName());
		m.addAttribute("thisPdPrice",thisPd.getShopPdPrice());
		m.addAttribute("thisPdDepiction",thisPd.getShopPdDepiction());
		m.addAttribute("thisPdCount",thisPd.getShopPdCount());
		m.addAttribute("thisPdType",thisPd.getShopPdType());
		if(thisPd.getShopPdType().equals("咖啡")) {
			List<ShopPd> anotherCoffee = sPdService.findByShopPdTypeNotInclude("咖啡", thisPd.getShopPdNumber());
			m.addAttribute("anotherPd",anotherCoffee);
		}else if(thisPd.getShopPdType().equals("咖啡豆")) {
			List<ShopPd> anotherCoffeeBean = sPdService.findByShopPdTypeNotInclude("咖啡豆", thisPd.getShopPdNumber());
			m.addAttribute("anotherPd",anotherCoffeeBean);
		}else {
			List<ShopPd> anotherCake = sPdService.findByShopPdTypeNotInclude("蛋糕", thisPd.getShopPdNumber());
			m.addAttribute("anotherPd",anotherCake);
		}
		return "shop/shopUserPdViewDetail";
	}
	
	//--------------評論區-------------------------
	@PostMapping(path = "user/saveMessageWithPd")
	@ResponseBody
	public ShopPdMessage processSaveMessageRelationShopPd(@ModelAttribute("mid") int mid,@ModelAttribute("pdid") int pdid,String detail,int score1,ShopPdMessage shopPdMessage) {
		//找到對應的商品
		ShopPd thisPd = sPdService.queryShopPdById(pdid);
		System.out.println("detail:"+detail);
		System.out.println("score1:"+score1);
		System.out.println("pdid:"+pdid);
		System.out.println("mid:"+mid);
		
		
		shopPdMessage.setShopPdMessageDetail(detail);
		shopPdMessage.setShopPdMessageScore(score1);
		shopPdMessage.setShopPdMessageTime(new Date());
		shopPdMessage.setShopPd(thisPd);
		
		//先將資料存入資料庫--->若靠關聯關係會是空值
		ShopPdMessage thidDetail = sPdMessageService.insertShopPdMessage(shopPdMessage);
		return thidDetail;
	}
	
	//畫面一導入該商品交該商品所屬的評論呈現
	@PostMapping(path = "user/showAllMesssageForThisPd")
	@ResponseBody
	public List<ShopPdMessage> processShowAllMesssageForThisPd(@ModelAttribute("pdid") int pdid) {
		return sPdMessageService.findByShopPdMessageDetail(pdid);
	}
	

	
	//shopPdupdateController
	
	@RequestMapping(path = "/company/{shopSearchResult.shopPdNumber}.up",method = RequestMethod.GET)
	public String updatePdData(@PathVariable("shopSearchResult.shopPdNumber") String pdId, Model m) {
		System.out.println("shopPdNumber:"+pdId);
		ShopPd updatePdData = sPdService.queryShopPdById(Integer.parseInt(pdId));
		m.addAttribute("shop/shopUpdatePdForm",updatePdData);
		return "shop/shopUpdatePdForm";
	}
	
	//company_updateForm
	
	@RequestMapping(path = "/company/updatePd",method = RequestMethod.POST)
	public String proccessUpdatePdForm(@ModelAttribute(name = "shop/shopUpdatePdForm") ShopPd updatePd,BindingResult result,Model m) {

		System.out.println("updatePdId:"+updatePd.getShopPdNumber());
		sPdService.updateShopPd(updatePd);
		
		Company company = updatePd.getCompany();
		int cid = company.getId();
		List<ShopPd> searchShopPd = sPdService.queryByCompanyProduct(cid);
		m.addAttribute("shopSearchResult",searchShopPd);
		return "shop/shopSearchPdResult";	
	}
	
	//company_shopPdDeleteController
	
	@RequestMapping(path = "/company/{shopSearchResult.shopPdNumber}.del",method = RequestMethod.GET)
	public String processDeletePdVenderSelect(@PathVariable(name = "shopSearchResult.shopPdNumber") int pdId,Model m,@ModelAttribute("cid") int cid) throws InterruptedException {

		sPdService.deleteShopPdById(pdId);

		List<ShopPd> searchShopPd = sPdService.queryByCompanyProduct(cid);
		m.addAttribute("shopSearchResult",searchShopPd);
		return "shop/shopSearchPdResult";	
	}
	
	//company_shopPdAddPd
	@PostMapping(path = "company/ajaxinsertshoppd")
	@ResponseBody
	public String processAjaxInsertShopPd(@RequestBody ShopPd pd,Model m,@ModelAttribute("cid") String cid) {
		System.out.println(" InsertCid:"+cid);
		
		Company company = cService.findById(Integer.parseInt(cid));
		System.out.println(company.getName());
		pd.setCompany(company);		
		sPdService.insertShopPd(pd);
		return "Success";
	}
	
	//shopcar controller
	
	// insertinto shopcar table 、ShopCarOrderItem table
	
	@PostMapping(path = "/shopcarinsert.controller")
	@ResponseBody
	public ShopCar processShopCarInsert(@ModelAttribute("mid") int mid,ShopCar sCar,String cartItem,int pdtotalprice,String paypalDetail,Model m) throws JSONException {
		System.out.println(cartItem);
		System.out.println("paypalDetail:"+paypalDetail);
		
		//提供給paypaly購物車的最後價格
		m.addAttribute("pdtotalprice",pdtotalprice);
		
		//找到對應會員memberid
		Member member = mService.findById(mid);
		System.out.println("shopcar mid:"+mid);
		
		ArrayList<ShopCarOrderItem> itemsSet = new ArrayList<ShopCarOrderItem>();
		
		// 轉換成json array 
		JSONArray jsonArray = new JSONArray(cartItem);
		
		for (int i = 0;i<jsonArray.length();i++) {
			
		//取得json array 的每一筆資料	
		JSONObject jsonObject = jsonArray.getJSONObject(i);
		
		//透過.optString("對應欄位名稱")取的值
		String id = jsonObject.optString("id");
		String pdname = jsonObject.optString("name");
		int unitprice = Integer.parseInt(jsonObject.optString("price"));
		int qty = Integer.parseInt(jsonObject.optString("qty"));
		
		//檢查jsonObject裡的值
		System.out.println("id:"+id+"pdname:"+pdname+"unitprice:"+unitprice+"qty:"+qty);
		
		//new ShopCarOrderItem(javaBean物件)，因@OneToMany 多方只能用LIST || SET 型別的資料型態
		//若使用HASHSET 當傳入重複KEY 值時，會將前一筆資料覆寫，故這邊使用LIST形式去接應多筆相同KEY值傳入的資料 
		ShopCarOrderItem sItem = new ShopCarOrderItem(pdname,qty,unitprice);			
		itemsSet.add(sItem);
		}
		
		//檢查LIST是否有成功新增1筆以上的ShopCarOrderItem物件=>ArrayList<ShopCarOrderItem>物件
		System.out.println(itemsSet.size());
		
		//將ArrayList<ShopCarOrderItem>塞入ShopCar 物件做關聯關係(因為單向關係所以只需在ShopCar端設定)
		sCar.setShopCarOrderItem(itemsSet);
		sCar.setPdToTalPrice(pdtotalprice);		
		sCar.setMember(member);
		sCar.setShopOrderDate(new Date());
		shopOrder = sCarService.insert(sCar);
		m.addAttribute("shopOrder", shopOrder);
		return shopOrder;

	}
//------------------------結帳-------------------------------
	
	//shopPaycontroller
	@GetMapping(path = "/user/find{mid}/shoppaypage")
	public String goToShopPayPage(@ModelAttribute("mid") int mid,Model m) {
		Member member = mService.findById(mid);
		MemberContent memberContent = mService.findMemberContentByMember2(member);
		String membername = memberContent.getName();
		String memberphone = memberContent.getPhone();
		String memberMail = member.getEmail();
		String memberAddress = memberContent.getAddress();
		
		m.addAttribute("membername",membername);
		m.addAttribute("memberphone",memberphone);
		m.addAttribute("memberAddress",memberAddress);
		m.addAttribute("memberMail",memberMail);
		
//		ShopCar shopOrder = sCarService.findById(2);
//		m.addAttribute("shopOrder",shopOrder);
		return "shop/shopCheckOut";
	}
	
	//select Paypal Pay
	@ResponseBody
	@PostMapping(path = "user/find{mid}/paypalPay")
	public Order processPaypalGetInfoFromShopCarDetail(@ModelAttribute("mid") int mid,String cartItem ,int pdtotalprice) {
		System.out.println("cartItem"+cartItem);
//		System.out.println("pdtotalprice"+pdtotalprice);
		
		Order order = new Order();
		order.setPrice(pdtotalprice);
		order.setCurrency("TWD");
		order.setMethod("paypal");
		order.setIntent("sale");
		order.setDescription("test");
		
		return order;
	}
	
	//paypal 付款畫面
	
	@GetMapping("/")
	public String home(@ModelAttribute("pdtotalprice") int totalprice) {
		Order order = new Order();
		order.setPrice(totalprice);
		order.setCurrency("TWD");
		order.setMethod("paypal");
		order.setIntent("sale");
		order.setDescription("test");
		try {
			
			Payment payment = paypalService.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
					"http://localhost:8080/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if(link.getRel().equals("approval_url")) {
					return "redirect:"+link.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
		
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	 @GetMapping(value = CANCEL_URL)
	    public String cancelPay() {
	        return "shop/cancel";
	    }
	 
	    @GetMapping(value = SUCCESS_URL)
	    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,@ModelAttribute("mid") int mid) {
	        try {
	        	System.out.println("paypalGotomid:"+mid);
	            Payment payment = paypalService.executePayment(paymentId, payerId);
	            System.out.println(payment.toJSON());
	            if (payment.getState().equals("approved")) {
	                return "redirect:/user/find"+mid+"/userOrderSearch";
//	                return "redirect:/user";
	            }
	        } catch (PayPalRESTException e) {
	         System.out.println(e.getMessage());
	        }
	        return "redirect:/user/find"+mid+"/userOrderSearch";
	    }
	    
	  //------------------------訂單資訊-------------------------------	  
	    
	    //導向使用者訂單畫面
	    @GetMapping("user/find{mid}/userOrderSearch")
	    public String processOrderDetailEntry(@PathVariable("mid") int mid,Model m){
	    	m.addAttribute("mid",mid);
	    	//shopCar 對應到這個使用者的訂單
	    	List<ShopCar> userOrder = sCarService.queryByUserOrderDetail(mid);
	    	m.addAttribute("userOrder",userOrder);
	    	
	    	return "shop/shopUserSearchOrderDetail";
	    }
	    
	    //取得使用者所有訂單資訊
	    @PostMapping("/shopcarDetail")
	    @ResponseBody
	    public List<ShopCarOrderItem> processGetUserOrderDetail(@ModelAttribute("mid") int mid,int shopcarid){
	    	System.out.println("進來查詢");
	    	List<ShopCarOrderItem> thisDetail = sCarOrderItemService.findByShopCarOrderItemDetail(shopcarid);
	    	return thisDetail;
	    	
	    }
	    
	    
	  //------------------------寄Mail-------------------------------
	    ShopCar shopOrder = new ShopCar(); 
		// Ajax異步寄mail
		@PostMapping(path = "/shopordermail")
		@ResponseBody
		public void processShopAjaxMail() {
			System.out.println("Ajax異步寄mail");
			// 寄mail

			String orderhtml = makeOrderHtml(shopOrder);
			System.out.println(orderhtml);
			sendShopPdOrderEmail(orderhtml,"EEIT12902@gmail.com");
			//return "success";
		}	    
		// 寄送e-mail
		public void sendShopPdOrderEmail(String shoppdorderMessage,String email) {

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
				message.setSubject("感謝您訂購RoyalBean的商品");

				// Now set the actual message
				message.setContent(shoppdorderMessage, "text/html;charset=utf-8");

				// Send message
				Transport.send(message);

				System.out.println("Sent message successfully....");

			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
		}

	public String makeOrderHtml(ShopCar shopOrder) {

		StringBuffer aStringBuffer = new StringBuffer();
		
		List<ShopCarOrderItem> shopCarOrderItem = shopOrder.getShopCarOrderItem();

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
				+ "<p style=\"font-size: 18px; font-weight: 400; margin: 0; color: #ffffff;\"><a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;font-size: 18px;\"> &nbsp;</a></p></td>"
				+ "<td style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 24px;\"> <a href=\"#\" target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\">"
				+ "</a> </td></tr></table></td></tr></table></div></td></tr><tr>");

		aStringBuffer.append(
				"<td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">"
				+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">"
				+ "<tr><td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\"> "
				+ "<img src=\"https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" /><br>"
				+ "<h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\"> 感謝您的訂購 </h2></td></tr>"
				+ "<tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;\">"
				+ "<p style=\"font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;\"></p>"
				+ "</td></tr>"
				+ "<tr><td align=\"left\" style=\"padding-top: 20px;\">"
				+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">");

		aStringBuffer.append(
				"<tr>"
				+ "<td width=\"75%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> 產品資訊 </td>\n"
				+ "<td width=\"25%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\"> 小計 </td>\n"
				+ "</tr>");
		for(int i=0;i<shopCarOrderItem.size();i++) {
			
		aStringBuffer.append(
				"<tr>"
				+ "<td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">"
				+ shopCarOrderItem.get(i).getPdname() + " * " + shopCarOrderItem.get(0).getQty() + "</td>"
				+ "<td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">"
				+ shopCarOrderItem.get(i).getUnitprice() + "</td>" + "</tr>");
		}

		aStringBuffer.append("</table>" + "</td>" + "</tr>");
		
		aStringBuffer.append(
				"<tr>"
				+ "<td align=\"left\" style=\"padding-top: 20px;\">"
				+ "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">"
				+ "<tr>"
				+ "<td width=\"75%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\"> 總價 </td>"
				+ "<td width=\"25%\" align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;\">"
				+ shopOrder.getPdToTalPrice() + "</td>" + "</tr>"
				+ "</table>" + "</td>"
				+ "</tr>" + "</table>");
		
		aStringBuffer.append(
				"</tr><tr><td align=\"left\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 24px;\">"
				+ "<p style=\"font-size: 14px; font-weight: 400; line-height: 20px; color: #777777;\">此訂單為測試訂單<a href=\"#\" target=\"_blank\" style=\"color: #777777;\">取消訂閱</a>.</p>"
				+ "</td></tr></table></td></tr></table></td></tr></table></body></html>");

		String view = aStringBuffer.toString();

		return view;
	}

	
}
