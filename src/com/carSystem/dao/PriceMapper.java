package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Price_classify;

@Repository
public interface PriceMapper {

	//��ȡ����id
	public String getMaxId();
	
	//��ȡ������ȫ���۸�
	public List<Price_classify> getAllPrice();
	
	//��Ӽ۸��������
	public void addPrice(Price_classify price_classify);
	
	//����idɾ��ĳ���۸�����
	public void deletePrice(String price_classufy_id);
}
