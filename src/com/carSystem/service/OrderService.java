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
	
	//����id��ö�����Ϣ
	public List<Order> queryOrderById(String order_id){
		return orderMapper.queryOrderById(order_id);
	}
	
	
	//���û������ȫ��δ֧������
	public List<Order> userQueryAllNotPayOrder(String login_id){
		return orderMapper.userQueryAllNotPayOrder(login_id);
	}
	
	//���ȫ��δ֧������
	public List<Order> queryAllNotPayOrder(){
		return orderMapper.queryAllNotPayOrder();
	}
	
	//����id���δ֧������
	public List<Order> queryNotPayOrderById(String order_id){
		return orderMapper.queryNotPayOrderById(order_id);
	}
	
	//���û������ȫ���Ѿ�֧������δ����
	public List<Order> userQueryAllPayOrder(String login_id){
		return orderMapper.userQueryAllPayOrder(login_id);
	}
	
	//���ȫ���Ѿ�֧������δ����
	public List<Order> queryAllPayOrder(){
		return orderMapper.queryAllPayOrder();
	}
	
	//���̼ң����ȫ���Ѿ�֧������δ����
	public List<Order> shopQueryAllPayOrder(String order_shop_id){
		return orderMapper.shopQueryAllPayOrder(order_shop_id);
	}
	
	//����id����Ѿ�֧������δ����
	public List<Order> queryPayOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllPayOrder();
		}
		return orderMapper.queryPayOrderByIdOrName(order_id);
	}
	
	//����id����Ѿ�֧������δ����
	public List<Order> shopQueryPayOrderById(String order_id, String shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllPayOrder(shop_id);
		}
		return orderMapper.shopQueryPayOrderByIdOrName(order);
	}
	
	//���û������ȫ���Ѿ�����δ�ջ�����
	public List<Order> userQueryAllSendOrder(String login_id){
		return orderMapper.userQueryAllSendOrder(login_id);
	}
	
	//���ȫ���Ѿ�����δ�ջ�����
	public List<Order> queryAllSendOrder(){
		return orderMapper.queryAllSendOrder();
	}

	//���̼ң����ȫ���Ѿ�����δ�ջ�����
	public List<Order> shopQueryAllSendOrder(String order_shop_id){
		return orderMapper.shopQueryAllSendOrder(order_shop_id);
	}
	
	//����id����Ѿ�����δ�ջ�����
	public List<Order> querySendOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllSendOrder();
		}
		return orderMapper.querySendOrderByIdOrName(order_id);
	}
	
	//���̼ң�����id����Ѿ�����δ�ջ�����
	public List<Order> shopQuerySendOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllSendOrder(order_shop_id);
		}
		return orderMapper.shopQuerySendOrderByIdOrName(order);
	}
	
	//���û������ȫ���ջ�δɾ������ʷ����
	public List<Order> userQueryAllReceiveOrder(String login_id){
		return orderMapper.userQueryAllReceiveOrder(login_id);
	}
	
	//���ȫ���ջ�δɾ������ʷ����
	public List<Order> queryAllReceiveOrder(){
		return orderMapper.queryAllReceiveOrder();
	}

	//(�̼�)���ȫ���ջ�δɾ������ʷ����
	public List<Order> shopQueryAllReceiveOrder(String order_shop_id){
		return orderMapper.shopQueryAllReceiveOrder(order_shop_id);
	}
	
	//����id����ջ�δɾ������ʷ����
	public List<Order> queryReceiveOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllReceiveOrder();
		}
		return orderMapper.queryReceiveOrderByIdOrName(order_id);
	}

	//���̼ң�����id����ջ�δɾ������ʷ����
	public List<Order> shopQueryReceiveOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllReceiveOrder(order_shop_id);
		}
		return orderMapper.shopQueryReceiveOrderByIdOrName(order);
	}
	
	//���ȫ������վ����
	public List<Order> queryAllDeleteOrder(){
		return orderMapper.queryAllDeleteOrder();
	}
	
	//���û������ȫ������վ����
	public List<Order> userQueryAllDeleteOrder(String login_id){
		return orderMapper.userQueryAllDeleteOrder(login_id);
	}

	//���̼ң����ȫ������վ����
	public List<Order> shopQueryAllDeleteOrder(String order_shop_id){
		return orderMapper.shopQueryAllDeleteOrder(order_shop_id);
	}
	
	//����id��û���վ����
	public List<Order> queryDeleteOrderById(String order_id){
		if(order_id == null || order_id.equals("")){
			return orderMapper.queryAllDeleteOrder();
		}
		return orderMapper.queryDeleteOrderByIdOrName(order_id);
	}

	//(�̼�)����id��û���վ����
	public List<Order> shopQueryDeleteOrderById(String order_id, String order_shop_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_shop_id(order_shop_id);
		
		if(order_id == null || order_id.equals("")){
			return orderMapper.shopQueryAllDeleteOrder(order_shop_id);
		}
		return orderMapper.shopQueryDeleteOrderByIdOrName(order);
	}
	
	//���Ӷ���,ͬʱ��������ӵ�id
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
	
	//�������
	public void payOrder(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_pay("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_pay(sdf.format(new Date()));
		
		orderMapper.payOrder(order);
	}
	
	//����id���û��Ķ�������
	public void sendOrderById(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_send("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_send(sdf.format(new Date()));
		
		orderMapper.sendOrderById(order);
	}
	
	//����id���û��Ķ����ջ�
	public void orderToReceive(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_receive("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_receive(sdf.format(new Date()));
		
		orderMapper.orderToReceive(order);
	}
	
	
	//�û�����idɾ����ʷ���� 
	public void orderDeleteHistory(String order_id){
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_status_delete("0");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		order.setOrder_time_delete(sdf.format(new Date()));
		
		orderMapper.orderDeleteHistory(order);
	}
	
	//����id����ɾ������վ�Ķ���
	public void orderDeleteById(String order_id){
		orderMapper.orderDeleteById(order_id);
	}
	
	//�����·ݽ�������ͳ��
	public List<Order> saleOrderByMonth(String month){
		return orderMapper.saleOrderByMonth(month);
	}
	
	//(�̼�)�����·ݽ�������ͳ��
	public List<Order> shopSaleOrderByMonth( String year, String month, String shop_id){
		List<Order> orderlist = orderMapper.saleOrderByMonth(year + "-" + month);
		for(int i=0;i<orderlist.size();i++){
			if( !orderlist.get(i).getOrder_shop_id().equals(shop_id)){
				orderlist.remove(i);
			}
		}
		return orderlist;
	}
	
	//����Ʒ�ƽ�������ͳ��
	public List<Order> saleOrderByBrand(String brand_id){
		return orderMapper.saleOrderByBrand(brand_id);
	}
	
	//(�̼�)��ʱ��ͳ�ƶ��� 
	public List<Order> shopSaleOrderTime(String shop_id){
		return orderMapper.shopSaleOrderTime(shop_id);
	}
		
	//(�̼�)��Ʒ��ͳ�ƶ��� 
	public List<Order> shopSaleOrderByBrand(String shop_id){
		return orderMapper.shopSaleOrderByBrand(shop_id);
	}
	
	//(�̼�)���ݾ���Ʒ�ƽ�������ͳ�� 
	public List<Order> shopSaleOrderByBrandId(String brand_id, String shop_id){
		Order order = new Order();
		order.setCar_brand_id(brand_id);
		order.setOrder_shop_id(shop_id);
		return orderMapper.shopSaleOrderByBrandId(order);
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
