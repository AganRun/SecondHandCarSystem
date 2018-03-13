package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Order;

@Repository
public interface OrderMapper {

	//获取最大的订单id
	public String getMaxId();
	
	//根据id获得订单信息
	public List<Order> queryOrderById(String order_id);
	
	//（用户）获得全部未支付订单
	public List<Order> userQueryAllNotPayOrder(String login_id);
	
	//获得全部未支付订单
	public List<Order> queryAllNotPayOrder();
	
	//根据id获得未支付订单
	public List<Order> queryNotPayOrderById(String order_id);
	
	//（用户）获得全部已经支付订单未发货
	public List<Order> userQueryAllPayOrder(String login_id);
	
	//获得全部已经支付订单未发货
	public List<Order> queryAllPayOrder();
	
	//(商家)获得全部已经支付订单未发货
	public List<Order> shopQueryAllPayOrder(String order_shop_id);
	
	//根据id获得已经支付订单未发货
	public List<Order> queryPayOrderById(String order_id);

	//根据id或name获得已经支付订单未发货
	public List<Order> queryPayOrderByIdOrName(String order_id);
	
	//（商家）根据id获得已经支付订单未发货
	public List<Order> shopQueryPayOrderById(Order order);
	
	//（商家）根据id或者name模糊查询已经支付订单未发货
	public List<Order> shopQueryPayOrderByIdOrName(Order order);
	
	//（用户）获得全部已经发货未收货订单
	public List<Order> userQueryAllSendOrder(String login_id);
	
	//获得全部已经发货未收货订单
	public List<Order> queryAllSendOrder();
	
	//（商家）获得全部已经发货未收货订单 
	public List<Order> shopQueryAllSendOrder(String order_shop_id);
	
	//根据id获得已经发货未收货订单
	public List<Order> querySendOrderById(String order_id);

	//根据id或name获得已经发货未收货订单
	public List<Order> querySendOrderByIdOrName(String order_id);
	
	//(商家)根据id获得已经发货未收货订单
	public List<Order> shopQuerySendOrderById(Order order);
	
	//(商家)根据id或name获得已经发货未收货订单
	public List<Order> shopQuerySendOrderByIdOrName(Order order);
	
	//（用户）获得全部收货未删除的历史订单
	public List<Order> userQueryAllReceiveOrder(String login_id);
	
	//获得全部收货未删除的历史订单
	public List<Order> queryAllReceiveOrder();
	
	//(商家)获得全部收货未删除的历史订单
	public List<Order> shopQueryAllReceiveOrder(String order_shop_id);
	
	//根据id获得收货未删除的历史订单
	public List<Order> queryReceiveOrderById(String order_id);

	//根据id或name获得收货未删除的历史订单
	public List<Order> queryReceiveOrderByIdOrName(String order_id);

	//（商家）根据id获得收货未删除的历史订单
	public List<Order> shopQueryReceiveOrderById(Order order);

	//（商家）根据id或name模糊获得收货未删除的历史订单
	public List<Order> shopQueryReceiveOrderByIdOrName(Order order);
	
	//(用户)获得全部回收站订单
	public List<Order> userQueryAllDeleteOrder(String login_id);
	
	//获得全部回收站订单
	public List<Order> queryAllDeleteOrder();
	
	//（商家）获得全部回收站订单
	public List<Order> shopQueryAllDeleteOrder(String order_shop_id);
	
	//根据id获得回收站订单
	public List<Order> queryDeleteOrderById(String order_id);

	//根据id或name获得回收站订单
	public List<Order> queryDeleteOrderByIdOrName(String order_id);

	//（商家）根据id获得回收站订单
	public List<Order> shopQueryDeleteOrderById(Order order);
	
	//（商家）根据id或者name模糊获得回收站订单
	public List<Order> shopQueryDeleteOrderByIdOrName(Order order);
	
	//增加订单
	public void addOrder(Order order);
	
	//付款操作
	public void payOrder(Order order);
	
	//根据id将用户的订单发货
	public void sendOrderById(Order order);
	
	//根据id将用户的订单收货
	public void orderToReceive(Order order);
	
	//用户根据id删除历史订单 
	public void orderDeleteHistory(Order order);
	
	//根据id彻底删除回收站的订单
	public void orderDeleteById(String order_id);
	
	//根据月份进行销售统计
	public List<Order> saleOrderByMonth(String time);
	
	//根据品牌进行销售统计
	public List<Order> saleOrderByBrand(String brand_id);
	
	//(商家)的时间统计订单 
	public List<Order> shopSaleOrderTime(String shop_id);
	
	//(商家)的品牌销量统计
	public List<Order> shopSaleOrderByBrand(String shop_id);

	//(商家)根据具体品牌进行销售统计 
	public List<Order> shopSaleOrderByBrandId(Order order);
	
	
}
