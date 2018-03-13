package com.carSystem.entity;

/**
 * 购物车
 * @author admin
 *
 */
public class ShopCart {

	
	private String shopCart_id;
	
	//汽车id
	private String shopCart_car_id;
	
	//用户id
	private String shopCart_person_id;
	
	//添加时间
	private String shopCart_addtime;
	
	private int car_price_new;
	
	private String car_name;
	
	private String car_img;

	public ShopCart(String shopCart_id, String shopCart_car_id, String shopCart_person_id, String shopCart_addtime) {
		super();
		this.shopCart_id = shopCart_id;
		this.shopCart_car_id = shopCart_car_id;
		this.shopCart_person_id = shopCart_person_id;
		this.shopCart_addtime = shopCart_addtime;
	}

	public ShopCart() {
		super();
	}

	public String getShopCart_id() {
		return shopCart_id;
	}

	public void setShopCart_id(String shopCart_id) {
		this.shopCart_id = shopCart_id;
	}

	public String getShopCart_car_id() {
		return shopCart_car_id;
	}

	public void setShopCart_car_id(String shopCart_car_id) {
		this.shopCart_car_id = shopCart_car_id;
	}

	public String getShopCart_person_id() {
		return shopCart_person_id;
	}

	public void setShopCart_person_id(String shopCart_person_id) {
		this.shopCart_person_id = shopCart_person_id;
	}

	public String getShopCart_addtime() {
		return shopCart_addtime;
	}

	public void setShopCart_addtime(String shopCart_addtime) {
		this.shopCart_addtime = shopCart_addtime;
	}

	public int getCar_price_new() {
		return car_price_new;
	}

	public void setCar_price_new(int car_price_new) {
		this.car_price_new = car_price_new;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public String getCar_img() {
		return car_img;
	}

	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}

	@Override
	public String toString() {
		return "ShopCart [shopCart_id=" + shopCart_id + ", shopCart_car_id=" + shopCart_car_id + ", shopCart_person_id="
				+ shopCart_person_id + ", shopCart_addtime=" + shopCart_addtime + "]";
	}
	
	
	
	
	
	
}
