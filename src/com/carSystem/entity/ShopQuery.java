package com.carSystem.entity;

public class ShopQuery {

	
	private int lowPrice;
	
	private int highPrice;
	
	private String brand_id;
	
	private String time_start;
	
	private String time_end;


	public ShopQuery(int lowPrice, int highPrice, String brand_id, String time_start, String time_end) {
		super();
		this.lowPrice = lowPrice;
		this.highPrice = highPrice;
		this.brand_id = brand_id;
		this.time_start = time_start;
		this.time_end = time_end;
	}

	public ShopQuery() {
		super();
	}

	public int getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}

	public int gethighPrice() {
		return highPrice;
	}

	public void sethighPrice(int highPrice) {
		this.highPrice = highPrice;
	}

	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}

	public String getTime_start() {
		return time_start;
	}

	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}

	public String getTime_end() {
		return time_end;
	}

	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}

	@Override
	public String toString() {
		return "ShopQuery [lowPrice=" + lowPrice + ", highPrice=" + highPrice + ", brand_id=" + brand_id + "]";
	}
	
}
