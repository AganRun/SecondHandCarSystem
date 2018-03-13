package com.carSystem.action.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carSystem.entity.Car;
import com.carSystem.service.CarService;

@Controller
@RequestMapping("/adminRecommandManage")
public class RecommandManageAction {

	@Autowired
	private CarService carService;
	
	//��ѯȫ�������۳����������ҳ��Ƽ��Ͳ��Ƽ�
	@RequestMapping("/recommandList")
	public String recommandList(Map<String, Object> map){
		List<Car> onlineList = carService.queryAllOnlineCar();
		
		//�Ƽ��Ͳ��Ƽ���list
		List<Car> notList = new ArrayList(10);
		List<Car> yesList = new ArrayList(10);
		for(int i=0; i<onlineList.size(); i++){
			System.out.println("============>" + onlineList.get(i).getCar_status_recommend() + "=========");
			if(onlineList.get(i).getCar_status_recommend().equals("0")){
				Car car = onlineList.get(i);
				notList.add(car);
			}
			if(onlineList.get(i).getCar_status_recommend().equals("1")){
				Car car = onlineList.get(i);
				yesList.add(car);
			}
		}
		
		map.put("yesList", yesList);
		map.put("notList", notList);
		return "admin/recommandManage/carRecommand";
	}
	
	//����id��ѯȫ�������۳����������ҳ��Ƽ��Ͳ��Ƽ�
	@RequestMapping("/queryRecommandCarById")
	public String queryRecommandCarById(Map<String, Object> map, String car_id){
		
		List<Car> onlineList;
		if(car_id==null || car_id.equals("")){
			onlineList = carService.queryAllOnlineCar();
		}else{
			onlineList = carService.queryOnlineCarById(car_id);
		}
		
		//�Ƽ��Ͳ��Ƽ���list
		List<Car> notList = new ArrayList(10);
		List<Car> yesList = new ArrayList(10);
		for(int i=0; i<onlineList.size(); i++){
			if(onlineList.get(i).getCar_status_recommend().equals("0")){
				Car car = onlineList.get(i);
				notList.add(car);
			}
			if(onlineList.get(i).getCar_status_recommend().equals("1")){
				Car car = onlineList.get(i);
				yesList.add(car);
			}
		}
		map.put("queryString", car_id);
		map.put("yesList", yesList);
		map.put("notList", notList);
		return "admin/recommandManage/carRecommand";
	}
	
	//�޸��Ƿ��Ƽ�״̬
	@RequestMapping("/changeRecommandStatus")
	public String changeRecommandStatus(Map<String, Object> map, String car_id, String newStatus){
		carService.changeRecommandStatus(car_id, newStatus);
		return "redirect:/adminRecommandManage/recommandList";
	}
	
	
}
