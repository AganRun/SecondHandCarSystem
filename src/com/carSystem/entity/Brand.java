package com.carSystem.entity;

/**
 *	商标实体对象
 *
 *	addSaleNum() 根据传进来的月份，将对应的month销量+1
 *	addSalePrice()	 根据传进来的月份，将对应的month销量Price+1
 *	saleSum()  品牌销量总和
 *	salePriceSum() 品牌销量价格总和
 */
public class Brand {
	
	private String brand_id;
	
	private String brand_name;
	
	private String brand_be_query;
	
	private int brand_saleNum_month1;
	
	private int brand_saleNum_month2;
	
	private int brand_saleNum_month3;
	
	private int brand_saleNum_month4;
	
	private int brand_saleNum_month5;
	
	private int brand_saleNum_month6;
	
	private int brand_saleNum_month7;
	
	private int brand_saleNum_month8;
	
	private int brand_saleNum_month9;
	
	private int brand_saleNum_month10;
	
	private int brand_saleNum_month11;
	
	private int brand_saleNum_month12;
	
	private String brand_salePrice_month1 = "0";
	
	private String brand_salePrice_month2 = "0";
	
	private String brand_salePrice_month3 = "0";
	
	private String brand_salePrice_month4 = "0";
	
	private String brand_salePrice_month5 = "0";
	
	private String brand_salePrice_month6 = "0";
	
	private String brand_salePrice_month7 = "0";
	
	private String brand_salePrice_month8 = "0";
	
	private String brand_salePrice_month9 = "0";
	
	private String brand_salePrice_month10 = "0";
	
	private String brand_salePrice_month11 = "0";
	
	private String brand_salePrice_month12 = "0";
	
	//月份
	private int monthNum;
	

