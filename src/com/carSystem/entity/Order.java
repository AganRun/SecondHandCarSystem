package com.carSystem.entity;

public class Order {
	
	private String order_id;
	
	private String order_car_id;
	
	private String order_person_id;
	
	private String order_shop_id;
	
	private String order_message;
	
	private String order_addtime;
	
	private String order_address;
	
	private String order_tel;
	
	private String order_person_name;
	
	//支付状态（0未支付，1发货）
	private String order_status_pay;
	
	private String order_time_pay;
	
	//发货状态（0未发货，1发货）
	private String order_status_send;
	
	private String order_time_send;
	
	//收货状态（0未签收，1签收）
	private String order_status_receive;
	
	private String order_time_receive;
	
	//删除状态（0删除，1正常）
	private String order_status_delete;
	
	private String order_time_delete;
	
	private String car_img;
	
	
	//数据库之外自己添加的
	private String car_name;
	
	private int car_price_new;
	
	private String login_id;
	
	private String car_brand_id;

	public Order(String order_id, String order_car_id, String order_person_id, String order_message,
			String order_addtime, String order_address, String order_tel, String order_person_name,
			String order_status_pay, String order_status_send, String order_time_send, String order_status_receive,
			String order_time_receive, String order_status_delete, String order_time_delete) {
		super();
		this.order_id = order_id;
		this.order_car_id = order_car_id;
		this.order_person_id = order_person_id;
		this.order_message = order_message;
		this.order_addtime = order_addtime;
		this.order_address = order_address;
		this.order_tel = order_tel;
		this.order_person_name = order_person_name;
		this.order_status_pay = order_status_pay;
		this.order_status_send = order_status_send;
		this.order_time_send = order_time_send;
		this.order_status_receive = order_status_receive;
		this.order_time_receive = order_time_receive;
		this.order_status_delete = order_status_delete;
		this.order_time_delete = order_time_delete;
	}

	public Order() {
		super();
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOrder_car_id() {
		return order_car_id;
	}

	public void setOrder_car_id(String order_car_id) {
		this.order_car_id = order_car_id;
	}

	public String getOrder_person_id() {
		return order_person_id;
	}

	public void setOrder_person_id(String order_person_id) {
		this.order_person_id = order_person_id;
	}

	public String getOrder_message() {
		return order_message;
	}

	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}

	public String getOrder_addtime() {
		return order_addtime;
	}

	public void setOrder_addtime(String order_addtime) {
		this.order_addtime = order_addtime;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public String getOrder_person_name() {
		return order_person_name;
	}

	public void setOrder_person_name(String order_person_name) {
		this.order_person_name = order_person_name;
	}

	public String getOrder_status_pay() {
		return order_status_pay;
	}

	public void setOrder_status_pay(String order_status_pay) {
		this.order_status_pay = order_status_pay;
	}

	public String getOrder_status_send() {
		return order_status_send;
	}

	public void setOrder_status_send(String order_status_send) {
		this.order_status_send = order_status_send;
	}

	public String getOrder_time_send() {
		return order_time_send;
	}

	public void setOrder_time_send(String order_time_send) {
		this.order_time_send = order_time_send;
	}

	public String getOrder_status_receive() {
		return order_status_receive;
	}

	public void setOrder_status_receive(String order_status_receive) {
		this.order_status_receive = order_status_receive;
	}

	public String getOrder_time_receive() {
		return order_time_receive;
	}

	public void setOrder_time_receive(String order_time_receive) {
		this.order_time_receive = order_time_receive;
	}

	public String getOrder_status_delete() {
		return order_status_delete;
	}

	public void setOrder_status_delete(String order_status_delete) {
		this.order_status_delete = order_status_delete;
	}

	public String getOrder_time_delete() {
		return order_time_delete;
	}

	public void setOrder_time_delete(String order_time_delete) {
		this.order_time_delete = order_time_delete;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}


	public int getCar_price_new() {
		return car_price_new;
	}

	public void setCar_price_new(int car_price_new) {
		this.car_price_new = car_price_new;
	}

	public String getOrder_time_pay() {
		return order_time_pay;
	}

	public void setOrder_time_pay(String order_time_pay) {
		this.order_time_pay = order_time_pay;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getOrder_shop_id() {
		return order_shop_id;
	}

	public void setOrder_shop_id(String order_shop_id) {
		this.order_shop_id = order_shop_id;
	}
	
		
	public String getCar_brand_id() {
		return car_brand_id;
	}

	public void setCar_brand_id(String car_brand_id) {
		this.car_brand_id = car_brand_id;
	}

	public String getCar_img() {
		return car_img;
	}

	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", order_car_id=" + order_car_id + ", order_person_id=" + order_person_id
				+ ", order_message=" + order_message + ", order_addtime=" + order_addtime + ", order_address="
				+ order_address + ", order_tel=" + order_tel + ", order_person_name=" + order_person_name
				+ ", order_status_pay=" + order_status_pay + ", order_status_send=" + order_status_send
				+ ", order_time_send=" + order_time_send + ", order_status_receive=" + order_status_receive
				+ ", order_time_receive=" + order_time_receive + ", order_status_delete=" + order_status_delete
				+ ", order_time_delete=" + order_time_delete + "]";
	}
	
	

}
