//package tw.royalbean.shopcar.controller;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.configurationprocessor.json.JSONArray;
//import org.springframework.boot.configurationprocessor.json.JSONException;
//import org.springframework.boot.configurationprocessor.json.JSONObject;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import tw.royalbean.shopcar.model.ShopCar;
//import tw.royalbean.shopcar.model.ShopCarOrderItem;
//import tw.royalbean.shopcar.model.ShopCarOrderItemService;
//import tw.royalbean.shopcar.model.ShopCarService;
//
//@Controller
////@SessionAttributes(names = {"shopCarId"})
////@RequestMapping(path = "/shopcar")
//public class ShopCarController {
//		
//	@Autowired
//	private ShopCarService sCarService;
//	
//	@Autowired
//	private ShopCarOrderItemService sOrderItemService;
//	
//	// insertinto shopcar table 、ShopCarOrderItem table
//	
//	@PostMapping(path = "/shopcarinserttest.controller")
//	@ResponseBody
//	public ShopCar processShopCarInsertTest(@ModelAttribute("mid") int mid,ShopCar sCar,String cartItem,int pdtotalprice) throws JSONException {
//		System.out.println(cartItem);
//		System.out.println("shopcar mid:"+mid);
//		ArrayList<ShopCarOrderItem> itemsSet = new ArrayList<ShopCarOrderItem>();
//		
//		// 轉換成json array 
//		JSONArray jsonArray = new JSONArray(cartItem);
//		
//		for (int i = 0;i<jsonArray.length();i++) {
//			
//		//取得json array 的每一筆資料	
//		JSONObject jsonObject = jsonArray.getJSONObject(i);
//		
//		//透過.optString("對應欄位名稱")取的值
//		String id = jsonObject.optString("id");
//		String pdname = jsonObject.optString("name");
//		int unitprice = Integer.parseInt(jsonObject.optString("price"));
//		int qty = Integer.parseInt(jsonObject.optString("qty"));
//		
//		//檢查jsonObject裡的值
//		System.out.println("id:"+id+"pdname:"+pdname+"unitprice:"+unitprice+"qty:"+qty);
//		
//		//new ShopCarOrderItem(javaBean物件)，因@OneToMany 多方只能用LIST || SET 型別的資料型態
//		//若使用HASHSET 當傳入重複KEY 值時，會將前一筆資料覆寫，故這邊使用LIST形式去接應多筆相同KEY值傳入的資料 
//		ShopCarOrderItem sItem = new ShopCarOrderItem(pdname,qty,unitprice);			
//		itemsSet.add(sItem);
//		}
//		
//		//檢查LIST是否有成功新增1筆以上的ShopCarOrderItem物件=>ArrayList<ShopCarOrderItem>物件
//		System.out.println(itemsSet.size());
//		
//		//將ArrayList<ShopCarOrderItem>塞入ShopCar 物件做關聯關係(因為單向關係所以只需在ShopCar端設定)
//		sCar.setShopCarOrderItem(itemsSet);
//		sCar.setPdToTalPrice(pdtotalprice);		
//		sCar.setShopOrderDate(new Date());
//		
//		return sCarService.insert(sCar);
//
//	}
//		
//	// backSystemUseSelect
//	@PostMapping(path = "/shopcarquery.controller/{shopcarid}")
//	@ResponseBody
//	public ShopCar processShopCarFindById(@PathVariable(name = "shopcarid")int shopcarid) {
//		return sCarService.findById(shopcarid);
//	}
//	
//	// backSystemUseSelect
//	@PostMapping(path = "shopcarqueryall.controller")
//	@ResponseBody
//	public List<ShopCar> processShopCarFindAll(){
//		return sCarService.findAll();
//	}
//	
//	
//
//}
