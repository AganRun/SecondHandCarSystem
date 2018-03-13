package com.carSystem.action.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.service.PriceService;

@Controller
@RequestMapping("/adminClassifyManage")
public class PriceManageAction {

	@Autowired
	private PriceService priceService;
	
	
	//获取全部的分类价格（排序好的）
	@RequestMapping("/getAllPrice")
	public String getAllPrice(Map<String, Object> map){
		map.put("PriceClassifyList", priceService.getAllPrice());
		return "admin/classifyManage/classify_price";
	}
	
	//添加价格分类区间
	@RequestMapping("/addPrice")
	public String addPrice(int price_classify_num){
		System.out.println("===========");
		priceService.addPrice(price_classify_num);
		return "redirect:/adminClassifyManage/getAllPrice";
	}
	
	//根据id删除某个价格区间
	@RequestMapping("/deletePrice")
	public String deletePrice(String price_classify_id){
		priceService.deletePrice(price_classify_id);
		return "redirect:/adminClassifyManage/getAllPrice";
	}
}
