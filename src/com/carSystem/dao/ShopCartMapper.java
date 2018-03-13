package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.ShopCart;

@Repository
public interface ShopCartMapper {

	
	//��ȡ���Ĺ��ﳵid
	public String getMAXShopCartId();
	
	//�����û���id��ѯȫ���Ĺ��ﳵ��Ϣ
	public List<ShopCart> getAllByPersonId(String person_id);
	
	//��ӹ��ﳵ
	public void addShopCart(ShopCart shopCart);
	
	//ɾ��ȫ�����ﳵ
	public void deleteAll();
	
	//����idɾ�����ﳵ
	public void deleteById(String shopCart_id);
}
