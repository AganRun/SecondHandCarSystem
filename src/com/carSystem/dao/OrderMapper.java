package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Order;

@Repository
public interface OrderMapper {

	//��ȡ���Ķ���id
	public String getMaxId();
	
	//����id��ö�����Ϣ
	public List<Order> queryOrderById(String order_id);
	
	//���û������ȫ��δ֧������
	public List<Order> userQueryAllNotPayOrder(String login_id);
	
	//���ȫ��δ֧������
	public List<Order> queryAllNotPayOrder();
	
	//����id���δ֧������
	public List<Order> queryNotPayOrderById(String order_id);
	
	//���û������ȫ���Ѿ�֧������δ����
	public List<Order> userQueryAllPayOrder(String login_id);
	
	//���ȫ���Ѿ�֧������δ����
	public List<Order> queryAllPayOrder();
	
	//(�̼�)���ȫ���Ѿ�֧������δ����
	public List<Order> shopQueryAllPayOrder(String order_shop_id);
	
	//����id����Ѿ�֧������δ����
	public List<Order> queryPayOrderById(String order_id);

	//����id��name����Ѿ�֧������δ����
	public List<Order> queryPayOrderByIdOrName(String order_id);
	
	//���̼ң�����id����Ѿ�֧������δ����
	public List<Order> shopQueryPayOrderById(Order order);
	
	//���̼ң�����id����nameģ����ѯ�Ѿ�֧������δ����
	public List<Order> shopQueryPayOrderByIdOrName(Order order);
	
	//���û������ȫ���Ѿ�����δ�ջ�����
	public List<Order> userQueryAllSendOrder(String login_id);
	
	//���ȫ���Ѿ�����δ�ջ�����
	public List<Order> queryAllSendOrder();
	
	//���̼ң����ȫ���Ѿ�����δ�ջ����� 
	public List<Order> shopQueryAllSendOrder(String order_shop_id);
	
	//����id����Ѿ�����δ�ջ�����
	public List<Order> querySendOrderById(String order_id);

	//����id��name����Ѿ�����δ�ջ�����
	public List<Order> querySendOrderByIdOrName(String order_id);
	
	//(�̼�)����id����Ѿ�����δ�ջ�����
	public List<Order> shopQuerySendOrderById(Order order);
	
	//(�̼�)����id��name����Ѿ�����δ�ջ�����
	public List<Order> shopQuerySendOrderByIdOrName(Order order);
	
	//���û������ȫ���ջ�δɾ������ʷ����
	public List<Order> userQueryAllReceiveOrder(String login_id);
	
	//���ȫ���ջ�δɾ������ʷ����
	public List<Order> queryAllReceiveOrder();
	
	//(�̼�)���ȫ���ջ�δɾ������ʷ����
	public List<Order> shopQueryAllReceiveOrder(String order_shop_id);
	
	//����id����ջ�δɾ������ʷ����
	public List<Order> queryReceiveOrderById(String order_id);

	//����id��name����ջ�δɾ������ʷ����
	public List<Order> queryReceiveOrderByIdOrName(String order_id);

	//���̼ң�����id����ջ�δɾ������ʷ����
	public List<Order> shopQueryReceiveOrderById(Order order);

	//���̼ң�����id��nameģ������ջ�δɾ������ʷ����
	public List<Order> shopQueryReceiveOrderByIdOrName(Order order);
	
	//(�û�)���ȫ������վ����
	public List<Order> userQueryAllDeleteOrder(String login_id);
	
	//���ȫ������վ����
	public List<Order> queryAllDeleteOrder();
	
	//���̼ң����ȫ������վ����
	public List<Order> shopQueryAllDeleteOrder(String order_shop_id);
	
	//����id��û���վ����
	public List<Order> queryDeleteOrderById(String order_id);

	//����id��name��û���վ����
	public List<Order> queryDeleteOrderByIdOrName(String order_id);

	//���̼ң�����id��û���վ����
	public List<Order> shopQueryDeleteOrderById(Order order);
	
	//���̼ң�����id����nameģ����û���վ����
	public List<Order> shopQueryDeleteOrderByIdOrName(Order order);
	
	//���Ӷ���
	public void addOrder(Order order);
	
	//�������
	public void payOrder(Order order);
	
	//����id���û��Ķ�������
	public void sendOrderById(Order order);
	
	//����id���û��Ķ����ջ�
	public void orderToReceive(Order order);
	
	//�û�����idɾ����ʷ���� 
	public void orderDeleteHistory(Order order);
	
	//����id����ɾ������վ�Ķ���
	public void orderDeleteById(String order_id);
	
	//�����·ݽ�������ͳ��
	public List<Order> saleOrderByMonth(String time);
	
	//����Ʒ�ƽ�������ͳ��
	public List<Order> saleOrderByBrand(String brand_id);
	
	//(�̼�)��ʱ��ͳ�ƶ��� 
	public List<Order> shopSaleOrderTime(String shop_id);
	
	//(�̼�)��Ʒ������ͳ��
	public List<Order> shopSaleOrderByBrand(String shop_id);

	//(�̼�)���ݾ���Ʒ�ƽ�������ͳ�� 
	public List<Order> shopSaleOrderByBrandId(Order order);
	
	
}
