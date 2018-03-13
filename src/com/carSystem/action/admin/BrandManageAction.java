package com.carSystem.action.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Brand;
import com.carSystem.service.BrandService;

@Controller
@RequestMapping("/admin")
public class BrandManageAction {
	
	@Autowired
	private BrandService brandService;
	
	
	//添加brand
	@RequestMapping("/addBrand")
	public String addBrand(Brand brand, Map<String, Object> map){
		brandService.addBrand(brand);
		return "redirect:/admin/brandListInit";
	}
	
	//品牌列表初始化
	@RequestMapping("brandListInit")
	public String brandListInit(Map<String, Object> map){
		List<Brand> list = brandService.queryAllBrand();
		map.put("brandList", list);
		return "admin/brandManage/brand_list";
	}
	
	//品牌详情查看
	@RequestMapping("brandDetails")
	public String brandDetails(Map<String, Object> map, String brand_id){
		Brand brand = brandService.queryBrandById(brand_id);
		map.put("brandDetails", brand);
		return "admin/brandManage/brand_details";
	}
	
	//品牌信息修改初始化页面
	@RequestMapping("/brandUpdateInit")
	public String brandUpdateInit(Map<String, Object> map, String brand_id){
		Brand brand = brandService.queryBrandById(brand_id);
		map.put("brandUpdate", brand);
		return "admin/brandManage/brand_update";
	}
	
	//保存修改后的品牌信息
	@RequestMapping("/saveBrand")
	public String saveBrand(Brand brand){
		brandService.saveBrand(brand);
		return "redirect:/admin/brandListInit";
	}
	
	//根据编号删除某个品牌
	@RequestMapping("/deleteBrand")
	public String deleteBrand(String brand_id){
		brandService.deleteBrand(brand_id);
		return "redirect:/admin/brandListInit";
	}
	
	
}
