package com.carSystem.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.carSystem.entity.Car;
import com.carSystem.entity.ShopQuery;

@Repository
public interface CarMapper {

	
	//��ѯȫ�����۳���
	public List<Car> queryAllOnlineCar();
	
	//���̼ң���ѯȫ�����۳���������װ��Ʒ�����ƣ�
	public List<Car> shopQueryAllOnlineCar(String shop_id);

	//����id��ѯ���۳���
	public List<Car> queryOnlineCarById(String car_id);
	
	//����id����nameģ����ѯ���۳���
	public List<Car> queryOnlineCarByIdOrName(String car_id);
	
	//���̼ң�����id��ѯ���۳���
	public List<Car> shopQueryOnlineCarById(Car car);
	
	//���̼ң�����id����nameģ����ѯ���۳���
	public List<Car> shopQueryOnlineCarByIdOrName(Car car);
	
	//��ӳ���
	public void addCar(Car car);
	
	
	//��ȡ����id
	public String getMaxCarId();

	//�����޸ĺ������������Ϣ
	public void saveCar(Car car);
	
	//���ݱ�Ž������¼�
	public void carDownShelf(Car car);
	
	//��ѯȫ���¼ܳ���
	public List<Car> queryAllDownShelfCar();
	
	//���̼ң���ѯȫ���¼ܳ���
	public List<Car> shopQueryAllDownShelfCar(String car_shop_id);
	
	//����id��ѯ�¼ܳ���
	public List<Car> queryDownShelfCarById(String car_id);
	
	//����id����nameģ����ѯ�¼ܳ���
	public List<Car> queryDownShelfCarByIdOrName(String car_id);
	
	//(�̼�)����id��ѯ�¼ܳ���
	public List<Car> shopQueryDownShelfCarById(Car car);

	//(�̼�)����id����nameģ����ѯ�¼ܳ���
	public List<Car> shopQueryDownShelfCarByIdOrName(Car car);
	
	//�������ϼ�
	public void carUpShelfById(Car car);
	
	//����id����ɾ��������Ϣ
	public void carDelete(String car_id);
	
	//�ı��Ƿ��Ƽ�״̬
	public void changeRecommandStatus(Car car);
	
	//������ͼۺ���߼۲�ѯ���߳���
	public List<Car> queryOnlineCarByLowAndHighAndTimeShelf(ShopQuery shopQuery);
	
	//������ͼۺ���߼ۺ�Ʒ�Ʋ�ѯ���߳���
	public List<Car> queryOnlineCarByLowAndHighAndBrandIdAndTimeShelf(ShopQuery shopQuery);
	
	//��ѯȫ������Ա�Ƽ����������ۣ�
	public List<Car> queryAllRecommandCar();


}
