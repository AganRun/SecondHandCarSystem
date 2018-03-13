package com.carSystem.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carSystem.dao.CarMapper;
import com.carSystem.entity.Car;
import com.carSystem.entity.ShopQuery;

@Service
public class CarService {

	@Autowired
	private CarMapper carMapper;
	
	//��ѯȫ�����۳���
	public List<Car> queryAllOnlineCar(){
		return carMapper.queryAllOnlineCar();
	}
	
	//���̼ң���ѯȫ�����۳���������װ��Ʒ�����ƣ�
	public List<Car> shopQueryAllOnlineCar(String shop_id){
		return carMapper.shopQueryAllOnlineCar(shop_id);
	}
	
	//����id��ѯ���۳���
	public List<Car> queryOnlineCarById(String car_id){
		return carMapper.queryOnlineCarById(car_id);
	}
	
	//����id��nameģ����ѯ���۳���
	public List<Car> queryOnlineCarByIdOrName(String car_id){
		return carMapper.queryOnlineCarByIdOrName(car_id);
	}
	
	//���̼ң�����id��ѯ���۳���
	public List<Car> shopQueryOnlineCarById(String car_id, String car_shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(car_shop_id);
		return carMapper.shopQueryOnlineCarById(car);
	}

	//���̼ң�����id����nameģ����ѯ���۳���
	public List<Car> shopQueryOnlineCarByIdOrName(String car_id, String car_shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(car_shop_id);
		return carMapper.shopQueryOnlineCarByIdOrName(car);
	}
	
	/**
	 * ��ӳ���
	 * 	���в� id �ϼ�ʱ�� ״̬��1����car��Ȼ����ӵ�mapper��
	 */
	public void addCar(Car car){
		car.setCar_opera_id(car.getCar_shop_id());
		car.setCar_status_sell("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    car.setCar_time_shelf(sdf.format(new Date()));  
	    
	    int maxId;
	    if( carMapper.getMaxCarId() == null || carMapper.getMaxCarId().equals("")){
	    	maxId = 798001;
	    }else{
	    	maxId = Integer.parseInt(carMapper.getMaxCarId());
	    }
	    maxId++;
	    car.setCar_id(Integer.toString(maxId));
	    
	    //��ȡ�ַ����������þ�ȷ����
	    car.setCar_time_buy( car.getCar_time_buy().substring(0, 10) );
	    carMapper.addCar(car);
	}
	
	//�����޸ĺ������������Ϣ
	public void saveCar(Car car){
		car.setCar_time_buy( car.getCar_time_buy().substring(0, 10) );
		carMapper.saveCar(car);
	}
	
	//���ݱ�Ž������¼�
	public void carDownShelf(String car_id, String operaDeleteId){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_sell("0");
		car.setCar_opera_delete_id(operaDeleteId);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		car.setCar_time_delete(sdf.format(new Date()));
		
		carMapper.carDownShelf(car);
	}
	
	//��ѯȫ���¼ܳ���
	public List<Car> queryAllDownShelfCar(){
		return carMapper.queryAllDownShelfCar();
	}
	
	//(�̼�)��ѯȫ���¼ܳ���
	public List<Car> shopQueryAllDownShelfCar(String car_shop_id){
		return carMapper.shopQueryAllDownShelfCar(car_shop_id);
	}
	
	//����id��ѯ�¼ܳ���
	public List<Car> queryDownShelfCarById(String car_id){
		return carMapper.queryDownShelfCarById(car_id);
	}
	
	//����id��nameģ����ѯ�¼ܳ���
	public List<Car> queryDownShelfCarByIdOrName(String car_id){
		return carMapper.queryDownShelfCarByIdOrName(car_id);
	}
	
	//(�̼�)����id��ѯ�¼ܳ���
	public List<Car> shopQueryDownShelfCarById(String car_id, String shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(shop_id);
		return carMapper.shopQueryDownShelfCarById(car);
	}
	
	//(�̼�)����id����nameģ����ѯ�¼ܳ���
	public List<Car> shopQueryDownShelfCarByIdOrName(String car_id, String shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(shop_id);
		return carMapper.shopQueryDownShelfCarByIdOrName(car);
	}
	
	//�������ϼ�
	public void carUpShelfById(String car_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_sell("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		car.setCar_time_shelf(sdf.format(new Date()));
		
		carMapper.carUpShelfById(car);
	}
	
	//����id����ɾ��������Ϣ
	public void carDelete(String car_id){
		carMapper.carDelete(car_id);
	}
	
	//�ı��Ƿ��Ƽ�״̬
	public void changeRecommandStatus(String car_id, String newStatus){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_recommend(newStatus);
		carMapper.changeRecommandStatus(car);
	}
	
	//������ͼۺ���߼۲�ѯ���߳���
	public List<Car> queryCarByClassifys(ShopQuery shopQuery){
		if(shopQuery.getBrand_id().equals("all")){
			return carMapper.queryOnlineCarByLowAndHighAndTimeShelf(shopQuery);
		}else{
			return carMapper.queryOnlineCarByLowAndHighAndBrandIdAndTimeShelf(shopQuery);
		}
	}
	
	//��ѯȫ������Ա�Ƽ����������ۣ�
	public List<Car> queryAllRecommandCar(){
		return carMapper.queryAllRecommandCar();
	}
	
	
}
