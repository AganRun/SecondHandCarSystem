package com.carSystem.action.shop;

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
@RequestMapping("/shop")
public class ShopCarManageAction {

	@Autowired
	private CarService carService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private PageService pageService;
	
	//导航栏的搜索框
	@RequestMapping("/navQueryIdOrName")
	public String navQueryIdOrName(Map<String, Object> map, String car_name, HttpSession session){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		map.put("carOnlineList", carService.shopQueryOnlineCarByIdOrName(car_name, login.getLogin_id()));
		return "shop/carManage/car_online_list";
	}
	
	//商家查询全部在售车辆
	@RequestMapping("/queryAllOnlineCar")
	public String queryAllOnlineCar(Map<String, Object> map, HttpSession session, String currentpage){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		
		List<Car> onlineCarList = carService.shopQueryAllOnlineCar(login.getLogin_id());
		
		Page page = pageService.pageToCar(onlineCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > onlineCarList.size() ? onlineCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		onlineCarList = onlineCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "all");
		map.put("carOnlineList", onlineCarList);
		return "shop/carManage/car_online_list";
	}
	
	//根据id查询在售车辆
	@RequestMapping("/queryOnlineCarById")
	public String queryOnlineCarById(Map<String, Object> map, String car_id, String shop_id, String currentpage){
		List<Car> onlineCarList = null;
		if(car_id == null || car_id.equals("")){
			onlineCarList = carService.shopQueryAllOnlineCar(shop_id);
		}else{
			onlineCarList = carService.shopQueryOnlineCarByIdOrName(car_id, shop_id);
		}
		
		Page page = pageService.pageToCar(onlineCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > onlineCarList.size() ? onlineCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		onlineCarList = onlineCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("page", page);
		map.put("queryKind", "idOrName");
		map.put("carOnlineList", onlineCarList);
		map.put("queryString", car_id);
		return "shop/carManage/car_online_list";
	}
	
	//添加车辆初始化界面
	@RequestMapping("/addCarInit")
	public String addCarInit(Map<String, Object> map){
		map.put("BrandList", brandService.queryAllBrand());
		return "shop/carManage/car_add";
	}
	
	//添加车辆
	@RequestMapping(value="/addCar", method=RequestMethod.POST)
	public String addCar(@RequestParam("imgSrc")MultipartFile mf, Car car) throws IOException{
		
		if(mf.getSize() != 0){	//上传的图片不为空
			
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
			car.setCar_img(mf.getOriginalFilename());
			
		}else{	//用户上传图片为空
			car.setCar_img("demo.jpg");
		}
		
		carService.addCar(car);
		return "redirect:/shop/queryAllOnlineCar";
	}
	
	//查看单个车辆详情
	@RequestMapping("/carDetail")
	public String carDetails(Map<String, Object> map, String car_id){
		List<Car> list = carService.queryOnlineCarById(car_id);
		map.put("carDetail", list.get(0));
		return "shop/carManage/car_details";
	}
	
	//在线车辆信息更新初始化页面
	@RequestMapping("/carUpdateInit")
	public String carUpdateInit(Map<String, Object> map, String car_id){
		map.put("carUpdate", carService.queryOnlineCarById(car_id).get(0));
		map.put("brandList",brandService.queryAllBrand());
		return "shop/carManage/car_update";
	}
	
	//保存修改后的在售汽车
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
		return "redirect:/shop/queryAllOnlineCar";
	}
	
	//根据车辆将汽车下架
	@RequestMapping("/carDownShelf")
	public String carDownShelf(String car_id){
		String operaDeleteId = carService.queryOnlineCarByIdOrName(car_id).get(0).getCar_shop_id();
		carService.carDownShelf(car_id, operaDeleteId);
		return "redirect:/shop/queryAllOnlineCar";
	}
	
	//下架车辆列表
	@RequestMapping("/queryAllDownShelfCar")
	public String queryAllDownShelfCar(Map<String, Object> map, HttpSession session, String currentpage){
		Login login = (Login) session.getAttribute("shoploginSession");
		if(login == null || !login.getLogin_permission().equals("shop")){
			return "redirect:/loginInitAction";
		}
		
		List<Car> downCarList = carService.shopQueryAllDownShelfCar(login.getLogin_id());
		Page page = pageService.pageToCar(downCarList.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > downCarList.size() ? downCarList.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		downCarList = downCarList.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("queryKind", "all");
		map.put("carDownShelfList", downCarList);
		map.put("page", page);
		return "shop/carManage/car_downShelf_list";
	}
	
	//下架车辆信息修改
	@RequestMapping("/carUpdateDownShelf")
	public String carUpdateDownShelf( Map<String, Object> map, String car_id){
		
		map.put("carUpdateDownShelf", carService.queryDownShelfCarById(car_id).get(0));
		map.put("brandList",brandService.queryAllBrand());
		return "shop/carManage/car_update_downShelf";
	}
	
	//保存修改后的下架汽车
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
		return "redirect:/shop/queryAllDownShelfCar";
	}
	
	//根据编号查询下架车辆信息
	@RequestMapping("/queryDownShelfCarById")
	public String queryDownShelfCarById(Map<String, Object> map, String car_id, String shop_id, String currentpage){
		List<Car> list = null;
		if(car_id == null || car_id.equals("")){
			list = carService.shopQueryAllDownShelfCar(shop_id);
		}else{
			list = carService.shopQueryDownShelfCarByIdOrName(car_id, shop_id);
		}
		
		Page page = pageService.pageToCar(list.size(), currentpage);
		int subEnd = (page.getCurrentpage()-1)*page.getSize() + page.getSize() > list.size() ? list.size() : (page.getCurrentpage()-1)*page.getSize() + page.getSize();
		list = list.subList( (page.getCurrentpage()-1)*page.getSize() , subEnd);
		
		map.put("queryKind", "idOrName");
		map.put("page", page);
		map.put("carDownShelfList", list);
		map.put("queryString", car_id);
		return "shop/carManage/car_downShelf_list";
	}
	
	//根据id将车辆上架
	@RequestMapping("/carUpShelfById")
	public String carUpShelfById(String car_id, Map<String, Object> map){
		carService.carUpShelfById(car_id);
		return "redirect:/shop/queryAllDownShelfCar";
	}
	
	//根据id彻底删除车辆信息
	@RequestMapping("/carDelete")
	public String carDelete(String car_id, Map<String, Object> map){
		carService.carDelete(car_id);
		return "redirect:/shop/queryAllDownShelfCar";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
