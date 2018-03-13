package com.carSystem.action.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Car;
import com.carSystem.entity.Page;
import com.carSystem.entity.ShopCart;
import com.carSystem.entity.ShopQuery;
import com.carSystem.service.BrandService;
import com.carSystem.service.CarService;
import com.carSystem.service.PageService;
import com.carSystem.service.PriceService;
import com.carSystem.service.ShopCartService;

@Controller
@RequestMapping("/userShop")
public class ShopAction {

	@Autowired
	private CarService carService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private PriceService priceService;
	
	@Autowired
	private ShopCartService shopCartService;
	
	@Autowired
	private PageService pageService;
	
	//导航栏的搜索框
	@RequestMapping("/navQueryIdOrName")
	public String navQueryIdOrName(Map<String, Object> map, String car_name){
		List<Car> onlineCarList = carService.queryOnlineCarByIdOrName(car_name);
		map.put("onlineCarList", onlineCarList);
		map.put("brandList", brandService.queryBeQueryBrand());
		map.put("priceList",priceService.getAllPrice());
		map.put("recommandList", carService.queryAllRecommandCar());
		return "user/shop/shopIndex";
	}
	
	//初始化商店界面
	@RequestMapping("/shopInit")
	public String shopInit(Map<String, Object> map, String currentpage){
		List<Car> onlineCarList = carService.queryAllOnlineCar();
		
		Page page = pageService.pageToCar(onlineCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > onlineCarList.size() ? onlineCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		onlineCarList = onlineCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("onlineCarList", onlineCarList);
		map.put("brandList", brandService.queryBeQueryBrand());
		map.put("priceList",priceService.getAllPrice());
		map.put("recommandList", carService.queryAllRecommandCar());
		
		return "user/shop/shopIndex";
	}
	
	//多添加查询商品
	@RequestMapping("/queryCarByClassifys")
	public String queryCarByClassifys(String brand_id, String price_low, String price_high, String time_start, String time_end, Map<String, Object> map){
		if(time_start == null || time_start.equals("不限制"))	time_start = "1000-01-01 00:00:01";
		if(time_end == null || time_end.equals("不限制"))	time_end = "5000-01-01 00:00:01";
		
		ShopQuery shopQuery = new ShopQuery(Integer.parseInt(price_low), Integer.parseInt(price_high), brand_id, time_start, time_end);
		List<Car> onlineCarList = carService.queryCarByClassifys(shopQuery);
		
		map.put("onlineCarList", onlineCarList);
		map.put("brandList", brandService.queryBeQueryBrand());
		map.put("priceList",priceService.getAllPrice());
		map.put("recommandList", carService.queryAllRecommandCar());
		
		if(!brand_id.equals("all")){
			String name = brandService.queryBrandById(brand_id).getBrand_name();
			map.put("queryBrand_name", name);
			map.put("queryBrand_id", brand_id);
		}
		if( !price_low.equals("-100000")){
			map.put("queryPrice_low", price_low);
		}
		if( !price_high.equals("1000000000")){
			map.put("queryPrice_high", price_high);
		}
		if( ! time_start.equals("1000-01-01 00:00:01")){
			map.put("queryTimeStart", time_start);
		}
		if( ! time_end.equals("5000-01-01 00:00:01")){
			map.put("queryTimeEnd", time_end);
		}
		
		return "user/shop/shopIndex";
	}
	
	//添加购物车信息
	@RequestMapping("/addShopCart")
	public String addShopCart(ShopCart shopCart, HttpSession session){
		if(session.getAttribute("loginSession") == null){
			return "redirect:/loginInitAction";
		}
		shopCartService.addShopCart(shopCart);
		return "redirect:/userShop/shopInit";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
