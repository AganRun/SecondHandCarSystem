package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Brand;

@Repository
public interface BrandMapper {
	
	//获取最大的brand_id
	public String getMaxBrandId();
	
	//添加brand
	public void addBrand(Brand brand);
	
	//通过id查询brand
	public Brand queryBrandById(String brand_id);
	
	//查询全部brand
	public List<Brand> queryAllBrand();
	
	//保存修改后的品牌信息
	public void saveBrand(Brand brand);
	
	//根据编号删除某个品牌
	public void deleteBrand(String brand_id);
	
	//修改品牌的是否可查询状态
	public void changeStatus(Brand brand);
	
	// 查询全部可以被用户搜索的品牌
	public List<Brand> queryBeQueryBrand();
	
	
	
	
}
