package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Car;
import com.carSystem.entity.ShopQuery;

@Repository
public interface CarMapper {

	
	//查询全部在售车辆
	public List<Car> queryAllOnlineCar();
	
	//（商家）查询全部在售车辆（其中装填品牌名称）
	public List<Car> shopQueryAllOnlineCar(String shop_id);

	//根据id查询在售车辆
	public List<Car> queryOnlineCarById(String car_id);
	
	//根据id或者name模糊查询在售车辆
	public List<Car> queryOnlineCarByIdOrName(String car_id);
	
	//（商家）根据id查询在售车辆
	public List<Car> shopQueryOnlineCarById(Car car);
	
	//（商家）根据id或者name模糊查询在售车辆
	public List<Car> shopQueryOnlineCarByIdOrName(Car car);
	
	//添加车辆
	public void addCar(Car car);
	
	
	//获取最大的id
	public String getMaxCarId();

	//保存修改后的在线汽车信息
	public void saveCar(Car car);
	
	//根据编号将车辆下架
	public void carDownShelf(Car car);
	
	//查询全部下架车辆
	public List<Car> queryAllDownShelfCar();
	
	//（商家）查询全部下架车辆
	public List<Car> shopQueryAllDownShelfCar(String car_shop_id);
	
	//根据id查询下架车辆
	public List<Car> queryDownShelfCarById(String car_id);
	
	//根据id或者name模糊查询下架车辆
	public List<Car> queryDownShelfCarByIdOrName(String car_id);
	
	//(商家)根据id查询下架车辆
	public List<Car> shopQueryDownShelfCarById(Car car);

	//(商家)根据id或者name模糊查询下架车辆
	public List<Car> shopQueryDownShelfCarByIdOrName(Car car);
	
	//将车辆上架
	public void carUpShelfById(Car car);
	
	//根据id彻底删除车辆信息
	public void carDelete(String car_id);
	
	//改变是否推荐状态
	public void changeRecommandStatus(Car car);
	
	//根据最低价和最高价查询在线车辆
	public List<Car> queryOnlineCarByLowAndHighAndTimeShelf(ShopQuery shopQuery);
	
	//根据最低价和最高价和品牌查询在线车辆
	public List<Car> queryOnlineCarByLowAndHighAndBrandIdAndTimeShelf(ShopQuery shopQuery);
	
	//查询全部管理员推荐车辆（在售）
	public List<Car> queryAllRecommandCar();


}
