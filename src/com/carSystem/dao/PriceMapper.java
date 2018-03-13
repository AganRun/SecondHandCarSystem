package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Price_classify;

@Repository
public interface PriceMapper {

	//获取最大的id
	public String getMaxId();
	
	//获取排序后的全部价格
	public List<Price_classify> getAllPrice();
	
	//添加价格分类区间
	public void addPrice(Price_classify price_classify);
	
	//根据id删除某个价格区间
	public void deletePrice(String price_classufy_id);
}
