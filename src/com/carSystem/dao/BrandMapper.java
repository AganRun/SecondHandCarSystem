package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Brand;

@Repository
public interface BrandMapper {
	
	//��ȡ����brand_id
	public String getMaxBrandId();
	
	//���brand
	public void addBrand(Brand brand);
	
	//ͨ��id��ѯbrand
	public Brand queryBrandById(String brand_id);
	
	//��ѯȫ��brand
	public List<Brand> queryAllBrand();
	
	//�����޸ĺ��Ʒ����Ϣ
	public void saveBrand(Brand brand);
	
	//���ݱ��ɾ��ĳ��Ʒ��
	public void deleteBrand(String brand_id);
	
	//�޸�Ʒ�Ƶ��Ƿ�ɲ�ѯ״̬
	public void changeStatus(Brand brand);
	
	// ��ѯȫ�����Ա��û�������Ʒ��
	public List<Brand> queryBeQueryBrand();
	
	
	
	
}
