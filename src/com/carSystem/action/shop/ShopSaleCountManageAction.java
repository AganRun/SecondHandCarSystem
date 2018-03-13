package com.carSystem.action.shop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Brand;
import com.carSystem.entity.Login;
import com.carSystem.entity.Order;
import com.carSystem.service.BrandService;
import com.carSystem.service.OrderService;

@Controller
@RequestMapping("/shopSaleCountManage")
public class ShopSaleCountManageAction {

	@Autowired
	private BrandService brandService;
	
	@Autowired
	private OrderService orderService;
	
	//根据品牌统计销量
	@RequestMapping("/brandSaleList")
	public String brandSaleList(Map<String, Object> map, HttpSession session){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		
		List<Brand> brandList = brandService.queryAllBrand();
		List<Order> orderList = orderService.shopSaleOrderByBrand(login.getLogin_id());
		int saleNum[] = new int[brandList.size()];
		int salePrice[] = new int[brandList.size()];
	
		for(int i=0; i<orderList.size(); i++){
			//该订单品牌在品牌列表中的位置
			int temp =0;
			for(int j=0; j<brandList.size(); j++){
				if(brandList.get(j).getBrand_id().equals( orderList.get(i).getCar_brand_id() )){
					temp = j;break;
				}
			}
			saleNum[temp]++;
			salePrice[temp] += orderList.get(i).getCar_price_new();
		}
		
		map.put("saleNum", saleNum);
		map.put("salePrice", salePrice);
		map.put("brandList", brandList);
		return "shop/saleCountManage/countByBrand";
	}
	
	//某个品牌销售详情
	@RequestMapping("/saleOrderByBrand")
	public String saleOrderByBrand(String brand_id,String shop_id, Map<String, Object> map){
		List<Order> orderList = orderService.shopSaleOrderByBrandId(brand_id, shop_id);
		map.put("brand_name", brandService.queryBrandById(brand_id).getBrand_name() );
		map.put("brandOrderList", orderList);
		return "shop/saleCountManage/brandOrderDetails";
	}
	
	
	//商家订单根据时间统计销量（从订单分析）
	@RequestMapping("/saleOrderByTime")
	public String saleOrderTime(Map<String, Object> map, HttpSession session, String year){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		
		int[] monthArray = new int[]{0,1,2,3,4,5,6,7,8,9,10,11,12};
		List<Order> orderTimeList = new ArrayList<Order>();

		if(year == null || year.equals("")){
			year = "2017";
		}
		if( !year.equals("2017")){
			map.put("year", year);
			map.put("month", monthArray);
			return "shop/saleCountManage/countByTime";
		}
		
		orderTimeList = orderService.shopSaleOrderTime(login.getLogin_id());
		int numSumMonth[] = new int[13]; 
		int priceSumMonth[] = new int[13]; 
//		List<ArrayList<Order>> orderMonthList = new ArrayList<ArrayList<Order>>(13);
//		for(int i=0; i<13; i++){
//			ArrayList<Order> list = new ArrayList<Order>(1);
//			orderMonthList.add(list);
//		}
		for(int i=0; i<orderTimeList.size(); i++){
			String month = orderTimeList.get(i).getOrder_time_receive().substring(5, 7);	//订单完成时间的月份
			int monthInt = Integer.parseInt(month);
			numSumMonth[monthInt]++;	//时间加进去
			priceSumMonth[monthInt]+=orderTimeList.get(i).getCar_price_new();	//销量加进去
//			orderMonthList.get(monthInt).add( orderTimeList.get(i) );	//订单列表
		}
		map.put("month", monthArray);
		map.put("year", year);
		map.put("numSum", numSumMonth);
		map.put("priceSum", priceSumMonth);
//		map.put("orderList", orderMonthList);
		return "shop/saleCountManage/countByTime";
	}
	
	
	
	//(商家)月份订单详情
	@RequestMapping("/saleOrderByMonth")
	public String saleOrderByMonth(String month, Map<String, Object> map, String shop_id, String year){
		List<Order> orderList = orderService.shopSaleOrderByMonth(year, month, shop_id);
		map.put("month", month);
		map.put("monthOrderList", orderList);
		return "shop/saleCountManage/monthOrderDetails";
	}
	
	
	
	
	
}
