package com.carSystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.BrandMapper;
import com.carSystem.entity.Brand;

@Service
public class BrandService {

	
	@Autowired
	private BrandMapper brandMapper;
	
	
	//���brand
	public void addBrand(Brand brand){
		int maxBrandId;
		if(brandMapper.getMaxBrandId().equals("") || brandMapper.getMaxBrandId() == null){
			maxBrandId = 1000;
		}else{
			maxBrandId = Integer.parseInt( brandMapper.getMaxBrandId() );
		}
		maxBrandId++;
		brand.setBrand_id(Integer.toString(maxBrandId));
		
		brandMapper.addBrand(brand);
	}
	
	//ͨ��id��ѯbrand
	public Brand queryBrandById(String brand_id){
		return brandMapper.queryBrandById(brand_id);
	}
	
	//��ѯȫ��brand
	public List<Brand> queryAllBrand(){
		return brandMapper.queryAllBrand();
	}
	
	//�����޸ĺ��Ʒ����Ϣ
	public void saveBrand(Brand brand){
		brandMapper.saveBrand(brand);
	}
	
	//���ݱ��ɾ��ĳ��Ʒ��
	public void deleteBrand(String brand_id){
		brandMapper.deleteBrand(brand_id);
	}
	
	//�޸�Ʒ�Ƶ��Ƿ�ɲ�ѯ״̬
	public void changeStatus(String brand_id, String brand_be_query){
		Brand brand = new Brand();
		brand.setBrand_be_query(brand_be_query);
		brand.setBrand_id(brand_id);
		brandMapper.changeStatus(brand);
	}
	
	// ��ѯȫ�����Ա��û�������Ʒ��
	public List<Brand> queryBeQueryBrand(){
		return brandMapper.queryBeQueryBrand();
	}
	
	//�ջ���Ʒ������+1
	public void addBrandSaleNum(Brand brand, int car_price_new){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String dateNowStr = sdf.format(new Date());  
	    String monthString = dateNowStr.substring(5, 7);
	    brand.addSaleNum(Integer.parseInt(monthString));
	    brand.addSalePrice(Integer.parseInt(monthString), car_price_new);
	    brandMapper.saveBrand(brand);
	}
	
	//�����·ݽ�������ͳ�ƣ��ֶ����·ݶ�Ӧ�ļ�Ǯ������
	public Brand countSaleByTime(){
		List<Brand> brandList = brandMapper.queryAllBrand();
		//���·ݶ�Ӧ�����ۺʹ���targetBrand
		Brand targetBrand = new Brand();
		for(int i=0; i<brandList.size(); i++){
			targetBrand.setBrand_saleNum_month1( targetBrand.getBrand_saleNum_month1() + brandList.get(i).getBrand_saleNum_month1() );
			targetBrand.setBrand_saleNum_month2( targetBrand.getBrand_saleNum_month2() + brandList.get(i).getBrand_saleNum_month2() );
			targetBrand.setBrand_saleNum_month3( targetBrand.getBrand_saleNum_month3() + brandList.get(i).getBrand_saleNum_month3() );
			targetBrand.setBrand_saleNum_month4( targetBrand.getBrand_saleNum_month4() + brandList.get(i).getBrand_saleNum_month4() );
			targetBrand.setBrand_saleNum_month5( targetBrand.getBrand_saleNum_month5() + brandList.get(i).getBrand_saleNum_month5() );
			targetBrand.setBrand_saleNum_month6( targetBrand.getBrand_saleNum_month6() + brandList.get(i).getBrand_saleNum_month6() );
			targetBrand.setBrand_saleNum_month7( targetBrand.getBrand_saleNum_month7() + brandList.get(i).getBrand_saleNum_month7() );
			targetBrand.setBrand_saleNum_month8( targetBrand.getBrand_saleNum_month8() + brandList.get(i).getBrand_saleNum_month8() );
			targetBrand.setBrand_saleNum_month9( targetBrand.getBrand_saleNum_month9() + brandList.get(i).getBrand_saleNum_month9() );
			targetBrand.setBrand_saleNum_month10( targetBrand.getBrand_saleNum_month10() + brandList.get(i).getBrand_saleNum_month10() );
			targetBrand.setBrand_saleNum_month11( targetBrand.getBrand_saleNum_month11() + brandList.get(i).getBrand_saleNum_month11() );
			targetBrand.setBrand_saleNum_month12( targetBrand.getBrand_saleNum_month12() + brandList.get(i).getBrand_saleNum_month12() );
		
			targetBrand.setBrand_salePrice_month1(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month1()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month1() )   ));
			targetBrand.setBrand_salePrice_month2(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month2()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month2() )   ));
			targetBrand.setBrand_salePrice_month3(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month3()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month3() )   ));
			targetBrand.setBrand_salePrice_month4(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month4()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month4() )   ));
			targetBrand.setBrand_salePrice_month5(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month5()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month5() )   ));
			targetBrand.setBrand_salePrice_month6(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month6()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month6() )   ));
			targetBrand.setBrand_salePrice_month7(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month7()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month7() )   ));
			targetBrand.setBrand_salePrice_month8(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month8()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month8() )   ));
			targetBrand.setBrand_salePrice_month9(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month9()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month9() )   ));
			targetBrand.setBrand_salePrice_month10(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month10()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month10() )   ));
			targetBrand.setBrand_salePrice_month11(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month11()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month11() )   ));
			targetBrand.setBrand_salePrice_month12(Integer.toString( Integer.parseInt(targetBrand.getBrand_salePrice_month12()) + Integer.parseInt(brandList.get(i).getBrand_salePrice_month12() )   ));
		}
		return targetBrand;
	}
	
}
