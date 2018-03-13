package com.carSystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.ShopCartMapper;
import com.carSystem.entity.ShopCart;

@Service
public class ShopCartService {

	
	@Autowired
	private ShopCartMapper shopCartMapper;
	
	//根据用户的id查询全部的购物车信息
	public List<ShopCart> getAllByPersonId(String person_id){
		return shopCartMapper.getAllByPersonId(person_id);
	}
	
	//添加购物车
	public void addShopCart(ShopCart shopCart){
		
		int maxId;
		if(shopCartMapper.getMAXShopCartId() == null || shopCartMapper.getMAXShopCartId().equals("")){
			maxId = 1000;
		}else{
			maxId = Integer.parseInt(shopCartMapper.getMAXShopCartId());
		}
		maxId++;
		shopCart.setShopCart_id(Integer.toString(maxId));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    shopCart.setShopCart_addtime(sdf.format(new Date()));  
	    
		shopCartMapper.addShopCart(shopCart);
	}
	
	//删除全部购物车
	public void deleteAll(){
		shopCartMapper.deleteAll();
	}
	
	//根据id删除购物车
	public void deleteById(String shopCart_id){
		shopCartMapper.deleteById(shopCart_id);
	}
	
	
	
	
	
}
