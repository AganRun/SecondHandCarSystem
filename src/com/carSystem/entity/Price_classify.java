package com.carSystem.entity;

/**
 * 用户价格分类
 * @author admin
 *
 */
public class Price_classify {

	
	private String price_classify_id;
	
	private int price_classify_num;

	public Price_classify(String price_classify_id, int price_classify_num) {
		super();
		this.price_classify_id = price_classify_id;
		this.price_classify_num = price_classify_num;
	}

	public Price_classify() {
		super();
	}

	public String getPrice_classify_id() {
		return price_classify_id;
	}

	public void setPrice_classify_id(String price_classify_id) {
		this.price_classify_id = price_classify_id;
	}

	public int getPrice_classify_num() {
		return price_classify_num;
	}

	public void setPrice_classify_num(int price_classify_num) {
		this.price_classify_num = price_classify_num;
	}

	@Override
	public String toString() {
		return "price_classify [price_classify_id=" + price_classify_id + ", price_classify_num=" + price_classify_num
				+ "]";
	}
	
	
	
}
