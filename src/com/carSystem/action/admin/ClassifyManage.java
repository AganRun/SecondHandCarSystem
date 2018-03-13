package com.carSystem.action.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.service.BrandService;

@Controller
@RequestMapping("/adminClassifyManage")
public class ClassifyManage {

	@Autowired
	private BrandService brandService;
	
	
	//查询全部的品牌状态
	@RequestMapping("/queryAllBrand")
	public String queryAllBrand(Map<String, Object> map){
		map.put("BrandList", brandService.queryAllBrand());
		return "admin/classifyManage/classify_brand";
	}
	
	//修改品牌的是否可查询状态
	@RequestMapping("/changeStatus")
	public String changeStatus(String brand_id, String brand_be_query){
		brandService.changeStatus(brand_id,brand_be_query);
		return "redirect:/adminClassifyManage/queryAllBrand";
	}
}
