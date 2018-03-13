package com.carSystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.OrderMapper;
import com.carSystem.entity.Order;

@Service
public class OrderService {

	
	@Autowired
	private OrderMapper orderMapper;
	
	//根据id获得订单信息
	public List<Order> queryOrderById(String order_id){
		return orderMapper.queryOrderById(order_id);
	}
	
	
	//（用户）获得全部未支付订单
	public List<Order> userQueryAllNotPayOrder(String login_id){
		return orderMapper.userQueryAllNotPayOrder(login_id);
	}
	
	//获得全部未支付订单
	public List<Order> queryAllNotPayOrder(){
		return orderMapper.queryAllNotPayOrder();
	}
	
	//根据id获得未支付订单
	public List<Order> queryNotPayOrderById(String order_id){
		return orderMapper.queryNotPayOrderById(order_id);
	}
	
	//（用户）获得全部已经支付订单未发货
	public List<Order> userQueryAllPayOrder(String login_id){
		return orderMapper.userQueryAllPayOrder(login_id);
	}
	
	//获得全部已经支付订单未发货
	public List<Order> queryAllPayOrder(){
		return orderMapper.queryAllPayOrder();
	}
	
	//（商家）获得全部已经支付订单未发货
	public List<Order> shopQueryAllPayOrder(String order_shop_id){
		return orderMapper.shopQueryAllPayOrder(order_shop_id);
	}
	
	//根据id获得已经支付订单未发货
	public List<Order> queryPayOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllPayOrder();
		}
		return orderMapper.queryPayOrderByIdOrName(order_id);
	}
	
	//根据id获得已经支付订单未发货
	public List<Order> shopQueryPayOrderById(String order_id, String shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllPayOrder(shop_id);
		}
		return orderMapper.shopQueryPayOrderByIdOrName(order);
	}
	
	//（用户）获得全部已经发货未收货订单
	public List<Order> userQueryAllSendOrder(String login_id){
		return orderMapper.userQueryAllSendOrder(login_id);
	}
	
	//获得全部已经发货未收货订单
	public List<Order> queryAllSendOrder(){
		return orderMapper.queryAllSendOrder();
	}

	//（商家）获得全部已经发货未收货订单
	public List<Order> shopQueryAllSendOrder(String order_shop_id){
		return orderMapper.shopQueryAllSendOrder(order_shop_id);
	}
	
	//根据id获得已经发货未收货订单
	public List<Order> querySendOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllSendOrder();
		}
		return orderMapper.querySendOrderByIdOrName(order_id);
	}
	
	//（商家）根据id获得已经发货未收货订单
	public List<Order> shopQuerySendOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllSendOrder(order_shop_id);
		}
		return orderMapper.shopQuerySendOrderByIdOrName(order);
	}
	
	//（用户）获得全部收货未删除的历史订单
	public List<Order> userQueryAllReceiveOrder(String login_id){
		return orderMapper.userQueryAllReceiveOrder(login_id);
	}
	
	//获得全部收货未删除的历史订单
	public List<Order> queryAllReceiveOrder(){
		return orderMapper.queryAllReceiveOrder();
	}

	//(商家)获得全部收货未删除的历史订单
	public List<Order> shopQueryAllReceiveOrder(String order_shop_id){
		return orderMapper.shopQueryAllReceiveOrder(order_shop_id);
	}
	
	//根据id获得收货未删除的历史订单
	public List<Order> queryReceiveOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllReceiveOrder();
		}
		return orderMapper.queryReceiveOrderByIdOrName(order_id);
	}

	//（商家）根据id获得收货未删除的历史订单
	public List<Order> shopQueryReceiveOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllReceiveOrder(order_shop_id);
		}
		return orderMapper.shopQueryReceiveOrderByIdOrName(order);
	}
	
	//获得全部回收站订单
	public List<Order> queryAllDeleteOrder(){
		return orderMapper.queryAllDeleteOrder();
	}
	
	//（用户）获得全部回收站订单
	public List<Order> userQueryAllDeleteOrder(String login_id){
		return orderMapper.userQueryAllDeleteOrder(login_id);
	}

	//（商家）获得全部回收站订单
	public List<Order> shopQueryAllDeleteOrder(String order_shop_id){
		return orderMapper.shopQueryAllDeleteOrder(order_shop_id);
	}
	
	//根据id获得回收站订单
	public List<Order> queryDeleteOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllDeleteOrder();
		}
		return orderMapper.queryDeleteOrderByIdOrName(order_id);
	}

	//(商家)根据id获得回收站订单
	public List<Order> shopQueryDeleteOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllDeleteOrder(order_shop_id);
		}
		return orderMapper.shopQueryDeleteOrderByIdOrName(order);
	}
	
	//增加订单,同时返回新添加的id
	public String addOrder(Order order){
		int maxId;
		if(orderMapper.getMaxId()==null || orderMapper.equals("")){
			maxId = 1000;
		}else{
			maxId = Integer.parseInt(orderMapper.getMaxId());
		}
		maxId++;
		order.setOrder_id(Integer.toString(maxId));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_addtime(sdf.format(new Date()));
		
		orderMapper.addOrder(order);
		
		return Integer.toString(maxId);
	}
	
	//付款操作
	public void payOrder(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_pay("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_pay(sdf.format(new Date()));
		
		orderMapper.payOrder(order);
	}
	
	//根据id将用户的订单发货
	public void sendOrderById(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_send("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_send(sdf.format(new Date()));
		
		orderMapper.sendOrderById(order);
	}
	
	//根据id将用户的订单收货
	public void orderToReceive(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_receive("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_receive(sdf.format(new Date()));
		
		orderMapper.orderToReceive(order);
	}
	
	
	//用户根据id删除历史订单 
	public void orderDeleteHistory(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_delete("0");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_delete(sdf.format(new Date()));
		
		orderMapper.orderDeleteHistory(order);
	}
	
	//根据id彻底删除回收站的订单
	public void orderDeleteById(String order_id){
		orderMapper.orderDeleteById(order_id);
	}
	
	//根据月份进行销售统计
	public List<Order> saleOrderByMonth(String month){
		return orderMapper.saleOrderByMonth(month);
	}
	
	//(商家)根据月份进行销售统计
	public List<Order> shopSaleOrderByMonth( String year, String month, String shop_id){
		List<Order> orderlist = orderMapper.saleOrderByMonth(year + "-" + month);
		for(int i=0;i<orderlist.size();i++){
			if( !orderlist.get(i).getOrder_shop_id().equals(shop_id)){
				orderlist.remove(i);
			}
		}
		return orderlist;
	}
	
	//根据品牌进行销售统计
	public List<Order> saleOrderByBrand(String brand_id){
		return orderMapper.saleOrderByBrand(brand_id);
	}
	
	//(商家)的时间统计订单 
	public List<Order> shopSaleOrderTime(String shop_id){
		return orderMapper.shopSaleOrderTime(shop_id);
	}
		
	//(商家)的品牌统计订单 
	public List<Order> shopSaleOrderByBrand(String shop_id){
		return orderMapper.shopSaleOrderByBrand(shop_id);
	}
	
	//(商家)根据具体品牌进行销售统计 
	public List<Order> shopSaleOrderByBrandId(String brand_id, String shop_id){
		Order order = new Order();
		order.setCar_brand_id(brand_id);
		order.setOrder_shop_id(shop_id);
		return orderMapper.shopSaleOrderByBrandId(order);
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
