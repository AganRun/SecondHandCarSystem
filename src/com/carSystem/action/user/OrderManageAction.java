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
	
	//�ύ����ҳ��
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
		
		//�ӹ��ﳵ����ɹ���ɾ�����ﳵ�еļ�¼������
		if(shopCart.getShopCart_id() != null){
			shopCartService.deleteById(shopCart.getShopCart_id());
		}
		
		return "user/order/order_add";
	}
	
	//�µ������ɶ�����δ֧������ת��֧��ҳ�棩
	@RequestMapping("/addOrder")
	public String addOrder(Order order, Map<String, Object> map){
		String id = orderService.addOrder(order);
		map.put("order_id", id);
		return "user/order/order_pay";
	}
	
	//��ת��֧��ҳ�棨���ڴ������б��ʹ�ã�
	@RequestMapping("/orderToPay")
	public String orderToPay(String order_id, Map<String, Object> map){
		map.put("order_id", order_id);
		return "user/order/order_pay";
	}
	
	//�û�ȡ��������ɾ��!��
	@RequestMapping("/deleteOrder")
	public String deleteOrder(String order_id){
		orderService.orderDeleteById(order_id);
		return "redirect:/orderManage/notPayOrder";
	}
	
	
	//֧���������ɹ�����ת��������ҳ��
	@RequestMapping("/payOrder")
	public String payOrder(String order_id){
		orderService.payOrder(order_id);
		return "redirect:/orderManage/notSendOrder";
	}
	
	//������ҳ��
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
		System.out.println("=================������ȣ�" + orderList.size());
		return "user/order/order_notPay";
	}
	
	//�Ѿ�����δ��������
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
	
	//�Ѿ�����δ�ջ�����
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
	
	//��ʷ����
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
	
	//��������
	@RequestMapping("/orderDetails")
	public String orderDetails(Map<String, Object> map, String order_id){
		Order order = orderService.queryOrderById(order_id).get(0);
		map.put("detailsOrder", order);
		return "user/order/order_details";
	}
	
	//���ѷ������� �ջ�(������brand���У�Ʒ�ƶ�Ӧ��������+1,��ǮҲ+)
	@RequestMapping("/orderToReceive")
	public String orderToReceive(String order_id){
		orderService.orderToReceive(order_id);
		
		Order order = orderService.queryOrderById(order_id).get(0);
		Car car = carService.queryOnlineCarById(order.getOrder_car_id()).get(0);
		Brand brand = brandService.queryBrandById(car.getCar_brand_id());
		brandService.addBrandSaleNum(brand, car.getCar_price_new());
		
		return "redirect:/orderManage/notReceiveOrder";
	}
	
	//�û�����idɾ����ʷ����
	@RequestMapping("/orderDeleteHistory")
	public String orderDelete(String order_id){
		orderService.orderDeleteHistory(order_id);
		return "redirect:/orderManage/historyOrder";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
