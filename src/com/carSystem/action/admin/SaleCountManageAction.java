package com.carSystem.action.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Brand;
import com.carSystem.entity.Order;
import com.carSystem.service.BrandService;
import com.carSystem.service.OrderService;

@Controller
@RequestMapping("/saleCountManage")
public class SaleCountManageAction {

	@Autowired
	private BrandService brandService;
	
	@Autowired
	private OrderService orderService;
	
	//根据品牌统计销量
	@RequestMapping("/brandSaleList")
	public String brandSaleList(Map<String, Object> map){
		List<Brand> brandList = brandService.queryAllBrand();
		map.put("brandSaleList", brandList);
		return "admin/saleCountManage/countByBrand";
	}
	
	//根据时间统计
	@RequestMapping("/timeSaleList")
	public String timeSaleList(Map<String, Object> map, String year){
		if(year == null || year.equals("")){
			year = "2017";
		}
		if( !year.equals("2017")){
			map.put("year", year);
			return "admin/saleCountManage/countByTime";
		}
		map.put("saleTimeBrand", brandService.countSaleByTime());
		map.put("year", year);
		return "admin/saleCountManage/countByTime"; 
	}
	
	//根据月份统计的订单
	@RequestMapping("/saleOrderByMonth")
	public String saleOrderByMonth(String month, Map<String, Object> map, String year){
		List<Order> orderList = new ArrayList<Order>();
		if(!year.equals("2017")){
			map.put("month", month);
			map.put("monthOrderList", orderList);
			return "admin/saleCountManage/monthOrderDetails";
		}
		System.out.println("month========>" + month);
		orderList = orderService.saleOrderByMonth(month);
		
		map.put("month", month);
		map.put("monthOrderList", orderList);
		return "admin/saleCountManage/monthOrderDetails";
	}
	
	//根据品牌统计订单
	@RequestMapping("/saleOrderByBrand")
	public String saleOrderByBrand(String brand_id, Map<String, Object> map){
		List<Order> orderList = orderService.saleOrderByBrand(brand_id);
		map.put("brand_name", brandService.queryBrandById(brand_id).getBrand_name() );
		map.put("brandOrderList", orderList);
		return "admin/saleCountManage/brandOrderDetails";
	}
	
	
	
	
	
	
	
	
	
	
}
