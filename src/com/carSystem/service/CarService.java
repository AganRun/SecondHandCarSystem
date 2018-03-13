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
	
	//查询全部在售车辆
	public List<Car> queryAllOnlineCar(){
		return carMapper.queryAllOnlineCar();
	}
	
	//（商家）查询全部在售车辆（其中装填品牌名称）
	public List<Car> shopQueryAllOnlineCar(String shop_id){
		return carMapper.shopQueryAllOnlineCar(shop_id);
	}
	
	//根据id查询在售车辆
	public List<Car> queryOnlineCarById(String car_id){
		return carMapper.queryOnlineCarById(car_id);
	}
	
	//根据id或name模糊查询在售车辆
	public List<Car> queryOnlineCarByIdOrName(String car_id){
		return carMapper.queryOnlineCarByIdOrName(car_id);
	}
	
	//（商家）根据id查询在售车辆
	public List<Car> shopQueryOnlineCarById(String car_id, String car_shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(car_shop_id);
		return carMapper.shopQueryOnlineCarById(car);
	}

	//（商家）根据id或者name模糊查询在售车辆
	public List<Car> shopQueryOnlineCarByIdOrName(String car_id, String car_shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(car_shop_id);
		return carMapper.shopQueryOnlineCarByIdOrName(car);
	}
	
	/**
	 * 添加车辆
	 * 	其中补 id 上架时间 状态（1）到car，然后添加到mapper中
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
	    
	    //截取字符串，购买不用精确到天
	    car.setCar_time_buy( car.getCar_time_buy().substring(0, 10) );
	    carMapper.addCar(car);
	}
	
	//保存修改后的在线汽车信息
	public void saveCar(Car car){
		car.setCar_time_buy( car.getCar_time_buy().substring(0, 10) );
		carMapper.saveCar(car);
	}
	
	//根据编号将车辆下架
	public void carDownShelf(String car_id, String operaDeleteId){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_sell("0");
		car.setCar_opera_delete_id(operaDeleteId);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		car.setCar_time_delete(sdf.format(new Date()));
		
		carMapper.carDownShelf(car);
	}
	
	//查询全部下架车辆
	public List<Car> queryAllDownShelfCar(){
		return carMapper.queryAllDownShelfCar();
	}
	
	//(商家)查询全部下架车辆
	public List<Car> shopQueryAllDownShelfCar(String car_shop_id){
		return carMapper.shopQueryAllDownShelfCar(car_shop_id);
	}
	
	//根据id查询下架车辆
	public List<Car> queryDownShelfCarById(String car_id){
		return carMapper.queryDownShelfCarById(car_id);
	}
	
	//根据id或name模糊查询下架车辆
	public List<Car> queryDownShelfCarByIdOrName(String car_id){
		return carMapper.queryDownShelfCarByIdOrName(car_id);
	}
	
	//(商家)根据id查询下架车辆
	public List<Car> shopQueryDownShelfCarById(String car_id, String shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(shop_id);
		return carMapper.shopQueryDownShelfCarById(car);
	}
	
	//(商家)根据id或者name模糊查询下架车辆
	public List<Car> shopQueryDownShelfCarByIdOrName(String car_id, String shop_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_shop_id(shop_id);
		return carMapper.shopQueryDownShelfCarByIdOrName(car);
	}
	
	//将车辆上架
	public void carUpShelfById(String car_id){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_sell("1");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		car.setCar_time_shelf(sdf.format(new Date()));
		
		carMapper.carUpShelfById(car);
	}
	
	//根据id彻底删除车辆信息
	public void carDelete(String car_id){
		carMapper.carDelete(car_id);
	}
	
	//改变是否推荐状态
	public void changeRecommandStatus(String car_id, String newStatus){
		Car car = new Car();
		car.setCar_id(car_id);
		car.setCar_status_recommend(newStatus);
		carMapper.changeRecommandStatus(car);
	}
	
	//根据最低价和最高价查询在线车辆
	public List<Car> queryCarByClassifys(ShopQuery shopQuery){
		if(shopQuery.getBrand_id().equals("all")){
			return carMapper.queryOnlineCarByLowAndHighAndTimeShelf(shopQuery);
		}else{
			return carMapper.queryOnlineCarByLowAndHighAndBrandIdAndTimeShelf(shopQuery);
		}
	}
	
	//查询全部管理员推荐车辆（在售）
	public List<Car> queryAllRecommandCar(){
		return carMapper.queryAllRecommandCar();
	}
	
	
}
