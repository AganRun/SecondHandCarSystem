package com.carSystem.action.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Brand;
import com.carSystem.entity.Car;
import com.carSystem.entity.Login;
import com.carSystem.entity.Order;
import com.carSystem.entity.Person;
import com.carSystem.entity.ShopCart;
import com.carSystem.service.BrandService;
import com.carSystem.service.CarService;
import com.carSystem.service.OrderService;
import com.carSystem.service.PersonService;
import com.carSystem.service.ShopCartService;

@Controller
@RequestMapping("/orderManage")
public class OrderManageAction {

	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private ShopCartService shopCartService;
	
	@Autowired
	private BrandService brandService;
	
	//提交订单页面
	@RequestMapping("/addOrderInit")
	public String addOrderInit(ShopCart shopCart, Map<String, Object> map,HttpSession session){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		
		Car car = carService.queryOnlineCarById(shopCart.getShopCart_car_id()).get(0);
		Person preson = personService.queryPersonById(shopCart.getShopCart_person_id());
		map.put("personInfo", preson);
		map.put("carInfo", car);
		
		//从购物车付款，成功后删除购物车中的记录！！！
		if(shopCart.getShopCart_id() != null){
			shopCartService.deleteById(shopCart.getShopCart_id());
		}
		
		return "user/order/order_add";
	}
	
	//下单（生成订单，未支付，跳转到支付页面）
	@RequestMapping("/addOrder")
	public String addOrder(Order order, Map<String, Object> map){
		String id = orderService.addOrder(order);
		map.put("order_id", id);
		return "user/order/order_pay";
	}
	
	//跳转到支付页面（用于待付款列表的使用）
	@RequestMapping("/orderToPay")
	public String orderToPay(String order_id, Map<String, Object> map){
		map.put("order_id", order_id);
		return "user/order/order_pay";
	}
	
	//用户取消订单（删除!）
	@RequestMapping("/deleteOrder")
	public String deleteOrder(String order_id){
		orderService.orderDeleteById(order_id);
		return "redirect:/orderManage/notPayOrder";
	}
	
	
	//支付操作，成功后跳转到代发货页面
	@RequestMapping("/payOrder")
	public String payOrder(String order_id){
		orderService.payOrder(order_id);
		return "redirect:/orderManage/notSendOrder";
	}
	
	//待付款页面
	@RequestMapping("/notPayOrder")
	public String notPayOrder(Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		List<Order> orderList = orderService.userQueryAllNotPayOrder( login.getLogin_id() );
		map.put("notPayOrder", orderList);
		System.out.println("=================代付款长度：" + orderList.size());
		return "user/order/order_notPay";
	}
	
	//已经付款未发货订单
	@RequestMapping("/notSendOrder")
	public String notSendOrder(Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		List<Order> orderList = orderService.userQueryAllPayOrder(login.getLogin_id());
		map.put("notSendOrder", orderList);
		return "user/order/order_notSend";
	}
	
	//已经发货未收货订单
	@RequestMapping("/notReceiveOrder")
	public String notReceiveOrder(Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		List<Order> orderList = orderService.userQueryAllSendOrder(login.getLogin_id());
		map.put("notReceiveOrder", orderList);
		return "user/order/order_notReceive";
	}
	
	//历史订单
	@RequestMapping("/historyOrder")
	public String historyOrder(Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("loginSession");
		if(login == null){
			return "redirect:/loginInitAction";
		}else if( !login.getLogin_permission().equals("user")){
			return "redirect:/loginInitAction";
		}
		List<Order> orderList = orderService.userQueryAllReceiveOrder(login.getLogin_id());
		map.put("historyOrder", orderList);
		return "user/order/order_history";
	}
	
	//订单详情
	@RequestMapping("/orderDetails")
	public String orderDetails(Map<String, Object> map, String order_id){
		Order order = orderService.queryOrderById(order_id).get(0);
		map.put("detailsOrder", order);
		return "user/order/order_details";
	}
	
	//将已发货订单 收货(并且在brand表中，品牌对应的销售量+1,价钱也+)
	@RequestMapping("/orderToReceive")
	public String orderToReceive(String order_id){
		orderService.orderToReceive(order_id);
		
		Order order = orderService.queryOrderById(order_id).get(0);
		Car car = carService.queryOnlineCarById(order.getOrder_car_id()).get(0);
		Brand brand = brandService.queryBrandById(car.getCar_brand_id());
		brandService.addBrandSaleNum(brand, car.getCar_price_new());
		
		return "redirect:/orderManage/notReceiveOrder";
	}
	
	//用户根据id删除历史订单
	@RequestMapping("/orderDeleteHistory")
	public String orderDelete(String order_id){
		orderService.orderDeleteHistory(order_id);
		return "redirect:/orderManage/historyOrder";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
