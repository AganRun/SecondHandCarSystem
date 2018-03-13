package com.carSystem.service;

import org.springframework.stereotype.Service;

import com.carSystem.entity.Page;


@Service
public class PageService {

	/**
	 * 两个分类方法没有什么区别，只是车辆含有图片，订单和车辆管理每页显示的数量不同，所以写了写了两个方法，只是每页的page.size不同
	 * @param total
	 * @param currentpage
	 * @return
	 */
	
	//对车辆的分页
	public Page pageToCar(int total, String currentpage){
		Page page = new Page(total, 8);		//这里第二个参数是一页显示几个数据
		
		if(currentpage == null || currentpage.equals("")){	//初始化
			page.setCurrentpage(1);
		}else if(Integer.parseInt(currentpage) > page.getLast()){		//大于总页数
			page.setCurrentpage(page.getLast());
		}else if(Integer.parseInt(currentpage) < 1){		//小于第一页
			page.setCurrentpage(1);
		}else{
			page.setCurrentpage(Integer.parseInt(currentpage));
		}
		
		return page;
	}
	
	//对订单的分页
	public Page pageToOrder(int total, String currentpage){
		Page page = new Page(total, 15);		//这里第二个参数是一页显示几个数据
		
		if(currentpage == null || currentpage.equals("")){	//初始化
			page.setCurrentpage(1);
		}else if(Integer.parseInt(currentpage) > page.getLast()){		//大于总页数
			page.setCurrentpage(page.getLast());
		}else if(Integer.parseInt(currentpage) < 1){		//小于第一页
			page.setCurrentpage(1);
		}else{
			page.setCurrentpage(Integer.parseInt(currentpage));
		}
		
		return page;
	}
	
	
}