	public Brand(String brand_id, String brand_name, String brand_be_query, int brand_saleNum_month1,
			int brand_saleNum_month2, int brand_saleNum_month3, int brand_saleNum_month4, int brand_saleNum_month5,
			int brand_saleNum_month6, int brand_saleNum_month7, int brand_saleNum_month8, int brand_saleNum_month9,
			int brand_saleNum_month10, int brand_saleNum_month11, int brand_saleNum_month12) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_be_query = brand_be_query;
		this.brand_saleNum_month1 = brand_saleNum_month1;
		this.brand_saleNum_month2 = brand_saleNum_month2;
		this.brand_saleNum_month3 = brand_saleNum_month3;
		this.brand_saleNum_month4 = brand_saleNum_month4;
		this.brand_saleNum_month5 = brand_saleNum_month5;
		this.brand_saleNum_month6 = brand_saleNum_month6;
		this.brand_saleNum_month7 = brand_saleNum_month7;
		this.brand_saleNum_month8 = brand_saleNum_month8;
		this.brand_saleNum_month9 = brand_saleNum_month9;
		this.brand_saleNum_month10 = brand_saleNum_month10;
		this.brand_saleNum_month11 = brand_saleNum_month11;
		this.brand_saleNum_month12 = brand_saleNum_month12;
	}

	public Brand(String brand_id, String brand_name, String brand_be_query) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_be_query = brand_be_query;
	}

	public Brand() {
		super();
	}
	
	//根据传进来的月份品牌对应的月份销量增加
	public void addSaleNum(int month){
		if(month == 1){
			brand_saleNum_month1++;
		}else if(month == 2){
			brand_saleNum_month2++;
		}else if(month == 3){
			brand_saleNum_month3++;
		}else if(month == 4){
			brand_saleNum_month4++;
		}else if(month == 5){
			brand_saleNum_month5++;
		}else if(month == 6){
			brand_saleNum_month6++;
		}else if(month == 7){
			brand_saleNum_month7++;
		}else if(month == 8){
			brand_saleNum_month8++;
		}else if(month == 9){
			brand_saleNum_month9++;
		}else if(month == 10){
			brand_saleNum_month10++;
		}else if(month == 11){
			brand_saleNum_month11++;
		}else if(month == 12){
			brand_saleNum_month12++;
		}
	}
	
	//根据传进来的月份品牌对应的月份销量价钱增加
	public void addSalePrice(int month, int price){
		if(month == 1){
			int price1 = Integer.parseInt(brand_salePrice_month1);
			price1 += price;
			brand_salePrice_month1 = Integer.toString(price1);
		}else if(month == 2){
			int price2 = Integer.parseInt(brand_salePrice_month2);
			price2 += price;
			brand_salePrice_month2 = Integer.toString(price2);
		}else if(month == 3){
			int price3 = Integer.parseInt(brand_salePrice_month1);
			price3 += price;
			brand_salePrice_month3 = Integer.toString(price3);
		}else if(month == 4){
			int price4 = Integer.parseInt(brand_salePrice_month4);
			price4 += price;
			brand_salePrice_month4 = Integer.toString(price4);
		}else if(month == 5){
			int price5 = Integer.parseInt(brand_salePrice_month5);
			price5 += price;
			brand_salePrice_month5 = Integer.toString(price5);
		}else if(month == 6){
			int price6 = Integer.parseInt(brand_salePrice_month6);
			price6 += price;
			brand_salePrice_month6 = Integer.toString(price6);
		}else if(month == 7){
			int price7 = Integer.parseInt(brand_salePrice_month7);
			price7 += price;
			brand_salePrice_month7 = Integer.toString(price7);
		}else if(month == 8){
			int price8 = Integer.parseInt(brand_salePrice_month8);
			price8 += price;
			brand_salePrice_month8 = Integer.toString(price8);
		}else if(month == 9){
			int price9 = Integer.parseInt(brand_salePrice_month9);
			price9 += price;
			brand_salePrice_month9 = Integer.toString(price9);
		}else if(month == 10){
			int price10 = Integer.parseInt(brand_salePrice_month10);
			price10 += price;
			brand_salePrice_month10 = Integer.toString(price10);
		}else if(month == 11){
			int price11 = Integer.parseInt(brand_salePrice_month11);
			price11 += price;
			brand_salePrice_month11 = Integer.toString(price11);
		}else if(month == 12){
			int price12 = Integer.parseInt(brand_salePrice_month12);
			price12 += price;
			brand_salePrice_month12 = Integer.toString(price12);
		}
	}
	
	//品牌销量总和
	public int saleSum(){
		int sum = brand_saleNum_month1 + brand_saleNum_month2 + brand_saleNum_month3 + brand_saleNum_month4 + brand_saleNum_month5 + brand_saleNum_month6 + brand_saleNum_month7 + brand_saleNum_month8 + brand_saleNum_month9 + brand_saleNum_month10 + brand_saleNum_month11 + brand_saleNum_month12 ;
		return sum;
	}
	
	//品牌销量价钱总和
	public int salePriceSum(){
		int sum = Integer.parseInt(brand_salePrice_month1) + Integer.parseInt(brand_salePrice_month2) +  Integer.parseInt(brand_salePrice_month3) +  Integer.parseInt(brand_salePrice_month4) +  Integer.parseInt(brand_salePrice_month5) +  Integer.parseInt(brand_salePrice_month6) +  Integer.parseInt(brand_salePrice_month7) +  Integer.parseInt(brand_salePrice_month8) +  Integer.parseInt(brand_salePrice_month9) +  Integer.parseInt(brand_salePrice_month10) +  Integer.parseInt(brand_salePrice_month11) +  Integer.parseInt(brand_salePrice_month12) ;
		return sum;
	}
	
	
	
	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getBrand_be_query() {
		return brand_be_query;
	}

	public void setBrand_be_query(String brand_be_query) {
		this.brand_be_query = brand_be_query;
	}

	public int getBrand_saleNum_month1() {
		return brand_saleNum_month1;
	}

	public void setBrand_saleNum_month1(int brand_saleNum_month1) {
		this.brand_saleNum_month1 = brand_saleNum_month1;
	}

	public int getBrand_saleNum_month2() {
		return brand_saleNum_month2;
	}

	public void setBrand_saleNum_month2(int brand_saleNum_month2) {
		this.brand_saleNum_month2 = brand_saleNum_month2;
	}

	public int getBrand_saleNum_month3() {
		return brand_saleNum_month3;
	}

	public void setBrand_saleNum_month3(int brand_saleNum_month3) {
		this.brand_saleNum_month3 = brand_saleNum_month3;
	}

	public int getBrand_saleNum_month4() {
		return brand_saleNum_month4;
	}

	public void setBrand_saleNum_month4(int brand_saleNum_month4) {
		this.brand_saleNum_month4 = brand_saleNum_month4;
	}

	public int getBrand_saleNum_month5() {
		return brand_saleNum_month5;
	}

	public void setBrand_saleNum_month5(int brand_saleNum_month5) {
		this.brand_saleNum_month5 = brand_saleNum_month5;
	}

	public int getBrand_saleNum_month6() {
		return brand_saleNum_month6;
	}

	public void setBrand_saleNum_month6(int brand_saleNum_month6) {
		this.brand_saleNum_month6 = brand_saleNum_month6;
	}

	public int getBrand_saleNum_month7() {
		return brand_saleNum_month7;
	}

	public void setBrand_saleNum_month7(int brand_saleNum_month7) {
		this.brand_saleNum_month7 = brand_saleNum_month7;
	}

	public int getBrand_saleNum_month8() {
		return brand_saleNum_month8;
	}

	public void setBrand_saleNum_month8(int brand_saleNum_month8) {
		this.brand_saleNum_month8 = brand_saleNum_month8;
	}

	public int getBrand_saleNum_month9() {
		return brand_saleNum_month9;
	}

	public void setBrand_saleNum_month9(int brand_saleNum_month9) {
		this.brand_saleNum_month9 = brand_saleNum_month9;
	}

	public int getBrand_saleNum_month10() {
		return brand_saleNum_month10;
	}

	public void setBrand_saleNum_month10(int brand_saleNum_month10) {
		this.brand_saleNum_month10 = brand_saleNum_month10;
	}

	public int getBrand_saleNum_month11() {
		return brand_saleNum_month11;
	}

	public void setBrand_saleNum_month11(int brand_saleNum_month11) {
		this.brand_saleNum_month11 = brand_saleNum_month11;
	}

	public int getBrand_saleNum_month12() {
		return brand_saleNum_month12;
	}

	public void setBrand_saleNum_month12(int brand_saleNum_month12) {
		this.brand_saleNum_month12 = brand_saleNum_month12;
	}
	
	

	public int getMonthNum() {
		return monthNum;
	}

	public void setMonthNum(int monthNum) {
		this.monthNum = monthNum;
	}
	
	

	public String getBrand_salePrice_month1() {
		return brand_salePrice_month1;
	}

	public void setBrand_salePrice_month1(String brand_salePrice_month1) {
		this.brand_salePrice_month1 = brand_salePrice_month1;
	}

	public String getBrand_salePrice_month2() {
		return brand_salePrice_month2;
	}

	public void setBrand_salePrice_month2(String brand_salePrice_month2) {
		this.brand_salePrice_month2 = brand_salePrice_month2;
	}

	public String getBrand_salePrice_month3() {
		return brand_salePrice_month3;
	}

	public void setBrand_salePrice_month3(String brand_salePrice_month3) {
		this.brand_salePrice_month3 = brand_salePrice_month3;
	}

	public String getBrand_salePrice_month4() {
		return brand_salePrice_month4;
	}

	public void setBrand_salePrice_month4(String brand_salePrice_month4) {
		this.brand_salePrice_month4 = brand_salePrice_month4;
	}

	public String getBrand_salePrice_month5() {
		return brand_salePrice_month5;
	}

	public void setBrand_salePrice_month5(String brand_salePrice_month5) {
		this.brand_salePrice_month5 = brand_salePrice_month5;
	}

	public String getBrand_salePrice_month6() {
		return brand_salePrice_month6;
	}

	public void setBrand_salePrice_month6(String brand_salePrice_month6) {
		this.brand_salePrice_month6 = brand_salePrice_month6;
	}

	public String getBrand_salePrice_month7() {
		return brand_salePrice_month7;
	}

	public void setBrand_salePrice_month7(String brand_salePrice_month7) {
		this.brand_salePrice_month7 = brand_salePrice_month7;
	}

	public String getBrand_salePrice_month8() {
		return brand_salePrice_month8;
	}

	public void setBrand_salePrice_month8(String brand_salePrice_month8) {
		this.brand_salePrice_month8 = brand_salePrice_month8;
	}

	public String getBrand_salePrice_month9() {
		return brand_salePrice_month9;
	}

	public void setBrand_salePrice_month9(String brand_salePrice_month9) {
		this.brand_salePrice_month9 = brand_salePrice_month9;
	}

	public String getBrand_salePrice_month10() {
		return brand_salePrice_month10;
	}

	public void setBrand_salePrice_month10(String brand_salePrice_month10) {
		this.brand_salePrice_month10 = brand_salePrice_month10;
	}

	public String getBrand_salePrice_month11() {
		return brand_salePrice_month11;
	}

	public void setBrand_salePrice_month11(String brand_salePrice_month11) {
		this.brand_salePrice_month11 = brand_salePrice_month11;
	}

	public String getBrand_salePrice_month12() {
		return brand_salePrice_month12;
	}

	public void setBrand_salePrice_month12(String brand_salePrice_month12) {
		this.brand_salePrice_month12 = brand_salePrice_month12;
	}

	@Override
	public String toString() {
		return "Brand [brand_id=" + brand_id + ", brand_name=" + brand_name + ", brand_be_query=" + brand_be_query
				+ ", brand_saleNum_month1=" + brand_saleNum_month1 + ", brand_saleNum_month2=" + brand_saleNum_month2
				+ ", brand_saleNum_month3=" + brand_saleNum_month3 + ", brand_saleNum_month4=" + brand_saleNum_month4
				+ ", brand_saleNum_month5=" + brand_saleNum_month5 + ", brand_saleNum_month6=" + brand_saleNum_month6
				+ ", brand_saleNum_month7=" + brand_saleNum_month7 + ", brand_saleNum_month8=" + brand_saleNum_month8
				+ ", brand_saleNum_month9=" + brand_saleNum_month9 + ", brand_saleNum_month10=" + brand_saleNum_month10
				+ ", brand_saleNum_month11=" + brand_saleNum_month11 + ", brand_saleNum_month12="
				+ brand_saleNum_month12 + "]";
	}
	
	
	
	
	
}
