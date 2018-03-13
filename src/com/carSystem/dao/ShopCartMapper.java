package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.ShopCart;

@Repository
public interface ShopCartMapper {

	
	//获取最大的购物车id
	public String getMAXShopCartId();
	
	//根据用户的id查询全部的购物车信息
	public List<ShopCart> getAllByPersonId(String person_id);
	
	//添加购物车
	public void addShopCart(ShopCart shopCart);
	
	//删除全部购物车
	public void deleteAll();
	
	//根据id删除购物车
	public void deleteById(String shopCart_id);
}
