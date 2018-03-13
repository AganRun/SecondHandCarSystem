package com.carSystem.entity;

public class Car {

	
	private String car_id;
	
	private String car_img;
	
	private String car_name;
	
	private String car_brand_id;
	
	private String brand_name;
	
	private String car_shop_id;
	
	//原价
	private int car_price_old;
	
	//现价
	private int car_price_new;
	
	//初次购买时间
	private String car_time_buy;
	
	//上架时间
	private String car_time_shelf;
	
	private String car_opera_id;
	
	//销售状态（0 删除1 在线 2已售 ）
	private String car_status_sell;
	
	private String car_time_delete;
	
	private String car_opera_delete_id;
	
	//状态（0普通状态 1管理员推荐车）
	private String car_status_recommend;

	public Car(String car_id, String car_name, String brand_id, int car_price_old, int car_price_new,
			String car_time_buy, String car_time_shelf, String car_opera_id, String car_status_sell,
			String car_time_delete, String car_opera_delete_id, String car_status_recommend) {
		super();
		this.car_id = car_id;
		this.car_name = car_name;
		this.car_brand_id = brand_id;
		this.car_price_old = car_price_old;
		this.car_price_new = car_price_new;
		this.car_time_buy = car_time_buy;
		this.car_time_shelf = car_time_shelf;
		this.car_opera_id = car_opera_id;
		this.car_status_sell = car_status_sell;
		this.car_time_delete = car_time_delete;
		this.car_opera_delete_id = car_opera_delete_id;
		this.car_status_recommend = car_status_recommend;
	}

	public Car() {
		super();
	}

	public String getCar_id() {
		return car_id;
	}

	public String getCar_img() {
		return car_img;
	}

	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}


	public int getCar_price_old() {
		return car_price_old;
	}

	public void setCar_price_old(int car_price_old) {
		this.car_price_old = car_price_old;
	}

	public int getCar_price_new() {
		return car_price_new;
	}

	public void setCar_price_new(int car_price_new) {
		this.car_price_new = car_price_new;
	}

	public String getCar_time_buy() {
		return car_time_buy;
	}

	public void setCar_time_buy(String car_time_buy) {
		this.car_time_buy = car_time_buy;
	}

	public String getCar_time_shelf() {
		return car_time_shelf;
	}

	public void setCar_time_shelf(String car_time_shelf) {
		this.car_time_shelf = car_time_shelf;
	}

	public String getCar_opera_id() {
		return car_opera_id;
	}

	public void setCar_opera_id(String car_opera_id) {
		this.car_opera_id = car_opera_id;
	}

	public String getCar_status_sell() {
		return car_status_sell;
	}

	public void setCar_status_sell(String car_status_sell) {
		this.car_status_sell = car_status_sell;
	}

	public String getCar_time_delete() {
		return car_time_delete;
	}

	public void setCar_time_delete(String car_time_delete) {
		this.car_time_delete = car_time_delete;
	}

	public String getCar_opera_delete_id() {
		return car_opera_delete_id;
	}

	public void setCar_opera_delete_id(String car_opera_delete_id) {
		this.car_opera_delete_id = car_opera_delete_id;
	}

	public String getCar_status_recommend() {
		return car_status_recommend;
	}

	public void setCar_status_recommend(String car_status_recommend) {
		this.car_status_recommend = car_status_recommend;
	}
	

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	

	public String getCar_brand_id() {
		return car_brand_id;
	}

	public void setCar_brand_id(String car_brand_id) {
		this.car_brand_id = car_brand_id;
	}
	

	public String getCar_shop_id() {
		return car_shop_id;
	}

	public void setCar_shop_id(String car_shop_id) {
		this.car_shop_id = car_shop_id;
	}

	@Override
	public String toString() {
		return "Car [car_id=" + car_id + ", car_name=" + car_name + ", car_brand_id=" + car_brand_id + ", car_price_old="
				+ car_price_old + ", car_price_new=" + car_price_new + ", car_time_buy=" + car_time_buy
				+ ", car_time_shelf=" + car_time_shelf + ", car_opera_id=" + car_opera_id + ", car_status_sell="
				+ car_status_sell + ", car_time_delete=" + car_time_delete + ", car_opera_delete_id="
				+ car_opera_delete_id + ", car_status_recommend=" + car_status_recommend + "]";
	}
	
	
	

}
