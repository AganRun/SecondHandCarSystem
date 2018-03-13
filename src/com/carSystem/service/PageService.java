package com.carSystem.service;

import org.springframework.stereotype.Service;

import com.carSystem.entity.Page;


@Service
public class PageService {

	/**
	 * �������෽��û��ʲô����ֻ�ǳ�������ͼƬ�������ͳ�������ÿҳ��ʾ��������ͬ������д��д������������ֻ��ÿҳ��page.size��ͬ
	 * @param total
	 * @param currentpage
	 * @return
	 */
	
	//�Գ����ķ�ҳ
	public Page pageToCar(int total, String currentpage){
		Page page = new Page(total, 8);		//����ڶ���������һҳ��ʾ��������
		
		if(currentpage == null || currentpage.equals("")){	//��ʼ��
			page.setCurrentpage(1);
		}else if(Integer.parseInt(currentpage) > page.getLast()){		//������ҳ��
			page.setCurrentpage(page.getLast());
		}else if(Integer.parseInt(currentpage) < 1){		//С�ڵ�һҳ
			page.setCurrentpage(1);
		}else{
			page.setCurrentpage(Integer.parseInt(currentpage));
		}
		
		return page;
	}
	
	//�Զ����ķ�ҳ
	public Page pageToOrder(int total, String currentpage){
		Page page = new Page(total, 15);		//����ڶ���������һҳ��ʾ��������
		
		if(currentpage == null || currentpage.equals("")){	//��ʼ��
			page.setCurrentpage(1);
		}else if(Integer.parseInt(currentpage) > page.getLast()){		//������ҳ��
			page.setCurrentpage(page.getLast());
		}else if(Integer.parseInt(currentpage) < 1){		//С�ڵ�һҳ
			page.setCurrentpage(1);
		}else{
			page.setCurrentpage(Integer.parseInt(currentpage));
		}
		
		return page;
	}
	
	
}
