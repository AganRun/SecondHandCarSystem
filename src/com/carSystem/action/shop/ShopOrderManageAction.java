package com.carSystem.action.shop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Login;
import com.carSystem.entity.Order;
import com.carSystem.entity.Page;
import com.carSystem.service.OrderService;
import com.carSystem.service.PageService;

@Controller
@RequestMapping("/shopOrderManage")
public class ShopOrderManageAction {

	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private PageService pageService;
	
	
	//未发货订单列表
	@RequestMapping("/orderNotSendList")
	public String orderNotSendList(Map<String, Object> map, HttpSession session,String currentpage){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		List<Order> orderList = orderService.shopQueryAllPayOrder(login.getLogin_id());
		
		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("notSendOrder", orderList);
		return "shop/orderManage/order_notSend";
	}
	
	//将订单发货,然后返回未发货订单列表
	@RequestMapping("/sendOrderById")
	public String sendOrderById(String order_id){
		orderService.sendOrderById(order_id);
		return "redirect:/shopOrderManage/orderNotSendList";
	}
	
	//订单信息详情
	@RequestMapping("/orderDetails")
	public String orderDetails(Map<String, Object> map, String order_id){
		Order order = orderService.queryOrderById(order_id).get(0);
		map.put("detailsOrder", order);
		return "shop/orderManage/order_details";
	}
	
	//根据id查询未发货订单
	@RequestMapping("/queryNotSendById")
	public String queryNotSendById(Map<String, Object> map, String order_id, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQueryPayOrderById(order_id, order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("notSendOrder", orderList);
		map.put("queryString", order_id);
		return "shop/orderManage/order_notSend";
	}
	
	//已经发货未收货订单
	@RequestMapping("/orderNotReceiveList")
	public String orderNotReceiveList(Map<String, Object> map, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQueryAllSendOrder(order_shop_id);
		
		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("notReceiveOrder", orderList);
		return "shop/orderManage/order_notReceive";
	}
	
	//根据id查询未收货订单
	@RequestMapping("/queryNotReceiveById")
	public String queryNotReceiveById(Map<String, Object> map, String order_id, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQuerySendOrderById(order_id, order_shop_id);
		
		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("notReceiveOrder", orderList);
		map.put("queryString", order_id);
		return "shop/orderManage/order_notReceive";
	}
	
	//历史订单列表
	@RequestMapping("/orderHistoryList")
	public String orderHistoryList(Map<String, Object> map, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQueryAllReceiveOrder(order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("HistoryOrder", orderList);
		return "shop/orderManage/order_history";
	}
	
	//根据id查询历史订单
	@RequestMapping("/queryHistoryById")
	public String queryHistoryById(Map<String, Object> map, String order_id, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQueryReceiveOrderById(order_id, order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("HistoryOrder", orderList);
		map.put("queryString", order_id);
		return "shop/orderManage/order_history";
	}
	
	//用户已经删除订单（回收站订单）
	@RequestMapping("/orderDeleteList")
	public String orderDeleteList(Map<String, Object> map, String order_shop_id, String currentpage, HttpSession session){
		List<Order> orderList = orderService.shopQueryAllDeleteOrder(order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("DeleteOrderList", orderList);
		return "shop/orderManage/order_delete";
	}
	
	//根据id查询回收站的订单
	@RequestMapping("/queryDeleteById")
	public String queryDeleteById(Map<String, Object> map, String order_id, String order_shop_id, String currentpage){
		List<Order> orderList = orderService.shopQueryDeleteOrderById(order_id, order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("DeleteOrderList", orderList);
		map.put("queryString", order_id);
		return "shop/orderManage/order_delete";
	}
	
	//根据id彻底删除回收站的订单
	@RequestMapping("/orderDeleteById")
	public String orderDeleteById(String order_id, String order_shop_id, Map<String, Object> map, String currentpage){
		orderService.orderDeleteById(order_id);
		
		List<Order> orderList = orderService.shopQueryAllDeleteOrder(order_shop_id);

		Page page = pageService.pageToOrder(orderList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > orderList.size() ? orderList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		orderList = orderList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("DeleteOrderList", orderList);
		return "shop/orderManage/order_delete";
	}
	
	
	
	
	
	
	
}
