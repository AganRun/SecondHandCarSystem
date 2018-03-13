package com.carSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.PriceMapper;
import com.carSystem.entity.Price_classify;

@Service
public class PriceService {

	@Autowired
	private PriceMapper priceMapper;
	
	
	//��ȡ������ȫ���۸�
	public List<Price_classify> getAllPrice(){
		return priceMapper.getAllPrice();
	}
	
	//��Ӽ۸��������
	public void addPrice(int  price_classify_num){
		int maxId;
		if( priceMapper.getMaxId() == null || priceMapper.getMaxId().equals("")){
			maxId = 1000;
		}else{
			maxId = Integer.parseInt(priceMapper.getMaxId());
		}
		maxId++;
		Price_classify price_classify = new Price_classify(Integer.toString(maxId), price_classify_num);
		
		priceMapper.addPrice(price_classify);
	}
	
	//����idɾ��ĳ���۸�����
	public void deletePrice(String price_classufy_id){
		priceMapper.deletePrice(price_classufy_id);
	}
}
