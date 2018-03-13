package com.carSystem.action.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.carSystem.entity.Car;
import com.carSystem.entity.Login;
import com.carSystem.entity.Page;
import com.carSystem.service.BrandService;
import com.carSystem.service.CarService;
import com.carSystem.service.PageService;

@Controller
@RequestMapping("/admin")
public class CarManageAction {

	@Autowired
	private CarService carService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private PageService pageService;
	
	//��ѯȫ�����۳���
	@RequestMapping("/queryAllOnlineCar")
	public String queryAllOnlineCar(Map<String, Object> map, String currentpage){
		List<Car> onlineCarList = carService.queryAllOnlineCar();
		
		Page page = pageService.pageToCar(onlineCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > onlineCarList.size() ? onlineCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		onlineCarList = onlineCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("carOnlineList", onlineCarList );
		return "admin/carManage/car_online_list";
	}
	
	//����id��ѯ���۳���
	@RequestMapping("/queryOnlineCarById")
	public String queryOnlineCarById(Map<String, Object> map, String car_id, String currentpage){
		List<Car> onlineCarList = null;
		if(car_id == null || car_id.equals("")){
			onlineCarList = carService.queryAllOnlineCar();
		}else{
			onlineCarList = carService.queryOnlineCarByIdOrName(car_id);
		}
		
		Page page = pageService.pageToCar(onlineCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > onlineCarList.size() ? onlineCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		onlineCarList = onlineCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("carOnlineList", onlineCarList);
		map.put("queryString", car_id);
		return "admin/carManage/car_online_list";
	}
	
//	//����id��ѯ���۳���
//	@RequestMapping("/addCarInit")
//	public String addCarInit(Map<String, Object> map){
//		map.put("BrandList", brandService.queryAllBrand());
//		return "admin/carManage/car_add";
//	}
//	
//	//��ӳ���
//	@RequestMapping("/addCar")
//	public String addCar(Car car){
//		carService.addCar(car);
//		return "redirect:/admin/queryAllOnlineCar";
//	}
	
	//�鿴������������
	@RequestMapping("/carDetail")
	public String carDetails(Map<String, Object> map, String car_id){
		List<Car> list = carService.queryOnlineCarById(car_id);
		map.put("carDetail", list.get(0));
		return "admin/carManage/car_details";
	}
	
	//���߳�����Ϣ���³�ʼ��ҳ��
	@RequestMapping("/carUpdateInit")
	public String carUpdateInit(Map<String, Object> map, String car_id){
		map.put("carUpdate", carService.queryOnlineCarById(car_id).get(0));
		map.put("brandList",brandService.queryAllBrand());
		return "admin/carManage/car_update";
	}
	
	//�����޸ĺ����������
	@RequestMapping(value="/saveCar", method=RequestMethod.POST)
	public String saveOnlineCar(@RequestParam("imgSrc")MultipartFile mf, Map<String, Object> map, Car car) throws IOException{
		if(mf.getSize() != 0){
			InputStream is = mf.getInputStream();
			File target = new File("D:\\shxt\\java\\new works\\images\\secondHandCarSystem\\" + mf.getOriginalFilename());
			OutputStream os = null;
			try{
				os = new FileOutputStream(target, true);
				int templeng = 0;
				byte[] tempbyte = new byte[4096];
				while((templeng = is.read(tempbyte)) != -1){
					os.write(tempbyte, 0, templeng);
					os.flush();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					is.close();
					os.close();
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
			File deleteFile = new File("D:\\shxt\\java\\new works\\images\\secondHandCarSystem\\" + car.getCar_img());
	        if (deleteFile.exists() && !car.getCar_img().equals("demo.jpg")){
	        	deleteFile.delete();
	        }
	        
	        car.setCar_img(mf.getOriginalFilename());
		}
		
		carService.saveCar(car);
		return "redirect:/admin/queryAllOnlineCar";
	}
	
	//���ݳ����������¼�
	@RequestMapping("/carDownShelf")
	public String carDownShelf(String car_id, HttpSession session){
		Login login = (Login)session.getAttribute("adminloginSession");
		carService.carDownShelf(car_id, login.getLogin_id());
		return "redirect:/admin/queryAllOnlineCar";
	}
	
	//�¼ܳ����б�
	@RequestMapping("/queryAllDownShelfCar")
	public String queryAllDownShelfCar(Map<String, Object> map, String currentpage){

		List<Car> downCarList = carService.queryAllDownShelfCar();
		Page page = pageService.pageToCar(downCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > downCarList.size() ? downCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		downCarList = downCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("queryKind", "all");
		map.put("page", page);
		map.put("carDownShelfList", downCarList);
		return "admin/carManage/car_downShelf_list";
	}
	
	//�¼ܳ�����Ϣ�޸�
	@RequestMapping("/carUpdateDownShelf")
	public String carUpdateDownShelf(Map<String, Object> map, String car_id){
		map.put("carUpdateDownShelf", carService.queryDownShelfCarById(car_id).get(0));
		map.put("brandList",brandService.queryAllBrand());
		return "admin/carManage/car_update_downShelf";
	}
	
	//�����޸ĺ���¼�����
	@RequestMapping(value="/saveDownShelfCar", method=RequestMethod.POST)
	public String saveDownShelfCar(@RequestParam("imgSrc")MultipartFile mf, Map<String, Object> map, Car car) throws IOException{
		
		if(mf.getSize() != 0){
			InputStream is = mf.getInputStream();
			File target = new File("D:\\shxt\\java\\new works\\images\\secondHandCarSystem\\" + mf.getOriginalFilename());
			OutputStream os = null;
			try{
				os = new FileOutputStream(target, true);
				int templeng = 0;
				byte[] tempbyte = new byte[4096];
				while((templeng = is.read(tempbyte)) != -1){
					os.write(tempbyte, 0, templeng);
					os.flush();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					is.close();
					os.close();
				}catch (IOException e) {
					e.printStackTrace();
				}
			}
			File deleteFile = new File("D:\\shxt\\java\\new works\\images\\secondHandCarSystem\\" + car.getCar_img());
	        if (deleteFile.exists() && !car.getCar_img().equals("demo.jpg")){
	        	deleteFile.delete();
	        }
	        
	        car.setCar_img(mf.getOriginalFilename());
		}
		carService.saveCar(car);
		return "redirect:/admin/queryAllDownShelfCar";
	}
	
	//���ݱ�Ų�ѯ�¼ܳ�����Ϣ
	@RequestMapping("/queryDownShelfCarById")
	public String queryDownShelfCarById(Map<String, Object> map, String car_id, String currentpage){
		List<Car> list = null;
		if(car_id == null || car_id.equals("")){
			list = carService.queryAllDownShelfCar();
		}else{
			list = carService.queryDownShelfCarByIdOrName(car_id);
		}
		Page page = pageService.pageToCar(list.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > list.size() ? list.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		list = list.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("queryKind", "idOrName");
		map.put("page", page);
		map.put("carDownShelfList", list);
		map.put("queryString", car_id);
		return "admin/carManage/car_downShelf_list";
	}
	
	//����id�������ϼ�
	@RequestMapping("/carUpShelfById")
	public String carUpShelfById(String car_id, Map<String, Object> map){
		carService.carUpShelfById(car_id);
		return "redirect:/admin/queryAllDownShelfCar";
	}
	
	//����id����ɾ��������Ϣ
	@RequestMapping("/carDelete")
	public String carDelete(String car_id, Map<String, Object> map){
		carService.carDelete(car_id);
		return "redirect:/admin/queryAllDownShelfCar";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
