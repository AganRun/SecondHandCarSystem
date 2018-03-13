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
	
	
	//���brand
	@RequestMapping("/addBrand")
	public String addBrand(Brand brand, Map<String, Object> map){
		brandService.addBrand(brand);
		return "redirect:/admin/brandListInit";
	}
	
	//Ʒ���б��ʼ��
	@RequestMapping("brandListInit")
	public String brandListInit(Map<String, Object> map){
		List<Brand> list = brandService.queryAllBrand();
		map.put("brandList", list);
		return "admin/brandManage/brand_list";
	}
	
	//Ʒ������鿴
	@RequestMapping("brandDetails")
	public String brandDetails(Map<String, Object> map, String brand_id){
		Brand brand = brandService.queryBrandById(brand_id);
		map.put("brandDetails", brand);
		return "admin/brandManage/brand_details";
	}
	
	//Ʒ����Ϣ�޸ĳ�ʼ��ҳ��
	@RequestMapping("/brandUpdateInit")
	public String brandUpdateInit(Map<String, Object> map, String brand_id){
		Brand brand = brandService.queryBrandById(brand_id);
		map.put("brandUpdate", brand);
		return "admin/brandManage/brand_update";
	}
	
	//�����޸ĺ��Ʒ����Ϣ
	@RequestMapping("/saveBrand")
	public String saveBrand(Brand brand){
		brandService.saveBrand(brand);
		return "redirect:/admin/brandListInit";
	}
	
	//���ݱ��ɾ��ĳ��Ʒ��
	@RequestMapping("/deleteBrand")
	public String deleteBrand(String brand_id){
		brandService.deleteBrand(brand_id);
		return "redirect:/admin/brandListInit";
	}
	
	
}
